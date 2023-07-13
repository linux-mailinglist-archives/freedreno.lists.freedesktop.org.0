Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A862752B4D
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 22:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838510E77E;
	Thu, 13 Jul 2023 20:03:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27CE10E0A9
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 20:03:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso1389717e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689278598; x=1689883398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yvt8Ku6KDe29tpizQm23o+O9+z8bar+cVRkERkmQ91w=;
 b=FIEiEaFZqrXW8g8YQ8JN5/m9jV8Rn+IH6+81QIfMP6OXn6Yx3ig8G05Rc2TzTjM92V
 QFyWvhupVc7i04q4dWNiplHx7Q54ZZ/p4Z4dTusHG2IpEOi6l1NkpfxgsTi6rwyQzD8n
 ZOC4c3xWeMOxZIeWojRjqw8OBPKWgl2fwPLd3RbgzlKjxxn5AGLn6dPVbCsBCTmJ3Rlm
 KPkU95S9zJR0wNt0nB+MgZSVuuEnUR/P3bGoZeVBJ9aeve2Juk38x177QueyngiiE4ST
 WdJInwrH3RsE3yoZvv0N4Pdg88osODnbFo9cvLG61hQfRW8CZlCBL3T4Aj9TXIDQV4Uq
 A3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689278598; x=1689883398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yvt8Ku6KDe29tpizQm23o+O9+z8bar+cVRkERkmQ91w=;
 b=Mf4J3iXfMlllUuOEw40yC8YAmeXWYUm7aZK16FjoZjXaZ0d4Xb4/dZGvO0ZEvPMOzm
 fB8SXo8CocF6iGZRxY10v95oGSjcsXw5OkU8hGvnfqi0TrTHzFysXXlghNVTY6sqJw8L
 jvuwjPKzSZQOBeDLdOOYvEzVVwSjYCaqpJ/e2aSxfq7nYD6Isdq/LvqoogTSz8pJ0x5q
 r0D/McT3RrIQVOFJISIPtCYHls0ygOl+kRGdjk+cWOfhLbAHPH/08nxVabUjALklKeSr
 tOIjeuT4xmcTSWs/+emX4d0OJC8UfGybqW4PzsEOwvbypDU0FURx+EGM/2IsBPvFHaxh
 LNMw==
X-Gm-Message-State: ABy/qLaKlb4bp/mlmlPcpqy8CERMW00UdDXRecLgm+2IzhEYCSJda5pK
 nQDosHbodV155htfkzNyYAnhkQ==
X-Google-Smtp-Source: APBJJlHvFT4NkzYf8AiTu0gZdv5cunOm8vlcbun9kkFFQ7/GyRaJ58yCVi/nDi7GsigvUUQbiZlZ0g==
X-Received: by 2002:a05:6512:398a:b0:4f9:5582:a7d3 with SMTP id
 j10-20020a056512398a00b004f95582a7d3mr218898lfu.22.1689278598227; 
 Thu, 13 Jul 2023 13:03:18 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x7-20020ac259c7000000b004f84b36a24fsm1227265lfn.51.2023.07.13.13.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 13:03:17 -0700 (PDT)
Message-ID: <a7aa6e21-6f79-0029-5034-db368239980a@linaro.org>
Date: Thu, 13 Jul 2023 23:03:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230712222523.7404-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712222523.7404-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix hw_fence error path cleanup
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/07/2023 01:25, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In an error path where the submit is free'd without the job being run,
> the hw_fence pointer is simply a kzalloc'd block of memory.  In this
> case we should just kfree() it, rather than trying to decrement it's
> reference count.  Fortunately we can tell that this is the case by
> checking for a zero refcount, since if the job was run, the submit would
> be holding a reference to the hw_fence.
> 
> Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.c      |  6 ++++++
>   drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 96599ec3eb78..1a5d4f1c8b42 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -191,6 +191,12 @@ msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
>   
>   	f->fctx = fctx;
>   
> +	/*
> +	 * Until this point, the fence was just some pre-allocated memory,
> +	 * no-one should have taken a reference to it yet.
> +	 */
> +	WARN_ON(kref_read(&fence->refcount));

It this really correct to return a refcounted object with 0 refcount 
(I'm looking at submit_create() / msm_fence_alloc() )? Maybe it would be 
better to move dma_fence_get() to msm_fence_alloc() ? But don't 
immediately see, which one should be moved.

> +
>   	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
>   		       fctx->context, ++fctx->last_fence);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3f1aa4de3b87..9d66498cdc04 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -86,7 +86,19 @@ void __msm_gem_submit_destroy(struct kref *kref)
>   	}
>   
>   	dma_fence_put(submit->user_fence);
> -	dma_fence_put(submit->hw_fence);
> +
> +	/*
> +	 * If the submit is freed before msm_job_run(), then hw_fence is
> +	 * just some pre-allocated memory, not a reference counted fence.
> +	 * Once the job runs and the hw_fence is initialized, it will
> +	 * have a refcount of at least one, since the submit holds a ref
> +	 * to the hw_fence.
> +	 */
> +	if (kref_read(&submit->hw_fence->refcount) == 0) {
> +		kfree(submit->hw_fence);
> +	} else {
> +		dma_fence_put(submit->hw_fence);
> +	}
>   
>   	put_pid(submit->pid);
>   	msm_submitqueue_put(submit->queue);

-- 
With best wishes
Dmitry

