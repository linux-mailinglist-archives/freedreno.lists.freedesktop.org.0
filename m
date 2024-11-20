Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA69D3949
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2010E701;
	Wed, 20 Nov 2024 11:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DVfRSDrm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471DA10E70B
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:18:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so5045331e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732101525; x=1732706325; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r98JRbkNHT9qAPDcDMFbKhAW5brAUGwlvcxwfaBzA8I=;
 b=DVfRSDrm443I8TofcippJ1ETBG2LeDUp75vdPhI6CkaG3iJaFiNJmub59YZT5YgsDD
 mcjWxAn3Xk4ehBZV24FhEZQa/APEEX6wc179XhvbCm7hI6vm9159SV1eZEjTHmcUeXJ9
 JySFfv39smomXxvKMfuDTDcSAC6ZNf3mVoIZVM610n+c75DGWBjHC7QQn9JZLVvFPeKc
 5/eWOMtdP6nv1hcrnYwq3wD4+wkNJK530iGYlwSf5C6Bz1wWXL59g90t+nHqqjYf94GS
 Xie7JogRRbLC7bMRCqFN580k/J3hqxMZl9Cm4A4j10rxYAyRKkliVhq97d8H8dhD+1my
 YjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732101525; x=1732706325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r98JRbkNHT9qAPDcDMFbKhAW5brAUGwlvcxwfaBzA8I=;
 b=T/7hd47iR9yuqd0RCWM6U8pHeoNvaJX3nfZcR646s6nMBmqN8WQM/2rVPeJTvy1lrC
 eqAmcnAi72IHMUA7xDpdAOuOubxGc+zoHS9SsS+YMtIbrnz/r/Bk8zV+4oCUBnzeyrmy
 zbt8V9p3QE8MnWJ3DsT2nexF/zducdpOvzglHfsFYoSEDa1z+0pUF5karGHUm7i+G/gu
 IaVm2i9GsPQEWpdPqUUsTHFc5fPK3dDwY86mYs6WPBKLldeEY9/mRoWTILSHho4gNBk7
 UF1vchavSsxbRZcNsJ68LxHYONWlh456QU/EUVQKwezv+StEIzw9W745yn8UkqOuGtyE
 n3RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUupLN61QwjGO3N2nEX6skYTVR7GUo/mKE3Z7ep58vYRrNtFYTPtW8hr61QNr2HltOXW4LwuHGf+Zg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxICAbmRNcrA0T3gdd0ju/p/Jh7pfBomE0r/d3IzqlksD1po7QA
 MELj2UqCwlAdbNjwOaKVjB9X+5vYel08D8NTHtiXarmRgaGpbEfYT+U4a89ALEY=
X-Google-Smtp-Source: AGHT+IEGQPNp9SIKJuYJWqBPnVInvfWWAGoF5yLxeIVZG2S0tAcaAoIolD/cc/TtRpao+k8gWOKZpg==
X-Received: by 2002:a05:6512:a8b:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-53dc1337665mr1132049e87.14.1732101525342; 
 Wed, 20 Nov 2024 03:18:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbf9d9813sm355254e87.136.2024.11.20.03.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:18:43 -0800 (PST)
Date: Wed, 20 Nov 2024 13:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
Message-ID: <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
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

On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> Now the features defines have the right name, introduce a features
> bitfield and move the features defines in it, fixing all code checking
> for them.
> 
> No functional changes intended.

I think it might be better to squahs this patch into the previous one,
it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
.features for ADRENO_FEAT_bar.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 34 +++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 +++---
>  4 files changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 825c820def315968d508973c8ae40c7c7b646569..93f0d4bf50ba773ecde93e6c29a2fcec24ebb7b3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -743,7 +743,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -769,7 +769,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a630_protect,
> @@ -839,7 +839,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -864,7 +864,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a620_zap.mbn",
> @@ -892,7 +892,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a630_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -911,7 +911,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -934,7 +934,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
> @@ -961,7 +961,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
> @@ -981,7 +981,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1000,7 +1000,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mbn",
> @@ -1028,7 +1028,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1046,7 +1046,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
> @@ -1331,7 +1331,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_HW_APRIV,
> +		.features = ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1355,7 +1355,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1377,7 +1377,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1400,7 +1400,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1422,7 +1422,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2ebd3fac212576a1507e0b6afe2560cd0408dd89..654d0cff421f15901cd4bf33b41e70004634ec75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2478,7 +2478,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
>  
>  	adreno_gpu->base.hw_apriv =
> -		!!(config->info->quirks & ADRENO_FEAT_HAS_HW_APRIV);
> +		!!(config->info->features & ADRENO_FEAT_HAS_HW_APRIV);
>  
>  	/* gpu->info only gets assigned in adreno_gpu_init() */
>  	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
> @@ -2495,7 +2495,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	}
>  
>  	if ((enable_preemption == 1) || (enable_preemption == -1 &&
> -	    (config->info->quirks & ADRENO_FEAT_PREEMPTION)))
> +	    (config->info->features & ADRENO_FEAT_PREEMPTION)))
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
>  	else if (is_a7xx)
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 09d4569f77528c2a20cabc814668c4c930dd07f1..11a228472fa0cef3b6e4e21a366470fbbc3ea8df 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -207,7 +207,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  
>  	priv->is_a2xx = info->family < ADRENO_3XX;
>  	priv->has_cached_coherent =
> -		!!(info->quirks & ADRENO_FEAT_HAS_CACHED_COHERENT);
> +		!!(info->features & ADRENO_FEAT_HAS_CACHED_COHERENT);
>  
>  	gpu = info->init(drm);
>  	if (IS_ERR(gpu)) {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 8782c25e8a393ec7d9dc23ad450908d039bd08c5..4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,9 +55,9 @@ enum adreno_family {
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  
> -#define ADRENO_FEAT_HAS_HW_APRIV		BIT(3)
> -#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(4)
> -#define ADRENO_FEAT_PREEMPTION			BIT(5)
> +#define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
> +#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
> +#define ADRENO_FEAT_PREEMPTION			BIT(2)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> @@ -98,6 +98,7 @@ struct adreno_info {
>  	uint32_t revn;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
> +	u64 features;
>  	u64 quirks;
>  	struct msm_gpu *(*init)(struct drm_device *dev);
>  	const char *zapfw;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
