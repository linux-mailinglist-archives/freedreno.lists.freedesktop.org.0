Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AC41F2E6
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 19:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E166EE6C;
	Fri,  1 Oct 2021 17:17:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6906EE68
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 17:17:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m3so40934624lfu.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4nq3ufox1xom42EnmcsKdxgFb5PRGjFCfz0qt/CUS50=;
 b=DqUCYxf5ILzqEJ2ur4zYXd5mUhCfSppqHqDIdi8GVIbYHZzyPOgVgPrnsoNXWolz76
 uJo37Uj1lIGE01zyFsiertqhTfvMNVazomy4yxykqCm0a+7wsPJpLI0sgmF2St4B2j1J
 6F8LEBKx7HuIXiMxm4bPbo1L2tkmxK147awCwK9V496ZDrMYqvrvMhzbY2pua2SyKeSR
 MsM1j2jNsiQJdT43SmWSBDRfl63e2LEXlzSptRVzHV/ucQtqYWn1ZVRuamXojiKlA6/F
 4AM2vqUn9xybUyYjHpXqLaX2eFYWcZ9IHAbIvKdLTM6iF30llhmuu8HFqnFftPbeQnw/
 CIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4nq3ufox1xom42EnmcsKdxgFb5PRGjFCfz0qt/CUS50=;
 b=6nitz0u7EMrgBtioe8X9J08wzzTP6/u8y/xrIj0bmtp9OPD6tW+JoQjoTlq2hLTnZ5
 /j5SXaZ2B4JRsMe4ey3/HV1HXKtD5Es7iYcC3eJD8egeOkWZk31FT0TmpzmuCbq4Yqtg
 iKz5vfgMnXra+4o69RsnzSg+Q4gbpTsKlhCGvl3Ngu6Md2WSIyD8xQ9nG+2QJ6ejfG4O
 4W47WIJIavRfqkOmNkPzhODZzR4ZBDw3jt8jeZKxYxfd3m73WYh+IZNXqSfmrpuWpl7Z
 5zye3qTDHhlsBvqKaQPu6Ip1mLzN9++OJl3h45AFXp2VcAO/qmwmF58JUlnYvk0c8gQH
 LMTw==
X-Gm-Message-State: AOAM533DLgsEdDqSnvK50NLZ9OuIFTZxevh48c1Aped4q1+Tl9hXbPZm
 Hh3ZUL7xvgMtvX3FoYhxQIL4+w==
X-Google-Smtp-Source: ABdhPJzx8FIsQnG6UCj2NGODwufkHIcRyzLmofPa0AcCaQFQjLKqVxtEOZE1Xib+jiiMU5PZGvC4oA==
X-Received: by 2002:a2e:711c:: with SMTP id m28mr9896344ljc.354.1633108667519; 
 Fri, 01 Oct 2021 10:17:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s8sm794636lfd.149.2021.10.01.10.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:17:47 -0700 (PDT)
To: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>, stable@vger.kernel.org
References: <20210917005913.157379-1-marex@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c15e4bc2-b377-a0a4-4a9e-3676db7bbc4b@linaro.org>
Date: Fri, 1 Oct 2021 20:17:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210917005913.157379-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Avoid potential overflow in
 timeout_to_jiffies()
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

On 17/09/2021 03:59, Marek Vasut wrote:
> The return type of ktime_divns() is s64. The timeout_to_jiffies() currently
> assigns the result of this ktime_divns() to unsigned long, which on 32 bit
> systems may overflow. Furthermore, the result of this function is sometimes
> also passed to functions which expect signed long, dma_fence_wait_timeout()
> is one such example.
> 
> Fix this by adjusting the type of remaining_jiffies to s64, so we do not
> suffer overflow there, and return a value limited to range of 0..INT_MAX,
> which is safe for all usecases of this timeout.
> 
> The above overflow can be triggered if userspace passes in too large timeout
> value, larger than INT_MAX / HZ seconds. The kernel detects it and complains
> about "schedule_timeout: wrong timeout value %lx" and generates a warning
> backtrace.
> 
> Note that this fixes commit 6cedb8b377bb ("drm/msm: avoid using 'timespec'"),
> because the previously used timespec_to_jiffies() function returned unsigned
> long instead of s64:
> static inline unsigned long timespec_to_jiffies(const struct timespec *value)
> 
> Fixes: 6cedb8b377bb ("drm/msm: avoid using 'timespec'")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: stable@vger.kernel.org # 5.6+

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> NOTE: This is related to Mesa MR
>        https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12886
> ---
>   drivers/gpu/drm/msm/msm_drv.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 0b2686b060c73..d96b254b8aa46 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -543,7 +543,7 @@ static inline int align_pitch(int width, int bpp)
>   static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>   {
>   	ktime_t now = ktime_get();
> -	unsigned long remaining_jiffies;
> +	s64 remaining_jiffies;
>   
>   	if (ktime_compare(*timeout, now) < 0) {
>   		remaining_jiffies = 0;
> @@ -552,7 +552,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
>   		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
>   	}
>   
> -	return remaining_jiffies;
> +	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
>   }
>   
>   #endif /* __MSM_DRV_H__ */
> 


-- 
With best wishes
Dmitry
