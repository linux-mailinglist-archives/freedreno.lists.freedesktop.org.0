Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B799EE1F2
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 09:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B410ED03;
	Thu, 12 Dec 2024 08:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oPGG7VeO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567F10ED07
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 08:53:48 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6f00b10bc1dso3047157b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993627; x=1734598427; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jZEBuK4pOs6c3HTWubegCnIiZHcjHaJUyWhFqCq+52Q=;
 b=oPGG7VeOAL1v+AMjguKSh1pq684KEVpzrGVbMnn4PoBSVWkVDQf6YFhtf//lmmrEBn
 9X9qQYOhn09NS4aoyHug3VdjBqWx1oTfFOulpzp6S82FDguV7SZDhe996iei8X9JChI+
 f/j04AjrTzTdfPC+xh2PCLM1hA6Hv5zBUO+O0aNUf1wfda2dtB4xoslpmWRQxYVgDf0I
 R3UZyFMZr4Ntriv5rg9CyS/JEI981S4OOn3BWtb4QrNC6Cn49sno5sai6qbP82/1EQDn
 pRcSBZljwKX7LDFskw9DQK0/+1X0Sqz4b47xlvtEbWuaK3dqscBEWgSbmnx5azXbh2uv
 ygwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993627; x=1734598427;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZEBuK4pOs6c3HTWubegCnIiZHcjHaJUyWhFqCq+52Q=;
 b=PMi6TkKwlPWcwGWgMzU3QjQVY5O19QrxtFfkLrw/EnHLyjTAmLfhngkh7DEp9NI9OY
 xSYB/Y6GxOBzrBUQ+qQJrJg6xTBURPWZk4+OWwE85ev2FjVqUS1GO8q6kfMS3rE7AswE
 N2pwiYSmz1yigYtktBL5DxHanaUHlRLfrQSktADbSCJYdrYPz78D2bX32+yMXsv/28vC
 LTw895l3Ahfe7+hju81Dy/3GlNYDOEw4ujzs7LaWI9VXEj8hjsVpjxHIqYCtmHG/v4+F
 boGK4IUrZ92bNdtPalT4LcT+XYONJhLuIzacv5uhuTsXIG5ZoV5FDyuD0joJGDtdpEs7
 v2eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm0ixBbhuX3O9mcXzr13nyr5Y4O0/AIa/L9VvRme99qZ8omAvZw1jt9my/zTmTvpnrzynrwbqfnf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTKITJ3U2vm0p16sf3vh3AohWdMIatTOR9V7UFPUHDOAacUyqs
 J/f8BqGuE1o0iYiW2F3REyEMoWVhnXdvS0qgCAIdASd67nRQd7DCEpPCX9Kurj3SIwFLEu2OjQu
 oVC0BNmWojSeSBHQdA8bGp6a9xpPnrFfAYC/P2g==
X-Gm-Gg: ASbGnctwtqCuRgqztSNVNsymnqpNG8cgdxJRW+8P7h+2XYyjfHeF/BYM0ntWcD1uLmV
 C9Uxm4G0gPlIsvOD7BngUYHE/doDaH/wvewjj0g==
X-Google-Smtp-Source: AGHT+IHuMMpUZGzgJIoL8iRVB5xsC/iPL+AehWPaIVJ9O3e0hF+WNkPHFm5l3HR7vE/h6cbNRSKgt6leTQzgEfKxics=
X-Received: by 2002:a05:690c:dd4:b0:6ef:69c4:4dac with SMTP id
 00721157ae682-6f19e4f3f86mr22422457b3.15.1733993627421; Thu, 12 Dec 2024
 00:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
 <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
In-Reply-To: <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:53:38 +0200
Message-ID: <CAA8EJppthF3aVq0T2FmjLRNySP2pW36QnEXoWt5fFAKh+Nmz5A@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 12 Dec 2024 at 05:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > All other submodules pass arguments directly. Drop struct
> > msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> > all data to msm_dp_panel_get() directly.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
> >   drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
> >   drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
> >   3 files changed, 11 insertions(+), 23 deletions(-)
> >
>
> Change not necessarily tied to catalog cleanup, and can be sent
> independently IMO.
>
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> >   {
> >       int rc = 0;
> >       struct device *dev = &dp->msm_dp_display.pdev->dev;
> > -     struct msm_dp_panel_in panel_in = {
> > -             .dev = dev,
> > -     };
> >       struct phy *phy;
> >
> >       phy = devm_phy_get(dev, "dp");
> > @@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> >               goto error_link;
> >       }
> >
> > -     panel_in.aux = dp->aux;
> > -     panel_in.catalog = dp->catalog;
> > -     panel_in.link = dp->link;
> > -
> > -     dp->panel = msm_dp_panel_get(&panel_in);
> > +     dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
> >       if (IS_ERR(dp->panel)) {
> >               rc = PTR_ERR(dp->panel);
> >               DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >       return 0;
> >   }
> >
> > -struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
> > +struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
> > +                           struct msm_dp_link *link, struct msm_dp_catalog *catalog)
> >   {
>
> so this API, takes a filled input panel, makes a msm_dp_panel out of it
> by filling out more information on top of what was already passed in and
> returns a msm_dp_panel.
>
> So IOW, converts a msm_dp_panel_in to msm_dp_panel.
>
> What is the gain by passing individual params rather than passing them
> as a struct instead? Isnt it better to have it within that struct to
> show the conversion and moreover we dont have to pass in 4 arguments
> instead of 1.

We gain uniformity. All other modules use params. And, as pointed out
by Maxime during HDMI Codec reviews, it's easier to handle function
params - it makes it more obvious that one of the params got missing.

-- 
With best wishes
Dmitry
