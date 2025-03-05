Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1EA50B34
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900D89A94;
	Wed,  5 Mar 2025 19:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVPiWgpm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6589A94
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:12:49 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3d0465a8d34so62979645ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741201968; x=1741806768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
 b=cVPiWgpmPRLn6mr23uPkrWZezzcKT5xsWFNM1NmAGmH79WFLkMQOOCB21qcbqFBYef
 fcGGCU5Q3y3LASmxqoq3SmgBi6XINsV31fcxi6S88D8MYf1r/YTJHc/1K/DWowSJjutZ
 wARNzNl0g1+HkldEzYh6sqGmChbvKwm0V3yuRtkEdN7x/FfAlwLwoVmZj6q65KcdPprm
 T15QYprQeGEKYhMkhr/PjiO63rLqqvhbYb/TstxL0mFqixqEnxAqUOSKo6W6MNQ6XUkd
 GM2DCgEduqED7zkg1SfN1tFc7HF2ZyIYdJQ/2M1V17FukVljkLC9uAMWvu1XqfzTtSkv
 AVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741201968; x=1741806768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
 b=aVqE01gPRpSN6TU/Og2jSUBdPq2kzjX86Er0Sou9R4xeClDbHEzYVj1G18SCf83J4F
 U1Ly3QEHHQpjHOHddGuhRr65JTgvmHDkcUF3X94zSQn5r0DUCs99lpQqrJ9q5HCWJOq3
 q5FKyM12DHQJeSEK2iBuZJ43w5sK1xIcEb207IrS6nSDxdINBHChKtj8kIsJtuN8VEd2
 j5EP1zJ1n7vae63tdivIRzKz25lz00DvfiBisc5wsHbv+XdcODhSky002d1UTResCsAl
 yLheV2w4RJrEvag54sDH0pBqtaqioyZEsJvZwVGe8eR3pg1QNw11/DNV/GRo+txJ0h//
 Owkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV2fSJiVG0N38jGy1LptpHAxDh5f94VLNAg4edhy2x5aXcIrBnO8K9LO3y4ZNNr/qbS4y3649OKkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeKmREgNoKrYwSeA1lbZG5hiIf/oYy/iUI3nW1t8Yck34nGLdz
 IA/ggCRmM339J9gCOvRD3pcn6X8Zx/Gfvf/iiE34v1Rqu3ahSBZjk2PKyhRkhYP9PQD3Yh08/KI
 ImzLVKqiVM22G2dOqeozvj9Qo33A=
X-Gm-Gg: ASbGncuA83tCU3jGc5YoPqFCSgsGtze5D8kSSquorFRDhvhzo2f3ZdBNBnvuGEb7IKp
 5ia5nQII80v6bthEMovlxWqDrCP5pwGfFox1g3M3G1NxIUuvSVmxa8xijiUP4B9hYAAy2qE/Xqv
 8JqX2JyPG331WBCZy3+TiWq0jYTA==
X-Google-Smtp-Source: AGHT+IHlEINA/jfl2bBPP1ul53oTsOP5ym9Trq3jpGpB8Vm7TzTmI2nqJcEmRK+XL9G3vhk3sJwn4J0bQLvJBmoMCFg=
X-Received: by 2002:a05:6e02:188c:b0:3d3:d28e:eae9 with SMTP id
 e9e14a558f8ab-3d42b890630mr57345765ab.7.1741201968293; Wed, 05 Mar 2025
 11:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:12:36 -0800
X-Gm-Features: AQ5f1Jo4BXeEdaC2izHqFmQ2gL7iBiicL-43RgNDhM5BByTDG8vBtJ6rU6EziYc
Message-ID: <CAF6AEGsi1s4rO0_HSy44ikFGXNJAkBxfBMucRyGA+xokzOsP_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
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

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
>
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> asserted unless an external user enabled stall-on-fault, and they are
> expected to resume the translation and re-enable interrupts.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++=
+++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3a=
b80e0fba936e214 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const=
 void *cookie, bool termina
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -       u32 reg =3D 0;
> +       u32 reg =3D 0, sctlr;
> +       unsigned long flags;
>
>         if (terminate)
>                 reg |=3D ARM_SMMU_RESUME_TERMINATE;
>
> +       spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +       /*
> +        * Re-enable interrupts after they were disabled by
> +        * arm_smmu_context_fault().
> +        */
> +       sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +       sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +       spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 498b96e95cb4fdb67c246ef13de1eb8f40d68f7d..284079ef95cd2deeb71816a28=
4850523897badd8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -466,13 +466,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, =
void *dev)
>         if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
> +       /*
> +        * On some implementations FSR.SS asserts a context fault
> +        * interrupt. We do not want this behavior, because resolving the
> +        * original context fault typically requires operations that cann=
ot be
> +        * performed in IRQ context but leaving the stall unacknowledged =
will
> +        * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> +        * set. Work around this by disabling interrupts for this context=
 bank.
> +        * It's expected that interrupts are re-enabled after resuming th=
e
> +        * translation.
> +        *
> +        * We have to do this before report_iommu_fault() so that we don'=
t
> +        * leave interrupts disabled in case the downstream user decides =
the
> +        * fault can be resolved inside its fault handler.
> +        *
> +        * There is a possible race if there are multiple context banks s=
haring
> +        * the same interrupt and both signal an interrupt in between wri=
ting
> +        * RESUME and SCTLR. We could disable interrupts here before we
> +        * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> +        * Lock the write to serialize it with the resume handler.
> +        */
> +       if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
> +               u32 val;
> +
> +               spin_lock(&smmu_domain->cb_lock);
> +               val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> +               val &=3D ~ARM_SMMU_SCTLR_CFIE;
> +               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> +               spin_unlock(&smmu_domain->cb_lock);
> +       }
> +
> +       /*
> +        * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> +        * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> +        * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> +        * first before running the user's fault handler to make sure we =
follow
> +        * this sequence. It should be ok if there is another fault in th=
e
> +        * meantime because we have already read the fault info.
> +        */
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
> +
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
>                 cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 411d807e0a7033833716635efb3968a0bd3ff237..4235b772c2cb032778816578c=
9e6644512543a5e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
>                                          ARM_SMMU_CB_FSR_TLBLKF)
>
>  #define ARM_SMMU_CB_FSR_FAULT          (ARM_SMMU_CB_FSR_MULTI |        \
> -                                        ARM_SMMU_CB_FSR_SS |           \
>                                          ARM_SMMU_CB_FSR_UUT |          \
>                                          ARM_SMMU_CB_FSR_EF |           \
>                                          ARM_SMMU_CB_FSR_PF |           \
>
> --
> 2.47.1
>
