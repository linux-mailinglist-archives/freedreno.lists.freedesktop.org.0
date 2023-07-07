Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943574A8EB
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 04:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E4A10E4F8;
	Fri,  7 Jul 2023 02:23:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805AC10E4F4
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 02:23:34 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so2142557e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 19:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696612; x=1691288612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXWxG7t3Irdpku0SEhtSikJm00++p2vmXFnApXXv6dg=;
 b=hgQdL+gUOHK1fXkyPQ+4At52VZVq7pO9ri1dGb8A0PbUK8dxqaCz5ZjvVKilwEklQq
 Z0Q3osBeKRC/VJHkbWqGJ3cgExZFSWHhl2VyhBdn2N/QDJzu+Yxdobo4Ib8jyJRq3uiK
 I/34eafF+W7dXn7jU9mWnfrJ72XVO8HSMYR4xo35twOqEJ5jpbFpsXQkRXGK+EoFdWOR
 VAPH3u9+IWcabAlJWumHBOVHpJFFXW2x8iPbVoKEAPPKY09mHhexkkEQILVFhPY95d17
 XCTX+mbYFS7lfG9xJtFzHp/hyXb3ai3NbNEp4Cz9+E+T0WQH+d7KLnvzoq20ZCk+SzCr
 Kv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696612; x=1691288612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXWxG7t3Irdpku0SEhtSikJm00++p2vmXFnApXXv6dg=;
 b=aOdnHvEN9C51GY8Pm28YpMQBTxAhOIT02BDGvzSm40giniuRtfxL6hntS2FMp/9b/4
 ZIH3GL4jYHCr8WQMxAfvlpcCzQKlzF7VyO4+2xCjjH45i7h6mVcFxzLg8qulj24WVi0g
 SJ4T93+x8Wq8RqjWzXCPKkwfjiE8g+cjxyy450PtJOK/3b5KYNyJz2C3im33u5hmsXgA
 AEF2seRUrkGPNsvjLp3h+c71aVcy9wCvEvmHoUX0cPEsV2B30kqhpq/kXTl8Da3SASxI
 RGs0vU9J4JPe+tXBsOi6xej/mD8rlQqC+vmsaRT1LxOqbO2zySu8+Fw00x7lcaBv+uTW
 hscg==
X-Gm-Message-State: ABy/qLa3B+Bc62P4LUgIHC8dGROicbySBeEpVYh2TbR2eE5+XQ3E9x+M
 twhj3dKYcgkq9XMsaSVSeQozKA==
X-Google-Smtp-Source: APBJJlEWo7Y+MzMZTJXpVoBn5i5YW1wE9tgLiAZ91fygBdKq8r4LajNSEqrTXMtanaa08LC8aQ46pA==
X-Received: by 2002:a05:6512:401c:b0:4fb:97e8:bc1c with SMTP id
 br28-20020a056512401c00b004fb97e8bc1cmr3104281lfb.54.1688696612549; 
 Thu, 06 Jul 2023 19:23:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ac244b1000000b004f871c71827sm482376lfm.139.2023.07.06.19.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:23:32 -0700 (PDT)
Message-ID: <33609e69-1b69-f1cc-5ade-0808bb004b10@linaro.org>
Date: Fri, 7 Jul 2023 05:23:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 02/12] drm/msm/adreno: Remove redundant gmem
 size param
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Even in the ocmem case, the allocated ocmem buffer size should match the
> requested size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c      | 2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 2 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 -
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 8 ++++----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 -
>   6 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..50ee03bc94b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -205,7 +205,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>   		A2XX_MH_INTERRUPT_MASK_MMU_PAGE_FAULT);
>   
>   	for (i = 3; i <= 5; i++)
> -		if ((SZ_16K << i) == adreno_gpu->gmem)
> +		if ((SZ_16K << i) == adreno_gpu->info->gmem)
>   			break;
>   	gpu_write(gpu, REG_A2XX_RB_EDRAM_INFO, i);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a99310b68793..f0803e94ebe5 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -749,7 +749,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_HI, 0x00000000);
>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_LO,
> -		0x00100000 + adreno_gpu->gmem - 1);
> +		0x00100000 + adreno_gpu->info->gmem - 1);
>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
>   
>   	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b3ada1e7b598..edbade75020f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1270,7 +1270,7 @@ static int hw_init(struct msm_gpu *gpu)
>   		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
>   
>   		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX,
> -			0x00100000 + adreno_gpu->gmem - 1);
> +			0x00100000 + adreno_gpu->info->gmem - 1);
>   	}
>   
>   	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 5eba0ae5c9a7..326912284a95 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -239,7 +239,6 @@ static const struct adreno_info gpulist[] = {
>   	}, {
>   		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
>   		.revn = 610,
> -		.name = "A610",
>   		.fw = {
>   			[ADRENO_FW_SQE] = "a630_sqe.fw",
>   		},

This one should go to the previous patch.


> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index e3cd9ff6ff1d..4f59682f585e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -320,7 +320,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   		*value = adreno_gpu->info->revn;
>   		return 0;
>   	case MSM_PARAM_GMEM_SIZE:
> -		*value = adreno_gpu->gmem;
> +		*value = adreno_gpu->info->gmem;
>   		return 0;
>   	case MSM_PARAM_GMEM_BASE:
>   		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
> @@ -1041,14 +1041,15 @@ int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
>   		return PTR_ERR(ocmem);
>   	}
>   
> -	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
> +	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->info->gmem);
>   	if (IS_ERR(ocmem_hdl))
>   		return PTR_ERR(ocmem_hdl);
>   
>   	adreno_ocmem->ocmem = ocmem;
>   	adreno_ocmem->base = ocmem_hdl->addr;
>   	adreno_ocmem->hdl = ocmem_hdl;
> -	adreno_gpu->gmem = ocmem_hdl->len;
> +
> +	WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem);
>   
>   	return 0;
>   }
> @@ -1097,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   
>   	adreno_gpu->funcs = funcs;
>   	adreno_gpu->info = adreno_info(config->rev);
> -	adreno_gpu->gmem = adreno_gpu->info->gmem;
>   	adreno_gpu->revn = adreno_gpu->info->revn;
>   	adreno_gpu->rev = *rev;
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6830c3776c2d..aaf09c642dc6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -77,7 +77,6 @@ struct adreno_gpu {
>   	struct msm_gpu base;
>   	struct adreno_rev rev;
>   	const struct adreno_info *info;
> -	uint32_t gmem;  /* actual gmem size */
>   	uint32_t revn;  /* numeric revision name */
>   	uint16_t speedbin;
>   	const struct adreno_gpu_funcs *funcs;

-- 
With best wishes
Dmitry

