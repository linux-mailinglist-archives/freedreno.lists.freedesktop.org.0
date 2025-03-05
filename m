Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56176A50B06
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6E89613;
	Wed,  5 Mar 2025 19:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LBPX8LS1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF989613
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:09:23 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d2b15760adso23688395ab.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741201762; x=1741806562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
 b=LBPX8LS1QQ7NjfELPWNAb4s8BtzYnWUUP2qUrof6EHtH1cLgy36k7QFgMV0FE77fq4
 PIVM/ffNC4SEnnc58HVf2q3kJ3JRP7NKrMxvdI9NPqyFcOlsupFkjOkhmCw3ClLGt1eh
 f0aZf1yESxOwG1FeNjsLxc9WFuRJ9ofOURQ218IY5hTZHF8ZcXjhxCjp/1qRBwY1GRhM
 HB1Oas3K7DCf2dce6tIaCQXYERtAvRsEzkJsf4eJp373Z/6CSB6MHLz5P3C8Mb5wdtUc
 QshEF+UU2XLxBmD56TjUxnIXN7+kIGZlvb76u2H93Wzz162J746bhfHNZrGrWQJ2kwqQ
 26Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741201762; x=1741806562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
 b=Px9ltTGboSbpI2DdAixKNqjzgBlY1bJ7eNfqrsYJtbRx7MqnBY69OADgmqzM5Rp3ag
 QNcRVI8B+Meq+ckukVEWCPlhxGv8JYIvAZe75sCsgWkWN0uSRluG+cZ0eIOb+/g22P19
 svzJJ7L6+Rqr0KE6HteGv4EGUmGYDtLNSZEFO5rktUuR909C5Z6/PfcGS22uIU2/725C
 NpDuLIdK/QIvmt7HP4Fz5ujRiU7dshZyAZOcTEeKNsoFsQVmAQoxM5QsaJ5sOElqlHsf
 E83d8CClueDmGyc3vUnHdruvfWed98ThTb3GS6UFdTfbqk9yoOjXu1t7h0UG9xlISvEj
 gIbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3r1Con+NbrCyYyxA8z7TbdMp+upBWuoO7buY5YR6obky8IizcTiCANmh6vSrQNc7vyc1ev8NCN00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIajtozy4I82TEPCMY24XDReuMZYu3TT7il98zlIMu0VVlKmJw
 OeLMVaDnANkFFR0iPVUad32cMiBb6Iv+2aQ73UgZkUsQGmvFZ19rplUH3mBzOgMjBUYUrSKYffu
 Sc+/nd2nIyeZpLXCR1dOueA+2Uws=
X-Gm-Gg: ASbGncv68p8CGqWbJNYS9FKmUczSiShB0LJ5pup15iVvBOZrnan9GHpEvczGD8EXaT+
 szEXFsvEQxdnjHGJEWqNZEh6rnEaG1BSHNi5ziqBJ13xTaQjiej2K09F4sDJHpqQWEEJ75OweRL
 cZR8Ub8zoSJpDB2byF2a3nj1zdcg==
X-Google-Smtp-Source: AGHT+IHXSq8mWw3KY8YoLCBCIFRQJmRjg67dMe+0ZPdRqaHGrvPtLaHOP4skAGzoNpcXGSt7lkAets5eLSq4yACekVE=
X-Received: by 2002:a05:6e02:1a6b:b0:3d1:78f1:8a9e with SMTP id
 e9e14a558f8ab-3d42b9aca8dmr52094955ab.20.1741201762171; Wed, 05 Mar 2025
 11:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:10 -0800
X-Gm-Features: AQ5f1Jq4dtaQy1zNSNrep0WaI-YiXYB1_xIUUY21RnpPU0GevSqQZgpgVwJN9cQ
Message-ID: <CAF6AEGvPvQuptuA07kDYdUDQh4iQA=g+c3t0OCjR1HfWZ6mSbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
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
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
>  3 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a=
39866a932360d4e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>
>         if (list_empty(&tbu_list)) {
>                 ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> -                                        cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                        cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>
>                 if (ret =3D=3D -ENOSYS)
>                         arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>         phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
>
>         tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -                                cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
>                 ret =3D IRQ_HANDLED;
>                 resume =3D ARM_SMMU_RESUME_TERMINATE;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75=
eea1d5de23117de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>                                       struct arm_smmu_context_fault_info =
*cfi)
>  {
>         cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +       cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>         cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>         cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> +       cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>  }
>
>  void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int=
 idx,
> @@ -419,7 +422,7 @@ void arm_smmu_print_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>  {
>         dev_err(smmu->dev,
>                 "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -               cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
> +               cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
>
>         dev_err(smmu->dev, "FSR    =3D %08x [%s%sFormat=3D%u%s%s%s%s%s%s%=
s%s], SID=3D0x%x\n",
>                 cfi->fsr,
> @@ -437,15 +440,15 @@ void arm_smmu_print_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
>                 cfi->cbfrsynra);
>
>         dev_err(smmu->dev, "FSYNR0 =3D %08x [S1CBNDX=3D%u%s%s%s%s%s%s PLV=
L=3D%u]\n",
> -               cfi->fsynr,
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : ""=
,
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
> +               cfi->fsynr0,
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "=
",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
>  }
>
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> @@ -464,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>                 return IRQ_NONE;
>
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
> +               cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :=
 IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..d3bc77dcd4d40f25bc70f3289=
616fb866649b022 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -543,9 +543,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
>  struct arm_smmu_context_fault_info {
>         unsigned long iova;
> +       u64 ttbr0;
>         u32 fsr;
> -       u32 fsynr;
> +       u32 fsynr0;
> +       u32 fsynr1;
>         u32 cbfrsynra;
> +       u32 contextidr;
>  };
>
>  void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
>
> --
> 2.47.1
>
