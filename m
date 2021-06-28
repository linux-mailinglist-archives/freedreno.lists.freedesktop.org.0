Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9843B6B85
	for <lists+freedreno@lfdr.de>; Tue, 29 Jun 2021 01:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD7A6E5A4;
	Mon, 28 Jun 2021 23:44:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD336E5A4
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 23:44:56 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id o198so4360736vkc.4
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
 b=gHLbIqQSZA+sYnsVzhDgRcVbz0BRC2ayMuV17e7qZzEMN4HF7dGJqkddBXrMM4rghH
 GeoQQojrKE9FUO/96fJpvJ2tOoQooUQ3iwBawTeKxoxyRmQWpCw0i7GfqY+OyikgTU11
 SFjZOVK0ZexOcYN4FekunaLJlFEWU2wL6ijfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
 b=HRIu37PWHV8of7ZjsmEJvXPWIekSRy4oVplCuGoR9RygDX5rd3hGfGpBBOcYrQpSSQ
 kyy6jdlZC1DZuWvsLqTAxeUum9vZE6FpvKqA+wvLPJI7aDyDfrfi/8qEWC5piiXDXSRP
 iHfatGOor2PdUpFPJr+v864Ivq9AvgByh2qNoZXVNa84XqsVYnQsC9F3C2J8d5bLkHI6
 l7uskZ5tFUsYwZS3NHM9KHhpdLxPEaCxZKbqny9eAmCFrFkcadxo0j2TcT7MvBpjreVt
 yBLGiG7w4AZv3OGM7ud7KDgwffj/AlY8i1RS/oAI1VvluayZnfPv4POdouky6Cs69MyI
 qoZA==
X-Gm-Message-State: AOAM532lgy0Uc3c7d7UxFvVGd14o3e4pes/QSugmLga8X6CLbWAwnA/E
 c3VRaWovsuSQq7rzNzwzHwki82/g8BmhA9zSWQgEHg==
X-Google-Smtp-Source: ABdhPJzu8m7WzPUvBstEnrLdEWviDthvRrwmL0ifVahCxK9zdAzvpMQjspmMVmZthMZJ0Wl9qUBJ9r+Xqn08qNV929U=
X-Received: by 2002:a1f:4582:: with SMTP id s124mr19508263vka.10.1624923895693; 
 Mon, 28 Jun 2021 16:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
 <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
 <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
In-Reply-To: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 29 Jun 2021 07:44:44 +0800
Message-ID: <CANMq1KAO_4udNPsSQ+D3d=+Zhqj9KudNvTSQa5GpTXNUMPFUgA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags
 disabling features
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jun 28, 2021 at 7:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > >                 dsi->mode_flags =
> > > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> > >
> > > Same, just delete the flag.
> > >
> > > These are all just semantic bugs due to the ambiguity of the flags, it is
> > > possible to provide a Fixes: flag for each file using this flag the wrong way
> > > but I dunno if it's worth it.
> >
> > Wow nice catch.
> >
> > I think we should fix all of those _before_ my patch is applied, with
> > proper Fixes tags so that this can be backported to stable branches,
> > even if it's a no-op. I can look into it but that may take a bit of
> > time.
>
> This is fixed now, please will you proceed with this patch, because I
> really like it!

Thanks for the ping, that fell off my radar, v2 on its way ,-)

> Yours,
> Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
