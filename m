Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03381390DA7
	for <lists+freedreno@lfdr.de>; Wed, 26 May 2021 03:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E166EB9B;
	Wed, 26 May 2021 01:00:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6FA6EB97
 for <freedreno@lists.freedesktop.org>; Wed, 26 May 2021 01:00:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w33so40953124lfu.7
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YVD+VaC1x6mEUUpHbrv0Vf+0CSBqOy9uuOikGpUxMvg=;
 b=oAxZJiGtciI9t/NLX66UdglzTF6S5YVGLrkNbEEq97ZK8FlZoJqA0iR5+303WI5BVt
 17gSGV4Ktd9RRwq2NBcXLrhJb3aQb008GP0vtLdj0+b+AqzZVS/3gqeAN147/Xm+hYDQ
 wyA75VHCv4xKN3AxB0McTmhN7PYqiLycGS1ZR7fdp6hROFumBKA4c5dyua+z1JDKXS0O
 qg5pAevul3ddtq/JLOSGzxP+nTzgoyStxs2eAYLAgZqBwQycf2GXmMo0IAzGNwGQvqY2
 bqfZnjFsCCV9KihaSuAcCSehZjhCN9d2BejQkofYqYugvB3sXhBSA+19F0+fGhQCKYPJ
 LuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVD+VaC1x6mEUUpHbrv0Vf+0CSBqOy9uuOikGpUxMvg=;
 b=uisj+wGfLWH0nhTPGFTqkj5R/2dHfv6I69FRqZBobIPR34n2hm5vfzxiM6cvywjhd7
 cguhcK2wz4AgoF7o++mvZWSbxmwkFB0wKAqUPDZYtMhBQL3OfoGP4AEAo8ukGZXiKoIj
 +/zFVirv3d69FmeqfFju8uCVFohnCqe6ftyHm2fTPyz0n2umzArImU1H9AQ1QsK1RcRv
 oEIXXblkUSVVGmWMJYUa5nOixhA5SwnGY7uVkGWS2D+rtwIJfjBY1IgjtS7W5DvKoWgm
 mCB3S/TrnLktO/QW8q/mkkEDnwznWKcQ/KQnwZh+IBmkxED+dpM7LwkxPKHj5zCiG1uC
 6CWg==
X-Gm-Message-State: AOAM530RfUqM4LsjoObLvK8mb3vOCPO+D3IBgfBJy6rfx/q8Rc4OTsID
 XQ0FU9S2eup/Q/rRrd79R70jaQ==
X-Google-Smtp-Source: ABdhPJysf1cz6iFkNRX8YN3S7joFh5Eqs7viTEl74u3GaRRhR/c17IOQmLIcX1E8b76GLltAHvJ3sQ==
X-Received: by 2002:a19:7012:: with SMTP id h18mr264097lfc.432.1621990852362; 
 Tue, 25 May 2021 18:00:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1839140lfs.263.2021.05.25.18.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 18:00:51 -0700 (PDT)
To: Guenter Roeck <linux@roeck-us.net>, Rob Clark <robdclark@gmail.com>
References: <20210525112904.1747066-1-linux@roeck-us.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <73c997e5-79dc-f269-f649-d5bc54c2e86c@linaro.org>
Date: Wed, 26 May 2021 04:00:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525112904.1747066-1-linux@roeck-us.net>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1/dpu_encoder: Drop
 unnecessary NULL checks after container_of
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/05/2021 14:29, Guenter Roeck wrote:
> The result of container_of() operations is never NULL unless the embedded
> element is the first element of the structure. This is not the case here.
> The NULL checks on the result of container_of() are therefore unnecessary
> and misleading. Remove them.
> 
> This change was made automatically with the following Coccinelle script.
> 
> @@
> type t;
> identifier v;
> statement s;
> @@
> 
> <+...
> (
>    t v = container_of(...);
> |
>    v = container_of(...);
> )
>    ...
>    when != v
> - if (\( !v \| v == NULL \) ) s
> ...+>
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8d942052db8a..a573fe211375 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1453,11 +1453,6 @@ static void dpu_encoder_off_work(struct work_struct *work)
>   	struct dpu_encoder_virt *dpu_enc = container_of(work,
>   			struct dpu_encoder_virt, delayed_off_work.work);
>   
> -	if (!dpu_enc) {
> -		DPU_ERROR("invalid dpu encoder\n");
> -		return;
> -	}
> -
>   	dpu_encoder_resource_control(&dpu_enc->base,
>   						DPU_ENC_RC_EVENT_ENTER_IDLE);
>   
> @@ -1797,11 +1792,6 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>   			struct dpu_encoder_virt, vsync_event_work);
>   	ktime_t wakeup_time;
>   
> -	if (!dpu_enc) {
> -		DPU_ERROR("invalid dpu encoder\n");
> -		return;
> -	}
> -
>   	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
>   		return;
>   
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
