Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90996F200
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2024 12:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6058410EA03;
	Fri,  6 Sep 2024 10:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWtY/qrc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62FA10EA03
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2024 10:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45C755C5624;
 Fri,  6 Sep 2024 10:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3C6C4CEC4;
 Fri,  6 Sep 2024 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725620221;
 bh=Y1Xu/m4qEradqB0WQJLayaC6i5KppBg/Aq1cg8q0uks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWtY/qrch76CwBkJQSxyyCYzfJfg/Dp/dtzl6Vk4UMJGfJwQQNbuRQBJowgjqRMq2
 lYC6Q6V1dwGdbAnw90ZBGuBCjJVUtF8mqpB62kgQzfopU1hYTJ3BNCm9I1CKgDaG+G
 MvU9FTQaPwdyiGYFFKTT9nXTWmb1jflToY7+kFZo4oCEbNQ4pUHoXq5dEp+ztjSQI4
 QCmZ0JE5Ix2Yl1OmtK2mGcNhqu4OMWNlOCTHC+ldeHoEqjBF9Q84jMNipfJccPHEJI
 pRNeFJk98EcALV/DM4cLL6hsX1mHwxD8W08K0wuGX3KdVOh4Qpu223CLTTB2RRP3d+
 E08jvNH8noIOw==
Date: Fri, 6 Sep 2024 11:56:56 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Ashish Mhetre <amhetre@nvidia.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
Message-ID: <20240906105656.GA16124@willie-the-truck>
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
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

On Thu, Sep 05, 2024 at 05:27:28PM +0100, Robin Murphy wrote:
> On 05/09/2024 4:53 pm, Will Deacon wrote:
> > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> > > 
> > > It was causing gpu smmu faults on x1e80100.
> > > 
> > > I _think_ what is causing this is the change in ordering of
> > > __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > > memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> > > this patch is supposed to work correctly in the face of other
> > > concurrent translations (to buffers unrelated to the one being
> > > unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> > > stale data read back into the tlb.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> > >   1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > Please can you try the diff below, instead?
> 
> Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> making a difference. In fact, given that msm_iommu_pagetable_unmap() still
> does a brute-force iommu_flush_iotlb_all() after io-pgtable returns, and in
> fact only recently made .tlb_flush_walk start doing anything either for the
> sake of the map path, I'm now really wondering how this patch has had any
> effect at all... :/

Hmm, yup. Looks like Rob has come back to say the problem lies elsewhere
anyway.

One thing below though...

> > 
> > Will
> > 
> > --->8
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 0e67f1721a3d..0a32e9499e2c 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> >                  /* Clear the remaining entries */
> >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > +               if (!iommu_iotlb_gather_queued(gather))
> 
> Note that this would reintroduce the latent issue which was present
> originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> actually allow a NULL gather to be passed to io_pgtable_tlb_add_page() it
> may end up being dereferenced (e.g. in arm-smmu-v3).

I think there is still something to fix here. arm_lpae_init_pte() can
pass a NULL gather to __arm_lpae_unmap() and I don't think skipping the
invalidation is correct in that case. Either the drivers need to handle
that or we shouldn't be passing NULL.

What do you think?

Will
