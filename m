Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B49A5DF9C
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 16:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304E110E2C5;
	Wed, 12 Mar 2025 15:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YJk3MZmn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD0010E2C5
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 15:00:06 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3cf8e017abcso24270985ab.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741791605; x=1742396405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
 b=YJk3MZmnB/i6YGY8eZa282BIRnqbL5ZePEorruj7I7hSfH0uEKUjbyx1ASWqWovjA7
 X/6PBhPPq+to3mMf8B/Ff7FYZvmV/SnfiUOY6ZIBtIV4h8V7xL3zDc4PoYlBDVYDtFcQ
 4gHtwtr/syGCW5h6ouZuidkfK45rez3ogfZLkMPYrEmI6K28uk1K47NSAcRyKNjnuLCI
 3Yaq9DxkkdBRnIlwJJm6kHhXbbff42HWLjQGQjd+e1jbDLydOljBxugk5GqHRP8+WUwF
 PgRrsyZ7iKBlvtt4ZA8Wpt/gc48esWav3zUM2VKctfvWNHwUQDL5cR65F1WfnYZ4NKz+
 MIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741791605; x=1742396405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
 b=Vxmef/Xt8bpgaPRB44ShRKrVnkIPcWa+tETO6qHriJ8/yA7eYMgIEXhIfRg8faL9Qk
 cKvteVPcm3yMzwKE/vQgzqUntxBEx3FKj1ie6voTY3h5bR17k8pny3cDAzAe8tElmsPG
 Ubuigb4N0+yWS25+XrkkeZTJyCDB4jRdZnVepGSjb8hLcmPTag+yMNJzvi7ZFchLMSRv
 jFSkSpAyFs1QtxBbp1dJTbBchxchKOcQ7T04/U9XUx4//1SF9NHvQM5UHGmEwS4xNZys
 jIKzkmKjRQt0Q6pAqUokPCcjWFu6FQacunMSXyY6m9KjQ17mD8NK9O9kweZ9LH1SM1vy
 8QlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6I2Bn7dMlDp0ozc95ZBWMKrXncmvmin7N08wksHiFa80E9zietepQj8Q+VWg7POCaV8TNdPs+RGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsKdgEzzhr+H3lnTl8NHa9DNEFSS134pxiezoD+svm/+uikRdG
 SNQBAdUxSEw4ViQNZ0tK8dLpa1P3O/T499n5kPB/+5YFspJQq72SW8kIvWVaqVSXY66xPNKbSKI
 xGKWOUfIiBsePITq//oBQO4QD6OQ=
X-Gm-Gg: ASbGnctF5z5KSxi9DxNULEZSs5pKMmj/WFDLmXHnpb4Xjv0kRfVvkAmTQoPFZL9bq8w
 tllrIZgv7VNMioHG/XpkVgIxULBl9QNBx0Kr9sGfRHh27u1U5W5QVLcHCCv7/xUSTMAfIH8sRtS
 FLOHFdiOppLmwad5sZYKhbh405LRmL1yNoRXeS5sK9tYNocx2yUxemx5lV
X-Google-Smtp-Source: AGHT+IG89CocD4yRKYNpZ9RLEOYRBeA78CpihMbt2tnLubfpVvKNjOKB0QgfM5gz+kA7p7liUlyqeFuRDen+lF6vWSw=
X-Received: by 2002:a05:6e02:3f89:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d4419902e4mr241203255ab.10.1741791605230; Wed, 12 Mar 2025
 08:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
In-Reply-To: <20250312130525.GC6181@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 07:59:52 -0700
X-Gm-Features: AQ5f1JorVIrx8dg8nV8siCMmQzu9hAMvxaP2jgGpa2BA4UCWgNEK-jMOL9dUEzA
Message-ID: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
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

On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > This will be used by drm/msm for GPU page faults, replacing the man=
ual
> > > > register reading it does.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 ++++++++++++=
+-----------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/dri=
vers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f5=
39557a39866a932360d4e 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >
> > > >       if (list_empty(&tbu_list)) {
> > > >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL=
, cfi.iova,
> > > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYN=
R0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSY=
NR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >
> > > >               if (ret =3D=3D -ENOSYS)
> > > >                       arm_smmu_print_context_fault_info(smmu, idx, =
&cfi);
> > > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> > > >
> > > >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.io=
va,
> > > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ?=
 IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR =
? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >       if (!tmp || tmp =3D=3D -EBUSY) {
> > > >               ret =3D IRQ_HANDLED;
> > > >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0=
bfba75eea1d5de23117de 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct a=
rm_smmu_device *smmu, int idx,
> > > >                                     struct arm_smmu_context_fault_i=
nfo *cfi)
> > > >  {
> > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0=
);
> > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0=
);
> > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
0);
> > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
1);
> > >
> > > We already have an implementation hook (->get_fault_info()) which the
> > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > That thing dumps these registers already so if we're moving that into
> > > the core SMMU driver, let's get rid of the hook and move everybody ov=
er
> > > rather than having it done in both places.
> >
> > As you probably saw, the next commit moves over
> > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > used by drm/msm to access these functions is specific to adreno_smmu
> > and there isn't an equivalent interface to allow it to call a generic
> > SMMU function so it isn't possible to move it entirely to the core. At
> > least not without a bigger refactoring that isn't justified for this
> > series that is just trying to fix things.
>
> Ok :(
>
> > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRS=
YNRA(idx));
> > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_C=
ONTEXTIDR);
> > >
> > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > it for stage-2 domains.
> > >
> > Does it matter if we read the register though, as long as users are
> > aware of this and don't use its value for anything?
>
> I think the contents are "UNKNOWN", so it could be hugely confusing even
> if they just got logged someplace. Why is it difficult to avoid touching
> it for stage-2?
>
> Will

Fwiw, we are only ever using stage-1

BR,
-R
