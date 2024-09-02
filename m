Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FE9688FE
	for <lists+freedreno@lfdr.de>; Mon,  2 Sep 2024 15:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1D110E2EB;
	Mon,  2 Sep 2024 13:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ln17nv3r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455D210E2E1
 for <freedreno@lists.freedesktop.org>; Mon,  2 Sep 2024 13:36:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42bbd16fcf2so27110365e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725284175; x=1725888975; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
 b=Ln17nv3rFjD12IrPeMhsB5ujohswHhRkZcZify0VdM230R+hiRCBR7LLH8hZpBXuEL
 i82EyxBrGSYEw08dt0gD1kjg6O2ih6aLjd2sTPXANHhY+zAH4iwzxgX/3U04c5ezloyZ
 v89+4at+UbHQEyugZnp4N95q8mMMMfhZbKS/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725284175; x=1725888975;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
 b=N3Snku33j1Hp8rj5Lu9d5K1fczT+VU4GulC9IIXDSnwB2bzPdxFqA4MHDfS65UV8qf
 u5CczubTSweEjncyTXbhtg7LNjSz/xgtYCtWDUA1ExS1hAVeMmnfUIJ9Rd7ZyUfnLcMF
 bjKq18EpAWlsmj+kQX7df4ujMiId0PJjTW+jKOJdt9kGNChB5lxfQme3ZWvCUiq2u5WR
 ao1x7+FOcIwclMIOg7AsX5LP0nbwggtL9gXWQUuQDL0GVKZcu8zSWk4m5jY4sp/zVC9w
 EgucEFN6TMglzwMFocmnxlvD2IsYOXJ4Mb95iMscUs/BAqlYzC9Vnrfczzn51eyipD47
 Ac5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDYD9Jb/ehvNoLSqiT6taxWuecgA7Po9JB+tZyIHmvg/NM+GnVfd87AiWxOzd/TDOpMZHe6JnrZ3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/UTYA/822zo2KfynTbfTy5uJvnhHY8EP0hB5qqmHG03KXq2uP
 HbYlA2mcVV/QV2anek6rJt6xonQm/yFtCeM2vgE/eSHsGC6M9dRtvqG8yTEWdgs=
X-Google-Smtp-Source: AGHT+IFmCAd/UKn+8RiDLAzhiVps6I/r8wIzIThrxAPcZIbCaz99pcPpBKWDT6e22RdxtT79ulMxyg==
X-Received: by 2002:a05:600c:3b11:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42bb01b4428mr88808955e9.10.1725284174404; 
 Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c7fa443esm4065467f8f.41.2024.09.02.06.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:36:11 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <ZtW_S0j5AEr4g0QW@phenom.ffwll.local>
Mail-Followup-To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 29, 2024 at 01:48:34PM -0700, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1b0cc899e8c1..99eaaca405a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +			(!clone_mode_requested && clone_mode_enabled))
> +		crtc_state->mode_changed = true;

So two things, and kinda about the overall patch series:

- msm is confused about crtc_state->mode_changed, e.g. it sets it if
  crtc_state->active_changed, which is wrong. Or msm dpu code doesn't use
  drm_atomic_crtc_needs_modeset() correctly.

- changing crtc_state->mode_changed from your crtc or plane callbacks
  means you cannot use drm_atomic_helper_check directly, but need to roll
  your own that calls drm_atomic_helper_check_modesets again as needed.
  See the kerneldoc comment for drm_atomic_helper_check_modesets()

- the same holds if you set mode_changed from your encoder or bridge
  functions, but I think this doesn't apply here for this patch.

I think it'd be really good to

- review existing kerneldoc and please submit patches where it's not clear
  or detailed enough

- add checks to the atomic helper code to catch this. I think the best way
  would be to check if drm_atomic_crtc_needs_modeset() changes outside of
  areas where the helper code allows it already (essentially connector
  functions setting ->connectors_changed), and set a new
  drm_atomic_state->dirty_needs_modeset. Which
  drm_atomic_helper_check_modeset would clear, and which would result in a
  WARN_ON in drm_atomic_check if it's not yet cleared when the driver
  returns with success.

  Otherwise there's just no way I think to make sure drivers get this
  right.

Can I please sign you up for these patches?

Thanks, Sima

> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
