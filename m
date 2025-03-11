Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341ADA5D049
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 21:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED0B10E5E4;
	Tue, 11 Mar 2025 20:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JET07UEp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4932910E5E4
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 20:01:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2217875d103so12885395ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741723271; x=1742328071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
 b=JET07UEpO3VtQdBbz9mLuX0MmcwYTyzwQCVArHUpKCLNs4O98kX/AePEZt3zreH0Wd
 9Ys3cjdC6XhbOff1YOad3O/4FoADeOc6w0SWb9PQQFqroUvyYXUgu5XBe7rgrlHDhpew
 RVlnbpvEeR/YI46/Ia/zBCy4s1+TvEoe+nJXdEoWlr4rTCcdHvwoErWhFRhZYbSDJBMP
 Ci0GK88CV37T7sCxm9fTuG+RSqznWDNiG9qqWic1M22yvxs02bFgqGnPF6guR21gEQfq
 JDFo3x5ItKsNHDms6IqvLY5rzbBkuQ9vck/cUohHPH5I0oHybu4yL3YsUNjxkGCFhVY9
 SL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723271; x=1742328071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
 b=ln+tFr8ekR8HD1LwTb90nuLyxO+VslzVlOTwmkomCrAdGdNANUUEUMmxOrld+l5KOM
 YyMfU+jVqV5Z6zXLA8UXidAHp/U9be9Xv73wwlf6DphvUC57alT6ol4JlWUnSBoRPJOg
 N4fe3DS8kpvfExcyo+7fMHEh81mzraSERAikrYXiZq3qlSlVOlsx4Jfs6Ed1k9o/ci5m
 1k+4cv/XMGpqB6EYXspmMR8wDlxtGL/2CrtUMDajyGPufvAcWH9g1DSqBY0ML3+qJai9
 SC1Wb89L1N2NDpb3Q5VZzrPkeSBCB19nrbxCWO832ZCKCnXFPUEz4zASPNESqhKlW8SW
 tvvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF2QzLCpXyGtSq1CzyQbXI+ptG7qlzrbx04rT9AAy3Ps+euz4EU5IzVDA8+VNrDV9zuY6Crjkcagg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC1MMrjNBxnDItAQ46o79Uko7l1LB+5DrdZVuYXbtkFzUEUwka
 kU2lyh8nWftR5yoQWv35Js6FSQXO01GO3KKcmEkJM3RytvPyYqZH7XXdVW8NWGHytQo9I+ntsXO
 oq5BeRLCUYOyT3SnZH+zX16TJHg8=
X-Gm-Gg: ASbGncu75QvBYUS1JqlgB0eIPlcXSdoSzFyR6AuocFa3jQ4UrYtyn+Lr4erFUE6CYn/
 +M81ih/nGX7zx3guLFWM6WstJvMzPGEoPAX+QmrRzGnuq6vnA9BEdzMxGURrGoc4ppW/ZZne1AS
 6X6He8GckdwJefd4FAaewSEIHD2Q==
X-Google-Smtp-Source: AGHT+IEZes+rPRA7sKIj+77k/pMBCMpcY3PJgbIkDYPW+Vp6cHzjHEMWL9jx7sEj0huuFiLemUSLs1dnWAE9qx1ILMs=
X-Received: by 2002:a05:6a00:3d01:b0:730:915c:b70 with SMTP id
 d2e1a72fcca58-736eb884cd6mr2575318b3a.0.1741723270852; Tue, 11 Mar 2025
 13:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
In-Reply-To: <20250311181151.GD5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 16:01:00 -0400
X-Gm-Features: AQ5f1JoexqrwePJhk6DD8zjGJRAEALzPtqaGXwA5Wf6vdtHsWziKMQ-PaQeJdxI
Message-ID: <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
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

On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > Up until now we have only called the set_stall callback during
> > initialization when the device is off. But we will soon start calling i=
t
> > to temporarily disable stall-on-fault when the device is on, so handle
> > that by checking if the device is on and writing SCTLR.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++=
+++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3c=
e72f48e3b38474da2 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *=
cookie, bool enabled)
> >  {
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > +     u32 mask =3D BIT(cfg->cbndx);
> > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> > +     unsigned long flags;
> >
> >       if (enabled)
> > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled |=3D mask;
> >       else
> > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled &=3D ~mask;
> > +
> > +     /*
> > +      * If the device is on and we changed the setting, update the reg=
ister.
> > +      */
> > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> > +
> > +             if (enabled)
> > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > +             else
> > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > +
> > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
>
> Are you sure you don't need TLB invalidation for this to take effect? I
> think some fields in the SCTLR can be cached in the TLB but you'll need
> to check whether or not that applies to CFCFG.
>
> Will

I think it should be fine because CFCFG only controls behavior when
there's a context fault and there can't be TLB entries for entries
that cause a context fault: "The architecture permits the caching of
any translation table entry that has been returned from memory without
a fault and that does not, as a result of that entry, cause a
Translation Fault or an Access Flag fault."

Connor
