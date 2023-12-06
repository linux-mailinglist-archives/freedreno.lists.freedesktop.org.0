Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C9806FAB
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 13:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2293910E0EE;
	Wed,  6 Dec 2023 12:29:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B8910E0EE
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 12:29:03 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50c0f13ea11so1672205e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701865742; x=1702470542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbeCAkVoLRW1/oUOSwS276hLe38ZJEWn0mKn2xkZbLg=;
 b=ADgRZh8rrC9nzdemi9es2EdMg7g1ILsTuQ9QnX2IhD/aHwBAtgiiXNl4rjRtdxymZ5
 0ww0VbglXioGsQZQ8RQtqcD96O3BIKUhnk2OEPgh0QkLiYId+fUyLCemrqIiLyy2XHmH
 uBbbsKcCs/s6nbJ5XXX+XXPZMUx1ULqVLatRnNMB+BLpjrJe9y3YfYM1l1AG8FWPPPlI
 AZo0O8YL/FsqnGZwRj+1s+TpGUVj1coNPeB9oFLnNzf8rT877DTc+plKkhzKz91GuOBx
 Lb2fBVU3fmvLVMeLfcbppfVd5ubmqBJtMr2kZCDKlTdPJ579gdtVyOtefzmHTkz3saPy
 EBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701865742; x=1702470542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbeCAkVoLRW1/oUOSwS276hLe38ZJEWn0mKn2xkZbLg=;
 b=E3BP93SAUQU2OkrWiGj/brlGnsYXSI2tfvczLdSUa6eRJ1C6L+WvYPG7xx0hp9FXT/
 yOega/yky3SFbvC+ahFr3H0vTjZaMBEit0ZYn7HS+Hdobv3gKB6Z8MeSGG0sZRLfxAJd
 RMQFt7oZyndctLOxpahzWWKeOiXgDYxxzFrhYB80O3PGyEm5X3ueDdJ4R2PbhLCMkKiI
 H3WRmyINHjNxV/Jw7Frpn+GodcMy/hNVGIDjUwxL3QyZGLZ4wXarggXsoT1sOWAou+g6
 9obp3uDogvVVa1FDRrTIRaLbcwSYCHQ0OnqxJizJiVu1e22FMGupfBA1Gs8DGBQNxftU
 rQ4Q==
X-Gm-Message-State: AOJu0Yzj9RvsTGZIaSoAClqq5GDoEgSuhWl+juZxxAwZQpOuIiNu3pMp
 SoecEsrLnF+Yfg+C4xPBitRRBA==
X-Google-Smtp-Source: AGHT+IHXO4wz3BPJVKoSrUkPWIa3dz1+hdplRoJCBOZolWa+GweffzORSxbnuIQaVl9JSecGILn6jg==
X-Received: by 2002:a19:e001:0:b0:50b:f817:14f8 with SMTP id
 x1-20020a19e001000000b0050bf81714f8mr452276lfg.19.1701865741726; 
 Wed, 06 Dec 2023 04:29:01 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056512050c00b0050be625999esm1317257lfb.110.2023.12.06.04.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 04:29:01 -0800 (PST)
Message-ID: <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
Date: Wed, 6 Dec 2023 13:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205220526.417719-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/adreno: Split up giant device
 table
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/5/23 23:03, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
>   1 file changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 41b13dec9bef..36392801f929 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
>   MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
>   module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
>   
> -static const struct adreno_info gpulist[] = {
> +static const struct adreno_info a2xx_gpus[] = {
>   	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
>   		.family = ADRENO_2XX_GEN1,
> @@ -55,6 +55,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a2xx_gpu_init,
>   	}, {
> +		/* sentinal */
sentinel?

> +	}
> +};
> +
> +static const struct adreno_info a3xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(
>   			0x03000512,
>   			0x03000520
> @@ -110,6 +116,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a3xx_gpu_init,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a4xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
>   		.family = ADRENO_4XX,
>   		.revn  = 405,
> @@ -143,6 +155,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a4xx_gpu_init,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a5xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
>   		.family = ADRENO_5XX,
>   		.revn = 506,
> @@ -268,6 +286,12 @@ static const struct adreno_info gpulist[] = {
>   		.init = a5xx_gpu_init,
>   		.zapfw = "a540_zap.mdt",
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a6xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
>   		.family = ADRENO_6XX_GEN1,
>   		.revn = 610,
> @@ -493,6 +517,12 @@ static const struct adreno_info gpulist[] = {
>   		.hwcg = a690_hwcg,
>   		.address_space_size = SZ_16G,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a7xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
>   		.family = ADRENO_7XX_GEN1,
>   		.fw = {
> @@ -522,7 +552,18 @@ static const struct adreno_info gpulist[] = {
>   		.zapfw = "a740_zap.mdt",
>   		.hwcg = a740_hwcg,
>   		.address_space_size = SZ_16G,
> -	},
> +	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info *gpulist[] = {
> +	a2xx_gpus,
> +	a3xx_gpus,
> +	a4xx_gpus,
> +	a5xx_gpus,
> +	a6xx_gpus,
> +	a7xx_gpus,
>   };
>   
>   MODULE_FIRMWARE("qcom/a300_pm4.fw");
> @@ -557,12 +598,14 @@ static const struct adreno_info *adreno_info(uint32_t chip_id)
>   {
>   	/* identify gpu: */
>   	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
> -		const struct adreno_info *info = &gpulist[i];
> -		if (info->machine && !of_machine_is_compatible(info->machine))
> -			continue;
> -		for (int j = 0; info->chip_ids[j]; j++)
I'm not sure using sentinels here is a good idea, it adds a
whole lot of stack size. Perhaps gpulist could be a struct
of array pointers and an array of sizes?

Konrad
