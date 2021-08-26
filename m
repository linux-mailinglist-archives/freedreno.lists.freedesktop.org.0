Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58513F8FB4
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 22:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307986E8BB;
	Thu, 26 Aug 2021 20:36:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931C76E8B8
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 20:36:18 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z1so5413336ioh.7
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
 b=VZbC9LJdjvm7jBIyQ99wpnFBXRhf/RtavRPrmiWlpnBkMX5G2PEaCCDA0eZpnirKCK
 rYivpqDHjpUeYYuxVPPrkWyKbtMNCAR8T0WpQhagK1uWeMtJX+uXPlYF2ZPbRa0A29zC
 YImvafN9RqYP7O0dVpcGpMgKLCwbxPpZnMZ8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
 b=ksmUbgKDLjnwrHsIsBrd/JJcI/n05tUHi5s7nmkqe46tnwFhND9VpW1Rod6LWPqxeF
 lZhr+AYXyYK+rYKuHaAUF6exZ3SY8xXf7Bt4ekv/BqSddnJF5RpIRNqmDtG96uV8ofw/
 +7/sxeWWCnA13tFkv0hbrFS0AAVWeW9uFMhaX8hRYyZOwlH11bDeO7vTGZV2II+Cjb02
 bWR13Uy2Dg0glBP5AmIL9MwUgjdoZuoWmq3zWJWtyayM9jtL2JFqpx9ZJ1ZbiIq6ZLIP
 o5VDMB8u8dxmWMcMWZfRY8OfTvWTd4tI7kvZfeAlR0xU9mmvmdyyldoITnVuma3g2VnZ
 n5cg==
X-Gm-Message-State: AOAM532GrQLNR00A35+IGXoUGETpP0Bw+krQqAZzF7GbM6lJw5GzcVHb
 cWz78+t2BFX+iKr0yBT87CMrARUMLQTFpw==
X-Google-Smtp-Source: ABdhPJwHk/h9Z4MNy99LNF+q4vvbnmxPOyBEjDi9Qjtj2w9DipK9+3ohTM5kPjA3SKDB7IAcb+pF9A==
X-Received: by 2002:a5d:8986:: with SMTP id m6mr4489856iol.87.1630010177791;
 Thu, 26 Aug 2021 13:36:17 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id n11sm2260781ilq.21.2021.08.26.13.36.16
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:36:17 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id j15so4645928ila.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
X-Received: by 2002:a92:d304:: with SMTP id x4mr4140800ila.82.1630010176526;
 Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
In-Reply-To: <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Aug 2021 13:36:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vara Reddy <varar@codeaurora.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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

Hi,

On Wed, Aug 25, 2021 at 6:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-07-26 16:13:51)
> > eDP panels might need some power sequencing and backlight management,
> > so make it possible to associate a drm_panel with a DP instance and
> > prepare and enable the panel accordingly.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > This solves my immediate problem on my 8cx laptops, of indirectly controlling
> > the backlight during DPMS. But my panel is powered when I boot it and as such I
> > get the hpd interrupt and I don't actually have to deal with a power on
> > sequence - so I'm posting this as an RFC, hoping to get some input on these
> > other aspects.
> >
> > If this is acceptable I'd be happy to write up an accompanying DT binding
> > change that marks port 2 of the DP controller's of_graph as a reference to the
> > attached panel.
>
> dianders@ mentioned creating a connector (and maybe a bridge) for the DP
> connector (not eDP)[1]. I'm not sure that's directly related, but I
> think with the aux bus code the panel isn't managed in the encoder
> driver. Instead the encoder sees a bridge and tries to power it up and
> then query things over the aux bus? It's all a little too fuzzy to me
> right now so I could be spewing nonsense but I think we want to take
> this bridge route if possible.
>
> -Stephen
>
> [1] https://lore.kernel.org/r/CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com/

The idea of modeling the connector as a bridge is something that makes
sense to me, but it probably makes sense to tackle that separately. We
don't need to block on it.

The whole DP AUX bus can also be tackled separately after the fact. It
really doesn't change things very much--we still have to find/attach
the panel. It just makes the panel probe in a slightly different way
and as a side effect gives the panel access to the DP AUX bus.

-Doug
