Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E436A3DAC69
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 22:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3926EE46;
	Thu, 29 Jul 2021 20:06:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62726EE46
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 20:06:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d8so8337232wrm.4
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=orEZU3YWRIPfL2Wlo/hgQ+Zfxy//ARMfeeEtYN2miI0=;
 b=PHWtzWLZg/vbTbQwYSj9IVbigjXSpJz3+iGNDaCdmA37AA6pP3syQ3E8yVXt68ROkE
 aT8+vP0/8KJmJ+4k5mVW5KoISPAQt9mYRbmKPV9ZkUbbM0dhbjYoNZwScDKdjbQvCIs1
 u37eDD4NLuI4LW8LS3TdsbbTETZ74+2me2IW0GFUfBzNk14ESFTjmUYxIEJ9wOf5JXE/
 d1NT82q8XGYdqq2g32qHQYqT5v36KZ9EOcQ5EaDX6RTwSw5f6SScBQjmgykMu9H3lbJM
 u/W7EFBHVtA2SVbYeGLgx+qczGGs+ePR2CUAj+6SwhW9R9mbyvxwPvNFJFgJ5bmm8ycV
 6Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=orEZU3YWRIPfL2Wlo/hgQ+Zfxy//ARMfeeEtYN2miI0=;
 b=Lspj7uqMDpxc1eGtEY6nyUkvww9PjpDmThvoQV8LIz0rwi19dR9YdEjW5sMFPSdtAs
 d6ZD1JQupSo1LRBtMhus/QSWiTu8VyXWKHS4gB1JWKeZ90w1qiDaKTWt8immTFcO3PZR
 g85/jNJVSzRML7gv/kG7mNNEn9LsTuLLj/K3AmZ6DW0uD25UoOPtJRgdDXmR80rSnoRk
 lNz8ISqsJxuJ7nKNnjW+WXM/BUwf9oVy+5SVKm7tlb0sYXnLHcgm3snuAks4ZlQrPj83
 cSlBpvmRmEW5RUw21eRnl0UL9XUkn4b2PTgkJH8daTrWVBp0uEMo7kJ5ng0RNYim8kp3
 NqsA==
X-Gm-Message-State: AOAM5309cN9Yscs6czydKb/igHW4vFEYCg4/lGzb3YgBIHGpy2vxdaEl
 yOtSva2wlIC6rACTn9V3PRLWdQ==
X-Google-Smtp-Source: ABdhPJwz51aKsXX7yYtXDXB43ennBdi6yWs9BV+AnNUgLR/wq7FEawLfPiAsm7CvVooy4myXa977cg==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr6618159wrw.328.1627589183227; 
 Thu, 29 Jul 2021 13:06:23 -0700 (PDT)
Received: from [192.168.1.12] (host-80-41-121-59.as13285.net. [80.41.121.59])
 by smtp.gmail.com with ESMTPSA id
 j13sm7796608wms.24.2021.07.29.13.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:06:22 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210729183942.2839925-1-robdclark@gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
Date: Thu, 29 Jul 2021 21:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729183942.2839925-1-robdclark@gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm: Disable frequency clamping on a630
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above 
the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more 
aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.

Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable 
at the higher frequencies.

Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in 
glxgear.

I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run 
at the voltage the hardware needs to be stable.

Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have 
CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?


On 29/07/2021 19:39, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The more frequent frequency transitions resulting from clamping freq to
> minimum when the GPU is idle seems to be causing some issue with the bus
> getting voted off when it should be on.  (An enable racing with an async
> disable?)  This might be a problem outside of the GPU, as I can't
> reproduce this on a618 which uses the same GMU fw and same mechanism to
> communicate with GMU to set opp.  For now, just revert to previous
> devfreq behavior on a630 until the issue is understood.
> 
> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>   drivers/gpu/drm/msm/msm_gpu.h           |  2 ++
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 12 ++++++++++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 748665232d29..9fd08b413010 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_enable(dev);
>   
> +	if (adreno_is_a630(adreno_gpu))
> +		gpu->devfreq.disable_freq_clamping = true;
> +
>   	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>   			adreno_gpu->info->name, &adreno_gpu_config);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0e4b45bff2e6..7e11b667f939 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -112,6 +112,8 @@ struct msm_gpu_devfreq {
>   	 * it is inactive.
>   	 */
>   	unsigned long idle_freq;
> +
> +	bool disable_freq_clamping;
>   };
>   
>   struct msm_gpu {
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 0a1ee20296a2..a832af436251 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -94,6 +94,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>   	if (!gpu->funcs->gpu_busy)
>   		return;
>   
> +	/* Revert to previous polling interval if we aren't using freq clamping
> +	 * to preserve previous behavior
> +	 */
> +	if (gpu->devfreq.disable_freq_clamping)
> +		msm_devfreq_profile.polling_ms = 10;
> +
>   	msm_devfreq_profile.initial_freq = gpu->fast_rate;
>   
>   	/*
> @@ -151,6 +157,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>   	unsigned int idle_time;
>   	unsigned long target_freq = df->idle_freq;
>   
> +	if (gpu->devfreq.disable_freq_clamping)
> +		return;
> +
>   	/*
>   	 * Hold devfreq lock to synchronize with get_dev_status()/
>   	 * target() callbacks
> @@ -186,6 +195,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>   	struct msm_gpu_devfreq *df = &gpu->devfreq;
>   	unsigned long idle_freq, target_freq = 0;
>   
> +	if (gpu->devfreq.disable_freq_clamping)
> +		return;
> +
>   	/*
>   	 * Hold devfreq lock to synchronize with get_dev_status()/
>   	 * target() callbacks
> 

-- 
Kind Regards,
Caleb (they/them)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
