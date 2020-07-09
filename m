Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF721A893
	for <lists+freedreno@lfdr.de>; Thu,  9 Jul 2020 22:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94D86EB2B;
	Thu,  9 Jul 2020 20:05:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E94A6EB2B
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jul 2020 20:05:47 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id h18so1551426qvl.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jul 2020 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
 b=AhNQ3fbwpzkEIcm+5ODN2ebHaNffsSaihE9J64OOIAKCSrPOSi8UTKlTBg+IOFXo9t
 5bjjk0weUCuGjLom8mO3n25mxkCZmksLojflbh+6QCihWuuzCh0ut7Do9/4MUH9uccBR
 bBPDd5Twd+Cbygxijcpwr3A11Rjp0BYBxDFWkVNH+XYp6OstTJeK2RnMGDUNmPdn9/pC
 C5py86ce/WHUUfwQNnkMrv0D5p/H4i/o21HHeP9NzG5bCDisxZgP7a9fEfN1lP29epEn
 E5qBcFQSAVhLpxnKd+CBvjfwNG6AgFsvOtC7UZuWlI5TTwoOj9pJVUXPhZS7mVHl0uAX
 sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
 b=dsCMWlJDI4lMJG6bXXyX887SUu0kmhFXotQARJIlICBy+vJss2FekE3dlwcEbudX8g
 eHZI24v160LliovqZo5ptEp+tmtoHCKq8b/gpfOK+Pox/17dsAMsRAOnbNveJmNH9z8R
 G8E5CBJwc52jfOfOgeQ7HBfOM0vR9XkBL5r5NmvMZHEgSRG0L6Z6AK8w6uXeRD6udR+x
 AmQBnumtnj1TnVBFVxiGAoWv9HE5D8nyUWHB3Tgw1MJD8xyuYjgXzZE86IeTuneuJ7YA
 OwheXYD+AemKSaNSNGUUHxGMT1EzB4O122Te2opPvwAusPFxT+0WAhLOgFsu0KtFmgee
 4qlw==
X-Gm-Message-State: AOAM530Bjf2W6HG8NKwQFkPmCeDxmyWpQTQ+1atcImmUQN6W2cMuniON
 jihdreWKVQKV20Zw7PF5CGsIbA==
X-Google-Smtp-Source: ABdhPJxcQip3en72uHZuZNYNwMWZgp8T1yNScrJF7eAeMu6gqoKUSdmJo+0p2Tl8FLdWhxkvOaeMpQ==
X-Received: by 2002:a0c:fa84:: with SMTP id o4mr64584468qvn.186.1594325146682; 
 Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id a185sm4702422qkg.3.2020.07.09.13.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
Date: Thu, 9 Jul 2020 16:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through
 hfi
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org, mka@chromium.org,
 dri-devel@freedesktop.org, viresh.kumar@linaro.org, sibis@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7/9/20 4:00 PM, Akhil P Oommen wrote:
> Newer targets support changing gpu frequency through HFI. So
> use that wherever supported instead of the legacy method.
> 

It was already using HFI on newer targets. Don't break it in one commit 
then fix it in the next.

> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 233afea..b547339 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -121,6 +121,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   		if (gpu_freq == gmu->gpu_freqs[perf_index])
>   			break;
>   
> +	if (!gmu->legacy) {
> +		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +		return;
> +	}
> +
>   	gmu->current_perf_index = perf_index;
>   	gmu->freq = gmu->gpu_freqs[perf_index];
>   
> @@ -893,10 +899,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>   	enable_irq(gmu->hfi_irq);
>   
>   	/* Set the GPU to the current freq */
> -	if (gmu->legacy)
> -		a6xx_gmu_set_initial_freq(gpu, gmu);
> -	else
> -		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +	a6xx_gmu_set_initial_freq(gpu, gmu);
>   
>   	/*
>   	 * "enable" the GX power domain which won't actually do anything but it
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
