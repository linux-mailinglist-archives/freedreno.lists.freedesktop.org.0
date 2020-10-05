Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AF283707
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 15:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4E0899D5;
	Mon,  5 Oct 2020 13:56:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A02F899D5
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 13:56:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e17so989021wru.12
 for <freedreno@lists.freedesktop.org>; Mon, 05 Oct 2020 06:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dg9PMrWuju7CtSiTsFc5fMoRQvaza8NEwASqcsZO++M=;
 b=ly235/F88b9oFpiEVFMmSUjOC8USMQzMETnsmzx76Lvm8v00ci586LoMHUb+nsH97E
 XFjKbLAbmz69pMf/mIhZb09OGmZRSkIgnHlmbtffx4wGcbRHihc5mIz0aNxtcFGPPvkl
 Jndgm5PXC7Ua44LHVYAGe3JhL6wccQYFwljhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Dg9PMrWuju7CtSiTsFc5fMoRQvaza8NEwASqcsZO++M=;
 b=F3Bkyrcdow1r9VVGf8SpdPsnGFkFMsBAbrQtcuzGvkLWOMXUB43SWNwsd15e3WT4TL
 2UklzAjt7KuYpe4Wd1KH7t7d/kCegLhi+0zr7LWcMow1euBJGH/JM6x1K7NJ9rQjbI9f
 6S5HYQbdrgBhVZ35/buvsdJ4NnWm8YyUzidWn6TwaCo2VKAVWYID7jFn6pcFmcEK1Yft
 n8pSt2j42hsGINYhRKLiZdtR1/YQRCD7R09Gru0huMYq0S3BNvv1HdW7rRvvsQQ8R+xi
 SYGuRywTiLYoVPFCHMViaNSzWiRSO2FGY63/VD7cmXEZJKYdJo0SiOmvvc5kdlaYkrqT
 x7bA==
X-Gm-Message-State: AOAM533UpbFxjeosBRkBfpf/ZxBU0fBWLlc64xww/TQPZ3M3QgHlVnT4
 rt/9iZIJjKkMKeYeOEIrYZmLhw==
X-Google-Smtp-Source: ABdhPJwBjaQ/CDTdmzx2apJHF7WUmsHUVX+VJjGiGvqwPns7tfENfSADqpvErsjRzw1fJJVl2N6g3w==
X-Received: by 2002:a5d:554c:: with SMTP id g12mr17893218wrw.294.1601906165661; 
 Mon, 05 Oct 2020 06:56:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 1sm31585wre.61.2020.10.05.06.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:56:04 -0700 (PDT)
Date: Mon, 5 Oct 2020 15:56:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201005135602.GR438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-8-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [PATCH 07/14] drm/msm: Refcount submits
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 12:21:39PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Before we remove dev->struct_mutex from the retire path, we have to deal
> with the situation of a submit retiring before the submit ioctl returns.
> 
> To deal with this, ring->submits will hold a reference to the submit,
> which is dropped when the submit is retired.  And the submit ioctl path
> holds it's own ref, which it drops when it is done with the submit.
> 
> Also, add to submit list *after* getting/pinning bo's, to prevent badness
> in case the completed fence is corrupted, and retire_worker mistakenly
> believes the submit is done too early.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Why not embed the dma_fence instead of pointer and use that refcount? i915
does that, and imo kinda makes sense instead of more refcounted things.
But might not make sense for msm.
-Daniel

> ---
>  drivers/gpu/drm/msm/msm_drv.h        |  1 -
>  drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
>  drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
>  4 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 50978e5db376..535f9e718e2d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
>  
>  bool msm_use_mmu(struct drm_device *dev);
>  
> -void msm_gem_submit_free(struct msm_gem_submit *submit);
>  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		struct drm_file *file);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index a1bf741b9b89..e05b1530aca6 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
>   * lasts for the duration of the submit-ioctl.
>   */
>  struct msm_gem_submit {
> +	struct kref ref;
>  	struct drm_device *dev;
>  	struct msm_gpu *gpu;
>  	struct msm_gem_address_space *aspace;
> @@ -169,6 +170,18 @@ struct msm_gem_submit {
>  	} bos[];
>  };
>  
> +void __msm_gem_submit_destroy(struct kref *kref);
> +
> +static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
> +{
> +	kref_get(&submit->ref);
> +}
> +
> +static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
> +{
> +	kref_put(&submit->ref, __msm_gem_submit_destroy);
> +}
> +
>  /* helper to determine of a buffer in submit should be dumped, used for both
>   * devcoredump and debugfs cmdstream dumping:
>   */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index e1d1f005b3d4..7d653bdc92dc 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	if (!submit)
>  		return NULL;
>  
> +	kref_init(&submit->ref);
>  	submit->dev = dev;
>  	submit->aspace = queue->ctx->aspace;
>  	submit->gpu = gpu;
> @@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	return submit;
>  }
>  
> -void msm_gem_submit_free(struct msm_gem_submit *submit)
> +void __msm_gem_submit_destroy(struct kref *kref)
>  {
> +	struct msm_gem_submit *submit =
> +			container_of(kref, struct msm_gem_submit, ref);
> +
>  	dma_fence_put(submit->fence);
> -	spin_lock(&submit->ring->submit_lock);
> -	list_del(&submit->node);
> -	spin_unlock(&submit->ring->submit_lock);
>  	put_pid(submit->pid);
>  	msm_submitqueue_put(submit->queue);
>  
> @@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	submit_cleanup(submit);
>  	if (has_ww_ticket)
>  		ww_acquire_fini(&submit->ticket);
> -	if (ret)
> -		msm_gem_submit_free(submit);
> +	msm_gem_submit_put(submit);
>  out_unlock:
>  	if (ret && (out_fence_fd >= 0))
>  		put_unused_fd(out_fence_fd);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8d1e254f964a..fd3fc6f36ab1 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  	pm_runtime_mark_last_busy(&gpu->pdev->dev);
>  	pm_runtime_put_autosuspend(&gpu->pdev->dev);
> -	msm_gem_submit_free(submit);
> +
> +	spin_lock(&ring->submit_lock);
> +	list_del(&submit->node);
> +	spin_unlock(&ring->submit_lock);
> +
> +	msm_gem_submit_put(submit);
>  }
>  
>  static void retire_submits(struct msm_gpu *gpu)
> @@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	submit->seqno = ++ring->seqno;
>  
> -	spin_lock(&ring->submit_lock);
> -	list_add_tail(&submit->node, &ring->submits);
> -	spin_unlock(&ring->submit_lock);
> -
>  	msm_rd_dump_submit(priv->rd, submit, NULL);
>  
>  	update_sw_cntrs(gpu);
> @@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  		msm_gem_active_get(drm_obj, gpu);
>  	}
>  
> +	/*
> +	 * ring->submits holds a ref to the submit, to deal with the case
> +	 * that a submit completes before msm_ioctl_gem_submit() returns.
> +	 */
> +	msm_gem_submit_get(submit);
> +
> +	spin_lock(&ring->submit_lock);
> +	list_add_tail(&submit->node, &ring->submits);
> +	spin_unlock(&ring->submit_lock);
> +
>  	gpu->funcs->submit(gpu, submit);
>  	priv->lastctx = submit->queue->ctx;
>  
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
