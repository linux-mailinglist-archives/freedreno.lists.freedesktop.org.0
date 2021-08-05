Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D23E1639
	for <lists+freedreno@lfdr.de>; Thu,  5 Aug 2021 16:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3686EA6C;
	Thu,  5 Aug 2021 14:00:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEF76EA6C
 for <freedreno@lists.freedesktop.org>; Thu,  5 Aug 2021 14:00:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g30so7026693lfv.4
 for <freedreno@lists.freedesktop.org>; Thu, 05 Aug 2021 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5meyUU5c75KlfpjDtjU0FZ5byhyUrjIowVbBuxl5gt8=;
 b=exwaS8glI5xqkQg7fftcfVSt0yKa5ROwNh4MsE4dv4suv9aVtEEmxfyL+3QPhV++UO
 F/TqJGkDSCqRHGxQiBd1r6AAcsvwuPPiZJrNMyU0E/fJawKNG6ZOLxt4al3Ion4+XrXc
 pSFhsC/F4Hwjm6n01l0155RK2RnITgIKiVqPqlS0TW09QQApBAtRQyOV/CmdulbVi3Ki
 0hg3R8oUP9Ax5gQCKPhOYvPnZLWm9K8ZyIDaAXTsaiUmYArWWZyKZNus4F4vc4ki5sMF
 7DskWiTIZzsbIVWugFUgBDh1H51/Qj9TwN3iFHW3vF6pVlFqfO77WlpdPXWQicoyi8wk
 88ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5meyUU5c75KlfpjDtjU0FZ5byhyUrjIowVbBuxl5gt8=;
 b=OIl788xuFfacDMq/uwKg+tzB18EXZRgFQ3XCkLegKqE3pm0UN1+gg4ytxyGAAIN4rR
 rmxKFVWukj6VRtBYZKZwhXSultwRsrF3/nJybai1Gvr5i/652HgWb6yNceIpsad2to4L
 zxUB8xLIUr+dCf10cO+WqVbc/xC5L02S143EN93joQcyJFryH0cRFenodpkOOUy3kHKt
 czxuD38bnKsnM5E/p4Bp0A03jPNkH00P1JUZ3dtAVNJxyL8M1nlwb1RMvy+Vthw6ugwi
 MRDlekIx4L78UV1yMBj0bywwSsIaFUMAkp6weqLx8rwBUWBZ8IVI/gje0eUbFFt2HzQJ
 3lgw==
X-Gm-Message-State: AOAM533oCN2xL24NKRcY1++xcz+WKrX1CrDPojmmuJUQMkpNbsZIxaLK
 S/f2VomkRQfFjFnPu119LMFetRMDrK5OFA==
X-Google-Smtp-Source: ABdhPJwcFb9ISI0KyAfqPA/9+TTAYxcorPwRB7ZppyJCzqw58qaB0x19GC8SIvHlp3gsTBbdGxLDrQ==
X-Received: by 2002:a05:6512:2186:: with SMTP id
 b6mr3736739lft.490.1628172021033; 
 Thu, 05 Aug 2021 07:00:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c13sm523002lfv.133.2021.08.05.07.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 07:00:20 -0700 (PDT)
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@linux.ie, daniel.vetter@ffwll.ch
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-5-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a73f8e7e-35a4-259f-74da-175600be7770@linaro.org>
Date: Thu, 5 Aug 2021 17:00:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721175526.22020-5-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RESEND PATCH v6 04/14] drm/msm/dpu: Replace
 definitions for dpu debug macros
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

On 21/07/2021 20:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The debug messages shouldn't be logged as errors when debug categories
> are enabled. Use the drm logging helpers to do the right thing
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run #v5

The patch seems correct, but I'd propose another approach.
There is just 1 user of DPU_DEBUG_DRIVER and 29 users of DPU_DEBUG. So 
we might instead replace them with DRM_DEBUG_* calls and drop the 
DPU_DEBUG/DPU_DEBUG_DRIVER altogether. DPU_ERROR is used in ~190 places, 
so it will be more intrusive, but still doable.

> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..c33164d3944a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,27 +31,15 @@
>    * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
>    * @fmt: Pointer to format string
>    */
> -#define DPU_DEBUG(fmt, ...)                                                \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
>   
>   /**
>    * DPU_DEBUG_DRIVER - macro for hardware driver logging
>    * @fmt: Pointer to format string
>    */
> -#define DPU_DEBUG_DRIVER(fmt, ...)                                         \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> -			DRM_ERROR(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> -
> -#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> +#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> +
> +#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
>   
>   /**
>    * ktime_compare_safe - compare two ktime structures
> 


-- 
With best wishes
Dmitry
