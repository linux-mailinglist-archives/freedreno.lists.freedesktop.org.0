Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1A927970
	for <lists+freedreno@lfdr.de>; Thu,  4 Jul 2024 17:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4710EB18;
	Thu,  4 Jul 2024 15:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f3NXCj8R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C1610EB18
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jul 2024 15:03:00 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6504101cfd6so6671567b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jul 2024 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105379; x=1720710179; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=f3NXCj8RxiBbaFcowATDt5XFvahQWtttVsuu34R/joMGX5G479BXkW+eyDDePc/x6b
 LZNQNyi8PZAZQf7GnuxISwmrnkFmOFpSC5foLCv/m7To1Gk+/x23HIYV/2YzRSJTHn1Y
 gW0HoL5ZYPQjp9w636F2FlqmRQLbTL/i8hqQlstt89ZX/Lr0tIBMc+fWHniM+kNGu7dd
 l5OU/825Jim4tqyYEtiIgfyr99LIdPcdFZpmLjPCxyn+YexbYIoOefG5sJMBLJfMD6Rs
 jLXAkdYMVjsHJRKRE9mxMksxvXzLfyUwVFUpJmz6US6Wxs2B/VSpvpdB5+LOnlVgBxMF
 w3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105379; x=1720710179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RpEult+PpmNSByOOg7rpoXoPutAbjsE547878wS6dE=;
 b=QRMbx5l3hmoWx+H2FgjZhJPY9q1fbuFdB1HG53RIR1LxogcQlc+SCy49R1KANINOU3
 82hyVrdqcbfJa5YEhhxqoiLn0MZN7CFwj1P78WWKxyqmhzDeSAYisD1nOM1TMRP5xugj
 7imP42Osp1Pg+9dDAsWFim5+0AhWp7dGFQEL5CSPhG0Am/xLHBmNCmF90f3gMjQceEYm
 S6Fa/BwgLXOpdhzvdkeIFTr4hRYJT2lYXTMbJ1tWK7wwKkc73S/71Peb8Xi1mFjwO/L3
 1eJxx5pQjHEBfY6I7lnz9HEcJ4NGrAIfJyppCRW9sC5E3zuJtcDZnZtfuTPHzfTUqDC+
 7T0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEKMBejTGbxyJL7ilNyiYEZr91atthNwDxAPJzmawatRt8PQC8Vu127YBZYLiUEcvyvPqI4IW8ndrRhnXFDnpsxignJfSwENPb4T4sN4xg
X-Gm-Message-State: AOJu0YxjuMknGJr+Wymzg8lQtCmwlOPmM/gcRoTQmXEH4WpoEBpnBLWl
 Dx8nqwi557jfW0NrjSOhKFfuQ6Rq6H4qZDPqOlm33BnJSxEm+xjoMWLg9B4an3icveie5rXzsvf
 XwZRWfQIPBVMfWUoALdhrHMhEx9xLEEQ+QfWcMw==
X-Google-Smtp-Source: AGHT+IEWiF8dmPUqO+MUVzpDwFotNDbkSv6rqQebrqrFFAWqvUWEde+EB1RkSLi4dXNcJF3GY4kgFC/uaKR3DkS8eNU=
X-Received: by 2002:a81:431f:0:b0:633:8b49:f97c with SMTP id
 00721157ae682-652d842fd27mr19039267b3.37.1720105379294; Thu, 04 Jul 2024
 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
 <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
 <20240704-jumping-saffron-shrew-d5f3b7@houat>
In-Reply-To: <20240704-jumping-saffron-shrew-d5f3b7@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 18:02:47 +0300
Message-ID: <CAA8EJpr69SoJFu0DMN0+Sk3Ayd7VQG_hPiy3MCfPnN34sR5ADg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/bridge-connector: reset the HDMI connector
 state
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

On Thu, 4 Jul 2024 at 15:56, Maxime Ripard <mripard@kernel.org> wrote:
>
> hi,
>
> On Tue, Jul 02, 2024 at 12:48:55PM GMT, Dmitry Baryshkov wrote:
> > On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> > IGT chokes on the max_bpc property in several kms_properties tests due
> > to the the drm_bridge_connector failing to reset HDMI-related
> > properties.
> >
> > Call __drm_atomic_helper_connector_hdmi_reset() if the
> > drm_bridge_connector has bridge_hdmi.
> >
> > It is impossible to call this function from HDMI bridges, there is is no
> > function that corresponds to the drm_connector_funcs::reset().
> >
> > Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/Kconfig                |  1 +
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 1a192a45961b..bfd025f8c7b5 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -9,6 +9,7 @@ config DRM_DISPLAY_HELPER
> >  config DRM_BRIDGE_CONNECTOR
> >       bool
> >       depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
> > +     select DRM_DISPLAY_HDMI_STATE_HELPER
>
> Sorry, I notice it on that patch, but it's really on the previous one:
> both DRM_BRIDGE and DRM_DISPLAY_HELPER are meant to be selected, not
> depended on.

I think they are selected by the 'driver' drivers, but they are
depended upon by the sub-devices. So all bridges depend on DRM_BRIDGE
(either directly or via the menu entry).
All drm/display modules depend on DRM_DISPLAY_HELPER. I agree that it
might be worth changing the second part (most likely in a separate
series, ok), but I'm sure that the DRM_BRIDGE part is correct.


>
> Otherwise,
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime



-- 
With best wishes
Dmitry
