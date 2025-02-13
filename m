Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCFA34ADA
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F40B10EB3C;
	Thu, 13 Feb 2025 16:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hAZwQFAa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918EF10EB3D
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:54:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54504f29000so1098458e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739465696; x=1740070496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kwV45hdyS0glOo3jiZV6QnhWvFYdES0z/A44sINBKLA=;
 b=hAZwQFAa45bpOJJKwtmxHdPn3VolMSIXc62Xfp7Z4u+mgLQKYRvcUbpFtuUYigLS9Z
 ce6igFj9MOTYp0x5PxlUfLLptio+uj+kh5YVzmxTq/wSzcDfEjLe1c06OHReO2mSd+f6
 /a3lzgYhZHv9vkOYH1hna6DZtUPaVGGxP33QoplYnZCMjDZnAShjBYWbbh6SAZo7vYSL
 wMEP8CDr/Kkynu0ZXJgT712jXs6msvAH6LdLoRnVjiMABVXN/i6Sq+SrvlLxPH9Ox+Fg
 0Q13evQC9VdCwuCfM7sp6+Zt5Lsy4x0lACeJ3a+yXdRpLeVHUL87ds8XxNnq939SyWdH
 Z8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465696; x=1740070496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwV45hdyS0glOo3jiZV6QnhWvFYdES0z/A44sINBKLA=;
 b=jrD5JTqudsLZwKv2pwsgfOEDv9Sac15LYdLcdgnKfpRS78C2zb5WAx4FcBAIQRGGZj
 R2cpEU5/q8RStXE/pHxAoJN2k4QKBLeqorRto5HqXf/gNb32M8ZTgR/pci54S6mmzol6
 02kZ9ICptLbwMcryoxyTKvxb/BfTn8g+NXUqCTQTAdVBxWnUbTf0BcqDE0zmsmliWQ6i
 wo6dty+sN+REOfglLP9ToMqWmr59sTp1a+ZmjAeuyJ4bJDchrhJXcj7wGlH98aM1SHsL
 /OQXZ5kjiOBkEgiIb/JDocUovaHEYo3Hhv+LPv2aG6aRT0DD9CRe9lGWTxYOhdvOtRrP
 TJcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzV+azcBWEG6meDmN7+2DRaDEvlHmMzqpolGB5T0N/+VYVV1VQUWYPmtSOQlKrq2a2ldIXhHXRZHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3xUi/QuWL3OA4SC5QCRz/K31XXUB1ennFdvhlKipD8wSdzSOs
 wDmlQKLpA26VFXCwGy0uMtL+FlL2zlo115StM2ln5ZKuZuca4rGZbCq7Rt+hYLU=
X-Gm-Gg: ASbGncu7pMSyWhJkzMjpStHq9QtHY8E9tFh4bo8xVHvlkiv5c7+pLq0t2RwZQ7ragvo
 HXBZkw9uZjxMrVvMVfcHLv+rEKCKb6wgr5Wf3FXEbQ2Wk/KJ+cqKo7kxdHvatUk1apH7CFw4Zlo
 ixzdkPiUltH48ngduEuJZrIUuzp2j3K0lZyLBgUdnpsrGKguQWUv2U1pT9PxAYaLAKU16m7lAUM
 rZCxpYzk/91QANTCQ2qBz0eCj1+Xqr0kPBhII6Sv/sOy8SEsjnmdyai72OP7kNlITxRZccuV/2f
 9sqJjqRzEEs9qphskoo6QNt7x+XMqeCpJ50KvEAVdB6jFzi8V0mA8ude7B/Lm9ChhyPAdP0=
X-Google-Smtp-Source: AGHT+IHmHfTqLsAoX8QLu52kx0svE3LQoUJ0tRblqSyDipPsAv620UI+8nfG4DUj1UTRWfZkvLSswg==
X-Received: by 2002:a05:6512:3ca3:b0:545:22ec:8b68 with SMTP id
 2adb3069b0e04-54522ec8df0mr398466e87.1.1739465695839; 
 Thu, 13 Feb 2025 08:54:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105d2dsm221273e87.128.2025.02.13.08.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:54:54 -0800 (PST)
Date: Thu, 13 Feb 2025 18:54:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
Message-ID: <ttipuo56z76svx3womcrrqurglvovkqehsx2orgnegjj2z7uxn@d3cov6qmmalm>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
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

On Thu, Feb 13, 2025 at 09:40:07PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index edffb7737a97..ac156c8b5af9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>  			{ 0, 0 },
>  			{ 137, 1 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
> +		.family = ADRENO_6XX_GEN3,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a620_hwcg,
> +			.protect = &a650_protect,
> +			.gmu_cgc_mode = 0x00020200,
> +			.prim_fifo_threshold = 0x00010000,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +				},
> +				{ /* sentinel */ },
> +			},
> +		},
> +		.address_space_size = SZ_16G,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(
>  			0x06030001,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0ae29a7c8a4d..1820c167fcee 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.uavflagprd_inv = 2;
>  	}
>  
> +	if (adreno_is_a623(gpu)) {
> +		gpu->ubwc_config.highest_bank_bit = 16;
> +		gpu->ubwc_config.amsbc = 1;

This bit causes my question: the patch for msm_mdss states that on the
display side both UBWC encoder and decoder are 4.0, which means that the
UBWC_AMSBC bit won't be set in the UBWC_STATIC register.

> +		gpu->ubwc_config.rgb565_predicator = 1;
> +		gpu->ubwc_config.uavflagprd_inv = 2;
> +		gpu->ubwc_config.macrotile_mode = 1;
> +	}
> +
>  	if (adreno_is_a640_family(gpu))
>  		gpu->ubwc_config.amsbc = 1;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 2c10474ccc95..3222a406d089 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1227,7 +1227,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
>  		&a6xx_state->gmu_registers[1], true);
>  
> -	if (adreno_is_a621(adreno_gpu))
> +	if (adreno_is_a621(adreno_gpu) || adreno_is_a623(adreno_gpu))
>  		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
>  			&a6xx_state->gmu_registers[2], false);
>  	else
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index dcf454629ce0..92caba3584da 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -442,6 +442,11 @@ static inline int adreno_is_a621(const struct adreno_gpu *gpu)
>  	return gpu->info->chip_ids[0] == 0x06020100;
>  }
>  
> +static inline int adreno_is_a623(const struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x06020300;
> +}
> +
>  static inline int adreno_is_a630(const struct adreno_gpu *gpu)
>  {
>  	return adreno_is_revn(gpu, 630);
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
