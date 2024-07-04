Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA36927991
	for <lists+freedreno@lfdr.de>; Thu,  4 Jul 2024 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A67E10EAC4;
	Thu,  4 Jul 2024 15:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YF2UyyFu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15B010EAC4
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jul 2024 15:07:12 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-650cef35de3so6761337b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jul 2024 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105632; x=1720710432; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nnU2GZk3GvU2j9RUyPBjNitDac3G21CdBZm/Vv/gzjU=;
 b=YF2UyyFu3zd6GGejuuEE/nVqPse6CR6Zw5DBs9JoqJof4Ai0Aanast0dWhmE8c7WMC
 y/SARpEPjsygGji2YE3MZcdrrpJKHj8d/qt5iDm1Jxz4NJBFKVZNUM7ziPtSP2PDaNYs
 HdsM0dEf2WvNXzA0c73jIVy/wYyCEDjMMnvlMVg5LV1Pe86mq78zERfX4/H9lly/OCBz
 XYluqY8orO7g3E450X9x0bC7KDPtyJr589l28FNHGF2o39u8Q/3iEWtNm/fIPn5EP5M9
 PNNAc/dSZZQngKMS88LwpWvH9/7b5SWrYACSUQOsC6arh/jbwrVXgZitwydEewDno3PM
 9MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105632; x=1720710432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnU2GZk3GvU2j9RUyPBjNitDac3G21CdBZm/Vv/gzjU=;
 b=wn8OaHoERVUacuFdizh+HBTTniSpRkJdy5v1GRWeijxf9cpOKawFzhne1kCuHQrNf+
 8702SfPpLmYT8qLEyHd6134EZSry79MA36fpsflMScSLnjXZWgcatoH7bfGbLdgUMQSQ
 w1FimsBCNwKJxTBMjCq3PWo8sUpItdKXcozaqxb8V6WzRXX2BMb1ibpS1kyHTT37Of72
 UH2LPXRpLVFUvJ7wzNTYb8DM0L0fC0LYy7G0MyfMtRqzvSL7xtOPAzn/f3ENnin+D7Xt
 JoQA1d46iIpPsXl9VZ3mJzEte3XkGxmCNBb7qsiMKx6ynDb8EzYxgCXqdG+WEEDV2U2y
 vYTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/w6qhcABs6j1CKGB4QReNaKGj2wCBUmyJ/ceBCBHpYfji64ypL+IlkRvVa/n4BeOPGL45fj0En/K715grdX3akkP57i+R+DbFh7o7EdkF
X-Gm-Message-State: AOJu0YyORZOVRXJ9r8R6HaquV2i2IwzNKnHRkjbWbBeXs0lzvH09jmJa
 2ba2ZX8Rvys+VaWzlyBz3PzTq6CL7+P7HN4RJdNOi+6QhWNJ2jiFqwvxWjEPloj9X1x4AaNNb9d
 anwqmA1boW/v7noWPD1o32YHRzEvZzL+MpfCXlA==
X-Google-Smtp-Source: AGHT+IF9hmKUAngU+XkEYYdVI6hGoHL4ie0aigB5IWXi9UydYCJoJBQQop8fXKQKn2jxuGIzVs4R7hjVverTeJ5rxns=
X-Received: by 2002:a25:1d6:0:b0:dff:91e:56ed with SMTP id
 3f1490d57ef6-e03c1912d45mr1779996276.1.1720105632032; 
 Thu, 04 Jul 2024 08:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
 <20240702-drm-bridge-connector-fix-hdmi-reset-v3-3-12b0e3124ca4@linaro.org>
 <20240704-roaring-aromatic-seal-d046af@houat>
In-Reply-To: <20240704-roaring-aromatic-seal-d046af@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 18:07:01 +0300
Message-ID: <CAA8EJpri+Jib=4gG4oK50s5yZy7RGEN30ka9KfHKt_aLYyd9tA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge-connector: move to DRM_DISPLAY_HELPER
 module
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 4 Jul 2024 at 15:54, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Jul 02, 2024 at 12:48:54PM GMT, Dmitry Baryshkov wrote:
> > drm_bridge_connector is a "leaf" driver, belonging to the display
> > helper, rather than the "CRTC" drm_kms_helper module. Move the driver
> > to the drm/display and add necessary Kconfig selection clauses.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/Makefile                             | 1 -
> >  drivers/gpu/drm/bridge/Kconfig                       | 1 +
> >  drivers/gpu/drm/display/Kconfig                      | 6 ++++++
> >  drivers/gpu/drm/display/Makefile                     | 2 ++
> >  drivers/gpu/drm/{ => display}/drm_bridge_connector.c | 0
> >  drivers/gpu/drm/imx/dcss/Kconfig                     | 2 ++
> >  drivers/gpu/drm/imx/lcdc/Kconfig                     | 2 ++
> >  drivers/gpu/drm/ingenic/Kconfig                      | 2 ++
> >  drivers/gpu/drm/kmb/Kconfig                          | 2 ++
> >  drivers/gpu/drm/mediatek/Kconfig                     | 2 ++
> >  drivers/gpu/drm/meson/Kconfig                        | 2 ++
> >  drivers/gpu/drm/msm/Kconfig                          | 1 +
> >  drivers/gpu/drm/omapdrm/Kconfig                      | 2 ++
> >  drivers/gpu/drm/renesas/rcar-du/Kconfig              | 2 ++
> >  drivers/gpu/drm/renesas/rz-du/Kconfig                | 2 ++
> >  drivers/gpu/drm/renesas/shmobile/Kconfig             | 2 ++
> >  drivers/gpu/drm/rockchip/Kconfig                     | 4 ++++
> >  drivers/gpu/drm/tegra/Kconfig                        | 1 +
> >  drivers/gpu/drm/tidss/Kconfig                        | 2 ++
> >  drivers/gpu/drm/xlnx/Kconfig                         | 1 +
> >  20 files changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 68cc9258ffc4..fa432a1ac9e2 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -128,7 +128,6 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
> >  drm_kms_helper-y := \
> >       drm_atomic_helper.o \
> >       drm_atomic_state_helper.o \
> > -     drm_bridge_connector.o \
> >       drm_crtc_helper.o \
> >       drm_damage_helper.o \
> >       drm_encoder_slave.o \
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index c621be1a99a8..3eb955333c80 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -390,6 +390,7 @@ config DRM_TI_SN65DSI86
> >       depends on OF
> >       select DRM_DISPLAY_DP_HELPER
> >       select DRM_DISPLAY_HELPER
> > +     select DRM_BRIDGE_CONNECTOR
> >       select DRM_KMS_HELPER
> >       select REGMAP_I2C
> >       select DRM_PANEL
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 479e62690d75..1a192a45961b 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -6,6 +6,12 @@ config DRM_DISPLAY_HELPER
> >       help
> >         DRM helpers for display adapters.
> >
> > +config DRM_BRIDGE_CONNECTOR
> > +     bool
> > +     depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
> > +     help
> > +       DRM connector implementation terminating DRM bridge chains.
> > +
>
> Is there any reason to put it in there instead of under DRM_BRIDGE like
> DRM_PANEL_BRIDGE?

DRM_PANEL_ BRIDGE is a bridge in the end. DRM_BRIDGE_CONNECTOR is not.
That's why I thought that drm/display is a better way to go.

-- 
With best wishes
Dmitry
