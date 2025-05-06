Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C6AAC775
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 16:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A865B10E350;
	Tue,  6 May 2025 14:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9mspyel";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EA810E350
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 14:08:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22e423394feso1286315ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746540497; x=1747145297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMambQHHu9+TC3RPEGjqmbblfLTvr1IrSGG4pLfvj0w=;
 b=W9mspyelhB+XyyhTvWuw/iPEgJSVhANBoyrVM+/82usEw9wQGp/Cc3lLxtVeJhnYvX
 zdBLvFjelarn28Y0llkXKAAb79f9CulOdr73UuUakutPVKVtbS0/PI34guFnkVTkzjlH
 01emwBvaeZ7Z19FfPOTE5YutihtluTOo7jR9WPU0rpWf0eBfAsPy+UieSYbyLl6/wN6+
 oyzwmjaTxQweHdWZpF8o42lDhquQi3aZTY1gM2rIxX0NGwt8ahwWb97IwgD8G3K5eXUa
 4wP6RdKeEdMe8VK0eEW1txQKhXH+jtKSD1Wl/XcRR1JqNolRq3XpBsyBoEjXXjqSYT0G
 CYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746540497; x=1747145297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMambQHHu9+TC3RPEGjqmbblfLTvr1IrSGG4pLfvj0w=;
 b=VYIQs7EkAQaP2c7iUKRGgbkyAdalnJVtBFJSIQUMeo4rQemF4buUNsGzIu6JE9n1ud
 O+eyDJkGWjtDx9GsfAohwROqxBx64XrKL8dmkoTmMjpwm5efZu52ON3pRzj3XiHHC124
 p7ofn6hsMIs5cLeURTnH1VdDW7gcaXjd+2xmucpb1a4BhhINo0teWKy/zy9GPeHxDO1D
 AYSSJEQW7kxh3tAnhhPxWazTCu5by6+Ds3klayNqz/r+q1j3Eb/ufyfUGDlKk1nYLXC7
 qYusk9yxhr7qq5/BYXOkHVzYDdlMM1/F0/ASi9shjY7n8bAxK58TdcUTudkJU2E02KIS
 8oQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1cVmg44ig1vkqJj+disJXp/KKZtOnviySs/NbI9bUsfCncEnmuSxeBIWbj/6WmZgSr79sl5EjeCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl3wG85a6Q5+uULmrCm7hcUarka7NtDTvYNiLdXYF4jf+MPBkt
 d0m0N+ecA/Nflnp8yz6Xg4NaLHSL13gjNeutwYuztyA0rQKwaZs0Neo7nqFQKYrbYB9qbBf0k/O
 KJ8QJsSqHzl8VRS2/7pzH0cxFy6E=
X-Gm-Gg: ASbGncuc0tScklVv2Bj7+J+tfXMMzeGWcPwlW7amm0UK84aEvnWa9DDlsJ4EgvY4u6g
 i4uZrA7dU5/1N62O5g5iUZWgewyLHwShoREiRTp7p0p33mBnRu2PFcgZAaj89m0H8Ns0dvyaqGp
 HWmMGVcA6FksQ5i3PZg8cm0g==
X-Google-Smtp-Source: AGHT+IF23nCrJaH3Mng+oDEHNLDP6N6PfnCkKREry5Wzy8HtvIefEq1olFphNquoaJEf3Hy0gX7xlzc7Wvr6z2YpGbI=
X-Received: by 2002:a17:903:41c2:b0:224:88c:9253 with SMTP id
 d9443c01a7336-22e102f3293mr93572875ad.6.1746540496500; Tue, 06 May 2025
 07:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
In-Reply-To: <20250506122449.GB723@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 10:08:05 -0400
X-Gm-Features: ATxdqUGXywpmRh-T8ACY0CkrWhxLattxcHrjANwJCwaesOG_LtpOol-JucgftpU
Message-ID: <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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

On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> > asserts an interrupt. The only way to clear that bit is to resume the
> > transaction by writing SMMU_CBn_RESUME, but typically resuming the
> > transaction requires complex operations (copying in pages, etc.) that
> > can't be done in IRQ context. drm/msm already has a problem, because
> > its fault handler sometimes schedules a job to dump the GPU state and
> > doesn't resume translation until this is complete.
> >
> > Work around this by disabling context fault interrupts until after the
> > transaction is resumed. Because other context banks can share an IRQ
> > line, we may still get an interrupt intended for another context bank,
> > but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> > it assuming that interrupts are disabled which is accomplished by
> > removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> > asserted unless an external user enabled stall-on-fault, and they are
> > expected to resume the translation and re-enable interrupts.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > Reviewed-by Robin Murphy <robin.murphy@arm.com>
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++=
+++++++-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
> >  3 files changed, 54 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e=
3ab80e0fba936e214 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(con=
st void *cookie, bool termina
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
> >  #define QCOM_ADRENO_SMMU_GPU_SID 0
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e60=
79edc6393d1938c98 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
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
>
> s/translation/transaction/
>
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
>
> I'm struggling to understand this last part. If the resume handler runs
> synchronously from report_iommu_fault(), then there's no need for
> locking because we're in interrupt context. If the resume handler can
> run asynchronously from report_iommu_fault(), then the locking doesn't
> help because the code below could clear CFIE right after the resume
> handler has set it.

The problem is indeed when the resume handler runs asynchronously.
Clearing CFIE right after the resume handler has set it is normal and
expected. The issue is the opposite, i.e. something like:

- Resume handler writes RESUME and stalls for some reason
- The interrupt handler runs through and clears CFIE while it's already cle=
ared
- Resume handler sets CFIE, assuming that the handler hasn't run yet
but it actually has

This wouldn't happen with only one context bank, because we wouldn't
get an interrupt until the resume handler sets CFIE, but with multiple
context banks and a shared interrupt line we could get a "spurious"
interrupt due to a fault in an earlier context bank that becomes not
spurious if the resume handler writes RESUME before the context fault
handler for this bank reads FSR above.

Connor

>
> I think the broader problem is that we can end up reporting a spurious
> fault when the irq is shared between context banks. However, your change
> to ARM_SMMU_CB_FSR_FAULT fixes that afaict:
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08ae=
a14ea5656d3e31328 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
> >                                        ARM_SMMU_CB_FSR_TLBLKF)
> >
> >  #define ARM_SMMU_CB_FSR_FAULT                (ARM_SMMU_CB_FSR_MULTI | =
       \
> > -                                      ARM_SMMU_CB_FSR_SS |           \
> >                                        ARM_SMMU_CB_FSR_UUT |          \
> >                                        ARM_SMMU_CB_FSR_EF |           \
> >                                        ARM_SMMU_CB_FSR_PF |           \
>
> because now any subsequent spurious IRQs will return IRQ_NONE. So I
> don't see why we need the locking at all. What am I missing?
>
> Also, I think your change probably exposes a benign bug in the qcom
> debug code as qcom_tbu_halt() has the following:
>
> if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS))
>         ...
>
> Will
