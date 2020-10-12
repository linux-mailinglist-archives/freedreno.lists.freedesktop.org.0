Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2B28BAF9
	for <lists+freedreno@lfdr.de>; Mon, 12 Oct 2020 16:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD866E497;
	Mon, 12 Oct 2020 14:40:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0876E0AF
 for <freedreno@lists.freedesktop.org>; Mon, 12 Oct 2020 14:40:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f21so17356129wml.3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Oct 2020 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sgxu8pwzEMgUUbjWBDrQW3ILYSpl7WdZp96R0DhO5Mc=;
 b=XI3dCFkFiN+2pFpXGzPmSIRwuJuDv/y/2G9Cj9dJ5EghRoEEVwApSzVYeCtJxffgn5
 skL+vGIevqPHDkBJSkAmpM2A1fHP5B8RcTb8FrQ1CweEk8h/tiOQmT7bbDlKQbpo7hXP
 ndmRWBk0diEt7ZiV4Hc+RQVD5RBiDSm7v5vA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Sgxu8pwzEMgUUbjWBDrQW3ILYSpl7WdZp96R0DhO5Mc=;
 b=AdrAzaucpxPx8mUp5vIkABbvipc9f8BdVEq8CrLFgnUeChaVVH+YPgCarWuAtcajed
 VmgmDD1nGF/75j21K4KPw5JhmTQbyDQo5/mbbu3Xx9c3tvKv+8xAX5Uj7I7VVBdNjVw6
 5vTP7X9HhH14DVHhNMc4OooZWK+Yct92XZaKWvDTUmfgYc9tSkKH8asiCzkL/hEnZrAx
 T0Si8vneH15e7XfpDFWsI33rFx6lVSlVcW3IKOVVfcq61dvoPiYPYUE3BsU0Upz7o9Dq
 uYR7I9pnD0af4UJf0jurheVqvjXtR+yVWFrQYMmht3cwt4q5PmseZrSncrJKbiJrD5VZ
 r0JQ==
X-Gm-Message-State: AOAM532tF1fDQ+lGa4HiNNU1WEM3e8f4BBSNRLhVLp/jLYKYveBSpxfS
 yN8u95QhQKykmTNB1Q9Z8/moKw==
X-Google-Smtp-Source: ABdhPJxtuGldLayKaoOLNdhPXiIp8BIJ4bsOKgdiv6Dh9nEH8u2gHnOAjBdyITgyL7C1levJe7WYXg==
X-Received: by 2002:a1c:8056:: with SMTP id b83mr11077306wmd.124.1602513620761; 
 Mon, 12 Oct 2020 07:40:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v4sm23467980wmg.35.2020.10.12.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:40:20 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:40:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201012144018.GB438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012020958.229288-23-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [PATCH v2 22/22] drm/msm: Don't implicit-sync if
 only a single ring
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

On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Any cross-device sync use-cases *must* use explicit sync.  And if there
> is only a single ring (no-preemption), everything is FIFO order and
> there is no need to implicit-sync.
> 
> Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> is undefined when fences are not used to synchronize buffer usage across
> contexts (which is the only case where multiple different priority rings
> could come into play).

Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
confused by your commit message?

Since for these protocols we do expect implicit sync accross processes to
work. Even across devices (and nvidia have actually provided quite a bunch
of patches to make this work in i915 - ttm based drivers get this right,
plus dumb scanout drivers using the right helpers also get this all
right).
-Daniel

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3151a0ca8904..c69803ea53c8 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  	return ret;
>  }
>  
> -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
>  {
>  	int i, ret = 0;
>  
> @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  				return ret;
>  		}
>  
> -		if (no_implicit)
> +		if (!implicit_sync)
>  			continue;
>  
>  		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> +	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> +			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
>  	if (ret)
>  		goto out;
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
