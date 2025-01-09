Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43889A06D07
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 05:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578B10ECDC;
	Thu,  9 Jan 2025 04:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iDtKwYBH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059A110ECDC
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 04:29:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso114374866b.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 20:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736396935; x=1737001735; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
 b=iDtKwYBHp1cVJfVzLXdqy+MH4OBQ5hN7tVlOpZGGJLHRJ+JijcDxLrfxAYmogK5s56
 yo7RGRPvF8nj8/WM4WYS6m5Dj4oUgD+6gGiZCx8jN9eP5OGf5UgbQMOqyxVdv0XPJ+ok
 Gi9qT2/w4pBBJoAnK+iVFdfR5b8H+j5mWdat2XoiltpnijLUujoUPSP+UmJK6+TyVPCE
 TjGZF4n7PROHZ51u/lLmErmme6rfzSCCvXptiN0rJOZQ3tvtn8jmHEVp3mNMiG/RCq7v
 3D6V/94n6ESe8HHOPNKPua1q9EltT+0FD3/NHYxyNC0X8gGgdlDEEuD1o9HSlQG08D2s
 SrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396935; x=1737001735;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8RZpQ2r9Mn21NHPw670vKYSiFhVy622sgKUY1Z4mzI=;
 b=WpE1wedchMSbYUIV2kKEx2XI81IpoGUnNVaG8xckGGHJfipzlJd9kbfjkIrfFS6ZjP
 6ud3pVNS9AT6pt+8yZMBWQGX+jZ+RecmGZEaorY+5pYzL2k1JLY37UQhUAIve1UJ7MK0
 zFZvG9ntKIBqkcLs0yRbvla5b6LSEh2L/X/D7A5y0Muu58gWJQWvLzHvyTBF6X10jkR6
 FhNioLRfPprlC3SEeYNwrgoms5PfYIRFY9NAkInYHO/4UF/swo2MBXb2vZVFGDvTFLRT
 Unq1wBqwNPczk+b0JWRD5kjyRkFBOflmZ4vHQ6q3a4jLBI5ZJtyJtkPoZXZYoocXwZ9C
 YF/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt87YlrIMCJ1xnKpUNqDd0wE+sYLG0N+mqrknMzAKmdgNZPK0es0nZlh0BDJN6pDGjtVDxuzAIPGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7GX8Rhj/xUhnGG657iJNmhJEoz1OxHZVNKRkYAwyrdBFmbg2N
 uaBs6G/PoMEzw2dU8rBhAvPnzyc0OokPTc4JIvJgoj9iROjYV+TXP54ucKFmXQ7GXRJQkZbbEcf
 K
X-Gm-Gg: ASbGnctKodynVdBA/wtwlD5LPrY+XYpLqsqzJMTIZWBObZC+VrV2Nc7KAj5UYcaBgHB
 fniSE/EwNH+KWUY9lEOzZBDA1yhFUTC5qbD134QNjN4eCp9zhbdjGtzD0vjSBsTidSF9J3OpN1w
 HUxhKWXNf9iHnRBPoPjLEqxmFvdalYFXtp0x9hwWykp8XrAULBAtS4tYsRRpMVBnXF7DTk2zqDm
 W0l7hOjJ/P87CTKs3yL3SvssX+2pk7YYEUYbLat6EgI7UN4xd49lYwbJt724ziNyzYCXZPSshli
 HLbyzYrKZZ2o3MCvn8qHSp+QLdoVD2iWI7Ij
X-Google-Smtp-Source: AGHT+IG1V8Jg2MaRUXUmzF8uHSbf02lJcqcW8qbepGUCESN2xtzsOIioyzPL1t8gTqIQIkv8DzAQUg==
X-Received: by 2002:a05:6512:3e23:b0:542:1bdd:511a with SMTP id
 2adb3069b0e04-542845268e7mr1247466e87.13.1736396562833; 
 Wed, 08 Jan 2025 20:22:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be549c2sm73895e87.109.2025.01.08.20.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:22:41 -0800 (PST)
Date: Thu, 9 Jan 2025 06:22:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Message-ID: <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
 <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
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

On Wed, Jan 08, 2025 at 05:19:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The driver isn't supposed to consult crtc_state->active/active_check for
> > resource allocation. Instead all resources should be allocated if
> > crtc_state->enabled is set. Stop consulting active / active_changed in
> > order to determine whether the hardware resources should be
> > (re)allocated.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
> >   2 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >   	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
> > -	/* force a full mode set if active state changed */
> > -	if (crtc_state->active_changed)
> > -		crtc_state->mode_changed = true;
> > -
> >   	if (cstate->num_mixers) {
> >   		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
> >   		if (rc)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
> >   		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> > -	 * Dont allocate when active is false.
> >   	 */
> >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >   		dpu_rm_release(global_state, drm_enc);
> > -		if (!crtc_state->active_changed || crtc_state->enable)
> 
> I think this was leftover code.
> 
> What happened was, we used to have dpu_rm_reserve() both in dpu_encoder's
> atomic_check and mode_set. Hence this is checking !active_changed because
> that case was expected to get handled in mode_set to avoid duplicate
> dpu_rm_reserve() calls. Code has progressed since then to drop the
> dpu_rm_reserve() from mode_set and only use atomic_check.
> 
> So the correct fixes tag for this should be:
> 
> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")

Actually it should be:

Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")

> With that addressed, this is
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > +		if (crtc_state->enable)
> >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >   					drm_enc, crtc_state, topology);
> >   		if (!ret)
> > 

-- 
With best wishes
Dmitry
