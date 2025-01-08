Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211EA063E7
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2025 19:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3983810E2C6;
	Wed,  8 Jan 2025 18:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YwUvFOy1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB810E2C6
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jan 2025 18:02:53 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso16059766b.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 10:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736359312; x=1736964112; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyXJyoTUz/O+MekoAhD1dI1UuPy1klDP8U3mVYcAA7E=;
 b=YwUvFOy1OUnbHpOcLnva0t+5Go0zxRfbXb52cUxK9MXhZv0xE7b5CnU5P2FPNFdc7t
 joAk3YaJb9vwSlMVaN59PQzSLoB9KO+kU0Mzsrq3CSGypBc/8buBrXqAM5sTDi+QuXpJ
 8t4u0LCVxb8E0e2ibR1PfpOicdhuhzxr97N7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736359312; x=1736964112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vyXJyoTUz/O+MekoAhD1dI1UuPy1klDP8U3mVYcAA7E=;
 b=uajEBEh0rjjbF9u9dezZzkddqT1/gKzTyoXhFrPoyk9l6sQVw0Ym7qCTHNiLicvPhn
 Wah3uPkoEn+5Tz5UtXzrNgQ5jJwiDYdMfxZl/pUHmHomLuSm/G+jPZ2la/quzaPih9Ij
 bUle+RjgAFbf7r2nnfkJkA0QLmDcAWPVJckhQOMiBCYnUKtyP8kmKaFuNi9F2Gtk/X3P
 0DRVYTpY0ZyTk/15R5v+W0KmLYfrdmVeCvGIuGnG1iqJSn0iU82O3ubRqEHq5s5BXu0u
 DQi2D2FKBqU8kBarnO9stUgYFeIUcx3BnzRJHiHEMX6PZ2VIN+wQ73UAFNpuzsTr/IZr
 oZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM6DF4hnJxU5HtsqxnmRrY0ABGyDK/2ce6h/8YbCdG69ZTleOpBIUWCVB9cjuZ16uOClJYFrpdl7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN+vCaPLXSoGH9z/8h4SeimI+QMSsEyHqOHcsV8rMePIAEHX+/
 kIDiDqxVKWzV0wKl9b+aK5tobgoT15rl3wuZWPQDH+scN+0NQ4SLmBPJswiIFwe8JWNWVqkxuGw
 6
X-Gm-Gg: ASbGnctrhY2JpH8B74W28fTBcenJCRBHxH+cMILjwZxCul8X1UGbFo5iTWrrmlJNKRy
 9bO67KNV/7kkXsexHBWzCP1LaAn+Aa0smj3imxfYW0kwHXAJ3Hnq8+207ND/fTfJT9ZtDDI6G7H
 4RCOjGlHEoX4juhs9q63iS+bl+ZqjRYa3EFJkZKhFyyA6msVDF6/AZ0HVLRxxSP9y5L53js2tlx
 v0sbuKfUpNxGCa7H+X/UNCxZZLGf20FepxBePiX9aexT0gBhQvEgbArSsquYMSc6VDt
X-Google-Smtp-Source: AGHT+IFozYJT06qw76DGVvnYOd+8i9OFhvq0LrKuiLg44EMhHZJky3qMfsIaLpjOif5j1Ah+kYp2VQ==
X-Received: by 2002:a5d:64eb:0:b0:385:f349:fffb with SMTP id
 ffacd0b85a97d-38a8732c439mr3473025f8f.45.1736358986935; 
 Wed, 08 Jan 2025 09:56:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2d2sm54271834f8f.71.2025.01.08.09.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:56:26 -0800 (PST)
Date: Wed, 8 Jan 2025 18:56:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Message-ID: <Z368SF0R6L82aM8Z@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Sun, Dec 22, 2024 at 07:00:43AM +0200, Dmitry Baryshkov wrote:
> The driver isn't supposed to consult crtc_state->active/active_check for
> resource allocation. Instead all resources should be allocated if
> crtc_state->enabled is set. Stop consulting active / active_changed in
> order to determine whether the hardware resources should be
> (re)allocated.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This is well-contained enough that I feel like I can actually review this
without making a fool of myself :-)

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
>  
> -	/* force a full mode set if active state changed */
> -	if (crtc_state->active_changed)
> -		crtc_state->mode_changed = true;
> -
>  	if (cstate->num_mixers) {
>  		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
>  		if (rc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
>  		crtc_state->mode_changed = true;
>  	/*
>  	 * Release and Allocate resources on every modeset
> -	 * Dont allocate when active is false.
>  	 */
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		dpu_rm_release(global_state, drm_enc);
>  
> -		if (!crtc_state->active_changed || crtc_state->enable)
> +		if (crtc_state->enable)
>  			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>  					drm_enc, crtc_state, topology);
>  		if (!ret)
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
