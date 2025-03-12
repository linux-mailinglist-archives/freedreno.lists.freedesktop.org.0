Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CBA5E291
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 18:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DDD10E145;
	Wed, 12 Mar 2025 17:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HwxlIFDH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786B10E719
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 17:23:52 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3d46fddf357so108585ab.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741800231; x=1742405031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
 b=HwxlIFDHkMFUqcI98/I1dFBkq+epFhmkPIZK7NfoRRwnUxruxDA2alhXMHvp3iQOlt
 THAK2bTB/6VnsSHZtfY5qFEhic3zBu4jptNsj4P2HFc/Rwwhed8WEuToRYVKsNQrjbQF
 jPII2+dUJ73SrC+Cxykd0h1ndlqyWZnEApD+WMiyi/U/oLuPLIwDpTYWUVmdeiRSEgBc
 yBPZvwTmHCBAoHVGY77V6pVvxOQl9Z2Zev8tJUAGKrqTpYYqVQzonD+NCT6QTsS9wtbS
 5HzgEN/ecb5XIXxfCLNOybVbITE1ldsEm4C8Yti1gZuF0VMjaEIInERqOEwzK+pMCTNW
 zrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741800231; x=1742405031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
 b=e1TNLGT3yB0Qibra7ZgWv4d1hjRiCfaTWNQI+1af06j/Cse6SUbNqvl9pNwg/1Z35c
 vAlbcbChUT2NjRPy9s0Q9fn0fr5XvKWuaeV2g8kV8kMmh3fYDKzP7i8NZYlH46VO/rDS
 4x5pWna8cZkBxoTtti20VEI+vkTNAIhAZgF++dgU8SkK/iR53j6jmmwxfGt/CVxWCgbK
 YN5WcHmwlPpLvSTwhoq2H9NwIyls7IVnNJXQkTF4yO8WGqM9oPMDYw1uiWFaxIFFS4az
 KJENxGEWGSnLr0AKbh3Y8PIEMqBjV6V17ptqJfg3wGYtyvCwWGWLkBq4LVpts2Gh0dEl
 YE/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN5Dw8GOdn8Jtnq0b9GG1NKA+RH2BKtzZqF7aRyEI6KcsjWKgPy5qdW4L67tOKO2nbuzXu4VhYpY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnzRINkiE6EwIg9oaY6H4Pd6/uH4lJmkhITFyez+Yxv0y/MOlw
 434/tOgva6CXwdKMzum/kOB9w3pSz4CIYsax6oenXl0eZyzZO8r57kOhYwSxI4byK7ShvALvIvn
 5TbKm0KWRX4X8dUqQcMm3L3HDtu4=
X-Gm-Gg: ASbGncvy7wa/eteFQzr1FhYY5bjJS0d5j0aXdO6IbETG5Cj3ltxCK/tHhc2mDdbXtwR
 1ciXNtxVu2+mkaVxNnde0m+9S88ya1pAHo+qGSlMlgeFhEv66ijg4Ki6C5cSVw2YrxMXzvbaVSv
 XAFS1jG5vVD/3DeZgqxKnrAq7+sQdB1hEWNacUQt/u/AdSHhk+0dlQOs/PKHgFQsx6J6U=
X-Google-Smtp-Source: AGHT+IGcOjBT5pnQnFzsB43flH0b/lHGboYrzDRZ8j3X26uAhwiB1vx8sBVrCRaRim73zA8BO7Uy4425SARrON6xCxo=
X-Received: by 2002:a05:6e02:1a84:b0:3d4:2362:98d8 with SMTP id
 e9e14a558f8ab-3d4419576dbmr239903965ab.2.1741800231340; Wed, 12 Mar 2025
 10:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
In-Reply-To: <20250312164735.GA6561@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 10:23:36 -0700
X-Gm-Features: AQ5f1JpoGELyygSS0E-6GUOCTc5ufPPqVKk2sRxHePqLfAbRabP5NvXjW3XjOTE
Message-ID: <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
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

On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> > > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.c
> > > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e=
3be0bfba75eea1d5de23117de 100644
> > > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(stru=
ct arm_smmu_device *smmu, int idx,
> > > > > >                                     struct arm_smmu_context_fau=
lt_info *cfi)
> > > > > >  {
> > > > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FA=
R);
> > > > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_T=
TBR0);
> > > > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR)=
;
> > > > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FS=
YNR0);
> > > > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR0);
> > > > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR1);
> > > > >
> > > > > We already have an implementation hook (->get_fault_info()) which=
 the
> > > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_inf=
o().
> > > > > That thing dumps these registers already so if we're moving that =
into
> > > > > the core SMMU driver, let's get rid of the hook and move everybod=
y over
> > > > > rather than having it done in both places.
> > > >
> > > > As you probably saw, the next commit moves over
> > > > qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> > > > used by drm/msm to access these functions is specific to adreno_smm=
u
> > > > and there isn't an equivalent interface to allow it to call a gener=
ic
> > > > SMMU function so it isn't possible to move it entirely to the core.=
 At
> > > > least not without a bigger refactoring that isn't justified for thi=
s
> > > > series that is just trying to fix things.
> > >
> > > Ok :(
> > >
> > > > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_C=
BFRSYNRA(idx));
> > > > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
> > > > >
> > > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't =
dump
> > > > > it for stage-2 domains.
> > > > >
> > > > Does it matter if we read the register though, as long as users are
> > > > aware of this and don't use its value for anything?
> > >
> > > I think the contents are "UNKNOWN", so it could be hugely confusing e=
ven
> > > if they just got logged someplace. Why is it difficult to avoid touch=
ing
> > > it for stage-2?
> > >
> > Fwiw, we are only ever using stage-1
>
> Sure, but this is in arm-smmu.c which is used by other people and support=
s
> both stages.

Sure, but no one else is using this field in the fault-info.  So maybe
the addition of a comment in the struct would be enough if it isn't
going to cause an SError/etc to read it for S2 cb?

BR,
-R
