Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E5A5D29D
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 23:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E60C10E159;
	Tue, 11 Mar 2025 22:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ArTD2Bo5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1248F10E159
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 22:36:51 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so1528434a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 15:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741732610; x=1742337410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
 b=ArTD2Bo52sEexvC/L/yU7ifML9z9dctjIYU8qaFrvyKOW/IUEUUWMKgZSKcQyrJxx6
 5KbqoMwvSi3ZB8yxi5o2DsBhP3h5aX0smNxubzFM5FcRNmjtV7YnGOCnaHXY7UGwklBL
 9wR8E/C/BuaD0rkkMIk8qSKtB/N5TlBkQyPoGXdI72C6FsVBClYLmsATTtyY6f26YzKM
 TZJ/1oh8+SC1BdC2LsFqmsy9ZrALbR728Cg/BQTRI7YuBVKPzZ0FH3zTg5gdpzBfH/Uk
 QgiVWuI9MPfd4yX9vdRYWquSBALlx/O4NUtxhi6EQM4eCcq7eglgI2qi+BgadYB2pbcV
 9kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741732610; x=1742337410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
 b=w1MGijgHavhZsudXXpx93SmzB4bblrxfy6QpVnOMd0CCE8BDFFoETlzH3NSp5wj38H
 cJbmFplxqKEzpKZJHlgCh2ReLPpBJEVYPmn76+KtFpyIHgo2pUBfpefE4PtuteBHINTE
 disIxrmGyZtlFgGoVln6E0Qj0KrV+sdscEzep3aDAnRI+3wCUulT3eD0+VgtwTN8esaW
 uiC4STRdJaB9tqbkQpcZkiaZuJ+Q+YPamncDT+FzP11eUk3/TaLe2/1DfGrolOyJAJJO
 JKMnItE8X1e4pjE0oIxVbMWfcyS10Lvk4sWisd/icusA8RrI6DcXU1gdO2tsSJWgXJAz
 hhBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnw0xNT2Bo8PKZRSfPqhMKdYpApD2hew5LktPAJKI1dGhLJKjj+mELh+AWVJE1wKNZgB3pBcll0xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG1hNQv7Xg5F4qe31yPqnReYL0YWS3Iv6kL9rU41Bl3/Cpuk6R
 XgX+mKiYJ7s3zuuaTSLKOyYE7sPcl6qk+ea9ZBvYS4/Cb56visc6URSUJ8PDchqiL6u+83cP23u
 mQoF8GSFVtjD7RcY4/8uob9flsjTT8XmU
X-Gm-Gg: ASbGncsxk4G9T7PG4oTTL6G9HfTwA57vz9xJ+SUSalMVD6f6EESTUxkqphq+FHdLN29
 nLCUJ+EDmUEmhcHApu2/wSfvQDvcqF5i7UPzf0b5zB0om62NRauj1TCTSEG8p/T7h/1WTQuc/Ju
 7RbralwaghhD6E8zobPaE/eirF0w==
X-Google-Smtp-Source: AGHT+IE2yP0Oqp5icApOYEeT5S9ryMzCphdSruIQb+pyZ1tL48mZ6lOK0AKajCd16hcESy+fMFtcVCe/Z6YypMdt4rI=
X-Received: by 2002:a17:90b:4a81:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-300a2891c23mr8155406a91.0.1741732609220; Tue, 11 Mar 2025
 15:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
In-Reply-To: <20250311180553.GB5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 18:36:38 -0400
X-Gm-Features: AQ5f1Jpps08fowB20qui8teO0kCK3_0sMgX__rQse3av3tUA4enIqUvNjCSXypk
Message-ID: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++---=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> >  3 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers=
/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f53955=
7a39866a932360d4e 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >
> >       if (list_empty(&tbu_list)) {
> >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >
> >               if (ret =3D=3D -ENOSYS)
> >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> >
> >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >       if (!tmp || tmp =3D=3D -EBUSY) {
> >               ret =3D IRQ_HANDLED;
> >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba=
75eea1d5de23117de 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>
> We already have an implementation hook (->get_fault_info()) which the
> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> That thing dumps these registers already so if we're moving that into
> the core SMMU driver, let's get rid of the hook and move everybody over
> rather than having it done in both places.

As you probably saw, the next commit moves over
qcom_adreno_smmu_get_fault_info() to use this. The current back door
used by drm/msm to access these functions is specific to adreno_smmu
and there isn't an equivalent interface to allow it to call a generic
SMMU function so it isn't possible to move it entirely to the core. At
least not without a bigger refactoring that isn't justified for this
series that is just trying to fix things.

>
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>
> I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> it for stage-2 domains.
>
> Will

Does it matter if we read the register though, as long as users are
aware of this and don't use its value for anything?

Connor
