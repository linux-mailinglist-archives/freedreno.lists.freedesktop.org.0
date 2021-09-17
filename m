Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA140FCE5
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 17:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A196EDDB;
	Fri, 17 Sep 2021 15:41:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6426EDC8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 15:41:39 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id p4so18728817qki.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=Rg3pQPgRu26LSb3Ym25tiFmMLVhLfw9SdEEPoUud66ykQ931PiVOz52pLoXgAwC0ox
 /mHm2+hTiXHgLGuu8t2OWBPxQeOxDuKiW2UWpQCJgV/9B2iyAFVPcdrDxhJyA8LPkxyJ
 OVEGgkK3fO0TjncIvsrXlzuOkF9DG2sCzr1V8nefKneQvr08Iin7PI1M/USyeat1+qSV
 cOlTWgRk5Y/SwKT1Vqv7vzUsbBQS0nxnQuYMU4VQRwxuRpApDeTEvusujkPUACV+t5Rr
 PqWzgleLdsIFdM+KfFpZGV0L6vGeeHDCvPQNK/XrwqX+BsWpcls4hgKiAqKiOlKNQk9K
 vi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=w6YAxf7JuHbbH0P+fu5qBq2WXwNHqa9Jd9NG8969oa+PF+4wEbNY0HUiq8et8Rx/BV
 eaDr346p6CM4T9TlA+Yl4BcVknS7KnKmaQtfp7xwYw9mYVdnL11Lxtud2hHXJ0OwAbch
 wnp6tFsqHRFY3MZYXGpgXHBDrOKpeVGOlOhmepbEwP11HD7XpBpKQILKIa7lmttghb2z
 c2BQNf+M0a4xcbJXhnRTx8dkRpg421KLjJmawcMWF1cchlrFDP3aiiSoeeylmsj+0h2u
 /d6VhNfl2UV2OE15Y3FG/vYhjxHs+DyXG1GwkAh8Yc394SVURHq3FzZO0GVmxjQbZvWG
 G17w==
X-Gm-Message-State: AOAM531eLR2g+gfOAYQOL25qZvbZvMsZNvOu11al13pxx0UdgKJG2J0y
 UeIaZO+WnvT4mOPSmOga45xofg==
X-Google-Smtp-Source: ABdhPJyjGqSsuJH7awGUj/YMxh1AbnFOYdGXvCtauKtD0RAp5YpZ9/RTGbsIl79Pjc1kmnuFaGBLDw==
X-Received: by 2002:a37:a87:: with SMTP id 129mr3162058qkk.448.1631893298377; 
 Fri, 17 Sep 2021 08:41:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 9sm4122038qtz.83.2021.09.17.08.41.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:41:37 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:41:36 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <20210917154136.GJ2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-10-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Freedreno] [PATCH 09/15] drm/omapdrm: cleanup:
 drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
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

On Thu, Sep 16, 2021 at 11:15:46PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..56013c3ef701 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
>  				  unsigned num_clips)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
>  
>  	drm_for_each_crtc(crtc, fb->dev)
>  		omap_crtc_flush(crtc);
>  
> -	drm_modeset_unlock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;

Return ret here, with that,

Reviewed-by: Sean Paul <sean@poorly.run>


>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
