Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA74DC36F
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 10:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7D310E11C;
	Thu, 17 Mar 2022 09:59:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89310E11C
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 09:59:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x15so6529228wru.13
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=zUt2tWkZnzZmR22TBfzVAfjbYftNAG6kYb5PLZxCQe0=;
 b=jgPd4/lzC2G8C7BxbIVBbZg/T/CeFLTTtdnT7GDQIMkDTo3olfLtrfpc2XKCmFMmLN
 1Ova22BUpr4EodnpmV4Us7t7xKvV6+Esqjh2hNtkN1dB9CtVfUXFClvd9PfYf7z22COq
 HvGTOMyMWbS0rIEfjLDuu2TOeyboi4LUHLuIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=zUt2tWkZnzZmR22TBfzVAfjbYftNAG6kYb5PLZxCQe0=;
 b=mytSHpmXSe6TtMwc8l13RTvScYYcLewYw1f7bfw5M+D4a9h/3xx2+W8ofsiZeo7tOi
 u97EW/FEH7QtyUEbHoXVZUCxcVMu76nlz9HHhOwcKaqgCtqxvj7WxrfnHNvmtgBfsGpA
 3la0MWrfL9iDnLqmRX077wPki+X4Z2bIh3Tryz402cYp7UX20dLRvn2hnRbquoCPoAYQ
 bWfCzIuJx6YdjLGLUrkJyK6eWv0ufX6sO5kCOVIGcTk11iBXQAptxuqfGnLj2zpgSByh
 c/fYzxJ1ukjDmmq81VNoq8qm22/OtRlxBCs5MBTYSxhyO4Zue1c44pizU8RcEaQ7ArMv
 Rp8w==
X-Gm-Message-State: AOAM533RsVFB5uE8SVcXySNTe2rvb4/cuc+SKIZ4FCnsfEWPiuoH7NoM
 E6Q+3DdXC+v8bEk+zFhbJPOfDwdI1GPEsgHR
X-Google-Smtp-Source: ABdhPJyVRbvMqP3RkZC3MlKGRoYqlAqtY6uzXCzQNDy205UCPIRTLqvSpNmTlOSJ5ttBBEhl2Snd4A==
X-Received: by 2002:a05:6000:1688:b0:203:8efe:e0b0 with SMTP id
 y8-20020a056000168800b002038efee0b0mr3108580wrd.289.1647511148160; 
 Thu, 17 Mar 2022 02:59:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm4016772wrs.73.2022.03.17.02.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:59:07 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:59:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Message-ID: <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310234611.424743-3-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/gpu: Park scheduler threads for
 system suspend
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 03:46:05PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In the system suspend path, we don't want to be racing with the
> scheduler kthreads pushing additional queued up jobs to the hw
> queue (ringbuffer).  So park them first.  While we are at it,
> move the wait for active jobs to complete into the new system-
> suspend path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 68 ++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8859834b51b8..0440a98988fc 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -619,22 +619,82 @@ static int active_submits(struct msm_gpu *gpu)
>  static int adreno_runtime_suspend(struct device *dev)
>  {
>  	struct msm_gpu *gpu = dev_to_gpu(dev);
> -	int remaining;
> +
> +	/*
> +	 * We should be holding a runpm ref, which will prevent
> +	 * runtime suspend.  In the system suspend path, we've
> +	 * already waited for active jobs to complete.
> +	 */
> +	WARN_ON_ONCE(gpu->active_submits);
> +
> +	return gpu->funcs->pm_suspend(gpu);
> +}
> +
> +static void suspend_scheduler(struct msm_gpu *gpu)
> +{
> +	int i;
> +
> +	/*
> +	 * Shut down the scheduler before we force suspend, so that
> +	 * suspend isn't racing with scheduler kthread feeding us
> +	 * more work.
> +	 *
> +	 * Note, we just want to park the thread, and let any jobs
> +	 * that are already on the hw queue complete normally, as
> +	 * opposed to the drm_sched_stop() path used for handling
> +	 * faulting/timed-out jobs.  We can't really cancel any jobs
> +	 * already on the hw queue without racing with the GPU.
> +	 */
> +	for (i = 0; i < gpu->nr_rings; i++) {
> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> +		kthread_park(sched->thread);

Shouldn't we have some proper interfaces for this? Also I'm kinda
wondering how other drivers do this, feels like we should have a standard
way.

Finally not flushing out all in-flight requests sounds a bit like a bad
idea for system suspend/resume since that's also the hibernation path, and
that would mean your shrinker/page reclaim stops working. At least in full
generality. Which ain't good for hibernation.

Adding Christian and Andrey.
-Daniel

> +	}
> +}
> +
> +static void resume_scheduler(struct msm_gpu *gpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < gpu->nr_rings; i++) {
> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> +		kthread_unpark(sched->thread);
> +	}
> +}
> +
> +static int adreno_system_suspend(struct device *dev)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	int remaining, ret;
> +
> +	suspend_scheduler(gpu);
>  
>  	remaining = wait_event_timeout(gpu->retire_event,
>  				       active_submits(gpu) == 0,
>  				       msecs_to_jiffies(1000));
>  	if (remaining == 0) {
>  		dev_err(dev, "Timeout waiting for GPU to suspend\n");
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto out;
>  	}
>  
> -	return gpu->funcs->pm_suspend(gpu);
> +	ret = pm_runtime_force_suspend(dev);
> +out:
> +	if (ret)
> +		resume_scheduler(gpu);
> +
> +	return ret;
>  }
> +
> +static int adreno_system_resume(struct device *dev)
> +{
> +	resume_scheduler(dev_to_gpu(dev));
> +	return pm_runtime_force_resume(dev);
> +}
> +
>  #endif
>  
>  static const struct dev_pm_ops adreno_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
>  	SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
>  };
>  
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
