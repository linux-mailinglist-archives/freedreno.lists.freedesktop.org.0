Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC56A94E0
	for <lists+freedreno@lfdr.de>; Fri,  3 Mar 2023 11:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DA510E040;
	Fri,  3 Mar 2023 10:11:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DF510E0F1
 for <freedreno@lists.freedesktop.org>; Fri,  3 Mar 2023 10:10:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id g18so1798425ljl.3
 for <freedreno@lists.freedesktop.org>; Fri, 03 Mar 2023 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NqTJog0WU9Xb9UlJnoiB4XTN8ej2i9JgdSH+1vJmkdE=;
 b=D56ghztB6NZ023qjf6JAGEbRxj2GdP2MyeLv7w9eludzsc8ZxOnMFuwM1Wn0Hb2fJy
 aqY0mGB5JmzxB6Ohhb0Dd0+SoL0BQPElORMkpo+sO4piYYvAvDx0Ot5zXFWsL//fEXnT
 5D6iiw1p8PudnM6q1bAEFoAsa7QhIyExZzA404tQdda2zFE9KUvtFktIZYwRwVWUjtn8
 OsspLEf/IQJdPHkG7wY6hkjz9aIHlnhJMxiBRC5V2HTOqNioqVIzpQWP3lrEikp49Fad
 hVf10cGR+ovsWxcZNr9XsNnW0nCBiHbzQoy+SC0W9ZwIfICneVjCv4dQ4HtVE38pqCR/
 klYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NqTJog0WU9Xb9UlJnoiB4XTN8ej2i9JgdSH+1vJmkdE=;
 b=JSJJ8HDsprB3yF3kKSyImK0sgln2o/FHgMbNejfPdyHxnjd119/m4vZ67kQpwDCUPN
 loHTJ3UVoxHnXARUTZZOSTbDy1+VhGYza3/jVfZVqRSiMCduJbl7pk8DA1SYKVa31dJ7
 ZDIRtjOZrGUPxZ0ol0kMoZXHaCydgjvDjCmpykvOMa8vsoKm/RoF6+tRXR2jON1zXSp0
 D5nP43fRxk5s085Pi0MHZxdXC/daGgbwBH6gTDgDb0kX35QagH1Aupz8CPVtxxOFrEXG
 ZQEpNvq8UBQdpA7VR1uT+WNFtsYDd1anNAVLIZclg0u/b+X2aSX/P0r3uKvHXQqFtPw/
 xhPQ==
X-Gm-Message-State: AO0yUKWWmTyBsQZsCPK95pbkyjl3ZU1PL7eR8MQwTFUiiWKlv1wCqdON
 awvlYXiQLeSYIiNb8J2ZsxOzeA==
X-Google-Smtp-Source: AK7set8498/xVK6/EvQia/Yd0/vqlLTKzh4csvD5Wm6NMW6LU1slxYLRLbfbSZjQg5IejKoczHCx2g==
X-Received: by 2002:a2e:3111:0:b0:290:6e3b:be34 with SMTP id
 x17-20020a2e3111000000b002906e3bbe34mr347302ljx.42.1677838256798; 
 Fri, 03 Mar 2023 02:10:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a2eb5b0000000b00294692d8645sm238386ljn.17.2023.03.03.02.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:10:56 -0800 (PST)
Message-ID: <a5249009-0bec-61a5-4dd2-5728ee3017e3@linaro.org>
Date: Fri, 3 Mar 2023 12:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-13-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230302235356.3148279-13-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 12/15] drm/msm: Add deadline based boost
 support
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Simon Ser <contact@emersion.fr>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <ppaalanen@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/03/2023 01:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Track the nearest deadline on a fence timeline and set a timer to expire
> shortly before to trigger boost if the fence has not yet been signaled.
> 
> v2: rebase
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.c | 74 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_fence.h | 20 +++++++++
>   2 files changed, 94 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A small question: do we boost to fit into the deadline or to miss the 
deadline for as little as possible? If the former is the case, we might 
need to adjust 3ms depending on the workload.

> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 56641408ea74..51b461f32103 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -8,6 +8,35 @@
>   
>   #include "msm_drv.h"
>   #include "msm_fence.h"
> +#include "msm_gpu.h"
> +
> +static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
> +{
> +	struct msm_drm_private *priv = fctx->dev->dev_private;
> +	return priv->gpu;
> +}
> +
> +static enum hrtimer_restart deadline_timer(struct hrtimer *t)
> +{
> +	struct msm_fence_context *fctx = container_of(t,
> +			struct msm_fence_context, deadline_timer);
> +
> +	kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +static void deadline_work(struct kthread_work *work)
> +{
> +	struct msm_fence_context *fctx = container_of(work,
> +			struct msm_fence_context, deadline_work);
> +
> +	/* If deadline fence has already passed, nothing to do: */
> +	if (msm_fence_completed(fctx, fctx->next_deadline_fence))
> +		return;
> +
> +	msm_devfreq_boost(fctx2gpu(fctx), 2);
> +}
>   
>   
>   struct msm_fence_context *
> @@ -36,6 +65,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>   	fctx->completed_fence = fctx->last_fence;
>   	*fctx->fenceptr = fctx->last_fence;
>   
> +	hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> +	fctx->deadline_timer.function = deadline_timer;
> +
> +	kthread_init_work(&fctx->deadline_work, deadline_work);
> +
> +	fctx->next_deadline = ktime_get();
> +
>   	return fctx;
>   }
>   
> @@ -62,6 +98,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>   	spin_lock_irqsave(&fctx->spinlock, flags);
>   	if (fence_after(fence, fctx->completed_fence))
>   		fctx->completed_fence = fence;
> +	if (msm_fence_completed(fctx, fctx->next_deadline_fence))
> +		hrtimer_cancel(&fctx->deadline_timer);
>   	spin_unlock_irqrestore(&fctx->spinlock, flags);
>   }
>   
> @@ -92,10 +130,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
>   	return msm_fence_completed(f->fctx, f->base.seqno);
>   }
>   
> +static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct msm_fence *f = to_msm_fence(fence);
> +	struct msm_fence_context *fctx = f->fctx;
> +	unsigned long flags;
> +	ktime_t now;
> +
> +	spin_lock_irqsave(&fctx->spinlock, flags);
> +	now = ktime_get();
> +
> +	if (ktime_after(now, fctx->next_deadline) ||
> +			ktime_before(deadline, fctx->next_deadline)) {
> +		fctx->next_deadline = deadline;
> +		fctx->next_deadline_fence =
> +			max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
> +
> +		/*
> +		 * Set timer to trigger boost 3ms before deadline, or
> +		 * if we are already less than 3ms before the deadline
> +		 * schedule boost work immediately.
> +		 */
> +		deadline = ktime_sub(deadline, ms_to_ktime(3));
> +
> +		if (ktime_after(now, deadline)) {
> +			kthread_queue_work(fctx2gpu(fctx)->worker,
> +					&fctx->deadline_work);
> +		} else {
> +			hrtimer_start(&fctx->deadline_timer, deadline,
> +					HRTIMER_MODE_ABS);
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&fctx->spinlock, flags);
> +}
> +
>   static const struct dma_fence_ops msm_fence_ops = {
>   	.get_driver_name = msm_fence_get_driver_name,
>   	.get_timeline_name = msm_fence_get_timeline_name,
>   	.signaled = msm_fence_signaled,
> +	.set_deadline = msm_fence_set_deadline,
>   };
>   
>   struct dma_fence *
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 7f1798c54cd1..cdaebfb94f5c 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -52,6 +52,26 @@ struct msm_fence_context {
>   	volatile uint32_t *fenceptr;
>   
>   	spinlock_t spinlock;
> +
> +	/*
> +	 * TODO this doesn't really deal with multiple deadlines, like
> +	 * if userspace got multiple frames ahead.. OTOH atomic updates
> +	 * don't queue, so maybe that is ok
> +	 */
> +
> +	/** next_deadline: Time of next deadline */
> +	ktime_t next_deadline;
> +
> +	/**
> +	 * next_deadline_fence:
> +	 *
> +	 * Fence value for next pending deadline.  The deadline timer is
> +	 * canceled when this fence is signaled.
> +	 */
> +	uint32_t next_deadline_fence;
> +
> +	struct hrtimer deadline_timer;
> +	struct kthread_work deadline_work;
>   };
>   
>   struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,

-- 
With best wishes
Dmitry

