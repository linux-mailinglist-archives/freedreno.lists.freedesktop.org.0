Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C355A303
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 22:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCBA10E1AC;
	Fri, 24 Jun 2022 20:49:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42610E3C2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 20:49:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id h23so6966064ejj.12
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Hm+RwF6zdRTAP4jPbUkFegWvOdyeCN+KoGv/KdQyOQ=;
 b=IbqRHr8pQpzMu6gfF9LxN6XfTvx/Z2IK+Zbycio945d5nIgTnwXNVNK+j4lk/X495z
 yuXBe4k0pIlvnpwAIZ5aNZcZ7xdA4653i+Xo1XsGB8DAuSCJF2kDY1Lcy0UFc0OXRHOm
 xDJ129UaWAVhiGChIz6Qs3E9N4JwBx1Om0jvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4Hm+RwF6zdRTAP4jPbUkFegWvOdyeCN+KoGv/KdQyOQ=;
 b=I6nHyXpQlMggUuYtkwXhNfGWykyllFYSJoVgp4XUMhN1R2bUeT+PHFuK31f0DAFWEP
 ZjoysW6DUah1OND2Xs4absYOKXeyKwg5EMk8Z6IDchQhyTPehJnO4kCmfo66vnpd1yqY
 Zkbft8H2YD7NuEThwmrcquEwfm4No1DbMvPazpZ/o1cyjjgAW/r8UzpI8ofOrp0xjtiW
 thC+OAtSI3/nUIVwmmOOHtAB6InsRx4phUeHbUYZJk1rOAXUVeNj8/0y/JJqZTcpj9uQ
 JtOc0Oiv3fkrDxtIKNLs8c9wx04puJgC7lv8kr2k+OxCAj3ZfNxq+WXHvg6Q0elSSmVD
 aa+g==
X-Gm-Message-State: AJIora/237MojALAx3ygJ7Iw7TJ537A94c3QwcI6TJstTqsRd+kcer+m
 s3BeP5CHkCSB+H55WJTWkLykQA==
X-Google-Smtp-Source: AGRyM1tUC838ztsYx8GI1aLILWxJgp48uXukKVyAcZfd/hrTaM4Z8OcVOEnxZ/ckpyMWLdikl4heVA==
X-Received: by 2002:a17:906:9b92:b0:722:f705:759d with SMTP id
 dd18-20020a1709069b9200b00722f705759dmr839195ejc.745.1656103741909; 
 Fri, 24 Jun 2022 13:49:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa7d682000000b0042dddaa8af3sm2726082edr.37.2022.06.24.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 13:49:01 -0700 (PDT)
Date: Fri, 24 Jun 2022 22:48:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YrYjO1oSUqL8f4xV@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chris Healy <cphealy@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20220609174213.2265938-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609174213.2265938-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Freedreno] [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, Chris Healy <cphealy@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 10:42:11AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> provide additional file ops, like show_fdinfo().
> 
> v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
>     varardic
> v3: nits
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

We're at three drivers, maybe it'd be better if this is more standardized?
I feel like we're opening a bit a can of worms here where everyone just
has some good odl fashioned fun. It's at least much better documented than
the old property proliferation :-)
-Daniel

> ---
>  include/drm/drm_gem.h | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a122dc..87cffc9efa85 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -314,6 +314,23 @@ struct drm_gem_object {
>  	const struct drm_gem_object_funcs *funcs;
>  };
>  
> +/**
> + * DRM_GEM_FOPS - Default drm GEM file operations
> + *
> + * This macro provides a shorthand for setting the GEM file ops in the
> + * &file_operations structure.  If all you need are the default ops, use
> + * DEFINE_DRM_GEM_FOPS instead.
> + */
> +#define DRM_GEM_FOPS \
> +	.open		= drm_open,\
> +	.release	= drm_release,\
> +	.unlocked_ioctl	= drm_ioctl,\
> +	.compat_ioctl	= drm_compat_ioctl,\
> +	.poll		= drm_poll,\
> +	.read		= drm_read,\
> +	.llseek		= noop_llseek,\
> +	.mmap		= drm_gem_mmap
> +
>  /**
>   * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
>   * @name: name for the generated structure
> @@ -330,14 +347,7 @@ struct drm_gem_object {
>  #define DEFINE_DRM_GEM_FOPS(name) \
>  	static const struct file_operations name = {\
>  		.owner		= THIS_MODULE,\
> -		.open		= drm_open,\
> -		.release	= drm_release,\
> -		.unlocked_ioctl	= drm_ioctl,\
> -		.compat_ioctl	= drm_compat_ioctl,\
> -		.poll		= drm_poll,\
> -		.read		= drm_read,\
> -		.llseek		= noop_llseek,\
> -		.mmap		= drm_gem_mmap,\
> +		DRM_GEM_FOPS,\
>  	}
>  
>  void drm_gem_object_release(struct drm_gem_object *obj);
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
