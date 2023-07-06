Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FDF74A7C7
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 01:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2598310E4D6;
	Thu,  6 Jul 2023 23:35:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728010E122
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jul 2023 23:35:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so2012201e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688686522; x=1691278522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g73wN5sCN+PwiGhvCOIinzj7v8+C8/n9RLZpvNMgLu0=;
 b=Je5FfvuPLBufiVmEA0pyi20HCOTlrG423lsnZatxW24w37SYfWFviQ5B6fnIVJH2W9
 zFVIoE4CHZtL18CPgZscOTpLQ4mSNjh7ay6ZJu4ejWP27RMSP4Mk1ToXI+f7RqvmkDWj
 2IUru1raRMI5pSMtBSMFHK3FTzvtPWtw1S8SeQJPx9d5q/4/7tQkLWbzi/ylPIrzHMex
 mjPIt2Ezy/EWY/9XnMn3Ix5wUNOO1QXKf0Nu2CSvabzHfzj7BNiAgMgS0ujwDlSVOp+u
 B4mVWVKtcQUA4xhe+AAL9E+EVxxVdFCHAoohdXnURPGQQJCCM/B8+I+88ZjFF5xjpl+V
 U+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688686522; x=1691278522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g73wN5sCN+PwiGhvCOIinzj7v8+C8/n9RLZpvNMgLu0=;
 b=MNSCS4Cc5RergEpggFdpQL2/iS+okuAHc21fYFbzsY8urrcSQo4FZs3su3KSCEU5rz
 Fjy5/Cr09NqbF7FuKy5Rla30b9sDSFBr2HKUZ85N2yQhT/3/jeDkYbQszM6714jtB+4i
 cTbbHnReMgmDm0uUqjSZaIeitV0outpP0h/aLSntHtOS13Lihd37yCheKqHyBofnZw2U
 MIV7QvOF6ZQHPw8QQlX0w3XjgxIjVm6jMH2sbtMQgVHFsDgbI2FX3lKJBy7YHnDaVqxL
 7KG24HC6yDXn5SfbM5PrdBnWzpx84gQ8vHdXOhBdHtEcsMxjoek+zUxggGb8wdq2neaf
 fqcA==
X-Gm-Message-State: ABy/qLaLiQkPcBRAeDN07R2l3S1OK1TGhOslh3eAIxjpvDdgOnrxC8uC
 1hNioQy0WggA4RXQMteOVFtROLlSzIJtyT/de0Hz3Q==
X-Google-Smtp-Source: APBJJlEqpw9tWrwznpxEke2ZZhwy4145DmO2c9KF2hX9vz2foUFMMzmMECEBpPJ63oE4T+4oT0nIkg==
X-Received: by 2002:a19:7103:0:b0:4f8:65ef:afcd with SMTP id
 m3-20020a197103000000b004f865efafcdmr2442967lfc.17.1688686522095; 
 Thu, 06 Jul 2023 16:35:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 r6-20020ac252a6000000b004fb8c31c8desm434087lfm.208.2023.07.06.16.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:35:21 -0700 (PDT)
Message-ID: <c41b8ce0-8149-911b-0c6e-f963c830ac92@linaro.org>
Date: Fri, 7 Jul 2023 01:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-10-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-10-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 09/12] drm/msm/adreno: Add adreno family
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Sometimes it is useful to know the sub-generation (or "family").  And in
> any case, this helps us get away from infering the generation from the
> numerical chip-id.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

>  		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
> +		.family = ADRENO_5XX,
>  		.revn = 508,
508 is from 530 fam

