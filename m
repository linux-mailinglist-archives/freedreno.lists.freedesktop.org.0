Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9FB975CC
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 21:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABA710E05A;
	Tue, 23 Sep 2025 19:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s28hwR+u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F7510E05A
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 19:35:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-631845b51e2so4349032a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758656136; x=1759260936; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
 b=s28hwR+umgUiSCuflwtPbUwxBVYdhEbcjoem6EWF9T9HX1T5T5KLISxflpl0HeOIT0
 p9oN0dqq52sCJPBaFerqa8HTZhicdaQb+coILTRwW9rSZ5UxrHWG4SPthSQ4O/HVAvJu
 ff+gErKsXb9dWN5bSp9i9nDne8D19S/gyg6SoWL7uP+OtcRkbulpZWXGopotXKhPPkTD
 ZIM+aHSoQ8GSW4Zw4NE4B8cLpCqbprH/cvMalJDHR3vCn5PYH3o1AhRpSVc/53ixlE3H
 lB2WWOGeFJJBQN1RORJck9CAFbIxhDt01lk9qntXtgQEV2sTgVyjkC8VGU3fSRaw/DU9
 wqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758656136; x=1759260936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
 b=EYJ90rZsRiA6hFViUQVTaxC/Dq62sgTBhhLd3koR0fsS5wXxPpsz9SDx3Tw6wMFbRv
 drT7bMyYLTfd2QttJl2+Sy/b75+G8kKVPgAJFmN7+gAIU4j0eneRwrs0zvOzkODaWJ7P
 DM7o44akDSAkr9ElHTul+VN8orT0bRHLKj8hOG28VFF7kMR5JDAnUxtaknKdzCvvsqMJ
 EibLkn77iOnalZ2Tj+e5GzdW8qcgZ8ZQVxVq03AGhWcJOlbfpuNN56zlrZT8NvCcGypB
 4iOpUIgTJncdYBaOsZS8td2+6xrBFlfAt4c7cM4DAJxfk4iimWig4eV3JUqikjepCLKW
 fkLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBycDojl0Fz5hDH349BCZoF3KJS496+6RZP/epTfOk9lc69pjIRK7aXVfjahVY74FdArQpsZhmsoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5syb1Io8BEb1TcegxwZZgjgax+6aQdW8/kSoJsdZNoKhECV4z
 iEtiMpWYliPxH0x8JIh4rxdtpdLuOss8EL9CDxLcKfn+b9kXgpA1RiE5mhLUpW84a2s=
X-Gm-Gg: ASbGncvHUqumAlEKHH7uLvSmg1mlL2VIZHR/E70qL9ioQ8CYHFORVpzOT9RcR6t5FCs
 ULH+Vqzs3XgwBdvzzAdhLWxNTxigewxiLwOpouJMaMzisahumFk8I9ShgErvJC52d5aPFO7mqUS
 DqXDItK9YgHbLMH1JCgUJV+igpusnP9sIYp0WPuMTu5lbTYOJVOS4g6p/UeHBoABm3oPGnPf202
 A2Rg9fy2y7zul8dzlfYHiRzmShd6DBm7mV6ESWAylmjVbaR5hqxO6McIT5u9Xzjmus4WiOknP3h
 KhnB5PTXUMLDSWWbvSxZxYtN5f6IbwFFZ0u11iKgWs93bbBDzhkzHNIWL55LHwcNBQssPP9/IvM
 T0Y6ga1Ym18BvQfdp8iyeTj8y3PM3voV8
X-Google-Smtp-Source: AGHT+IGlCvK6yuqIUQUFOgGwHK0uqqneA6mTN1hmeGJkoLmdyjKHvGizIk+emNFkQbBfTqMzUbXl5A==
X-Received: by 2002:a17:907:d25:b0:b0e:8cd4:e2d3 with SMTP id
 a640c23a62f3a-b302705ebc2mr337045066b.19.1758656136185; 
 Tue, 23 Sep 2025 12:35:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:bd4e:c20d:5910:982f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b27217f616esm995766666b.72.2025.09.23.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 12:35:35 -0700 (PDT)
Date: Tue, 23 Sep 2025 21:35:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
Message-ID: <aNL2g40S03YUs9wR@linaro.org>
References: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
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

On Tue, Sep 23, 2025 at 07:04:40AM -0700, Rob Clark wrote:
> Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
> 
> Fixes this splat that was reported with IRIS video playback:
> 
>     ------------[ cut here ]------------
>     WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
>     CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
>     pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>     pc : msm_gem_free_object+0x1f8/0x264 [msm]
>     lr : msm_gem_free_object+0x138/0x264 [msm]
>     sp : ffff800092a1bb30
>     x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>     x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>     x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>     x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>     x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>     x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>     x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>     x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>     x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>     x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>     Call trace:
>      msm_gem_free_object+0x1f8/0x264 [msm] (P)
>      drm_gem_object_free+0x1c/0x30 [drm]
>      drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>      drm_gem_object_release_handle+0x5c/0xcc [drm]
>      drm_gem_handle_delete+0x68/0xbc [drm]
>      drm_gem_close_ioctl+0x34/0x40 [drm]
>      drm_ioctl_kernel+0xc0/0x130 [drm]
>      drm_ioctl+0x360/0x4e0 [drm]
>      __arm64_sys_ioctl+0xac/0x104
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x34/0xec
>      el0t_64_sync_handler+0xa0/0xe4
>      el0t_64_sync+0x198/0x19c
>     ---[ end trace 0000000000000000 ]---
>     ------------[ cut here ]------------
> 
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Perhaps also add

Closes: https://lore.kernel.org/r/aNF6N8u1VIFSTaRM@linaro.org/

when applying.

Thanks!
Stephan

> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> -	if (obj->resv != &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
>  		struct drm_gem_object *r_obj =
>  			container_of(obj->resv, struct drm_gem_object, _resv);
>  
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}
> -- 
> 2.51.0
> 
