Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA707CF683
	for <lists+freedreno@lfdr.de>; Thu, 19 Oct 2023 13:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEB710E4C7;
	Thu, 19 Oct 2023 11:20:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9210E4C6
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 11:20:03 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a7ab31fb8bso93798537b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697714402; x=1698319202; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LClJmbXBbgZZ9PL/ptRr8uW+H9M+Lhuk/jPg67TAQuM=;
 b=O8vbAMF5xTWu58Gjoai9PrWnsc+u1HBs/J7fCB1/uXHERS2Elh5CNc4yLFnM+zfk63
 DaM/9gYUi39ZMGgomPPelh2h+y+2sLYv2hV3ctIfMV5Mpn94SBkg8HJptHFFZeP/Q7b+
 l70sGuPYn77US3+NxvHTi3rT29aDr1tVSR1J+37DSVxoqBrmtCAorWpZQT1E+BxoTDgd
 l8O+qW32LxPJgUpGpWl/nzqgVifQKrZqaLm0SBEKdiJpeFAjDDBHvZkoXld1PQ2diqNB
 gyCnD/3czyBNZRlOa1vdKJlaoZrFsjt+71MTST4PBJw4axv/xhUvmTXZ2n8nEdu8245J
 fRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697714402; x=1698319202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LClJmbXBbgZZ9PL/ptRr8uW+H9M+Lhuk/jPg67TAQuM=;
 b=Nyh6EIENEetM/+b7EXrmYVV5TNrJqtR+88iYYrSLccZAH9U1tSJVRzv4XGK3lL/wHl
 9otMzYwQ3ii+A/yE0mBruU0O8mtJtNGfwX2+Lss2biLf5hJW0F9+EwWVVm1JSsJSAs5+
 mH5k88mrOh5IG5K/iy9h+pd0kf2itBCI7jPP5LSJOx3HzYcrpib53iRxovtYxWhz04MB
 DM3LFRlAn8M1bxEeEuBIaH+j2bVYf53qGe1EM/ql39P+xtqLc3j6FxasWDGj6HjlbmvT
 7ci7yFfU6DNPgl9l2wjL2t+gxoNSlVIsdcrg94hxx+nUXt+Fn+G3MSj8IzqBFyR9gM6w
 Xk1w==
X-Gm-Message-State: AOJu0YyfT1wUNpxBciAqxb2GWtNwsFy/Ja52sGJjFUZLFax5oers+6eM
 t6FEaQakrxXCrb9MVqAt26QKQGrTbzzkMl4OSWkq9A==
X-Google-Smtp-Source: AGHT+IHsKrnC+HnnF2UK0XWJsB/bhHUzaseUh9wgYFQMhnXiNl5Q/h72pZzdPFWB8GR4VoHaQazj+FeGDz8qhVkt4fA=
X-Received: by 2002:a25:285:0:b0:d9a:5f91:c616 with SMTP id
 127-20020a250285000000b00d9a5f91c616mr2004733ybc.46.1697714402196; Thu, 19
 Oct 2023 04:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
In-Reply-To: <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Oct 2023 14:19:51 +0300
Message-ID: <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 03/10] drm/mipi-dsi: add API for manual
 control over the DSI link power state
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > The MIPI DSI links do not fully fall into the DRM callbacks model.
>
> Explaining why would help

A kind of explanation comes afterwards, but probably I should change
the order of the phrases and expand it:

The atomic_pre_enable / atomic_enable and correspondingly
atomic_disable / atomic_post_disable expect that the bridge links
follow a simple paradigm: either it is off, or it is on and streaming
video. Thus, it is fine to just enable the link at the enable time,
doing some preparations during the pre_enable.

But then it causes several issues with DSI. First, some of the DSI
bridges and most of the DSI panels would like to send commands over
the DSI link to setup the device. Next, some of the DSI hosts have
limitations on sending the commands. The proverbial sunxi DSI host can
not send DSI commands after the video stream has started. Thus most of
the panels have opted to send all DSI commands from pre_enable (or
prepare) callback (before the video stream has started).

However this leaves no good place for the DSI host to power up the DSI
link. By default the host's pre_enable callback is called after the
DSI bridge's pre_enable. For quite some time we were powering up the
DSI link from mode_set. This doesn't look fully correct. And also we
got into the issue with ps8640 bridge, which requires for the DSI link
to be quiet / unpowered at the bridge's reset time.

Dave has come with the idea of pre_enable_prev_first /
prepare_prev_first flags, which attempt to solve the issue by
reversing the order of pre_enable callbacks. This mostly solves the
issue. However during this cycle it became obvious that this approach
is not ideal too. There is no way for the DSI host to know whether the
DSI panel / bridge has been updated to use this flag or not, see the
discussion at [1].

Thus comes this proposal. It allows for the panels to explicitly bring
the link up and down at the correct time, it supports automatic use
case, where no special handling is required. And last, but not least,
it allows the DSI host to note that the bridge / panel were not
updated to follow new protocol and thus the link should be powered on
at the mode_set time. This leaves us with the possibility of dropping
support for this workaround once all in-kernel drivers are updated.

> > The drm_bridge_funcs abstraction.
>
> Is there a typo or missing words?

missing comma in front of The

>
> > Instead of having just two states (off and on) the DSI hosts have
> > separate LP-11 state. In this state the host is on, but the video
> > stream is not yet enabled.
> >
> > Introduce API that allows DSI bridges / panels to control the DSI host
> > power up state.

[1] https://lore.kernel.org/dri-devel/6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org/

> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
> >  include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
> >  2 files changed, 56 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> > index 14201f73aab1..c467162cb7d8 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> >
> > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     return ops && ops->power_up;
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> > +
> > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     if (!mipi_dsi_host_power_control_available(host))
> > +             return -EOPNOTSUPP;
> > +
> > +     return ops->power_up ? ops->power_up(host) : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> > +
> > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     if (!mipi_dsi_host_power_control_available(host))
> > +             return;
> > +
> > +     if (ops->power_down)
> > +             ops->power_down(host);
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> > +
>
> If this API is supposed to be used by DSI devices, it should probably
> take a mipi_dsi_device pointer as a parameter?

Ack.

>
> We should probably make sure it hasn't been powered on already too?

Ack, I can add an atomic count there and a WARN_ON. However I don't
think that it is a real problem.

>
> Maxime



--
With best wishes

Dmitry
