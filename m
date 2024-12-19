Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20149F87DD
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6F910EE05;
	Thu, 19 Dec 2024 22:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EOSlLvyn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B510EE04
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:29:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1273313e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734647374; x=1735252174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
 b=EOSlLvynCJ0MjK2ZYpBIoC/4MPc/n/nYvOJ0YGNtolEXVzHf8/OoNE67MgeeYEa2sD
 eVJ/Xfv8v3oB+y0qYTuh4VliFw3z/MmwI2jIjvW381kju7mow9p0BOPzkTam6fc6NjfW
 jZiBLEryWWHupDmrwXJu/GOB+mihbWhzO6zgxa4DfH8L+X+LRDl1tip82KL+4I/FS16x
 f1frXn5K/xXXYRb5zIKfZ7u7PUt4VzXHKQWJNeYNjrBTkE2ffvJzyp2EfomEfpBUE2M4
 YdqZFOgMfc9YmTuZH1gWIt1q9ZRBm1Q9RVEzpKpg7ON5SsYpPVnimKEyihwJTrHnGxcH
 LgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734647374; x=1735252174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
 b=Swg6ipux2UxL93jAEvDjmcATbTmaKW8+DqArKpjAl6Mv6gLfZOecpTq6xuJv/YGCrt
 KHBpwfYVt9N+2dbbGPol+e2e7boUUz4nE+Y4/zigF9dCvOMdDA4zZXjr0Rp1Hbpqk7YR
 Dncv+nmOe85dCjJNUtvs4clXnk7oYfSiXsMm/5UFirWDMNpTz4NPujJ5m9YquR1xZlIf
 3kkC4EiKcnPoc5+W/7UiNYl9sbYEoDtSBh0t0SvlXQ0M73DbONgnyb5dpxB9HvoIAfOS
 Skld1qaNIGUSP8mS8+ZVD52ahPWnHmP3sUHSzyqls7bJBAasMiGAzzhZu3UCUs/fQa9i
 jxCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqa/wGGUN93iH0PLvyz5cccGowlF2XRePZ3OzXKKaDTteSN6muQXAcDH4iFDIAhQWSVywtxyRQDAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIYQVmF/e05P04oBPZjyyM5BKMgO2xnygQZr4QSMvxhOmEYbj+
 LnxbUti2tyf47t0+s29Nvac6tRnqWGOgF17RPbkcAAAQ2+KAIOH4nlC1MKf8pdg=
X-Gm-Gg: ASbGncu3YqwfJ7NhorlKH51eNr1oQ8mUrQ9mTTH2Vq0emkihjjP24ds+eqpJrQttzce
 ju8YUFZ3LuWvtElYtvdvvtHj1QqzW+C85ZpEt2aYMPpuvEiy5hUGws20Q6XOX0KRIxc042H18tc
 iucdWlKGLU0NEXerd4f+/mkk7sc4c0CPKvjIpHTARO3SBlfNqjWgkyLEcXs6tfr6RXJAHrys/Km
 zrKmn2j7eXffiwvC3cMr56WolmXgGUbg4aSFxcJTCY/oAkpcZbwBwq+xfPPhpxZ4bs+GAOHU1K9
 ztS4KOv/hsI+xVXRbKRxLrn1KcEa7rQAFwYq
X-Google-Smtp-Source: AGHT+IFMM7IxIREim+tWSsfHbYnZXp42QWfaJbZuCEzIN329HrV4/pAlBkqpNqL2/3JQwCfAxNPnzw==
X-Received: by 2002:a05:6512:3087:b0:540:1a33:dede with SMTP id
 2adb3069b0e04-54229533383mr60123e87.21.1734647374424; 
 Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f66fbsm291938e87.21.2024.12.19.14.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Date: Fri, 20 Dec 2024 00:29:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
Message-ID: <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> Add pipe as trace argument to ease converting pipe into
> pipe array later.

Isn't it already converted in on of the previous patches? Also you are
adding it to a particular trace function, trace_dpu_crtc_setup_mixer().

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 72ed8749cd716..6841d0504d450 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  
>  	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>  				   state, to_dpu_plane_state(state), stage_idx,
> -				   format->pixel_format,
> +				   format->pixel_format, pipe,
>  				   modifier);
>  
>  	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 5307cbc2007c5..cb24ad2a6d8d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>  		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
>  		 uint32_t stage_idx, uint32_t pixel_format,
> -		 uint64_t modifier),
> +		 struct dpu_sw_pipe *pipe, uint64_t modifier),
>  	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> -		pixel_format, modifier),
> +		pixel_format, pipe, modifier),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,		crtc_id		)
>  		__field(	uint32_t,		plane_id	)
> @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  		__entry->dst_rect = drm_plane_state_dest(state);
>  		__entry->stage_idx = stage_idx;
>  		__entry->stage = pstate->stage;
> -		__entry->sspp = pstate->pipe.sspp->idx;
> -		__entry->multirect_idx = pstate->pipe.multirect_index;
> -		__entry->multirect_mode = pstate->pipe.multirect_mode;
> +		__entry->sspp = pipe->sspp->idx;
> +		__entry->multirect_idx = pipe->multirect_index;
> +		__entry->multirect_mode = pipe->multirect_mode;
>  		__entry->pixel_format = pixel_format;
>  		__entry->modifier = modifier;
>  	),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
