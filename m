Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378722C3320
	for <lists+freedreno@lfdr.de>; Tue, 24 Nov 2020 22:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6C06E027;
	Tue, 24 Nov 2020 21:39:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9A6E0A6;
 Tue, 24 Nov 2020 21:39:24 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F157A2083E;
 Tue, 24 Nov 2020 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606253964;
 bh=BTK/WvWriIxnwavgHEbW5VAszssfpXosYOXxF+X6xRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XerLvPVsvsKgeHuOc3H2w+A9dpR9WF2I/J/sOhvd4pEgfTaULs6Zka5HUR6sNO7C0
 n0QTKF4Qcd7eAf9jC88hpOBV9Hx8GOSR13pwnXHJZ+pNd9rBN/gXcSWoXf4jfVS1yb
 McYowqtP4ITtSgcwUpXu9MR9Ea0jgn67AngC4Bpw=
Date: Tue, 24 Nov 2020 21:39:18 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <20201124213917.GA14252@willie-the-truck>
References: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <47f8e9760a7fba8b58ea89c9add96f5615f97014.1606150259.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47f8e9760a7fba8b58ea89c9add96f5615f97014.1606150259.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCHv9 3/8] iommu/arm-smmu: Move non-strict mode
 to use io_pgtable_domain_attr
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
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 10:35:56PM +0530, Sai Prakash Ranjan wrote:
> Now that we have a struct io_pgtable_domain_attr with quirks,
> use that for non_strict mode as well thereby removing the need
> for more members of arm_smmu_domain in the future.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 8 +++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 -
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 4b9b10fe50ed..f56f266ebdf7 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -786,9 +786,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  			goto out_clear_smmu;
>  	}
>  
> -	if (smmu_domain->non_strict)
> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> -
>  	if (smmu_domain->pgtbl_cfg.quirks)
>  		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>  
> @@ -1527,7 +1524,8 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>  	case IOMMU_DOMAIN_DMA:
>  		switch (attr) {
>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			*(int *)data = smmu_domain->non_strict;
> +			if (smmu_domain->pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT)
> +				*(int *)data = smmu_domain->pgtbl_cfg.quirks;

I still don't think this is right :(
We need to set *data to 1 or 0 depending on whether or not the non-strict
quirk is set, i.e:

	bool non_strict = smmu_domain->pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT;
	*(int *)data = non_strict;

Your code above leaves *data uninitialised if non_strict is not set.

>  			return 0;
>  		default:
>  			return -ENODEV;
> @@ -1578,7 +1576,7 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>  	case IOMMU_DOMAIN_DMA:
>  		switch (attr) {
>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			smmu_domain->non_strict = *(int *)data;
> +			smmu_domain->pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;

And this is broken because if *data is 0, then you _set_ the quirk, which is
the opposite of what we should be doing.

In other words, although the implementation has changed, the semantics have
not.

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