>  		.fw = {
>  			[ADRENO_FW_PM4] = "a530_pm4.fw",
> @@ -156,6 +168,7 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a508_zap.mdt",
>  	}, {
>  		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
> +		.family = ADRENO_5XX,
>  		.revn = 509,
509 and 512 are from 540 fam

>  		.fw = {
>  			[ADRENO_FW_PM4] = "a530_pm4.fw",
> @@ -173,6 +186,7 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a512_zap.mdt",
>  	}, {
>  		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
> +		.family = ADRENO_5XX,
>  		.revn = 510,
510 is 530ish but I think it's closer to 505 or whatever the
8953 gpu was called

[...]

> -	priv->is_a2xx = config.rev.core == 2;
> +	priv->is_a2xx = info->family < ADRENO_3XX;
is this variable even needed now that there are explicit family values?

Konrad
>  	priv->has_cached_coherent =
>  		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 2e62a7ce9f13..75ff7fb46099 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1079,8 +1079,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	u32 speedbin;
>  	int ret;
>  
> +	adreno_gpu->funcs = funcs;
> +	adreno_gpu->info = adreno_info(config->rev);
> +	adreno_gpu->rev = *rev;
> +
>  	/* Only handle the core clock when GMU is not in use (or is absent). */
> -	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
> +	if (adreno_has_gmu_wrapper(adreno_gpu) ||
> +	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
>  		/*
>  		 * This can only be done before devm_pm_opp_of_add_table(), or
>  		 * dev_pm_opp_set_config() will WARN_ON()
> @@ -1096,10 +1101,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			devm_pm_opp_set_clkname(dev, "core");
>  	}
>  
> -	adreno_gpu->funcs = funcs;
> -	adreno_gpu->info = adreno_info(config->rev);
> -	adreno_gpu->rev = *rev;
> -
>  	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>  		speedbin = 0xffff;
>  	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6066cfaaea52..2fa14dcd4e40 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -29,6 +29,25 @@ enum {
>  	ADRENO_FW_MAX,
>  };
>  
> +/**
> + * @enum adreno_family: identify generation and possibly sub-generation
> + *
> + * In some cases there are distinct sub-generations within a major revision
> + * so it helps to be able to group the GPU devices by generation and if
> + * necessary sub-generation.
> + */
> +enum adreno_family {
> +	ADRENO_2XX_GEN1,  /* a20x */
> +	ADRENO_2XX_GEN2,  /* a22x */
> +	ADRENO_3XX,
> +	ADRENO_4XX,
> +	ADRENO_5XX,
> +	ADRENO_6XX_GEN1,  /* a630 family */
> +	ADRENO_6XX_GEN2,  /* a640 family */
> +	ADRENO_6XX_GEN3,  /* a650 family */
> +	ADRENO_6XX_GEN4,  /* a660 family */
> +};
> +
>  #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
> @@ -63,6 +82,7 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>  struct adreno_info {
>  	const char *machine;
>  	struct adreno_rev rev;
> +	enum adreno_family family;
>  	uint32_t revn;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
> @@ -188,14 +208,14 @@ static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
>  	if (WARN_ON_ONCE(!gpu->info))
>  		return false;
> -	return (gpu->info->revn < 300);
> +	return gpu->info->family < ADRENO_2XX_GEN2;
>  }
>  
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
>  	if (WARN_ON_ONCE(!gpu->info))
>  		return false;
> -	return (gpu->info->revn < 210);
> +	return gpu->info->family == ADRENO_2XX_GEN1;
>  }
>  
>  static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
> @@ -338,29 +358,31 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  /* check for a615, a616, a618, a619 or any a630 derivatives */
>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_revn(gpu, 630) ||
> -		adreno_is_revn(gpu, 615) ||
> -		adreno_is_revn(gpu, 616) ||
> -		adreno_is_revn(gpu, 618) ||
> -		adreno_is_revn(gpu, 619);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return gpu->info->family == ADRENO_6XX_GEN1;
>  }
>  
>  static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return gpu->info->family == ADRENO_6XX_GEN4;
>  }
>  
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_revn(gpu, 650) ||
> -		adreno_is_revn(gpu, 620) ||
> -		adreno_is_a660_family(gpu);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return gpu->info->family >= ADRENO_6XX_GEN3;
>  }
>  
>  static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return gpu->info->family == ADRENO_6XX_GEN2;
>  }
>  
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
