Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3B9F87FE
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA46310E4C1;
	Thu, 19 Dec 2024 22:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vkQ3wC0J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B057610E4C1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:40:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3004028c714so14611361fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734648054; x=1735252854; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vh2BxipYNQWFszB8ZE0t+5AT9BL7t6v/D0gD+HOidz4=;
 b=vkQ3wC0J6fdfglzejzyqQVVCeVKizXgxaQWDRKk6QE8WuSynTCtieXV2X5T5R6GM3c
 nZ39Ec3tquF1UlK2mRgElHsdAjT/OIQTtSdfMJdMKBxJU56dlXLgDkR94PxksBHuOSpS
 Bi4eTnvdNnud0PJt7p3cFw0DguPezDzIZ3JKWTCeFVMZb/o0e2JwmzjRZGr0gdksZY2J
 obCuXmcf5nT4owtMUoilyTfiobMx6XZ/mBeu5s3vz2ffVpvit/n4Wx7hGkmgaJ0ZrCgx
 CX9o7BMnBmKfBtDXnWqu5m6kimpg3oaNbkiThKfuYJhLj31s/BFBHiAKg2N3/UPjGqla
 R05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734648054; x=1735252854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh2BxipYNQWFszB8ZE0t+5AT9BL7t6v/D0gD+HOidz4=;
 b=R7cUvHb6/Cq3SGjAhFcfhX4VEecA/YsxgBOFADQQMtkbc0dR5I+HxinCo/OqnTFnoK
 Fxu9h34hAFlqP1qopTJDX7i6+P5aM3T8OOEU1v7Q4/+JLWlx4AtFioeQUIpw2b/BaFnG
 74xGf2zTkwq9q/8jiOyy9lXKtuXywojfVph0XN3Ph7M1Jc4wnrcvFUFjS5B3SoebsuFg
 ezg0fUnXdoFtdtdZe1WhBAS6wmo6aRQTHJIHMwFp8sg3HUuiwK9d4ugUZaMamelX986v
 z0UCOXds/3WTxVEyjtyM3y9mReSvgU726kZI8ZFccxcZiXvrN7KlJLD3uZb2bS7TBeO+
 99dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZE/OiGppXcS2F59ROOaLNacUnC43VKBMHe4GSQH6Hge7thsefE0vf4bVeDRmpSxq+cYTwYWSuYXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQwSAmi7iipx335P7mvE7Q0MbbquBxylV7HwAjqHgg2DvSIumg
 S0D7N8uICu/PHq/HkcyGC3K8xGRQO1XQvogXYrT6NnRXXPpC+g7G+KPnxR/YMnI=
X-Gm-Gg: ASbGncvUUrqtGK53ydvkIxEGPttTel/JT9M0KdugEqu+KLUEjmDWD1lUxBdrwhaZFSa
 DmbJz+SlGIBq9TrzrgNtZpbkK56As++r4wZTz4rtH0DQ13lSsvYmhwtO9AQ4p0oNvy57CTul78q
 nsI2eSNWPCBcd6HAncMhcseq3KoOx1wVrCYVtUhbc8QXuW0bikfXPY8QuJVmVXxcelx4/gUseas
 mUBCcEHeN6uDHoe2JAhQSLiwnrW7oBRSPsX4dD5ESApzOO1+hfeAl7NbQFjZoCM3aFGhG1E5kXf
 bsAxcgplHzLiOMl+c6QmIAESfJJz0cDVmAWd
X-Google-Smtp-Source: AGHT+IEt4/eMp/y1Apol7QWoRib0WgvjbLHCpW5b0S3ge8gl3DIGCRdf7XNwtxVsFbf2qGT8HzCfyA==
X-Received: by 2002:a05:6512:108a:b0:540:1a40:ab0d with SMTP id
 2adb3069b0e04-5422953fef2mr88735e87.28.1734648053813; 
 Thu, 19 Dec 2024 14:40:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5fe9sm299180e87.48.2024.12.19.14.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:40:52 -0800 (PST)
