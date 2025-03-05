Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB8A50AFF
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B00899C7;
	Wed,  5 Mar 2025 19:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzVImIdw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716F6899C7
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:08:52 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3d2a869d016so21503775ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741201732; x=1741806532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0rwdbOsrvhVQWkD+6wv4GBig+hVeZ1WlsuKcRFEC24=;
 b=lzVImIdwR4lJH2jB44fz7QiskpSsdYSKSIuWmuW7OsZF6v2TxjB1NQ/uW7nfuO9rBf
 2XpuNrXpznk1QymGDSrmusOZ0n+jRlB+I2DKT9NDiRxEy7/foDfC7JPZctCqgHAi5x5t
 0yiWfIi32oZX2JxTWyIDMN2oTISHs9RGpsSXhOVzh4p9o3tk4Hbb66pGNA+roBuE1i5S
 pc3LMsDliJ96TY7T5GeE+oOGcoPRtlS13iO4ogvrmERgksZUxJEXwHwLNAeKX4gm/M3x
 d9gEwhnBEwJwTxaYOv4n9kLB0K7cuNuylk5AvPAo9709JGpokLCJtA+xTV0jkPybaqNm
 Ydsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741201732; x=1741806532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0rwdbOsrvhVQWkD+6wv4GBig+hVeZ1WlsuKcRFEC24=;
 b=rWArVxvmnJJSRr+SbMFaYXpbVsymNGyH5oQJP1wuhQTBLpL+lKzU+05Tr3NGLakXm8
 N62JuODajecpl7TQ7x7Ra3bMwJFvrkeNqIASf4tdZNLmsBrUBjHwvmxit3cZ0Arthf1C
 fZ5olcn4yFzonx5AY92AszXctipk9+XuBYxp43zMPnPgmpbzuK69Y8fze52AlF3+z5KE
 uTBsMSOUzZ+oJNkTZBHoLDp4UuN7sBLpwnhwIyVEc/Xf9AYa0FXwPuWkX9NjCBrBh1Hf
 r8KK1OY3EV1lTthk7k3EhAmGEE0n1aWok0qTG8xloHYerkIXzWxY5Rq+RG3VRe+MF4C2
 Wf7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+govdp2vvLTnZtnM6nEB7h8b2Y63gHTObXfXrS13/zwAKI5KsT7JJf9+CBTEbLvlVZag5erESY4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylvt/h+/qTetmPbc2se3GDM9z7F/w2scQiFYRxgTMSWbaKKJhy
 1lWUpF+rXXAiGSYgV516INI20WHeQLE9T/0LMRe0Pzzf6uy20wHh/OeT1LVwXwTJEnZkW0nle5L
 bYqcQsiLmvWlS+VdWJYBU83wXbRw=
X-Gm-Gg: ASbGncsJzk2GxrcfEYHUvy06z1Ib/fiJFG2F16f2/ijMo7cho6oOXXR/5UCmX8wgFiT
 KhW2R47QjYXTK5KVchZn1K71qaVP7K6GPH9FK/tzN/6yKpkyiIpwmcurrzzzBwn89QUFx6nijkF
 SW8jWBtT9cdFV71Zh3h4CR7qc8rw==
X-Google-Smtp-Source: AGHT+IGKqFB68VbJCdjMZhHRQpbk0T6xNTpyv7D0PC3oDuNU1RuVIo7za2nmnastCLN4xv3VgbROaNLz10jhsmRGJtk=
X-Received: by 2002:a05:6e02:1ca5:b0:3d3:f27a:9104 with SMTP id
 e9e14a558f8ab-3d42b87d366mr55414225ab.3.1741201731910; Wed, 05 Mar 2025
 11:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:08:39 -0800
