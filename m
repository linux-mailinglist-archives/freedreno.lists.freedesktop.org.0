Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7D54D096
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 20:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7837510EEF4;
	Wed, 15 Jun 2022 18:03:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1267E10EFBF
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 18:03:07 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-fe4ac3b87fso17526213fac.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 11:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t06Whp8J1p63OOXUI0W1zpEYnP4NO86mmZ4mk1dCZBM=;
 b=YvcDqM7MBtAzPErRZDMbs6OrvTj+QYa+beHr6a1/MPFMs36i4IHHwhi/HrIonOHZ5B
 hAUWJL3EbN6PE/e8P4Z81X6QJIsNKjUjHq19oEJRFL71hOOBmhYR+56JNNHhAWSN505e
 Nz/TMvVRs9UNYU48UyVN9DOAZQ90/tRCME+jo9JP1s89FnySs++DfspxfIqCKmzeGvQ+
 c3/JaoohIEjh16DUNRuaWmdkgUVAZYJ+3hmyBoaLBWEni6QCiIzg8W7Ps3Moz17GYXDX
 hORteutp7s4Wt1czjZDn+3iZMk9sBrTpR6ZxA5go2qgomPRSoP5I2UfKO3mLRTKU1mBQ
 UUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t06Whp8J1p63OOXUI0W1zpEYnP4NO86mmZ4mk1dCZBM=;
 b=Q/zAwzoN7CvRmfXGTxjQEhgNlHONKPwIP9ZDvKZIUSCslevO2WEWAJr7Y9mlpYkElL
 WneQ01jFqG0u30dYAtwqHpgV3IIHA0CxTxGGgd6gD8fEPZIlBaBYeJpqQzksv9JbpuPS
 fKusclqd8cx1GVEr3+huvzF5aze9EhLBFgqJGcaSZvlq3jWzX5DWGaUX7Pj3WC2yWm1u
 EqPwxPAOdl15U5v/Qt9mw6Bk19BDeTlhe3Dc02NPaVH7073zxBKKQeb3EhXT21XxuIM2
 hxgjUa6PimSVunFgFkx5Yhc+VX/a+TcGOegYdJlOXHeK0naMMRuKEvZrlHFWAx5onZVz
 yKdA==
X-Gm-Message-State: AJIora/L54s/G8FkSZvs75IfCIrLTTzJ5uxsEZvfth8nF9VL5iX5NvPC
 5yhH+x8Kd/a5ATvCSw9bvtNpKw==
X-Google-Smtp-Source: AGRyM1tzJ8Etjk9NLHG0a4rnjXGH2j3pVNbLOrclTtBfeP2QVF6H/r8tCJsVdlCCmanAzxOmg7ofJw==
X-Received: by 2002:a05:6870:73cc:b0:f5:ff37:ab8e with SMTP id
 a12-20020a05687073cc00b000f5ff37ab8emr6016895oan.153.1655316186084; 
 Wed, 15 Jun 2022 11:03:06 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056830232f00b0060c030fae2asm6385436otg.54.2022.06.15.11.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 11:03:05 -0700 (PDT)
Message-ID: <0eb804a6-050e-5f69-48bb-27a8c41da108@kali.org>
Date: Wed, 15 Jun 2022 13:03:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220615150107.2969593-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220615150107.2969593-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Drop update_fences()
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 6/15/22 10:01 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> I noticed while looking at some traces, that we could miss calls to
> msm_update_fence(), as the irq could have raced with retire_submits()
> which could have already popped the last submit on a ring out of the
> queue of in-flight submits.  But walking the list of submits in the
> irq handler isn't really needed, as dma_fence_is_signaled() will dtrt.
> So lets just drop it entirely.
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 22 ++--------------------
>   1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index e59a757578df..b61078f0cd0f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -176,24 +176,6 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
>   	return ret;
>   }
>   
> -static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> -		uint32_t fence)
> -{
> -	struct msm_gem_submit *submit;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ring->submit_lock, flags);
> -	list_for_each_entry(submit, &ring->submits, node) {
> -		if (fence_after(submit->seqno, fence))
> -			break;
> -
> -		msm_update_fence(submit->ring->fctx,
> -			submit->hw_fence->seqno);
> -		dma_fence_signal(submit->hw_fence);
> -	}
> -	spin_unlock_irqrestore(&ring->submit_lock, flags);
> -}
> -
>   #ifdef CONFIG_DEV_COREDUMP
>   static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>   		size_t count, void *data, size_t datalen)
> @@ -450,7 +432,7 @@ static void recover_worker(struct kthread_work *work)
>   		if (ring == cur_ring)
>   			fence++;
>   
> -		update_fences(gpu, ring, fence);
> +		msm_update_fence(ring->fctx, fence);
>   	}
>   
>   	if (msm_gpu_active(gpu)) {
> @@ -753,7 +735,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
>   	int i;
>   
>   	for (i = 0; i < gpu->nr_rings; i++)
> -		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
> +		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
>   
>   	kthread_queue_work(gpu->worker, &gpu->retire_work);
>   	update_sw_cntrs(gpu);


Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

