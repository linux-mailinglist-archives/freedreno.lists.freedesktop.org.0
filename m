Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1AF6A1DF8
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 16:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA3710EC4B;
	Fri, 24 Feb 2023 15:05:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347810EC4B
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 15:05:17 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id ne1so13792222qvb.9
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 07:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5BpD6FTwoSIc56RP/MeWNUaxFFqGMGY83NroahzU7g=;
 b=OvJ/9+t5tSih6Cs7/VwVRxdFSmLE3uHmMP2iPMou9Ph4IF275aGHwW0lsDMq34XP7J
 KtnmR1Kyz9nwbAfPeB24EE6enAvh7TfdZ+LSdCXmejScc26YtKCkcAQ1c9p3rylCaevD
 bujgKUL0r4fwcaZZHa7LJHd+QTLXr0V0d0H/k6PEFE7bHEZIuzn75UNaXDWjfWE7ghmL
 qbF7hAEUqyjiIUgBbCc762iOqinFYjyMRYZhvWbSWbaEalQzp2d3mR9f6b0kIvHGLpvW
 knmQixfvy0915fxY6j1UAH4N39fDRRUzNMpV287lkrqkWaLqSzVDPkT8EbxPjJSHllhq
 cEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5BpD6FTwoSIc56RP/MeWNUaxFFqGMGY83NroahzU7g=;
 b=XB2VHMQ7OlzfjM8RdNwmqcELtbp9wRbPMzC7OLkUKDwfoR3Txzh40GneqKFhGxdTBH
 /3gnoaew4ac1Vq+zNxj3e//vQLtbX6jWdYHx8ig9HxugcnTbZhdBADVR7xSYnmkoQTSj
 9PE6wmtqShETBLBKNHsfOCLKSf1FSIC/TbZtGqlaPHgbT9v69GugbzjGh8t1KYYjN+Az
 CmrNQn9ECI9oZKvfGvcTP3jYuAcD6esedqYO7iQleoKuad/4Ek0kaqxZiB8EYkH/zqUG
 VKGl4HjKmT4r/aIuTEbVkjbj6SomXXd8zzCEapEpHxUHBKGAMCOSTELd0Ss6gX4+Jaif
 oZVQ==
X-Gm-Message-State: AO0yUKXcMps6tLIehgrl0diNeqsXHIbaLs/5rwhe+cZjj/qXo7uJLzRO
 oEAFXVXRiIH380nYpYH4538nWw==
X-Google-Smtp-Source: AK7set82DcP5O0Ce0JRP76yvFk01KL2wCZ2N+/Abd+TwAMwdOsaWfxITECxz9SxWHBh1nhmPmixVNg==
X-Received: by 2002:a05:6214:e8a:b0:56e:ff37:6b6e with SMTP id
 hf10-20020a0562140e8a00b0056eff376b6emr31812080qvb.10.1677251116493; 
 Fri, 24 Feb 2023 07:05:16 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca.
 [135.19.110.125]) by smtp.gmail.com with ESMTPSA id
 a186-20020a3798c3000000b0073b878e3f30sm6538530qke.59.2023.02.24.07.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 07:05:16 -0800 (PST)
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-4-5f22163cd1df@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <2f2467d1-f5f3-86dd-edba-fc26e60d142f@marek.ca>
Date: Fri, 24 Feb 2023 10:04:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20230223-topic-opp-v3-4-5f22163cd1df@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 4/7] drm/msm/a2xx: Implement .gpu_busy
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This won't work because a2xx freedreno userspace expects to own all the 
perfcounters.

This will break perfcounters for userspace, and when userspace isn't 
using perfcounters, this won't count correctly because userspace writes 
0 to CP_PERFMON_CNTL at the start of every submit.

On 2/23/23 5:52 AM, Konrad Dybcio wrote:
> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
> allows us to use devfreq on this old old old hardware!
> 
> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..104bdf28cdaf 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -481,6 +481,31 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   	return aspace;
>   }
>   
> +/* While the precise size of this field is unknown, it holds at least these three values.. */
> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> +{
> +	u64 busy_cycles;
> +
> +	/* Freeze the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_FREEZE);
> +
> +	busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
> +
> +	/* Reset the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_RESET);
> +
> +	/* Re-enable the performance monitors */
> +	gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2,
> +		A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE,
> +		A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE);
> +	gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_ENABLE);
> +
> +	*out_sample_rate = clk_get_rate(gpu->core_clk);
> +
> +	return busy_cycles;
> +}
> +
>   static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   {
>   	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
> @@ -502,6 +527,7 @@ static const struct adreno_gpu_funcs funcs = {
>   #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
>   		.show = adreno_show,
>   #endif
> +		.gpu_busy = a2xx_gpu_busy,
>   		.gpu_state_get = a2xx_gpu_state_get,
>   		.gpu_state_put = adreno_gpu_state_put,
>   		.create_address_space = a2xx_create_address_space,
> 
