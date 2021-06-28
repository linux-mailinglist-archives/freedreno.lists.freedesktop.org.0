Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F93B5CF8
	for <lists+freedreno@lfdr.de>; Mon, 28 Jun 2021 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5726E42D;
	Mon, 28 Jun 2021 11:10:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AF86E42F
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 11:10:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f13so25115398ljp.10
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
 b=GWKNCASd9MPmyxEUsoGR9JzIVqWCjK0OSZF1l1oCdifzvEDMqh0KUYe3MV8Dgbr+PA
 la9gyUtlwDg0n3+3jlE9gokVLM6wdEqMHpYm1GUNKILSnuRdU+RgBU7sRxOUjljpyx1u
 zKT2T7iMjOJzomPtHeovnBESXt8hdlSg1o9l9GDzfxR/6G/S3tgN1K7+yyCGozJ1EgyI
 9PvkiqVsL1bXqLvS7gQ+U/3JwHmPIo1Hy4i7AHzDiPuPyOEXwm7HJstY+KYKcy+at9Yg
 H1VQ4aM1iq7p8brNaOJS61SqZPEocFRr1bHCErosV2zAZJTQ2DzKJf/Yr1Gt16mOzVxo
 1abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
 b=CQ4B0hToDjzH4tzk9Lgfl3ycrNDJGmGL9QOwB9Bpdjk8RP4vGwkj80ms5KYLBrslYY
 CEmm8BqbeCYTZGHzuRrjjI2VBPwmvDjVnDQHGQmLFCsGKR2mS6bFph8xyN3JZ9J7dBX6
 cWqcimYB1AN+wuXuo3JvhwqO+Re6wZ4lmm7KM8+v/Kz2g6ebfTgG+EQJGJTQhcTtIbjr
 Vs38ml6A4sgB+LichzwF/gmfVMrwyQeWoEoHQuI7XGrqdOrpnb+raG7cpsMNoUOmWklj
 8CCyBhFdBNJkZJhNDYv9hqDQcsLP3ETtAzJ2DHdV42NOJm2F30rqRiL2oXbV/1wlbgJd
 F0+A==
X-Gm-Message-State: AOAM5318GuoMXoLa4HuLCJ9DAgM+OhCG6SfKa6QrSSalBJy8w1Z5EQTw
 ilBjfmsHUAFuvUXviuIyew6mbuvH0kcBwN7b4DJK+A==
X-Google-Smtp-Source: ABdhPJzyEQpk+qVTQTN61ga94Up2dG17/tdSZ8ryGBxDStAhbzvUPZemkx4xWP9DPdoHPznWcXaHK8zDx3IUoLZtJDU=
X-Received: by 2002:a2e:9483:: with SMTP id c3mr19694556ljh.273.1624878635125; 
 Mon, 28 Jun 2021 04:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
 <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
In-Reply-To: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Jun 2021 13:10:23 +0200
Message-ID: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
To: Nicolas Boichat <drinkcat@chromium.org>
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

On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > >                 dsi->mode_flags =
> > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > Same, just delete the flag.
> >
> > These are all just semantic bugs due to the ambiguity of the flags, it is
> > possible to provide a Fixes: flag for each file using this flag the wrong way
> > but I dunno if it's worth it.
>
> Wow nice catch.
>
> I think we should fix all of those _before_ my patch is applied, with
> proper Fixes tags so that this can be backported to stable branches,
> even if it's a no-op. I can look into it but that may take a bit of
> time.

This is fixed now, please will you proceed with this patch, because I
really like it!

Yours,
Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
