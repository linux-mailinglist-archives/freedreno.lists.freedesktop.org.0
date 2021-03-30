Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B534DDCB
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 03:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2244A6E7FA;
	Tue, 30 Mar 2021 01:52:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293C16E7FA
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 01:52:04 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so8626004pjc.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 18:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+Cpe14PwtL8vIUpx0dzGsw3Ka3M5f1GgIApZ0rRvA/g=;
 b=oIp3r0zJ4FEkjG/TIz3OMayXIb3PX9+/n1mCnMVGrWZSbWvbO5suX5t3s3oJMBAefp
 kGfwCG0FpEIFzFWq+aF80ldxe8US/FdLKz/DnS+P7Cl0rdlML39ht1/w31VYPGa+6naq
 WRUkqdlp81lqC1baoM8Qe5Ey4jfwxQUYRdWSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+Cpe14PwtL8vIUpx0dzGsw3Ka3M5f1GgIApZ0rRvA/g=;
 b=sj7JCdcM80CU0XkiAOabTESoJP1eEzB/VRoFu3IBbNu3OR4QNHcuoYpUxBDlELL7wV
 QeUOnS2mPou3U4vu7pZFZvAPfVvyn+SByFBOW9/2mNVexF6ul/EYWsBaFUSQWALixJQZ
 YtlsW7DaOw6gwuSjg7u7dax4Vnr+nY3YSdhjC24z/cE41rWcK0qYv6vI2Yilm2t3uPJJ
 zVBNsxpTEVAw/tYw4S/FIEsNYkq6KmYrOF0XB6moltKkhJLBoqNabNQGYfvo+nRh+AYH
 aRWtLW/LZJLkvrFrv1t5J7rPRbrt40zNOFxgjbd+N4naqTpBzf5cTd6JtdHMpDIleT/F
 li7A==
X-Gm-Message-State: AOAM5302epGbIifzMaXparxT+Oxkd64y8xJN7mcPnHXKfbgbNd9wtR7a
 NcFAamUwcBMm/82zkN6kPcDCWA==
X-Google-Smtp-Source: ABdhPJyvaXWUQUyIW3y2W3D2lyK/Nk8RADybL4nEpzcpJxiDOoLQLbonvJydNGKL5kjDt5jh0FqtLA==
X-Received: by 2002:a17:902:eac5:b029:e6:34e2:8378 with SMTP id
 p5-20020a170902eac5b02900e634e28378mr30720652pld.35.1617069123644; 
 Mon, 29 Mar 2021 18:52:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id bg16sm893875pjb.43.2021.03.29.18.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 18:52:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210219120032.260676-10-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
From: Stephen Boyd <swboyd@chromium.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 29 Mar 2021 18:52:01 -0700
Message-ID: <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3 10/11] drm: Use state helper instead of
 the plane state pointer
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Trimming Cc list way down, sorry if that's too much.

Quoting Maxime Ripard (2021-02-19 04:00:30)
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,
> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.

Does this mean drm_atomic_helper_swap_state()?

> 
> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
> 
> This was made using the coccinelle script below:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>         ...,
>         .atomic_disable = func,
>         ...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>         ...,
>         .atomic_update = func,
>         ...,
>  };
> )
> 
> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>         ...
> -       struct drm_plane_state *new_state = plane->state;
> +       struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
>         ...
>  }
> 
> @ include depends on adds_new_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_new_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c      | 4 +++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      | 3 ++-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 31071f9e21d7..e8ce72fe54a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1244,7 +1244,8 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
>                                 struct drm_atomic_state *state)
>  {
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
> -       struct drm_plane_state *new_state = plane->state;
> +       struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +                                                                          plane);
>  
>         pdpu->is_error = false;
>  

This is oopsing for me. It turns out that 'new_state' is NULL. According
to the comments drm_atomic_get_new_plane_state() can return NULL if the
plane isn't part of the global state. I haven't looked much further but
wanted to report it here in case that type of return value makes sense.

If I revert this patch from linux-next my display works and doesn't
crash the system. Or I can check for NULL in the if below and it also
works.

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df7f3d3afd8b..f31b89531f6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1251,7 +1251,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
-	if (!new_state->visible) {
+	if (new_state && !new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
 		dpu_plane_sspp_atomic_update(plane);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
