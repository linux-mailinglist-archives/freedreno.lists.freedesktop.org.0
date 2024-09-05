Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619C96DEED
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159E010E117;
	Thu,  5 Sep 2024 15:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fDjDFHIM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBCB10E117
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 15:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8D4E5C53AE;
 Thu,  5 Sep 2024 15:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B99C4CEC3;
 Thu,  5 Sep 2024 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725551615;
 bh=FT/uFKjMbwjJnnJkd4LrmJ5bCz++QM6QGQX26aS6/TY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDjDFHIMejDOYZ1VSD8UDbscVuMP/PSfJvjVNV/TYwbSKY+jz6Id69N9FhBr3jBFL
 ar/EINT4oTP8C74poPjbEBjS27L4FT7w4XvUjhGyX1JSio4NZnr1BrW+Q4T5JRu/sj
 U/CfocxCWVsJIH94pfS+4ul0tG9h2o5GjIwCjNoYjyVQZKXBKeJQO+OwRKkF9dOBw/
 kbiE/M09Dlfqx7JsRlxUMqPwFfhzhA9Py9+/16RqfjhJTBrJKoAKZHs6ojWpYPUXd7
 3dYiIDvpXRdSiVmgV1aAeHU8Ako29QCgEtmgXpvNjyeYvxgZHRgPtRKsPCs1ndZNia
 Cv2U3508lueSA==
Date: Thu, 5 Sep 2024 16:53:30 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>,
 Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
Message-ID: <20240905155330.GA15246@willie-the-truck>
References: <20240905124956.84932-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905124956.84932-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Rob,

On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> 
> It was causing gpu smmu faults on x1e80100.
> 
> I _think_ what is causing this is the change in ordering of
> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> this patch is supposed to work correctly in the face of other
> concurrent translations (to buffers unrelated to the one being
> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> stale data read back into the tlb.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)

Please can you try the diff below, instead?

Will

--->8

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..0a32e9499e2c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
                /* Clear the remaining entries */
                __arm_lpae_clear_pte(ptep, &iop->cfg, i);
 
-               if (gather && !iommu_iotlb_gather_queued(gather))
+               if (!iommu_iotlb_gather_queued(gather))
                        for (int j = 0; j < i; j++)
                                io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
 
