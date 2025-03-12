Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46083A5DDFF
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 14:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1990C10E15F;
	Wed, 12 Mar 2025 13:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hkU5WpdG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A314F10E154
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 13:30:19 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-224172f32b3so11071985ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741786219; x=1742391019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
 b=hkU5WpdGWqOVe+yOMZNWQM7sME64M9IjBgFTCeh2DTX46Gi8IbBXPfvDp/GClLa7zt
 3q4WXc5CVRK70HCsnIarWxCC8n32ACGA7B8qtntzpaH9rAgLXnZYu6Hz3pnLUc9H+hph
 sTDUW5QZJPRKegD6As+k/8t8VOKOHvLIOIx1ixJWFci6asCuNLaJ0RmMzqc/X7OkYQTh
 8lprFksNBh61tEu94PN+7R9WR0lL0QoygIEJtUVUz9zd6TxcCMBahq0RhO8cyqmQT9Qa
 1Mv8SeKMRW7601PU5/X4j4+wrKw4f1zP0ie3+iQg9VM5ITfwSZcjskGPNfI9IFYs/WTN
 uyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741786219; x=1742391019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
 b=n55KIUZaHWgxoyzNLfpZXnrUlv2Ftv85OLLo7J6onTH2suRDxv2xJmTQOfYT9kLu64
 LEnT71Ea8bfD2fvgbhUT7VdSbhoyoA9tipWEueSfhr9zZ81wPCIgrnxs/JZ+NwyL+mje
 ZKeFdmPsB6NPFkUuRnSkiROhM+NCgvZPljun6Swx04tnNy67lwmjagI2FiKfpLMEIkra
 SE+Ueu8IyIX3mTl0RQNjCPxUnoljar8+NNaBqtDoPUgH1Jljj+msa/sN6AqM43WBepHt
 we4FKpbVWdd8slzedlBFAOtt64KiLJ2u4ncPCh2IP968cKZyG89jKu8xAlMxIl1bj/dM
 bFow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpvqoE2qXwVdPOwbusvPr0h9VlLTOLdNi0NRSs7AFrPDPyrItj83MunSTHUsL1JsDmodvOOni+uvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXh0E9rP5KqUuM+8LVqTkUhRMdCRNzqk6AkCZ0UKpTLVIjDUxd
 J7pveiliuU4PeYJI5WYno97BleT6mvS2eWduFermyKdrkg1Xhp9lN7IRKIR0gS8UsJec+d7TS0d
 GXscCP2HzZnsPZSbrTw091ED5uzc=
X-Gm-Gg: ASbGncuRKw7huphuZBMBEuCn5xhbnr0BV9nPhAVOgM40pBe5YutaSZmHPneblW8/ZYl
 FIXRruaWMa2gWohcRdoQAlX6nDDF0oHW48s0VITfSS67FwTyH5TIn+25Tyawb10evqwRdWrKhNv
 DkUI/FDvsN0AowL99lrvR5iUm8Pg==
X-Google-Smtp-Source: AGHT+IHNI8mdn86Q0gIcolu7qp1NQiSCr9Mpiw/QLXiMzo4X0s/wK63ODT6l7NpH3nsyJT/iynSTv/X8C6Q/+ji18QU=
X-Received: by 2002:a05:6a00:2d9f:b0:730:9467:b4b8 with SMTP id
 d2e1a72fcca58-736eba6ca4cmr3642332b3a.4.1741786218878; Wed, 12 Mar 2025
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
In-Reply-To: <20250312124907.GB6181@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 12 Mar 2025 09:30:07 -0400
X-Gm-Features: AQ5f1JqWM8ID_E8sPNheprXCY9CSTKUwdJFoTdyL5levhUnxGmDxSGFVnmiAz6I
Message-ID: <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
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

On Wed, Mar 12, 2025 at 8:49=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > > Up until now we have only called the set_stall callback during
> > > > initialization when the device is off. But we will soon start calli=
ng it
> > > > to temporarily disable stall-on-fault when the device is on, so han=
dle
> > > > that by checking if the device is on and writing SCTLR.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++=
+++++++++---
> > > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a2=
4b3ce72f48e3b38474da2 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const vo=
id *cookie, bool enabled)
> > > >  {
> > > >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> > > >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > > > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > > > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > > > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > > > +     u32 mask =3D BIT(cfg->cbndx);
> > > > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D e=
nabled;
> > > > +     unsigned long flags;
> > > >
> > > >       if (enabled)
> > > > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled |=3D mask;
> > > >       else
> > > > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled &=3D ~mask;
> > > > +
> > > > +     /*
> > > > +      * If the device is on and we changed the setting, update the=
 register.
> > > > +      */
> > > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0)=
 {
> > > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > > +
> > > > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SM=
MU_CB_SCTLR);
> > > > +
> > > > +             if (enabled)
> > > > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > > > +             else
> > > > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > > > +
> > > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR=
, reg);
> > >
> > > Are you sure you don't need TLB invalidation for this to take effect?=
 I
> > > think some fields in the SCTLR can be cached in the TLB but you'll ne=
ed
> > > to check whether or not that applies to CFCFG.
> > >
> >
> > I think it should be fine because CFCFG only controls behavior when
> > there's a context fault and there can't be TLB entries for entries
> > that cause a context fault: "The architecture permits the caching of
> > any translation table entry that has been returned from memory without
> > a fault and that does not, as a result of that entry, cause a
> > Translation Fault or an Access Flag fault."
>
> Ok, but what about other types of fault? For example, a permission fault
> or an address size fault?
>
> Will

I'm not sure, but the pseudocode for context faults mentions
resampling CFCFG after a fault happens ("We have a fault and must
resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
cache it. Also in practice this does seem to work. Does that answer
it?

Connor
