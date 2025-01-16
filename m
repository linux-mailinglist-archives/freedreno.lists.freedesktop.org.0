Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8AA134C0
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 09:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A0210E8E9;
	Thu, 16 Jan 2025 08:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hHrfZrog";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA1410E8EB
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 08:09:23 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso707514e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 00:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014902; x=1737619702; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
 b=hHrfZrogi4yj+UjpvZazAopurVzUXLWjLovg65MlRAOaKguzCQo4FhaAshbOZouGyg
 8A9vUiGNuxP2q+YWOvH0F6e9mKY+0LA0dckK5UuwMSNvHqjtLa7Wo8N0cBCWvvBJQvcP
 PBiEx7bFk5PnVOj3Cl65XZfXAsRAufw85QvMzIVn0i3r7r9mnjekRzn2ThDXme0EGL/f
 f+E6YVc5Up6Y42clIX+AhjL9gMKzZsuDukGfAgY5F3igSxdB7QkbsUbl8V5ZSx9ZAORi
 I3SE45sSjV/0wLJoipxJoaQ9wVmauZdikwkwLRuGeuV3JASZdHMXJvjP2fnes/wGfKtQ
 KHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014902; x=1737619702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
 b=qF6CkRxK7MfW5v3tgZX75LscTU2tfckyP0XoD+3UMnLBuLcG/k8Vbt5FvvgOJjUAUU
 3WCPBf9lD+FG4eaBLD0LzBVm/3sJ6cwgudIxq5jn5mFGiEO4GxLTD2V4YsLZhB7K73I/
 YmxyjnyR+ZjllchiyvrJQJk+4ZJN5IsYhPihAryD1kNfridbsMFhDNouiGKfIkuTXJBh
 mqMj/lF4OV0UnVqQlunwt9SIxuzm6Ul7nWJ2P/ge0W/R3mPx1by8oqc9gdxt5Bztitqi
 wHn0IAsGcpjsqJLyL6W3DTgLOIUopv6UtI6gO4NqxCnE9WY5KaQBveA0sMIIyGrv3A/g
 zisg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf4skNYUrIas2dWOH8pSId1JPTEEB2BYQBqV6ahOc6RTv57k6gAmJ8H6VWZ+VVc+4Q+k9QGmdH3mg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZYpNC2X47/5hAB7OicWollRzEl3jFH0CJDk8GHgWlIWnOr1VA
 Qa0QaWW41Vd0I7rSyT0qMKp+kR9LJFtz7AfhDtURh9KjJ+6b9sZDd5A6vQ4YSDg=
X-Gm-Gg: ASbGncvqyW/8tfatKJ3KsteM7DWgqHalmqgvtnfmI6WFmgDlrjeD/AuoAQ0jyEV8isd
 6+2gmbUTB+xrhDljvG0wTyFGVhMukO0t/8QLBQcskunoUZd89pzacBADW5cunaq5VmWTWCNmCqz
 a+INwxoxLepu8rt68Gd4+Fa1AiPY9SJLod0NFHlJWE7hGNoFVwvoBkGMHlba3MvAsRayPtNiLAB
 j3zgjoxTJxndRiI8nyo6Na9jry0qH3bKnuvFHnTwxwVvb7lRQ0EBgY+7/0VY2x0DUoWXgxVKL/v
 xK9Ux+v+9xjUgaCnPC4qjZ5+Gnnw7nBd+Er9
X-Google-Smtp-Source: AGHT+IGEHcCQjP4XA6TrXiXXldBmt08e0Vh4nxPE4SnDPCPsbcrbar+E8zfVOYTqQoHRGtLyWIB3yw==
X-Received: by 2002:a05:6512:a8e:b0:540:3572:1864 with SMTP id
 2adb3069b0e04-542845b35b6mr9642052e87.44.1737014902298; 
 Thu, 16 Jan 2025 00:08:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec067asm2271621e87.186.2025.01.16.00.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:08:21 -0800 (PST)
Date: Thu, 16 Jan 2025 10:08:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/16] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <actkdpr62j55cez7sbszrsjgsax7lwzlzk4qqe7rmqfo2y3u4a@2xro4eo56a25>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:01PM +0800, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array size
> STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 42 +++++++++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 81474823e6799..5ae640da53fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -401,7 +401,6 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  				       struct dpu_hw_stage_cfg *stage_cfg
>  				      )
>  {
> -	uint32_t lm_idx;
>  	enum dpu_sspp sspp_idx;
>  	struct drm_plane_state *state;
>  
> @@ -426,8 +425,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
>  
>  	/* blend config update */
> -	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> -		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> +	mixer->lm_ctl->ops.update_pending_flush_sspp(mixer->lm_ctl, sspp_idx);

No. This is required if two LMs use different CTLs.

>  }
>  
>  static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 5f010d36672cc..64e220987be56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2

it's 1, not 2.

>  #define PIPES_PER_PLANE			2

#define PIPES_PER_PLANE		(PIPES_PER_STAGE * STAGES_PER_PLANE)

>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
