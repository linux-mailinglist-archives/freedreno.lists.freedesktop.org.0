Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC3BAF70B
	for <lists+freedreno@lfdr.de>; Wed, 01 Oct 2025 09:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD6B10E699;
	Wed,  1 Oct 2025 07:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="uq+SudJJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B112710E692
 for <freedreno@lists.freedesktop.org>; Wed,  1 Oct 2025 07:37:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b3727611d76so1016048666b.2
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1759304269; x=1759909069; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCBC31964+c7FoQA1HUfYfeEbUaDgsaFIT9ZaWC1avo=;
 b=uq+SudJJZkQ+FyaGoewFcqJnCh4Exn2nn0JqhvuktCeECHiK2fKsj+VVxmTxDmwlfd
 DHTWbYmiKuTHvTBWJN1oH/+7Pz0ulvcvTAhEd1Ha1DZmPgTYgqPw0l44HBm5e486JkgG
 m9W2nuf7Y4QD6CI/F627yP9hUNpweXMBq8bsfjoVb+4GVQKTDt3dam/Q4corSL2Wvl3m
 jr6XtGUngcn60L0+2U1fSg0V+viOqBTeyqrXjXtCXFWe7QDO4zyOHAqdbsmGwUZFd+P4
 I8whY9MnsgP5CHNXuz1xcw4TWIJKNzX1na9TM0Rt5ZDGu4xaRTojJVhfCyW13X6LNecX
 9Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759304269; x=1759909069;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CCBC31964+c7FoQA1HUfYfeEbUaDgsaFIT9ZaWC1avo=;
 b=uw9qMQImy4hRqf0vz+qvd77+n1DzXYnIiE2XLBsYeiLB2QHI9qmCR0uFepVP9yxjMI
 SPYpn5h3xKtYUvxJzqeRxkoJqyC8ZuReZROg+mHc9Xf20DHzfO5Y5SVjf7E9tuMKMqEF
 BUeh9iKi5oyGTuE7QWIkVYFwp6QJt6RBRs6wyJKcoUXoRR8KduD9o8Y/KAgTYiZki68Q
 B9WFA6m3shTftHa3j+zHii4a7mwzqGjr+ZoSz0gDWM5M4niag5ARhFMwXF7qLHUFovT3
 fUgVDXXVGXL8VMeoKl3a/hNsgtQ2dxiUyNtktHc73+z1iRlgfUKCiFWK3Y32Bd2oMban
 7V+w==
X-Gm-Message-State: AOJu0YwBV6ArrK9zdZ+DZuwF/CaDDDnTDYsfjwHDvjS1LBYaRVdsJ+eC
 1lc/9M1CXVtTCzjuMJ4divrQ2lWVlXK78dyPF5/EMgolECD2wVNIUZLJJHGSvTO77eI=
X-Gm-Gg: ASbGncuG1LuhuxzHt4BFrMBnSfLLawLUc2O6hAs4bWE9W9u0lbVSZTYy33/oNISOtqX
 K9O10NHqfE1Bn33GMtapEkrzEWMNHh1Gbh5SKb9WqoX5NDnGGrdl9KS9Ii3H99C1hL9hWISBeX+
 82nCQN9h2QdEmzk29OfjQq1cPCW1hquEcKBwzlXkiaMejyl8CVaWhaazxN97E7J5hsROmfwKFdr
 rqMMslasDu737VfZpEvizawLPJsaIzWpvYxm9MVU2XuwGPzZ5biRdvwS0kPA3Un9iW0ggAwEhb8
 KjTFMqWjPdCgrYC6PsWZ7zT/gaxbL619PW/D8PvFyma5eK3BTeO6v2HMs6cVOGBfDT80aeNREL9
 W5JPaPXQ6it7q04kzstL251UlhLujYevsqkC9WTzBU3SAXTmXgU+yG/9Tbl0MPJg7CEtAoGX4Mz
 C16njCEwiMnGMC91YC
X-Google-Smtp-Source: AGHT+IECncxzo44p2ti1eqVfThffaFqPYdNBkWZ/Tki6amN33j9mO0FxuVRZFb9kMJ5ZWSnhCBIzXQ==
X-Received: by 2002:a17:907:3cc8:b0:b3e:c7d5:4cb5 with SMTP id
 a640c23a62f3a-b46e632f76emr337033566b.31.1759304269133; 
 Wed, 01 Oct 2025 00:37:49 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d27759835sm693220566b.13.2025.10.01.00.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 00:37:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 09:37:47 +0200
Message-Id: <DD6TBB5CSRII.3SEI8QL9N1ATT@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica
 Zhang" <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
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

On Tue Sep 23, 2025 at 4:04 PM CEST, Rob Clark wrote:
> Imported dma-bufs also have obj->resv !=3D &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
>
> Fixes this splat that was reported with IRIS video playback:
>
>     ------------[ cut here ]------------
>     WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_g=
em_free_object+0x1f8/0x264 [msm]
>     CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-r=
c7 #1 PREEMPT
>     pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
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

Also fixes log spam when opening GNOME Camera on Fairphone 5.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_ob=
ject *obj)
>  		put_pages(obj);
>  	}
> =20
> -	if (obj->resv !=3D &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv !=3D &obj->_resv))=
 {
>  		struct drm_gem_object *r_obj =3D
>  			container_of(obj->resv, struct drm_gem_object, _resv);
> =20
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}

