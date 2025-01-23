Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F9A1A55D
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 15:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1173C10E814;
	Thu, 23 Jan 2025 14:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ki00wXjY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DC910E814
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 14:00:29 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f7d35de32dso228878a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 06:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737640829; x=1738245629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrivE+jXCcpkJfX31hjpK5tPlRP7KoKj2mnULiizYXQ=;
 b=Ki00wXjYakzYznvGaKezccWt1qABfrCRsQPwvKOKo/1V9Szi4y6Fta72Mafbs2VLx+
 VLYSEIWbddV5WNBSxUf5/1U0RdqkMegzSINply6c9/tweZ0ZUVCS6kEjCLb1B1Le3oqd
 ZuJ3SLer1n5vRWEg6ISs+Qx+eNxJB6K+yPfaXbqqdrGOa6OOOqs4SLO0j9wf9GSuNYmr
 IRh9ltDgwP7EmasbLRwV8yB/auBW8Az45IO0H06SUoRSQS5XEq1HID0CwBzFDjd3z7Pl
 p5xQfQAISXeRVg5w7BHRIqeujQWfsFX3Q043+L0qTa88HgQ2MsDX+efUrr4YVD5x30HY
 WlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737640829; x=1738245629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KrivE+jXCcpkJfX31hjpK5tPlRP7KoKj2mnULiizYXQ=;
 b=xEmJyQZXJUwySVHDFwYqdmGd5MDepdlNzwu8Z8uaYL3ZJJojFvDkRqFzf8WMxGHtHm
 Obo4oDNFmy+h5m9+lH9AYEuZX8eckIoMGTHwzroJZQ0QeLgKZtrUgSkjj8Y7eSIdKxTU
 Xi6f32I5L7qV+uzQhPyCfo7TvExg1aR42GnQ6nwIe8q/OwvUDOFhriSDLrNZwayufM7U
 Gjg2NIhvytBsyk5Vq5HTInsCV2dGmwqMSP3nHjNbdhm4tG/XsNIpu2lSWYUu2lVUaOyn
 b09RIFxYPZ+GLolybqrMFnqlB4BV3/EIW+bZqGKYPuHIjhuk3bEcNk2jMXe53kRzS1On
 MWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTTfG/gDIWi9ilQwtqn+gByqcjkTfOJIsBr7n9EJ707/LwNfDC83JJig+xb2xqZEiQ5dVNTfXdYtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxyd1dnq7sw5D1MGhV3zvDN6s1aVQtIuDGtYkQJWLbM2XXquS2i
 y7RnAh+l/MAmBHd1bABOeFZOzge0DNt037TNgo43DTcTPxMLjSWeap8fREQA4E0lK2HWJLjpINS
 u4Jix+EaKgjKlaR6r+wSsbeS2Th8=
X-Gm-Gg: ASbGncsBiZT3ENidITaezbWaLx4F+LpgZBhWWbVzyaW3rJJMk7vXJ2WxsK1zbsHXBXZ
 NvdXhb2E2mtWgqo2uvzNxq8WCzWkYH8B6r3Ro6RQyHr6nUiMnWzH+LYPdVAmnYQ==
X-Google-Smtp-Source: AGHT+IFmTC6qmDF4oUBj7xpD8an7Qpq8DoBkwz2IBfRe4cVvkaz/pes+WZH4kbi478o6Q0jVZbaKQwuX1r2P0uDuuGQ=
X-Received: by 2002:a05:6a00:2406:b0:72a:a7a4:99ca with SMTP id
 d2e1a72fcca58-72daf973e78mr14767252b3a.2.1737640828927; Thu, 23 Jan 2025
 06:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 09:00:17 -0500
X-Gm-Features: AWEUYZkhKWn32H9Mkt-2dMmko580derQXOamfCI9VPysLRLbJNJBREOXqAVlk7w
Message-ID: <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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

