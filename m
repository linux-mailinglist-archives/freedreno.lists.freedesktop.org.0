Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6D258712
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 06:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1D89B62;
	Tue,  1 Sep 2020 04:56:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECE189B62
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 04:56:07 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 37so89854oto.4
 for <freedreno@lists.freedesktop.org>; Mon, 31 Aug 2020 21:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vtOK+JdyZooaz1NAnQQXA6CpZw+KJadIhTEL2kbj1TY=;
 b=sZM/Hx5YPU8n2Dalo1uiJyMbr745uxuBPAiHY508RWFAugXsnmybzaLCEO2xBNgLhG
 OHE3C4OULSiQYqRcs6BgvhFZC+zZO/VmAeoeqk0k8gB826LBP5qidYnIAYU4rOIrINgM
 TQ+yTWu9Sxp8KC9xZ0TtcnzBbSYCkRapMjBxSKHKoL/KQMvdRc035C9nWtMEqtqRJ36N
 mxJCS9ZoY3Rle9LHVK05/P3R23ouMMKvMCxvJyUkXSUI8qASZExglvLZXweoLVSTAFGu
 Ppbut+TiK/e+1by4PrTo8/2Fewu7TTf0mn3QUYRsvS8RpzJPQ2SJY84gO+/bEYyQ2701
 WYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vtOK+JdyZooaz1NAnQQXA6CpZw+KJadIhTEL2kbj1TY=;
 b=N5n76EZHFjoJBbaPv2tR8Ah1y/6es4SonkUzcAB31tDhI4MSoF6BnLDH6rbrKS03Y6
 pGcVKWtIEoDfdAG+nkzNPwSvjPdjonShsvYyM2ZiZOLDlG3CPlsOgpkZA79I3UHgSFEl
 VXo7mdq/dR8QYP5c9cZn/gwYv+NNxHKwKXcx0JK6stbpLRCbGIXHfOwfFCwCIzzBXpPy
 BJ/cG86VdK5rJHVdU8Rc1TwYjzx2HR1cKHeKIqLg1mLooET9wjy1ND9moJi0oGaeF98i
 LzDWYv7U2XzPAGdqkBeNG0D2ivFqC4LqXVCoYWZFrtUKpFXV1DrAhSXnelwil9XQZv/M
 8zZQ==
X-Gm-Message-State: AOAM530AOw3A7wEJJQWRYo5Bez8Mllbg6uq88tgAxBHotKzZXOwP6+Hy
 kpWx8DweMttB1yaIcX6LllRG+A==
X-Google-Smtp-Source: ABdhPJw+EMv9TyDAnLqJQrXIIowFlV6IK//RYKVec+GZUzuKneC5cn+zskaRocfswvWbn08780xMEw==
X-Received: by 2002:a9d:7e85:: with SMTP id m5mr138888otp.330.1598936166935;
 Mon, 31 Aug 2020 21:56:06 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id r189sm2033728oih.51.2020.08.31.21.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 21:56:06 -0700 (PDT)
Date: Mon, 31 Aug 2020 23:56:03 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200901045603.GO3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-9-robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 08/19] iommu/arm-smmu: constify some helpers
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Sprinkle a few `const`s where helpers don't need write access.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 59ff3fc5c6c8..27c83333fc50 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -377,7 +377,7 @@ struct arm_smmu_master_cfg {
>  	s16				smendx[];
>  };
>  
> -static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_tcr(const struct io_pgtable_cfg *cfg)
>  {
>  	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
>  		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> @@ -398,13 +398,13 @@ static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  	return tcr;
>  }
>  
> -static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_tcr2(const struct io_pgtable_cfg *cfg)
>  {
>  	return FIELD_PREP(ARM_SMMU_TCR2_PASIZE, cfg->arm_lpae_s1_cfg.tcr.ips) |
>  	       FIELD_PREP(ARM_SMMU_TCR2_SEP, ARM_SMMU_TCR2_SEP_UPSTREAM);
>  }
>  
> -static inline u32 arm_smmu_lpae_vtcr(struct io_pgtable_cfg *cfg)
> +static inline u32 arm_smmu_lpae_vtcr(const struct io_pgtable_cfg *cfg)
>  {
>  	return ARM_SMMU_VTCR_RES1 |
>  	       FIELD_PREP(ARM_SMMU_VTCR_PS, cfg->arm_lpae_s2_cfg.vtcr.ps) |
> -- 
> 2.26.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
