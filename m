Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3D74A3EF
	for <lists+freedreno@lfdr.de>; Thu,  6 Jul 2023 20:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D0810E0CA;
	Thu,  6 Jul 2023 18:55:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3610E0CA
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jul 2023 18:55:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb9fd28025so1513139e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688669715; x=1691261715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c73ospzpOiJ3HtlgE71gvC44nRlCQXqmHvLoRFp4sL4=;
 b=ND2+mI66BMUP0EVE1nSaYxo9mWB5eeoIo1gtE7E+zEXop6A8oX/OLRZXrLxEN1LhAh
 M58ceesFaLsZHJIl14MQQebqOO9dtXDwDrdF0XzK1FztkxRZn8WN4ay8KzkMAA8ePzMb
 jzf63o8jdzaNDYop5EEeRy3wdHRZDegmCOdKjn14iMOXuAAxvMuitqELUqjRH/oXZAQ6
 I3uzETwgEkWbFL6nff3d943wAiWYpBMPBH3GKYEqF/32sT2xRB7eQ5OjmibnmSD+ofK8
 F6W3/mg4BJ2Iii0UkfWEFfFIMkJSCMZjfTy6B8/wrYcM801nR3PGAcFPLDDSMEgJnUXQ
 C5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688669715; x=1691261715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c73ospzpOiJ3HtlgE71gvC44nRlCQXqmHvLoRFp4sL4=;
 b=NWmJ3yl60mjo3yVrQExXX5PePEviXP4hm8SHmEBYNcdWd/6/Zs3fkEB9IweJqCONz1
 zUOVoxaiZjfyl7iGPoAO3jbzxlsZaWF7jSyHhVy0/YXBiuS+maEAsAyNcHV+E91Y99DU
 OdgH3CmzwWH7u3yuAOfwmqbfbc8QWzexMDNOz4sXCO0zcDHaVvy08aJkephcROrHTGQ0
 txa4DjLqnq7dsTfR2pgfr5qBt5TgUrP3r7exTdp17leywS3neMW/siVPMzkiob/K6uGv
 qm29ZoMexjZJj/654goBvcSeYoayTuDc3Nh0Us4kXrqC5q3AeIf7+Ls+rwEu3qt/4b89
 cUyw==
X-Gm-Message-State: ABy/qLa1Y1/mlOWtG4NH20GzFyNDZTO0IiDR9RnKz88JYR3o24xxKj2T
 Tpt1nG9Y4riVFje0JvIVQKYHuA==
X-Google-Smtp-Source: APBJJlF1X8wbG4TDSUK8MuBW3QmgXhipXcKJo3Ts0Qh54FlI4NjRBynEemoPlOJF9xLjXeRjhk8xZQ==
X-Received: by 2002:a05:6512:3253:b0:4fa:5e76:7ad4 with SMTP id
 c19-20020a056512325300b004fa5e767ad4mr2021699lfr.10.1688669714682; 
 Thu, 06 Jul 2023 11:55:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac25151000000b004fb9c625b4asm363910lfd.210.2023.07.06.11.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 11:55:14 -0700 (PDT)
Message-ID: <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
Date: Thu, 6 Jul 2023 21:55:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Jordan Crouse <jorcrous@amazon.com>, freedreno@lists.freedesktop.org
References: <20230309222049.4180579-1-jorcrous@amazon.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230309222049.4180579-1-jorcrous@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Check for the GPU IOMMU during bind
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/03/2023 00:20, Jordan Crouse wrote:
> While booting with amd,imageon on a headless target the GPU probe was
> failing with -ENOSPC in get_pages() from msm_gem.c.
> 
> Investigation showed that the driver was using the default 16MB VRAM
> carveout because msm_use_mmu() was returning false since headless devices
> use a dummy parent device. Avoid this by extending the existing is_a2xx
> priv member to check the GPU IOMMU state on all platforms and use that
> check in msm_use_mmu().
> 
> This works for memory allocations but it doesn't prevent the VRAM carveout
> from being created because that happens before we have a chance to check
> the GPU IOMMU state in adreno_bind.
> 
> There are a number of possible options to resolve this but none of them are
> very clean. The easiest way is to likely specify vram=0 as module parameter
> on headless devices so that the memory doesn't get wasted.

This patch was on my plate for quite a while, please excuse me for 
taking it so long.

I see the following problem with the current code. We have two different 
instances than can access memory: MDP/DPU and GPU. And each of them can 
either have or miss the MMU.

For some time I toyed with the idea of determining whether the allocated 
BO is going to be used by display or by GPU, but then I abandoned it. We 
can have display BOs being filled by GPU, so handling it this way would 
complicate things a lot.

This actually rings a tiny bell in my head with the idea of splitting 
the display and GPU parts to two different drivers, but I'm not sure 
what would be the overall impact.

More on the msm_use_mmu() below.

> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++++-
>   drivers/gpu/drm/msm/msm_drv.c              | 7 +++----
>   drivers/gpu/drm/msm/msm_drv.h              | 2 +-
>   3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 36f062c7582f..4f19da28f80f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
>   		config.rev.minor, config.rev.patchid);
>   
> -	priv->is_a2xx = config.rev.core == 2;
> +	/*
> +	 * A2xx has a built in IOMMU and all other IOMMU enabled targets will
> +	 * have an ARM IOMMU attached
> +	 */
> +	priv->has_gpu_iommu = config.rev.core == 2 || device_iommu_mapped(dev);
>   	priv->has_cached_coherent = config.rev.core >= 6;
>   
>   	gpu = info->init(drm);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index aca48c868c14..a125a351ec90 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   
>   	/*
> -	 * a2xx comes with its own MMU
> -	 * On other platforms IOMMU can be declared specified either for the
> -	 * MDP/DPU device or for its parent, MDSS device.
> +	 * Return true if the GPU or the MDP/DPU or parent MDSS device has an
> +	 * IOMMU
>   	 */
> -	return priv->is_a2xx ||
> +	return priv->has_gpu_iommu ||
>   		device_iommu_mapped(dev->dev) ||
>   		device_iommu_mapped(dev->dev->parent);

I have a generic feeling that both old an new code is not fully correct. 
Please correct me if I'm wrong:

We should be using VRAM, if either of the blocks can not use remapped 
memory. So this should have been:

bool msm_use_mmu()
{
  if (!gpu_has_iommu)
    return false;

  if (have_display_part && !display_has_mmu())
    return false;

  return true;
}

What do you think.

>   }
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9f0c184b02a0..f33f94acd1b9 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -126,7 +126,7 @@ struct msm_drm_private {
>   	struct msm_gpu *gpu;
>   
>   	/* gpu is only set on open(), but we need this info earlier */
> -	bool is_a2xx;
> +	bool has_gpu_iommu;
>   	bool has_cached_coherent;
>   
>   	struct drm_fb_helper *fbdev;

-- 
With best wishes
Dmitry

