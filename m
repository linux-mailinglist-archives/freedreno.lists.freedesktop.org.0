Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635644AFFFC
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 23:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F310E173;
	Wed,  9 Feb 2022 22:17:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D61A10E173
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 22:17:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i17so6843654lfg.11
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=T9akMQGOGv0TdBQ+Zhymh6XiC98Y7uCuYr8S0QfufYw=;
 b=So89NUtFvR12bmWOhO2nI5d8soc5b89oiH6ChTJGXB7g1HWfnQxgnN07opHsWJJbDY
 +YcN7dVNKQiiXNQNyqF64SdA5fDsk/RHoHiSAtN+aD7T/RpjjWAAiezNp03ig23l4YWi
 dXoxKgcP5yNxjFunr8JDwDmPnZjzNobzJ90mlchJ+akOWikw7A7mYM62pzQEW1PD10sx
 /j5luWQKYxjGaxpaAxFNNnfI7KLJbBkjz3c1dA/Y4YO+OqpZCSSAWBwhv48NUUCq24bu
 yWq3UtqIkCiHf3ONkQQuUSth6JYjyjgwM7f9sur8i6IjrY6uyLYA4JYlB2zGUH0fMNVK
 o3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9akMQGOGv0TdBQ+Zhymh6XiC98Y7uCuYr8S0QfufYw=;
 b=7hn7RpwiVup9HtKwLNK3BerBuNEiKHjPoTLOTmcHjd66nE3ibfz+otDAmwbFIBpgHh
 SZngY3B4m40qTejLY/RpgWVjylCMSywJFuMWrrZ2GkdL9RupntGXWqm1wrGeDvX7VIYw
 vbz9yFfS32erREKEaSN+oDm9xQGTh4VzkfnOiIGugXIN/MDXxuLf7cYUCzSpCLDs6z+p
 sG0fK/LFPKgoxMp/6CIt0Eva2FaQMhMpR4yyseH7WvqHZyrzOHeNg5UMtY7LPZhoDhpZ
 nvJIVerkk6wZ6F5OzyEZFvsd7z/wFITqQSv606bmzXnh4zy6hf97JVBpAwqKuja14wBt
 Bs2A==
X-Gm-Message-State: AOAM531YAQHLYLwk82WZvsbl+YZOZUoNuAQjmk0WRF796GofYblC/Qxd
 lMIrRX6f+tfedtjqq07bkZyMkA==
X-Google-Smtp-Source: ABdhPJxW/IKBuQbesqGO3kgP8T+UCOU7nfSM5QCDmtANUvL9RHgmlLxrVB+EsyElYkDADCFQXe+zNw==
X-Received: by 2002:a05:6512:1502:: with SMTP id
 bq2mr3004500lfb.551.1644445038733; 
 Wed, 09 Feb 2022 14:17:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k21sm2527309lfg.252.2022.02.09.14.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:17:18 -0800 (PST)
Message-ID: <6ea0e85e-1ade-f102-86c2-4b71dbc24285@linaro.org>
Date: Thu, 10 Feb 2022 01:17:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Qing Wang <wangqing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] gpu: drm: msm: use div64_u64() instead of do_div()
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

On 09/02/2022 11:37, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> do_div() does a 64-by-32 division.
> When the divisor is u64, do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.
> 
> fix do_div.cocci warning:
> do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 2c1049c..aa4617b
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -648,7 +648,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	/* Calculate the clock frequency from the number of CP cycles */
>   	if (elapsed) {
>   		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> -		do_div(clock, elapsed);
> +		div64_u64(clock, elapsed);
>   	}
>   
>   	trace_msm_gpu_submit_retired(submit, elapsed, clock,


-- 
With best wishes
Dmitry