On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
>
> > @@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(c=
onst void *cookie, bool termina
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > -     u32 reg =3D 0;
> > +     u32 reg =3D 0, sctlr;
> > +     unsigned long flags;
> >
> >       if (terminate)
> >               reg |=3D ARM_SMMU_RESUME_TERMINATE;
> >
> > +     spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> >       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> > +
> At this point further transaction can be processed but SCTLR.CFIE is
> cleared so subequent context fault will not generate interrupt till
> SCTLR.CFIE is set.

If you're asking why the spin lock is there, it's because this isn't
true if there's another context bank, they share an interrupt line,
and it happens to fault around the same time. I haven't checked if
that's actually the case for Adreno, but in case this gets used by
other drivers and moved into common code I want it to be as robust as
possible. This is explained in the comment added to
arm_smmu_context_fault(). Also the next commit toggles CFCFG and we
want to serialize against that.

>
> > +     /*
> > +      * Re-enable interrupts after they were disabled by
> > +      * arm_smmu_context_fault().
> > +      */
> > +     sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > +     sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> > +     arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> > +
> > +     spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> >  }
> >
> >  static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c52=
56452b2b2efa928f1 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >       if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> >               return IRQ_NONE;
> >
> > +     /*
> > +      * On some implementations FSR.SS asserts a context fault
> > +      * interrupt. We do not want this behavior, because resolving the
> > +      * original context fault typically requires operations that cann=
ot be
> > +      * performed in IRQ context but leaving the stall unacknowledged =
will
> > +      * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> > +      * set. Work around this by disabling interrupts for this context=
 bank.
> > +      * It's expected that interrupts are re-enabled after resuming th=
e
> > +      * translation.
> > +      *
> > +      * We have to do this before report_iommu_fault() so that we don'=
t
> > +      * leave interrupts disabled in case the downstream user decides =
the
> > +      * fault can be resolved inside its fault handler.
> > +      *
> > +      * There is a possible race if there are multiple context banks s=
haring
> > +      * the same interrupt and both signal an interrupt in between wri=
ting
> > +      * RESUME and SCTLR. We could disable interrupts here before we
> > +      * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> > +      * Lock the write to serialize it with the resume handler.
> > +      */
> > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > +             u32 val;
> > +
> > +             spin_lock(&smmu_domain->cb_lock);
> > +             val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> > +             val &=3D ~ARM_SMMU_SCTLR_CFIE;
> > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > +             spin_unlock(&smmu_domain->cb_lock);
> > +     }
> > +
> > +     /*
> > +      * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> > +      * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> > +      * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> > +      * first before running the user's fault handler to make sure we =
follow
> > +      * this sequence. It should be ok if there is another fault in th=
e
> > +      * meantime because we have already read the fault info.
> > +      */
> The context would remain stalled till we write to CBn_RESUME. Which is do=
ne
> in qcom_adreno_smmu_resume_translation(). For a stalled context further
> transactions are not processed and we shouldn't see further faults and
> or fault inerrupts. Do you observe faults with stalled context?

Yes. I've observed that on MMU-500 writing RESUME before the interrupt
has been cleared doesn't clear SS. This happened with v2 in the case
where there was already a devcoredump and drm/msm called
qcom_adreno_smmu_resume_translation() immediately from its fault
handler, and we'd get a storm of unhandled interrupts until it was
disabled. Given that the architecture spec says we're supposed to
clear the interrupt first this may have been an attempt to "help"
developers.

>
> > +     arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> > +
> >       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> >               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
> >
> >       if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> >               arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> >
> > -     arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> >       return IRQ_HANDLED;
> >  }
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af3742=
6e005241a8288da20 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
> >                                        ARM_SMMU_CB_FSR_TLBLKF)
> >
> >  #define ARM_SMMU_CB_FSR_FAULT                (ARM_SMMU_CB_FSR_MULTI | =
       \
> > -                                      ARM_SMMU_CB_FSR_SS |           \
> Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUME
> does, this seems right. This but can be taken as separate patch.
>
> >                                        ARM_SMMU_CB_FSR_UUT |          \
> >                                        ARM_SMMU_CB_FSR_EF |           \
> >                                        ARM_SMMU_CB_FSR_PF |           \
> >
> > --
> > 2.47.1
> >
