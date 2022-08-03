Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F55892EA
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 21:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1409B2AE1A;
	Wed,  3 Aug 2022 19:52:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E818B0C3;
 Wed,  3 Aug 2022 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659556367; x=1691092367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kPJ0bv7qD5e3QqW3xXd4I/PtJrU1pHCZsHBtKoPlWvs=;
 b=w3pc2rfvb1U6bobg8rFrrAPY4wJEbLC0s0JSfPAwVNy9bOBPmDd+66A+
 P+86XXTWQDSqkzcjVtorypWhjFPxW9BZ84OAY8mPsoxBTOOMLeOTl62Xn
 Tic/LGwmO3RUOHcI9EV4472sMfnBRxJaJxJx6FbYiz7EXEqyeW8kcpWdV 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 12:52:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 12:52:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 12:52:30 -0700
Received: from [10.216.4.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 12:52:26 -0700
Message-ID: <c80d70b6-a7ad-5900-ea7a-f0f2157e4a40@quicinc.com>
Date: Thu, 4 Aug 2022 01:22:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220803172302.1976981-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220803172302.1976981-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Move hangcheck timer restart
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

On 8/3/2022 10:53 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Don't directly restart the hangcheck timer from the timer handler, but
> instead start it after the recover_worker replays remaining jobs.
> 
> If the kthread is blocked for other reasons, there is no point to
> immediately restart the timer.  Fixes a random symptom of the problem
> fixed in the next patch.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index fba85f894314..8f9c48eabf7d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -328,6 +328,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
>   }
>   
>   static void retire_submits(struct msm_gpu *gpu);
> +static void hangcheck_timer_reset(struct msm_gpu *gpu);
>   
>   static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
>   {
> @@ -420,6 +421,8 @@ static void recover_worker(struct kthread_work *work)
>   	}
>   
>   	if (msm_gpu_active(gpu)) {
> +		bool restart_hangcheck = false;
> +
>   		/* retire completed submits, plus the one that hung: */
>   		retire_submits(gpu);
>   
> @@ -436,10 +439,15 @@ static void recover_worker(struct kthread_work *work)
>   			unsigned long flags;
>   
>   			spin_lock_irqsave(&ring->submit_lock, flags);
> -			list_for_each_entry(submit, &ring->submits, node)
> +			list_for_each_entry(submit, &ring->submits, node) {
>   				gpu->funcs->submit(gpu, submit);
> +				restart_hangcheck = true;
> +			}
>   			spin_unlock_irqrestore(&ring->submit_lock, flags);
>   		}
> +
> +		if (restart_hangcheck)
> +			hangcheck_timer_reset(gpu);
>   	}
>   
>   	mutex_unlock(&gpu->lock);
> @@ -515,10 +523,6 @@ static void hangcheck_handler(struct timer_list *t)
>   		kthread_queue_work(gpu->worker, &gpu->recover_work);
>   	}
>   
> -	/* if still more pending work, reset the hangcheck timer: */
In the scenario mentioned here, shouldn't we restart the timer?

-Akhil.
> -	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
> -		hangcheck_timer_reset(gpu);
> -
>   	/* workaround for missing irq: */
>   	msm_gpu_retire(gpu);
>   }
> 

