Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F796DF97
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 18:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8310E7E2;
	Thu,  5 Sep 2024 16:27:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6477910E7E2
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 16:27:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F38CFEC;
 Thu,  5 Sep 2024 09:28:06 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 836863F73B;
 Thu,  5 Sep 2024 09:27:32 -0700 (PDT)
Message-ID: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
Date: Thu, 5 Sep 2024 17:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240905155330.GA15246@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/09/2024 4:53 pm, Will Deacon wrote:
> Hi Rob,
> 
> On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
>>
>> It was causing gpu smmu faults on x1e80100.
>>
>> I _think_ what is causing this is the change in ordering of
>> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
>> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
>> this patch is supposed to work correctly in the face of other
>> concurrent translations (to buffers unrelated to the one being
>> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
>> stale data read back into the tlb.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> Please can you try the diff below, instead?

Given that the GPU driver's .tlb_add_page is a no-op, I can't see this 
making a difference. In fact, given that msm_iommu_pagetable_unmap() 
still does a brute-force iommu_flush_iotlb_all() after io-pgtable 
returns, and in fact only recently made .tlb_flush_walk start doing 
anything either for the sake of the map path, I'm now really wondering 
how this patch has had any effect at all... :/

> 
> Will
> 
> --->8
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..0a32e9499e2c 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>                  /* Clear the remaining entries */
>                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
>   
> -               if (gather && !iommu_iotlb_gather_queued(gather))
> +               if (!iommu_iotlb_gather_queued(gather))

Note that this would reintroduce the latent issue which was present 
originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we 
actually allow a NULL gather to be passed to io_pgtable_tlb_add_page() 
it may end up being dereferenced (e.g. in arm-smmu-v3).

Thanks,
Robin.

>                          for (int j = 0; j < i; j++)
>                                  io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
>   
