Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21BA5E1FE
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 17:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4597A10E7B2;
	Wed, 12 Mar 2025 16:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mJ3wvFgR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720DC10E145
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 16:47:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72A39A45DD5;
 Wed, 12 Mar 2025 16:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94A1C4CEDD;
 Wed, 12 Mar 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741798063;
 bh=ELSEo0D7KcKhySYOIqk4yKTpqKUpc0DRoOc04z68Nyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJ3wvFgRU+05Re8+zMFHdJQyGysGsqfW9WFRtbywXLUgpmxuH26PtWMJIOQ3AagEX
 jHaMqDtG8Phx4NJ1N2ujNKN3rxoAEJZ8oiaP2MdnGKQhFHgdO3908ga5pUtftOqiKh
 mY+KgrgaNokT9UYHN6EWHpcfZQVYqhdc7ue+fbwaMehUSPkiFvgXozJcdiPOXWpdxN
 yiix2EyQfDaA2j9Jt2KP2bObjrrzX4O14ZCk1paF7R4qAHOSULtXEbQ/O5NqeXjTQM
 VzJxD/annxVwCotkTPXFThqgYDNqNI7crJlrK9Kh95zzZ8UWSVFa9rvjLcWU4PbVZY
 y4/cCZmfNf0Lg==
Date: Wed, 12 Mar 2025 16:47:36 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312164735.GA6561@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
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

On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> On Wed, Mar 12, 2025 at 6:05 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > > > >                                     struct arm_smmu_context_fault_info *cfi)
> > > > >  {
> > > > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > > > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> > > >
> > > > We already have an implementation hook (->get_fault_info()) which the
> > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > > That thing dumps these registers already so if we're moving that into
> > > > the core SMMU driver, let's get rid of the hook and move everybody over
> > > > rather than having it done in both places.
> > >
> > > As you probably saw, the next commit moves over
> > > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > > used by drm/msm to access these functions is specific to adreno_smmu
> > > and there isn't an equivalent interface to allow it to call a generic
> > > SMMU function so it isn't possible to move it entirely to the core. At
> > > least not without a bigger refactoring that isn't justified for this
> > > series that is just trying to fix things.
> >
> > Ok :(
> >
> > > > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> > > >
> > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > > it for stage-2 domains.
> > > >
> > > Does it matter if we read the register though, as long as users are
> > > aware of this and don't use its value for anything?
> >
> > I think the contents are "UNKNOWN", so it could be hugely confusing even
> > if they just got logged someplace. Why is it difficult to avoid touching
> > it for stage-2?
> >
> Fwiw, we are only ever using stage-1

Sure, but this is in arm-smmu.c which is used by other people and supports
both stages.

Will
