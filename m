Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA87431F7
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 02:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4910E433;
	Fri, 30 Jun 2023 00:52:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6710E029
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 00:52:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b698371937so21218011fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 17:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688086358; x=1690678358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t2vB8BmxULVJxmGOs9rdQlX1X8v8wP+ERA+PGWKm9bI=;
 b=B+RbpntmLf1ZO/+/u6up7RLJJOiQT2qo2NGUayWP5pfz8vNrY6iOdIMyWg6ALk1q8D
 ExuHYvHZd9Ja4V3Cidf7tK29t0cYzWm3uGuVsNrZv/+O11ycJmmU1rMZgFXgNbtm/Vwl
 0sYJ8bTmc+Sw7fgu/mUagOfuPKhFG9DYSWQTOAuQbwL6CcNbeNiCJ5aFmJRcD/dvUhaK
 p8ytdfkrh6HlxL4OltQ/0Ua/2aXAkFoQxfLAzsu0w1h12lq7gVB+c0aJ0WHdQJC9UmRk
 7r5taS6gfcsDglpzezGQmLSb+p0i5ZQCJyOAjxxrG4lnSiflvw76O0SaFAgxcdeFWLCY
 46eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688086358; x=1690678358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2vB8BmxULVJxmGOs9rdQlX1X8v8wP+ERA+PGWKm9bI=;
 b=dFMKg68z7Omkgho/tyrjKLlnNbeSlmz9VzNkwc8m0cDE2WGg+55qyQACZYtBgZJAXK
 ttNA7HL5Ynlv5wXT5xlQbNpJsinM6YQJfv+Hwve6Vs3N6C3FOphh+2/TN9+4t39uDa32
 jIY0TL2cs9xP+Wru3ag0z8EWVbPOs5g7RZSZhuwvHMhQos39FXEOnlxU4QXDf5zSqc5F
 b1KCM/vmNa1XOVy1ozRP7As3SV99PcYpoSIyX8gl3cEPvG+W3mEFdN0apMT47bNPLIa+
 Ci7CShMEXGC2oEkuac0JtEzgkS/YqRh3mr3TVVhonUpjI4eELFC04kbL6Fg+Q7gLD4C+
 R3mQ==
X-Gm-Message-State: ABy/qLY7/KJFqszYDu7ugLdN5FABSzGJI42XlB1uuoTJQM/iRSBNZLvW
 z0xMC6+e+VTgCTqFs/7uT8qaRw==
X-Google-Smtp-Source: APBJJlE1c5o3D3G6GvcZOs3abDtDqQuFd80Fa6AQStxZs3COu7E6O54u1yjuPmHUE/Sodiwo+pWWtg==
X-Received: by 2002:a05:6512:2397:b0:4fb:a0ec:983f with SMTP id
 c23-20020a056512239700b004fba0ec983fmr1366668lfv.14.1688086358424; 
 Thu, 29 Jun 2023 17:52:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056512020b00b004f875a919a6sm1086476lfo.293.2023.06.29.17.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:52:37 -0700 (PDT)
Message-ID: <cca48c01-b84a-dff6-57ae-356971edacf3@linaro.org>
Date: Fri, 30 Jun 2023 03:52:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-6-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-6-f4ec0caa742d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v4 6/7] drm/msm/dpu: Allow NULL FBs in
 atomic commit
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
Cc: sebastian.wick@redhat.com, contact@emersion.fr, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2023 03:25, Jessica Zhang wrote:
> Since solid fill planes allow for a NULL framebuffer in a valid commit,
> add NULL framebuffer checks to atomic commit calls within DPU.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++++++++------------
>   2 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1edf2b6b0a26..d1b37d2cc202 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -451,6 +451,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct drm_plane_state *state;
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>   	struct dpu_plane_state *pstate = NULL;
> +	const struct msm_format *fmt;
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> @@ -470,7 +471,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb)
> +			fmt = msm_framebuffer_format(pstate->base.fb);
> +		else
> +			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> +					DRM_FORMAT_RGBA8888, 0);

The DRM_FORMAT_RGBA8888 should be defined somewhere in patch 1 as format 
for the solid_fill, then that define can be used in this patch.

> +
> +		format = to_dpu_format(fmt);
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5f0984ce62b1..4476722f03bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -837,8 +837,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	pipe_cfg->dst_rect = new_plane_state->dst;
>   
> -	fb_rect.x2 = new_plane_state->fb->width;
> -	fb_rect.y2 = new_plane_state->fb->height;
> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
> +		fb_rect.x2 = new_plane_state->fb->width;
> +		fb_rect.y2 = new_plane_state->fb->height;
> +	}
>   
>   	/* Ensure fb size is supported */
>   	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
> @@ -848,10 +850,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -E2BIG;
>   	}
>   
> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> -
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> +	if (drm_plane_solid_fill_enabled(new_plane_state))
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	else
> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
>   	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>   		/*
>   		 * In parallel multirect case only the half of the usual width
> @@ -1082,21 +1087,32 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe;
> -	const struct dpu_format *fmt =
> -		to_dpu_format(msm_framebuffer_format(fb));
> +	const struct dpu_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	struct msm_gem_address_space *aspace = kms->base.aspace;
>   	struct dpu_hw_fmt_layout layout;
>   	bool layout_valid = false;
> -	int ret;
>   
> -	ret = dpu_format_populate_layout(aspace, fb, &layout);
> -	if (ret)
> -		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> -	else
> -		layout_valid = true;
> +	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
> +		int ret;
> +
> +		fmt = to_dpu_format(msm_framebuffer_format(fb));
> +
> +		ret = dpu_format_populate_layout(aspace, fb, &layout);
> +		if (ret)
> +			DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> +		else
> +			layout_valid = true;
> +
> +		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> +				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> +				crtc->base.id, DRM_RECT_ARG(&state->dst),
> +				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> +	} else {
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	}
>   
>   	pstate->pending = true;
>   
> @@ -1104,11 +1120,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>   	pdpu->is_rt_pipe = is_rt_pipe;
>   
> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> -
>   	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
>   				   drm_mode_vrefresh(&crtc->mode),
>   				   layout_valid ? &layout : NULL);
> 

-- 
With best wishes
Dmitry

