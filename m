Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2394381A32
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 19:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282316E42C;
	Sat, 15 May 2021 17:41:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D8D6E431
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 17:41:43 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 131so2250459ljj.3
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=b7eX77q8eKbpdnMvJxfoJvBkAq9vgiVC8Eptr8qHOxM=;
 b=IHGdBBzTmj0VpkUBKhTvgL7ff21LY6rZpUEOV3viZVLWRG8L747QMqM1X1LPtFkbZh
 EJvhV8MZPe7isHM0+kW+Yoey9ivxWHwnk/JMSgWgkVw4cnAZdYpRK5KzLhwTZuhyo+Nn
 Olms4DtUW52q+cHwHUSZSkId+NnfvpdrA65XHDr5qXEE/UaFnAkOwT+kESdSE8/g0WLY
 jJUmQ5VkyZDBeoAKNelXs1BQOA4sdFn9nTYGnkX+Aj8MAi1PsEVp6pJP5nxZebo+tx+r
 taRE2AgAWsf1M4OApV4dm7YYBO2l5DMWCyekP73xI7v9FWHCA8U/FajH4mLMYnI5VrVV
 Q6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7eX77q8eKbpdnMvJxfoJvBkAq9vgiVC8Eptr8qHOxM=;
 b=hZAk63O2HGIMdfcdHlacal6GFodenRsfrru7+L30py8GjuZidCCwbG0Yt1TknHanv4
 EYBfPahRdfllEYcyR70JZwb2lu2bya00MQAeCeUIf1ZdT0vihmfHL8cr2OHO7UPSIXfh
 55n1xpzLoKlQbLuMTf9g3lVggZ46GdxII5jzCc+6X1DBTyA5iouzXBPUi2QTOtjDFXUi
 u5xiaHjpSPwEJZ1rK5g37TzgA2A9WmoaBjhAusOLgEvfBRYzLJ1TItS1v1ZYvHtpN8Aa
 0nOMUTQG6mqf8THh/x4g9vgQ47hZyx3cagno4Swxs+ham5gXpYuhmTcuO6rFae3osbnH
 8kFQ==
X-Gm-Message-State: AOAM532xGzRzTRskjzrwB1YyZpJjSUfZMNXCSocO2fSt7kS7vIlAjCdQ
 +4lqbuwbgHqM+QqIMU0a087uBQ==
X-Google-Smtp-Source: ABdhPJywo+0YyXrXkHIsvx+8Y2y5PtGhqM4kuVUcPeW2DVE2rC9aZH144ekNIyXTmHQxnYIgvKLC3w==
X-Received: by 2002:a2e:9215:: with SMTP id k21mr42376171ljg.224.1621100502083; 
 Sat, 15 May 2021 10:41:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm952196ljk.123.2021.05.15.10.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:41:41 -0700 (PDT)
To: Zhen Lei <thunder.leizhen@huawei.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508022836.1777-1-thunder.leizhen@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ad97839c-8849-d4d7-91ff-af2ac2453745@linaro.org>
Date: Sat, 15 May 2021 20:41:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210508022836.1777-1-thunder.leizhen@huawei.com>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm: Fix error return code in
 msm_drm_init()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/05/2021 05:28, Zhen Lei wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> Fixes: 7f9743abaa79 ("drm/msm: validate display and event threads")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2454e2..ebd856dde1f1 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -523,6 +523,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   		priv->event_thread[i].worker = kthread_create_worker(0,
>   			"crtc_event:%d", priv->event_thread[i].crtc_id);
>   		if (IS_ERR(priv->event_thread[i].worker)) {
> +			ret = PTR_ERR(priv->event_thread[i].worker);
>   			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
>   			goto err_msm_uninit;
>   		}
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
