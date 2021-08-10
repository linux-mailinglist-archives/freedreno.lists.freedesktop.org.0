Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90A3E57BE
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 11:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763789F5F;
	Tue, 10 Aug 2021 09:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DE789F5F
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 09:59:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso1499018wms.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MefEA4Nq7J6T2dI7JAfQRLzqq6xMi9Np2QTxe9FH/ao=;
 b=Ub3q5SAO7Kv1nHiTJ/N4yNZrN/khgI4qtvA5nxt+dxgcebDl0lDwBFwTvTxyrp17Vm
 wWikexHre+7ie2TJbQLseE0ju6eQjxzjjFRbnISwdtMOUvECJ5HKj8bl5EeAtEYl5bjH
 wJpMPRBavTTOgmIt46gi22Ae41uf/IhJSHAKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MefEA4Nq7J6T2dI7JAfQRLzqq6xMi9Np2QTxe9FH/ao=;
 b=VHh6c+eHM/K2becbkzUA1bkEPi4bhTYRJ3RyjZ2k0oPf35Lj8QToJ+44WPKlpvUk9d
 0Q7chlOv4Q7ZYRYVl004mp8oPrWDGRhmaca4nVr8Hmk+WE7mcfaMXEqDT/S/wWN+QKHC
 faW1/Zbodgwc3aiieyU4aCIBHGkXnTLlWQy5ShwXFUOAmGkQ230RaiGArc+5bVKXbqMp
 mBq/F2K4iUopbpHFdUK8YWH56u22VOrjM7h0hLs+8nevBCHOKxcxHARaHDpj0gLXo+b6
 y29pceftBnB2U6mFcHgsVCJZ1nWwKu6pFWpCjZ7WZdmfQbwF018tDAjcW+XUplPI7zHj
 UdCg==
X-Gm-Message-State: AOAM532nCMrWlFjVcCxkmQbWgfEXkzTWqTYYRTwJZmzOM8Qv7c0qRVxE
 yTHny8OeTY4vQ3V1qLyT5xObzA==
X-Google-Smtp-Source: ABdhPJw0ncsCg1y+/DhOKn41spVPSe5l76r1tANrr6Xrdr7e6umhw8yDt/g593RlUe8DkFZlTNJkdg==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr3682474wmd.141.1628589582148; 
 Tue, 10 Aug 2021 02:59:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e6sm20450115wme.6.2021.08.10.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:59:41 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:59:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: zhaoxiao <zhaoxiao@uniontech.com>
Cc: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <YRJOCzKVJOfCS4Ro@phenom.ffwll.local>
Mail-Followup-To: zhaoxiao <zhaoxiao@uniontech.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210806023047.24386-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806023047.24386-1-zhaoxiao@uniontech.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Freedreno] [PATCH v2] drm/drv: Remove initialization of static
 variables
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

On Fri, Aug 06, 2021 at 10:30:47AM +0800, zhaoxiao wrote:
> Address the following checkpatch errors:
> ERROR: do not initialise statics to false
> 
> FILE: :drivers/gpu/drm/msm/msm_drv.c:21:
> -static bool reglog = false;
> 
> FILE: :drivers/gpu/drm/msm/msm_drv.c:31:
> -bool dumpstate = false;
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Subject should start out with drm/msm, not drm/drv - that would indicate a
patch touching the drm_drv.c core files, or things related to that.
-Daniel

> ---
> v2: change the patch description 
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b8fa2ad0d84..d9ca4bc9620b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>  };
>  
>  #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
> -static bool reglog = false;
> +static bool reglog;
>  MODULE_PARM_DESC(reglog, "Enable register read/write logging");
>  module_param(reglog, bool, 0600);
>  #else
> @@ -76,7 +76,7 @@ static char *vram = "16m";
>  MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
>  module_param(vram, charp, 0);
>  
> -bool dumpstate = false;
> +bool dumpstate;
>  MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
>  module_param(dumpstate, bool, 0600);
>  
> -- 
> 2.20.1
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
