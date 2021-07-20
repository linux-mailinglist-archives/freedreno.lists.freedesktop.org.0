Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A473CFB94
	for <lists+freedreno@lfdr.de>; Tue, 20 Jul 2021 16:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1951894A7;
	Tue, 20 Jul 2021 14:08:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF66E3EF
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jul 2021 14:08:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id w13so12358102wmc.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jul 2021 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vdj/876kbj9otjV0SXLMGMJadLoRz/MWE+rabeKCiRs=;
 b=ez54kYqit1kD8uQyQxcQe8M9Z5tOkNmZnsUiOZGUePvnwGXLbG946Dkr03BbDFCQpf
 s8/LFEKMgoxoja8qKu2j/lNl53l/KhEzxNacpIh4zg1yF6wm3BbMo2EjzOu7JKkpGMPn
 Ye0fDTd99UcNVzQ9C+eWxJhBhNj1sn4lZIbr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vdj/876kbj9otjV0SXLMGMJadLoRz/MWE+rabeKCiRs=;
 b=oQJUlsGnwK8KspxxsxR+TcWwes4pXNtFUw1C9sNDxXyjERdtfROb3m5uwlJ08dccwO
 gw6Zp5N40NkEthRgldTLzzMyAhAYiwQ7fSCFKD1YoySH2cRsGMqpLc7Nla/vK9V6qOnt
 joQvRX0iW/1s5D0mZ3G44nh4Pkxlgu0mG316Ffq3uC1ItMydzeT+O1Ot6lcHiGaP1wxc
 jbM08DVlTxJQjI37plt1fY6VC9Cbk4MsZ1JAI2B6/csDFDyt64G9D3lA99OIPxKa+Ze1
 yelSxdJKr0J77zsdW2Ko0ba7wUg59YjxKEmcmGuIkwidyXXPaKBGyKqCmcHHO2OIRpA8
 95sA==
X-Gm-Message-State: AOAM530wB3M79X6dFejANbPx0rKj8ikS7AEkTAlp2kNiPgPOFeCyKhpR
 S3GxZFiyKPgKYMqjot37B0HdbQ==
X-Google-Smtp-Source: ABdhPJxMU++IY5nRb5dHWOBB6cPsmCpD91+OygobkfIENh5fKb+3nWKdQaWO6CUlP10eV7boXeOv2Q==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr31996863wmq.0.1626790115511; 
 Tue, 20 Jul 2021 07:08:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a207sm3004661wme.27.2021.07.20.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:08:35 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:08:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YPbY4RG2VV+5Cd65@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <20210717202924.987514-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210717202924.987514-5-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Freedreno] [PATCH 04/11] drm: Drop drm_gem_object_put_locked()
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 01:29:06PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that no one is using it, remove it.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Yay!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem.c | 22 ----------------------
>  include/drm/drm_gem.h     |  2 --
>  2 files changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..c8866788b761 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -974,28 +974,6 @@ drm_gem_object_free(struct kref *kref)
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
> -/**
> - * drm_gem_object_put_locked - release a GEM buffer object reference
> - * @obj: GEM buffer object
> - *
> - * This releases a reference to @obj. Callers must hold the
> - * &drm_device.struct_mutex lock when calling this function, even when the
> - * driver doesn't use &drm_device.struct_mutex for anything.
> - *
> - * For drivers not encumbered with legacy locking use
> - * drm_gem_object_put() instead.
> - */
> -void
> -drm_gem_object_put_locked(struct drm_gem_object *obj)
> -{
> -	if (obj) {
> -		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> -
> -		kref_put(&obj->refcount, drm_gem_object_free);
> -	}
> -}
> -EXPORT_SYMBOL(drm_gem_object_put_locked);
> -
>  /**
>   * drm_gem_vm_open - vma->ops->open implementation for GEM
>   * @vma: VM area structure
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 240049566592..35e7f44c2a75 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -384,8 +384,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
>  		__drm_gem_object_put(obj);
>  }
>  
> -void drm_gem_object_put_locked(struct drm_gem_object *obj);
> -
>  int drm_gem_handle_create(struct drm_file *file_priv,
>  			  struct drm_gem_object *obj,
>  			  u32 *handlep);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
