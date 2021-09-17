Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C140FCF4
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 17:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD226EE3D;
	Fri, 17 Sep 2021 15:42:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B076EE3C
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 15:42:11 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id a66so18728510qkc.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QZO8NMAjMQkXQJzuQx47mPXuOG2i+pU24PwiydWpDeM=;
 b=QSUPKbjlIZXzcgl73QzCldp54G6vcvodAvbVZuE3jtlcyyYXYA1Nti1qUlSPg4uUiB
 0I/Iq6SJFmn1IttowvF/JMR79YSGKAeBrdjW+CCxmrvXfIWEgMwxsqvKB1QK9GIqGyAV
 SMJdcHsj5HUav2SDLNCQR71lQwEdIjxJRmaLPa/oBq9kV/9cq2ycR60owTGUyRXWD8tR
 5Hnc0X90MeyQI3BmpnJ4dje2o+63d3K8WVZKD+j9pbfPZq/5+ejWGTnPp/Btb9SukgLZ
 G+5y9BLcPfSxlDAhiL7q3cjZrBKUErLPUu4Rehtr5GHRXT7jxlCqIzodKSNW/8NAP6zY
 K34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QZO8NMAjMQkXQJzuQx47mPXuOG2i+pU24PwiydWpDeM=;
 b=o9o56jYwim89Qtft3kWG+RoL/ULHz1bprPcX79ciqpP+1oSt0AsS+JnlGuLOr0oK67
 lHAZWQ2oAJ1AHERYEIHAe6qQmb2PW2PPsaj51GTKpt+3WLq60F2rsWGZXiLzSgHwox4J
 X9MDhCNfwJFidtxiHOCWAdTakpeMaf0BrI6vXUpjS41oS8P18rDJajC31rCX/E/nk5Us
 WJzrYkv0F0cDUEkSczaC0PwvhIMF8DxF1JNqS20jMcxBW44BBipM02zmx6eO3l9149K3
 1qQ45uL3iIl4hbIPiCeBYQgy9k447rTXCwqA5WTPtTNhBC+p4i9WEJtJREEIWU6TyU0O
 nFwg==
X-Gm-Message-State: AOAM531KiLiMB5BVMl99O9i0HeVR9QP0htckJQkNafqmzkpbxPT4k2sB
 MjT9REL6Ea8atRSznlNRGnfIHw==
X-Google-Smtp-Source: ABdhPJwVL52VyuqCVGcaprqDlGNhVkaTAyCEiksVmivD0l81s38J2EgeSKuszuc5vwmoVtFSDEVnAQ==
X-Received: by 2002:a05:620a:2185:: with SMTP id
 g5mr11148090qka.244.1631893330985; 
 Fri, 17 Sep 2021 08:42:10 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p10sm916118qkk.10.2021.09.17.08.42.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:42:10 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:42:09 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <20210917154209.GK2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-11-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-11-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Freedreno] [PATCH 10/15] drm/nouveau: cleanup:
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

On Thu, Sep 16, 2021 at 11:15:47PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d7b9f7f8c9e3..eb613af4cdd5 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -667,15 +667,17 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
>  	struct drm_device *drm_dev = dev_get_drvdata(kdev);
>  	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>  	struct drm_audio_component *acomp = data;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
>  	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
>  		return -ENOMEM;
>  
> -	drm_modeset_lock_all(drm_dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
>  	acomp->ops = &nv50_audio_component_ops;
>  	acomp->dev = kdev;
>  	drm->audio.component = acomp;
> -	drm_modeset_unlock_all(drm_dev);
> +	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
>  	return 0;

Return ret here, with that fixed,

Reviewed-by: Sean Paul <sean@poorly.run>


>  }
>  
> @@ -686,12 +688,14 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
>  	struct drm_device *drm_dev = dev_get_drvdata(kdev);
>  	struct nouveau_drm *drm = nouveau_drm(drm_dev);
>  	struct drm_audio_component *acomp = data;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(drm_dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
>  	drm->audio.component = NULL;
>  	acomp->ops = NULL;
>  	acomp->dev = NULL;
> -	drm_modeset_unlock_all(drm_dev);
> +	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
>  }
>  
>  static const struct component_ops nv50_audio_component_bind_ops = {
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
