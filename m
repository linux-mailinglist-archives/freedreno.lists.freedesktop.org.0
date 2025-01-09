Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5DA06CE6
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 05:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC0A10ECDB;
	Thu,  9 Jan 2025 04:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sHi89LjE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA2F10ECDB
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 04:25:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso540640e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 20:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736396661; x=1737001461; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
 b=sHi89LjEqgk4fYYAeQ40LmQruqMi4INrEYnCyZYE+ribYCygCKUh4Zn6dWD5ZQg84R
 ey02oRf38wKee3PuQC7Jijq7Ngpm5tW1ECeI0UWnMS3EjxSAOX4h5Myuj++5VjgoYQPJ
 gNcmANMjYYT1DpmQT4Yd+cr3U9ozgObBSO0eHumh0kuR9YuQr6s+UuHs8NMoMYo5BVc7
 G6tPfnlaCL4HSpw0sZIOLgIyX4of0O06JqGVk7kMPZ8ftN4dgr1WnSUANWCmCkYLQ9GX
 g7xdC1DtXzAvHm/nZ0Ffr2WgFkMjNkHJG0JOxQfnsJfqjMtrbopicrShSL5RD1KlOpAQ
 UoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396661; x=1737001461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
 b=sYl+biEaYq43xG3YH4vn7ju3qORKYgONzRq9epEumpM7EQq0Ldi1JpiB4tIeivBV1+
 SuSmj7PKxsVng7+Et77b+BBJ4aSwJrp566SgX8zdDjgHtNsVAj4I09Rx7nBrdFbeinic
 h3LZzis8SgPPDsD93M+3d5MFtRY1QCaM572xBdFq2EKgeFWNP2Y2yT+ii4NAif4XCvJ0
 lmvXOfd9MhxOpMfZH/YrtfjTzTHRC3sJPZrnIi6ERN0oH9/DDNqi8TV1f7l9/lc8D4jG
 oaw9IAL37o/HlPjzLqkvXjXYx2vWNUoc9J2texpIWdeVtE7WCXjmjj0EqkoOAmvVK0gl
 vXXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnfe9+OZiho+w8+JE+A8anqW5WHSKRyDTGmWDuNQiT1k6glkfmtE7yPjRx4H/mZWJUpOsYBw1Tl7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0mR2XoA9umQC3A9ddcUlBYYOxvxSM6MRy2tIE19ccIvOF0c1R
 REN0Eg9eFCdUnS1g227TkdPf9Nxva1K/0Yi0OcVws6F18i7nQ+hKyWaC4jCCZ+Y=
X-Gm-Gg: ASbGncv1zzn06uS8C3QkqYyTpp9biicTAq3IvoaIDITA6QqNwm7g0HPPm3uT6Wc74gA
 R52xDLita73+LqBnON28aicXzYIgLXETeTo7lMezNUy/oDxgL9zbdH50VOR+uHMfk+KwYvugzsa
 pdOHJRQSP3DoqujhXEF5J6bu99js4Tt6viicZXKf4IWTzIu42y+r3lrryNhQnm5HV3Q+GbTT8dL
 ym8qLeAutisE8MgJ6Lg5rzFkgQU2ibUGyqnJXERo/M+CuCDC49Q2XgAt8T1kTo6k+bjq1I6F+JL
 /mvN2qaAtVMyKZwbVOVUvbYwGC5ssK/IX509
X-Google-Smtp-Source: AGHT+IHEZuHRIaKqakNLtv5UXX2C9mvMRn31Oci3NY2kR1ylrkyMAvDePp+/dCdXLT4ozAK/6FWpMw==
X-Received: by 2002:ac2:4c4a:0:b0:542:7f34:4df8 with SMTP id
 2adb3069b0e04-5428c1cfe56mr228114e87.2.1736396661334; 
 Wed, 08 Jan 2025 20:24:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a029sm71282e87.54.2025.01.08.20.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:24:20 -0800 (PST)
Date: Thu, 9 Jan 2025 06:24:17 +0200
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
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <ag7drc3bwzlmktbknoo2gzulaziva2mj7d2ze4wc26ng23336k@f5o6ue2skit5>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
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

On Wed, Jan 08, 2025 at 06:27:13PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > Perform corresponding check before calling the drm_atomic_helper_check()
> > function.
> > 
> > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> >   5 files changed, 77 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >   	cstate->num_mixers = num_lm;
> >   }
> > +/**
> > + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > + * @drm_enc:    Pointer to drm encoder structure
> > + * @crtc_state:	Corresponding CRTC state to be checked
> > + * @conn_state: Corresponding Connector's state to be checked
> > + *
> > + * Check if the changes in the object properties demand full mode set.
> > + */
> > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state)
> > +{
> > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +	struct msm_display_topology topology;
> > +
> > +	DPU_DEBUG_ENC(dpu_enc, "\n");
> > +
> > +	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > +	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > +
> > +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +
> > +	return 0;
> > +}
> 
> How will this work exactly?
> 
> needs_cdm is set in the encoder's atomic_check which is called inside
> drm_atomic_helper_check(). But this function is called before that.
> 
> So needs_cdm will never hit.
> 

Please refer to the previous patch, it should answer your question.

> 
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >   		struct drm_encoder *drm_enc,
> >   		struct drm_crtc_state *crtc_state,
> > @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
> >   	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> >   	 */

-- 
With best wishes
Dmitry