X-Gm-Features: AQ5f1Jrw9lGRpl9F6jcnDiNBl5g1M5MC8H0JX8l57Dd5AI53ivtmLQ11CYhZEew
Message-ID: <CAF6AEGsd2DcdGdLX67RDNob9aev8wojwzyMqgwxMmN4RZiJKrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
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
> In some cases drm/msm has to resume a stalled transaction directly in
> its fault handler. Experimentally this doesn't work on SMMU500 if the
> fault hasn't already been acknowledged by clearing FSR. Rather than
> trying to clear FSR in msm's fault handler and implementing a
> tricky handshake to avoid accidentally clearing FSR twice, we want to
> clear FSR before calling the fault handlers, but this means that the
> contents of registers can change underneath us in the fault handler and
> msm currently uses a private function to read the register contents for
> its own purposes in its fault handler, such as using the
> implementation-defined FSYNR1 to determine which block caused the fault.
> Fix this by making msm use the register values already read by arm-smmu
> itself before clearing FSR rather than messing around with reading
> registers directly.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>  3 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 6372f3e25c4bc24cb52f9233095170e8aa510a53..186d6ad4fd1c990398df4dec5=
3f4d58ada9e658c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -62,16 +62,15 @@ static void qcom_adreno_smmu_get_fault_info(const voi=
d *cookie,
>                 struct adreno_smmu_fault_info *info)
>  {
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> -       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> -       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -
> -       info->fsr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR)=
;
> -       info->fsynr0 =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_F=
SYNR0);
> -       info->fsynr1 =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_F=
SYNR1);
> -       info->far =3D arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR=
);
> -       info->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNR=
A(cfg->cbndx));
> -       info->ttbr0 =3D arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_T=
TBR0);
> -       info->contextidr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_=
CB_CONTEXTIDR);
> +       struct arm_smmu_context_fault_info *cfi =3D &smmu_domain->cfi;
> +
> +       info->fsr =3D cfi->fsr;
> +       info->fsynr0 =3D cfi->fsynr0;
> +       info->fsynr1 =3D cfi->fsynr1;
> +       info->far =3D cfi->iova;
> +       info->cbfrsynra =3D cfi->cbfrsynra;
> +       info->ttbr0 =3D cfi->ttbr0;
> +       info->contextidr =3D cfi->contextidr;
>  }
>
>  static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index a9213e0f1579d1e3be0bfba75eea1d5de23117de..498b96e95cb4fdb67c246ef13=
de1eb8f40d68f7d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -453,26 +453,26 @@ void arm_smmu_print_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
>
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  {
> -       struct arm_smmu_context_fault_info cfi;
>         struct arm_smmu_domain *smmu_domain =3D dev;
> +       struct arm_smmu_context_fault_info *cfi =3D &smmu_domain->cfi;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>         static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>                                       DEFAULT_RATELIMIT_BURST);
>         int idx =3D smmu_domain->cfg.cbndx;
>         int ret;
>
> -       arm_smmu_read_context_fault_info(smmu, idx, &cfi);
> +       arm_smmu_read_context_fault_info(smmu, idx, cfi);
>
> -       if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> +       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
> -       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -               cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :=
 IOMMU_FAULT_READ);
> +       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
> +               cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> -               arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> +               arm_smmu_print_context_fault_info(smmu, idx, cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635ef=
b3968a0bd3ff237 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>         ARM_SMMU_DOMAIN_NESTED,
>  };
>
> +struct arm_smmu_context_fault_info {
> +       unsigned long iova;
> +       u64 ttbr0;
> +       u32 fsr;
> +       u32 fsynr0;
> +       u32 fsynr1;
> +       u32 cbfrsynra;
> +       u32 contextidr;
> +};
> +
>  struct arm_smmu_domain {
>         struct arm_smmu_device          *smmu;
>         struct io_pgtable_ops           *pgtbl_ops;
> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>         const struct iommu_flush_ops    *flush_ops;
>         struct arm_smmu_cfg             cfg;
>         enum arm_smmu_domain_stage      stage;
> +       struct arm_smmu_context_fault_info cfi;
>         struct mutex                    init_mutex; /* Protects smmu poin=
ter */
>         spinlock_t                      cb_lock; /* Serialises ATS1* ops =
and TLB syncs */
>         struct iommu_domain             domain;
> @@ -541,16 +552,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu);
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
> -struct arm_smmu_context_fault_info {
> -       unsigned long iova;
> -       u64 ttbr0;
> -       u32 fsr;
> -       u32 fsynr0;
> -       u32 fsynr1;
> -       u32 cbfrsynra;
> -       u32 contextidr;
> -};
> -
>  void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
>                                       struct arm_smmu_context_fault_info =
*cfi);
>
>
> --
> 2.47.1
>