Date: Fri, 20 Dec 2024 00:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <i6ch4bagrbotwp4u4x2spvw7crztyk6dph6i5wfz5k3guyrhxl@clmriesuuaa5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:29PM +0800, Jun Nie wrote:
> Blend pipes by set of mixer pair config.

You are repeating commit subject, so this phrase can be dropped. But
more importantly, I don't understand it. What do you mean?

> The first 2 pipes are for left
> half screen with the first set of mixer pair config. And the later 2 pipes
> are for right in quad pipe case. A stage structure serves a mixer pair,
> that is coupled with 2 pipes. So the stage array number is defined as
> STAGES_PER_PLANE.

And I still have problems understanding your commit message. This might
sound like a joke, but it is not. If my commit message are not clear,
I'm getting more or less the same response. Please consider asking one
of your colleagues to help you with the commit messages.

And another usual comment: describe why, not what. Start by describing
the problem instead of writing a text about the change itself.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6841d0504d450..6ef7e6ed00238 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	const struct msm_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>  
> -	uint32_t lm_idx, i;
> +	uint32_t lm_idx, stage, i, pipe_idx;
>  	bool bg_alpha_enable = false;
>  	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>  
> @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>  			bg_alpha_enable = true;
>  
> -		for (i = 0; i < PIPES_PER_PLANE; i++) {
> -			if (!pstate->pipe[i].sspp)
> -				continue;
> -			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> -			_dpu_crtc_blend_setup_pipe(crtc, plane,
> -						   mixer, cstate->num_mixers,
> -						   pstate->stage,
> -						   format, fb ? fb->modifier : 0,
> -						   &pstate->pipe[i], i, stage_cfg);
> +		/* loop pipe per mixer pair that's served by a stage structure */

served?

> +		for (stage = 0; stage < PIPES_PER_PLANE / STAGES_PER_PLANE; stage++) {
> +			for (i = 0; i < PIPES_PER_STAGE; i++) {
> +				pipe_idx = i + stage * PIPES_PER_STAGE;
> +				if (!pstate->pipe[pipe_idx].sspp)
> +					continue;
> +				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
> +				_dpu_crtc_blend_setup_pipe(crtc, plane,
> +							   mixer, cstate->num_mixers,
> +							   pstate->stage,
> +							   format, fb ? fb->modifier : 0,
> +							   &pstate->pipe[pipe_idx], i,
> +							   &stage_cfg[stage]);

This is not correct. It will make all LM CTLs to be programmed to flush
this SSPP, while actually they should only be flushed for a
corresponding pair.

> +			}
>  		}
>  
>  		/* blend config update */
> @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	struct dpu_crtc_mixer *mixer = cstate->mixers;
>  	struct dpu_hw_ctl *ctl;
>  	struct dpu_hw_mixer *lm;
> -	struct dpu_hw_stage_cfg stage_cfg;
> +	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
>  	int i;
>  
>  	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
> @@ -516,9 +521,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	}
>  
>  	/* initialize stage cfg */
> -	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> +	memset(&stage_cfg, 0, sizeof(stage_cfg));
>  
> -	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
> +	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg[0]);

stage_cfg instead of &stage_cfg[0], unless you are passing just one
stage config.

>  
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		ctl = mixer[i].lm_ctl;
> @@ -535,8 +540,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  			mixer[i].mixer_op_mode,
>  			ctl->idx - CTL_0);
>  
> +		/*
> +		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +		 * There is 4 mixers at most. The first 2 are for the left half, and

There is 1 mixer, there are 4 mixers.

> +		 * the later 2 are for the right half.
> +		 */
>  		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&stage_cfg);
> +			&stage_cfg[i / 2]);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 68867c2f40d4b..27ef0771da5d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -32,6 +32,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2
>  #define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
