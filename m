Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA46A98557A
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 10:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FAF10E7B8;
	Wed, 25 Sep 2024 08:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xc/mEwir";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556310E7BF
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 08:29:02 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so7640763e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Sep 2024 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727252940; x=1727857740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fJc/ZEonsSpvQx65a5f325f6xswc665KOha+qhiv8i8=;
 b=xc/mEwir3cVnpPTqEC9ZCBUadI4yeSq3DqsPdO2Mipz8vILIo2Mn6rdyRcr4uIyQCn
 bm4cAYXLMhwav7WaKzjviM2gSiLaAnDDP8AdsdXzFMSY9qXVaM1kPtkPQyFQjx4FVzv+
 Sj+8aOxdosO+nM/kD2mORQi+E8ntu7BBxp8igz96UivNtKyqj4vqRCwUe2P6w1C7AGSo
 9btRID48025jALw21GsSavhnuaw5WI2zZ9jMeL8PloswbXeJ/i4zX1gxJgaR1xpCk209
 tFyM66kewMtxsnE7DayBD5n2Pul9TMac3Q4fBfk/IVQqv9FfunBzNrWq6RllWepiQ/Ls
 M2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727252940; x=1727857740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJc/ZEonsSpvQx65a5f325f6xswc665KOha+qhiv8i8=;
 b=H3p2wZUArs/QaRMLJf2ldocw401eZFrrwflM5Ac2K91jA2LfMNMPHw7K6a1c2BtdLw
 yp2T31JrC6pGEeEm6vKp5+PYFnHcXZ6LPcJLf72+SASGwsRZeHi3cMmT1EqN4WTGDDIt
 lSCh2BwBNSNn3X2g9VfMcLGHk37ljFHYg1xlMQKtQs5aynaDGpAzC/B5He6Dag7HZKdt
 05yKt/cz/uuhoV8CwWxM3d+TrOazb4PjmVrDkRwJR6Dtzb5HzZ5QV1x3AS2zOrVv+HM/
 Xs8rQx//wlC4XoiiiajKzTkEtipSaFmRblPv08wx++XQLfyJjoAHMZjDndZqG+D5Z4cI
 6log==
X-Forwarded-Encrypted: i=1;
 AJvYcCVACSzWBBr3qN+0p7mu9MmPk1e2qnEwmL2d9KBwmRLcVsEZnQPU6Cu3/tlqmw6aDyIdfcbmWqdNEwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9hta8L691p9SJYggwMsVYdm+wenVv7Md1nSQo8S/0hvmpyZ1L
 W3nFiExjRCqibEJ9lOmxPaBQvV6UhfSA2edNh6ZaSnBBPl+4VAvzTqtk87DH9ag=
X-Google-Smtp-Source: AGHT+IFWtR5Spi/hxHDKmyK+yEjL67FVSC0HLJLKUPO8bW2hzqf39SxWRho/7uZXgcWIoMTcw6ko+w==
X-Received: by 2002:a05:6512:3f07:b0:535:6ba7:7725 with SMTP id
 2adb3069b0e04-5387048a6d7mr1170484e87.3.1727252940511; 
 Wed, 25 Sep 2024 01:29:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8648d41sm454852e87.224.2024.09.25.01.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:28:59 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:28:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 14/22] drm/msm/dpu: Require modeset if clone mode
 status changes
Message-ID: <zwxgml3qi3t253y2yhmi5lcpxg5odugrncfgh74y36kwubd4xv@oem2vicytu5i>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-14-7849f900e863@quicinc.com>
 <yjfe5wajajeqmcp65kbvcttzgkrsfv5rhkbvqvioqx3rwdn6g6@2h2byk2l2imy>
 <75297d0d-528a-4152-b35f-ba41fbf914dc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75297d0d-528a-4152-b35f-ba41fbf914dc@quicinc.com>
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

On Tue, Sep 24, 2024 at 05:05:43PM GMT, Abhinav Kumar wrote:
> 
> 
> On 9/24/2024 4:25 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:30PM GMT, Jessica Zhang wrote:
> > > If the clone mode enabled status is changing, a modeset needs to happen
> > > so that the resources can be reassigned
> > 
> > Sima's comment regarding crtc_state->mode_changed seems to be ignored...
> > 
> 
> Not ignored. One of us has to take that up. There is a broader cleanup
> required for that.

At least then it should be mentioned in the commit message or under the
commit message.

> 
> We can sync up on how to tackle this : whether it needs to be in this series
> or push another one cleaning up all the instances.


Yes, let's sync separately.

> 
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a7850bf844db..f20e44e9fc05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1268,6 +1268,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   {
> > >   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> > >   									  crtc);
> > > +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> > > +									      crtc);
> > >   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > >   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> > > @@ -1279,6 +1281,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   	int rc = 0;
> > >   	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> > > +	bool clone_mode_requested = drm_crtc_in_clone_mode(old_crtc_state);
> > > +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
> > >   	/* there might be cases where encoder needs a modeset too */
> > >   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> > > @@ -1286,6 +1290,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   			crtc_state->mode_changed = true;
> > >   	}
> > > +	if ((clone_mode_requested && !clone_mode_enabled) ||
> > > +	    (!clone_mode_requested && clone_mode_enabled))
> > > +		crtc_state->mode_changed = true;
> > > +
> > >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > >   		rc = dpu_crtc_assign_resources(crtc, crtc_state);
> > >   		if (rc < 0)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry
