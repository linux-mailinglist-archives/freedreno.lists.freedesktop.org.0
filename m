Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF47998777
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 15:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCB610E8EC;
	Thu, 10 Oct 2024 13:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uylRX+Ag";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9998210E8EC
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 13:20:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so1259709e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728566422; x=1729171222; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=afwhwANrqqjIZBXW8NL/Qic7KEaJJJJRdGp7JOpIUIo=;
 b=uylRX+Ag6sj1gUjOOIa5i8jtbELnVqrd+P2DauywUmJYztHNbJ42VTlsXsh0MQ7yFw
 0Gr8sDsw4jf8cynot6STUhHjoQstCvoKbkkL6K9if1e4T816BB1EXQjei2N4TB+lqhPS
 gfDTOgMTIU4u4zpF0J29vtCKtxKdpcNcmUkcKD+VtmbWbw9jVxjLK/YCIEpTPplCR98r
 ZYu6AfQgJ/9gDgnYFy1eJFcQ+pruUDzHsNyTbsYKnI9yuCSPkR5FTGJKoiOALcdlOQWi
 CcFXV8hUXLI/OXFYBkRzAFZ12AJgXyaG45ei0AAr8/QZ0hT/3UENZdAI3pHqGODp4Oix
 wEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728566422; x=1729171222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afwhwANrqqjIZBXW8NL/Qic7KEaJJJJRdGp7JOpIUIo=;
 b=W3WFCO5Axa02zhWtvXTVxXFaN/oKkxP2iK/bbF4aHt0QXZy6RJ9KZQ7y9I310UHuJ3
 JCbVzybv44s1wFlD9T1V2eDSBKcKFVPe0efef6k0fA/xqYhz+QO8Id9RAt7QBf1dFW/j
 HlBBiYJT0t6MH2x+9ATxM3olbs6NdC9vS8gTZag1GVVN5lrK57lunKq2WKJ8FL+2T1tq
 Gygs21bq0B/ffaLXoqqnumrJYe3T6q+GPv6P9Ym5n8zUFAoOfMg1KiyL9vx9J2lvSYmr
 bkDtJ/1AtNEgica4jJECJhKMlZ1M9ok9tswkbCWAB4WPRJOVFGXIaa4HeXFASegvImfv
 P29A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtXaCe+bIZ80/WtGldNrNgSvU16bfIhCFqYNifOoTZkIHs/ItfINhIiEovo4QZEIFyVcDTCQFrQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXEWhFuUYqEtmAkBZYBHF8qTqat6uGBwtaF8Ozh+sqzCKeSPmC
 on/+wlAHN3CHsnvIqXjT+N3lnLYWWNVpzil0FIeIEAk91Jk+iFSUI0K/f6t8HdTDK2tEtl2cQZ3
 xV+E=
X-Google-Smtp-Source: AGHT+IE/rgqAiHR9MVe1Z5kBE+dVl8tJdx0Xano7R9HQucKZllTMG/aWC2ImiYcthp5VhrcRP6uTWA==
X-Received: by 2002:a05:6512:220d:b0:539:9f3c:3bfd with SMTP id
 2adb3069b0e04-539c497050dmr4024250e87.58.1728566421692; 
 Thu, 10 Oct 2024 06:20:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0f9csm250105e87.189.2024.10.10.06.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:20:21 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/14] drm/msm/dpu: Support quad-pipe in SSPP checking
Message-ID: <j2ws4q45uwmk4anzgz32ckzsbuc32zngmnybynxoyvgtezu6kr@5e2hxhfsmbtf>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-10-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-10-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:23PM GMT, Jun Nie wrote:
> Move requreiment check to routine of every pipe check. Because there is

s/Because there is/There will be/

> multiple SSPPs for quad-pipe case in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 86 ++++++++++++++---------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index fc54625ae5d4f..05b92ff7eb529 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -143,11 +143,13 @@ struct dpu_hw_pixel_ext {
>   *             such as decimation, flip etc to program this field
>   * @dest_rect: destination ROI.
>   * @rotation: simplified drm rotation hint
> + * @valid: notify that this pipe and config is in use

This is not related to code move, is it? And if it is, it should be
described in the commit message.

>   */
>  struct dpu_sw_pipe_cfg {
>  	struct drm_rect src_rect;
>  	struct drm_rect dst_rect;
>  	unsigned int rotation;
> +	bool valid;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9a8fbeec2e1e8..904ebec1c8a18 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -739,12 +739,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>  		struct dpu_sw_pipe *pipe,
>  		struct dpu_sw_pipe_cfg *pipe_cfg,
> -		const struct msm_format *fmt,
> -		const struct drm_display_mode *mode)
> +		const struct drm_display_mode *mode,
> +		struct drm_plane_state *new_plane_state)
>  {
>  	uint32_t min_src_size;
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	int ret;
> +	const struct msm_format *fmt;
> +	uint32_t supported_rotations;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
> +	/*
> +	 * We already have verified scaling against platform limitations.
> +	 * Now check if the SSPP supports scaling at all.
> +	 */
> +	if (!sblk->scaler_blk.len &&
> +	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +	      drm_rect_width(&new_plane_state->dst)) ||
> +	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> +	      drm_rect_height(&new_plane_state->dst))))
> +		return -ERANGE;
> +
> +	fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +		supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +						   supported_rotations);
>  
>  	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>  
> @@ -920,49 +948,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	const struct msm_format *fmt;
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
> -	int ret = 0;
> -
> -	pipe_hw_caps = pipe->sspp->cap;
> -	sblk = pipe->sspp->cap->sblk;
> -
> -	/*
> -	 * We already have verified scaling against platform limitations.
> -	 * Now check if the SSPP supports scaling at all.
> -	 */
> -	if (!sblk->scaler_blk.len &&
> -	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -	      drm_rect_width(&new_plane_state->dst)) ||
> -	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> -	      drm_rect_height(&new_plane_state->dst))))
> -		return -ERANGE;
> -
> -	fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -		supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -						   supported_rotations);
> -	r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -					  &crtc_state->adjusted_mode);
> -	if (ret)
> -		return ret;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int ret = 0, i;
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		pipe = &pstate->pipe[i];
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		if (!pipe_cfg->valid || !pipe->sspp)
> +			break;

And... this check broke display support at this point, didn't it? It's
never set, so none of the pipes are going to be checked.

> +		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +						  &crtc_state->adjusted_mode,
> +						  new_plane_state);
>  		if (ret)
>  			return ret;
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
