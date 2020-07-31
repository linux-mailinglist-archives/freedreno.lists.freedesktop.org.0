Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EC234233
	for <lists+freedreno@lfdr.de>; Fri, 31 Jul 2020 11:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8C56EA45;
	Fri, 31 Jul 2020 09:17:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8072D6EA44
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jul 2020 09:17:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k8so8600404wma.2
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jul 2020 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zap5mCPdXGfCBoAglpFSUI584futiyKZR3trwr0wzD8=;
 b=hrXPg9RLOgJQDEhP1zScUI2NKWRyxq+SOMDtubqqTm9OhE3LSXNrEngEmNAZLOTL0H
 fBRH5ArtO84NfTCYG8xBTJddOZMVD63HOKJ+1I9ZLDreM4zYgFi9cYauzula4Crybhif
 4yKDC5LtUynoFNpru4vkUKuO2Vq2Dnh4f8Z6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zap5mCPdXGfCBoAglpFSUI584futiyKZR3trwr0wzD8=;
 b=OkymbhvpkTu5/yFPi6a6SLQ1UjoXhOblEjrbSN4c+WbXn2k8TVLEJzegiDvVSzFR8C
 Uz882PP0AmufD0uJY/09LPPd5F+3FVYNcC122JpCr/wsBP9Ej8x9K4rNaL31ofm2x8Vr
 XG5WSzh+gs3u5FMqtbwtMenZ1JLZudCUtAqsLkP6V7faNqhQ1GWiTS26gykWFo/faMi2
 osMDI32dD5dAoO+qg6U8vTINrFYDm+38nKoPyXjSwXKixdB5nowReziwQlok4ta62DUf
 lWA2kjWfaDWklyN8zjOpDFEKts5yH3B7JmhZ16tF+Yea0DWd5mhX8ZIr9zlRpIm/ykEh
 3PtQ==
X-Gm-Message-State: AOAM530th3IKdhn4w4IYP+r4js+TeEs4qJWCSeLcaMvYIetUQFJKy0/C
 e15i8GWTAwCkkoYMBGKCYX2yLQ==
X-Google-Smtp-Source: ABdhPJzcg+Saw+jf9MpEs60W0A+5dDIrQXLHf8yAkzEyQPQJ2WoiIqn+/xFeKy/ou89Ul0fBMASB5w==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr3024941wmd.10.1596187071227; 
 Fri, 31 Jul 2020 02:17:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w14sm12443489wrt.55.2020.07.31.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:17:50 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:17:48 +0200
From: daniel@ffwll.ch
To: 
Message-ID: <20200731091748.GU6419@phenom.ffwll.local>
References: <1596000952-27621-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596000952-27621-1-git-send-email-cohens@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [PATCH] drm: re-add deleted doc for
 drm_gem_open_ioctl
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
Cc: adelva@google.com, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, daniel@ffwll.ch, gregkh@linuxfoundation.org,
 jsanka@codeaurora.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 01:35:52AM -0400, Steve Cohen wrote:
> Add back the removed documentation for drm_gem_open_ioctl.
> This patch is submitted in response to [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20200728085244.GY6419@phenom.ffwll.local/
> 
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee2058a..fe94122 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -871,6 +871,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   * @file_priv: drm file-private structure
>   *
>   * Open an object using the global name, returning a handle and the size.
> + *
> + * This handle (of course) holds a reference to the object, so the object
> + * will not go away until the handle is deleted.

Applied, thanks.
-Daniel

>   */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
