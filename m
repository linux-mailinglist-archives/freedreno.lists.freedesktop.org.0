Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF954212DCE
	for <lists+freedreno@lfdr.de>; Thu,  2 Jul 2020 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456136E24B;
	Thu,  2 Jul 2020 20:22:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A756E24B
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jul 2020 20:22:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so24116144edy.1
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jul 2020 13:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJqRalz8nhd1uucT/hW2AoacNEdXpfTo9tORErtQ+CY=;
 b=A7yLVEUdkzu0U9R4Gydu8ALB+orKv8jxKoFtu9XmVALASxtFPW+Va6LJ5qJhI72YNO
 9Xv4iYY5bNsUh4qm4m+LioK2uUta+u/jnJbYpH5humUCWvYsMBgJboDYhKhHZZUx+Y2t
 CDichgejEQLfWBWPDxoXBh4pejxijkeFbK9MuXnJAFs5KNJlHJCDWrK9c/h1hkSFn1Q4
 i5mh2FvofLz5G0TU14GFgd8kGAENZrFOlC0+nycGxTpVBcCABFThDjY47tWqwP7ogWZm
 0gGGJU4NXyM42SPgXXtcGIsWvfmWkLee6PiI8Na2c1rFNSlo/xXzsM8i1cmZ6bAwIOqg
 4fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJqRalz8nhd1uucT/hW2AoacNEdXpfTo9tORErtQ+CY=;
 b=TaWXhyi3L4JfhbPpZBCYeZMkYwKu+YMlqPc64w7ZWYJ2DMXrbjf/Tlcu1fMZHk3HxO
 IfE+NAdt67Nj7TQJQBTWaed1lvDpo7TqW8Zh21PLS2GOjKQ3v0Uv3pQI2GTmldyyDVGD
 wjEQFzzX+k+x7ghUa578tGmgspEYsgVktlHIvEk9EgKsBxGXpiNhpuHKRPnMwdDmBATq
 Q1tW+6A5rDNw7W1HIz+E6LyKPwT2yzcAwHaJPw4v+d/gfe5w3eCKvE5QeZrWiBzuuXaX
 gNXyyP6MdfzMBXa5Rkqn0uDE3Ca1+IGeAzHEZ3UTkUs4/dXKfzbmOe5IV2VXHmyWjlB/
 S+Pw==
X-Gm-Message-State: AOAM532ta3V1l1yLnz5LwfpFKLwmflez8UZozedzU70x4E5lrFbVKHFX
 qkpqjXZdnqZhlJFHW2nhUbdjWPoICh9+olYPTYg=
X-Google-Smtp-Source: ABdhPJzZ45bUaTYoAMc4+7tytjU6jg5rAHFG6yHcGC5gt16WN/ceKbzpc4PdmYV+WosMNX1otFsQabXOGlQkVzfbrmw=
X-Received: by 2002:a50:f392:: with SMTP id g18mr14487895edm.151.1593721325980; 
 Thu, 02 Jul 2020 13:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-3-jcrouse@codeaurora.org>
In-Reply-To: <20200626200042.13713-3-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 2 Jul 2020 13:22:36 -0700
Message-ID: <CAF6AEGuN6b5a0=Ava53vyv8E57=XCPBTZAjYrRNxtNv41VOp4Q@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v9 2/7] iommu/arm-smmu: Add support for
 split pagetables
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Will Deacon <will@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 1:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
> by the io-pgtable configuration.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/iommu/arm-smmu.c | 21 ++++++++++++++++-----
>  drivers/iommu/arm-smmu.h | 25 +++++++++++++++++++------
>  2 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 8a3a6c8c887a..048de2681670 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -555,11 +555,15 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>                         cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
>                         cb->ttbr[1] = 0;
>                 } else {
> -                       cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> -                       cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -                                                 cfg->asid);
> +                       cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +                               cfg->asid);
>                         cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -                                                cfg->asid);
> +                               cfg->asid);

above looks like stray whitespace changes?

> +
> +                       if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +                               cb->ttbr[1] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +                       else
> +                               cb->ttbr[0] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
>                 }
>         } else {
>                 cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> @@ -824,7 +828,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>
>         /* Update the domain's page sizes to reflect the page table format */
>         domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -       domain->geometry.aperture_end = (1UL << ias) - 1;
> +
> +       if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +               domain->geometry.aperture_start = ~0UL << ias;
> +               domain->geometry.aperture_end = ~0UL;
> +       } else {
> +               domain->geometry.aperture_end = (1UL << ias) - 1;
> +       }
> +
>         domain->geometry.force_aperture = true;
>
>         /* Initialise the context bank with our page table cfg */
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 38b041530a4f..5f2de20e883b 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -168,10 +168,12 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_TCR                        0x30
>  #define ARM_SMMU_TCR_EAE               BIT(31)
>  #define ARM_SMMU_TCR_EPD1              BIT(23)
> +#define ARM_SMMU_TCR_A1                        BIT(22)
>  #define ARM_SMMU_TCR_TG0               GENMASK(15, 14)
>  #define ARM_SMMU_TCR_SH0               GENMASK(13, 12)
>  #define ARM_SMMU_TCR_ORGN0             GENMASK(11, 10)
>  #define ARM_SMMU_TCR_IRGN0             GENMASK(9, 8)
> +#define ARM_SMMU_TCR_EPD0              BIT(7)
>  #define ARM_SMMU_TCR_T0SZ              GENMASK(5, 0)
>
>  #define ARM_SMMU_VTCR_RES1             BIT(31)
> @@ -347,12 +349,23 @@ struct arm_smmu_domain {
>
>  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  {
> -       return ARM_SMMU_TCR_EPD1 |
> -              FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> -              FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> -              FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> -              FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> -              FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +       u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> +               FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> +               FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> +               FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> +               FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +
> +       /*
> +       * When TTBR1 is selected shift the TCR fields by 16 bits and disable
> +       * translation in TTBR0
> +       */
> +       if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +               tcr = (tcr << 16) & ~ARM_SMMU_TCR_A1;
> +               tcr |= ARM_SMMU_TCR_EPD0;
> +       } else
> +               tcr |= ARM_SMMU_TCR_EPD1;

I'm not personally a fan of if/else ladders that mix {}'s, but
Will/Robin may have a different opinion

BR,
-R

> +
> +       return tcr;
>  }
>
>  static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> --
> 2.17.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
