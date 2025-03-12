Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DAEA5DD4F
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 14:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2D110E070;
	Wed, 12 Mar 2025 13:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jCKBd0Ii";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8BB10E070
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 13:05:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD33B5C4427;
 Wed, 12 Mar 2025 13:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14095C4CEE3;
 Wed, 12 Mar 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741784744;
 bh=tQxLHaC5IOJlSNyEQXOM0hkci8JPuwjdb8elPNaj8+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCKBd0Ii3zEWKe0hu2rFrehNCnSbNl7NHa4XzoYQbrTSXnQHxgRneTQPVxT5lRntP
 TYorVyRqBbBmpKOzYQw5AX2an7nJvrOujEoWALPxjV1SEkrAhDFUl9v7ZEQsnFwwrx
 mu2whHpwcubaL+8XLy6nnhjcSKYe6KnrxAE4LbGJ6DPAHQEyx4vE9aRK4pT3aRhU8H
 jMH0e2soV0CDPRQ+eMcLA6kB0NgcdAY90mg6PmfzKgyAJUnU1EZZfMXVHL5frieL+F
 NvvYKMhH46k2B/XcpfNkjXfzujhDquSqyLz+kTMOjOa07+B4DoaoQpcVUTxGX6wjtR
 dnmVfrwUZy3QQ==
Date: Wed, 12 Mar 2025 13:05:38 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312130525.GC6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
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

On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > This will be used by drm/msm for GPU page faults, replacing the manual
> > > register reading it does.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >
> > >       if (list_empty(&tbu_list)) {
> > >               ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >
> > >               if (ret == -ENOSYS)
> > >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >       phys_soft = ops->iova_to_phys(ops, cfi.iova);
> > >
> > >       tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >       if (!tmp || tmp == -EBUSY) {
> > >               ret = IRQ_HANDLED;
> > >               resume = ARM_SMMU_RESUME_TERMINATE;
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > >                                     struct arm_smmu_context_fault_info *cfi)
> > >  {
> > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >
> > We already have an implementation hook (->get_fault_info()) which the
> > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > That thing dumps these registers already so if we're moving that into
> > the core SMMU driver, let's get rid of the hook and move everybody over
> > rather than having it done in both places.
> 
> As you probably saw, the next commit moves over
> qcom_adreno_smmu_get_fault_info() to use this. The current back door
> used by drm/msm to access these functions is specific to adreno_smmu
> and there isn't an equivalent interface to allow it to call a generic
> SMMU function so it isn't possible to move it entirely to the core. At
> least not without a bigger refactoring that isn't justified for this
> series that is just trying to fix things.

Ok :(

> > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> >
> > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > it for stage-2 domains.
> >
> Does it matter if we read the register though, as long as users are
> aware of this and don't use its value for anything?

I think the contents are "UNKNOWN", so it could be hugely confusing even
if they just got logged someplace. Why is it difficult to avoid touching
it for stage-2?

Will
