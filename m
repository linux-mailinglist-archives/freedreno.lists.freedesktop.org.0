Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C38B4656
	for <lists+freedreno@lfdr.de>; Sat, 27 Apr 2024 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E27E10EDB6;
	Sat, 27 Apr 2024 12:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yS1owcQR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABA610EDB6
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 12:19:44 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso4673651a12.3
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714220383; x=1714825183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4r3jYKlMERH6PsO0Wo3cOiMFIZsMB1gxrJXGFLI6Pn8=;
 b=yS1owcQRt6hpStRJL95K25u4dtAfGGkj56/x7tu+yv8plgFBJHDlhJjvkpU7MrxQoz
 FzZUUg3X1SgaemdmaO3ohvC0sN8rEw3YVDq3niSqt7Y/hp7u9kEiA+zDpoDQZnNeNVlA
 XFJt2Mb6K0C5SSTxlRVaiXFXjir8TnyYmsE77dhfiD4tD97X3irK10m0+YJJiwrT0YgF
 uezHY3FcQKiBiDgeiM+Z1anazmddvh3wq2kHEnHJv3SzKuWEGtfVg+expZpz3nH6yodn
 MQkxg8bNXEM0EsltwKghoL0qA6sUlKv+j1WAJd/eYmaouzdmVoxNRpqOqvw62zfA7n6r
 7hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714220383; x=1714825183;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4r3jYKlMERH6PsO0Wo3cOiMFIZsMB1gxrJXGFLI6Pn8=;
 b=UZylWMp0LtzSkYOwoVsdCiFVawGEfQI5fDzrEef1YIsMu1370P0rXugfBcCVvQAoDJ
 lVrW77udYghRt9ENaNSTElXtX3w7siZ8ZAohsWef6PMWljqfCmMX1Qx0dqz8WtxLvFxi
 xkmRy+cYdItuRbhBqMK9+YZVttzgKFx2dKha0CD3jJOCm/wZ7AX0EdFPsM9waMEphaNo
 1e/DD07OczX1995yOs8PmKol93bGV+hXqlzLYmo3MnFev7XND2126Zue2XC+0bkAWhq7
 Ldw1rDaLaiWQX+jbc03d94dYvXgM/gtvUxuEvGeM73Cn6h3ZdZXxWkFTTNZLGwHNbioR
 4pjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1VYNqkjnwSg5DuTNgEdEas90n6gmdMGa1PBdToAjVvqJ8N227T1fVDTuw9l3yc/cHCc5FMLbq9vEF5CH3gYxQxBgWXM4Q/vuBxkfzqq0C
X-Gm-Message-State: AOJu0YzjZu2NxdCG80ZWa1W+eZxDxazez6axvswFiRivI7HwEGBWFNId
 BV7E4Oo8YQgeqWw388NPQUPPbhHA1boEzf2tCYCIUrwXBngsXyhcojTm7VexE7g=
X-Google-Smtp-Source: AGHT+IFFmvB7a0Iq/ACh0TiQSFs4aL4w04wG2YHXNxMzcAsXeXzX66uSetZg0Dr/ySxRzKhDvXhp1w==
X-Received: by 2002:a50:bb45:0:b0:572:4faf:ed67 with SMTP id
 y63-20020a50bb45000000b005724fafed67mr3492935ede.24.1714220383032; 
 Sat, 27 Apr 2024 05:19:43 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 t22-20020a50d716000000b005726e206449sm552493edi.24.2024.04.27.05.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 05:19:42 -0700 (PDT)
Message-ID: <12db74c2-87ec-45e3-9ca0-c5f2328c5f8b@linaro.org>
Date: Sat, 27 Apr 2024 14:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26.04.2024 8:34 PM, Connor Abbott wrote:
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

[...]

> +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> +{
> +	u32 status;
> +
> +	status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> +	gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> +
> +	dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
> +
> +	/* Ignore FASTBLEND violations, because the HW will silently fall back
> +	 * to legacy blending.

/*
 * foo



> +	 */
> +	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> +		del_timer(&gpu->hangcheck_timer);
> +
> +		kthread_queue_work(gpu->worker, &gpu->recover_work);
> +	}
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
>  		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
>  
> +	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)

Does this field actualy exist on a6 too?

> +		a7xx_sw_fuse_violation_irq(gpu);
> +
>  	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
>  		msm_gpu_retire(gpu);
>  
> @@ -2525,6 +2550,59 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>  
> +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	u32 fuse_val;
> +	int ret = 0;
> +
> +	if (adreno_is_a750(adreno_gpu)) {
> +		/* Assume that if qcom scm isn't available, that whatever
> +		 * replacement allows writing the fuse register ourselves.
> +		 * Users of alternative firmware need to make sure this
> +		 * register is writeable or indicate that it's not somehow.
> +		 * Print a warning because if you mess this up you're about to
> +		 * crash horribly.
> +		 */
> +		if (!qcom_scm_is_available()) {
> +			dev_warn_once(gpu->dev->dev,
> +				"SCM is not available, poking fuse register\n");
> +			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> +				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> +				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> +			adreno_gpu->has_ray_tracing = true;

I'm not 100% sure. I'm afraid there may be SKUs with RT cores fused
off (as in, cut off from the rest, not "indicated unavailable") or
otherwise dysfunctional..

My guess would be that TZ probably has some sort of a LUT/match table
based on other SoC identifiers

> +			return 0;
> +		}
> +
> +		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> +					     QCOM_SCM_GPU_TSENSE_EN_REQ);
> +		if (ret)
> +			return ret;
> +
> +		/* On a750 raytracing may be disabled by the firmware, find out whether
> +		 * that's the case. The scm call above sets the fuse register.
> +		 */
> +		fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> +		adreno_gpu->has_ray_tracing =
> +			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +	} else {
> +		if (adreno_is_a740(adreno_gpu)) {
> +			/* Raytracing is always enabled on a740 */
> +			adreno_gpu->has_ray_tracing = true;
> +		}
> +
> +		if (!qcom_scm_is_available())
> +			return 0;
> +
> +		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
> +	}
> +
> +	return ret;

	if (qcom_scm_is_available())
		return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
}

return 0;

?

Konrad
