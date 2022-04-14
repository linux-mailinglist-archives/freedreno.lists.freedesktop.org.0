Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A863501C5D
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 22:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305CD10E202;
	Thu, 14 Apr 2022 20:09:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CB510E325
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 20:09:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id r13so12094463ejd.5
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
 b=oM2qYDjzsXJDUAHNx6vFqnV1+qnLdL1Xe5C3dzmC66+quS3wWWGkaNIQsO9Yy8nXam
 YG0sUWZXbEJhoHkK57/0Iw5a6LpPk/LwtPQH0w6pgdrknxCmSrmIE74V2aZZjHJfEvdO
 3quH4CB8aG16ID9RExDHT4l4sF/8MSw6AwssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
 b=yEhyp4CtzG1YYBNkqTXol10Dg8jodDD5hh9VTr9sL9kN9c5XwoAeEh0I+dMM/GqjeI
 YMNvQtio+2gqkYwhNe8Errby/pY0FvH27mAqMAy+gy7jphG9w13VVUr9XYtycS71ZKpd
 yZ6jktygazGiTNajJtFKxkWUi0oWqs+R0Tess45fwdYTjwU34FpM9ktLXa8ZqOPerhV8
 uo1W1v6K/jMzzCr3DzBNDGCKe9qdH0esTZ5SOCR9A4Bz3eVi/MLRxruAc7CxtrKwJCmY
 iHMi6U4bE3kW3HcbRMXfhqJsB/4qg4rhUQPqzkFKkRgPaGapOVLL2Xrb1XRRdXafPhVb
 6OMg==
X-Gm-Message-State: AOAM532UZj+GgcU+sEmmjCpzxIrD+fHgg18mxdnh7rGMEnf3Uixz1ehG
 mzDOplVwsZYJy7x9YXQIMs6F04X5/b14fwoj0HE=
X-Google-Smtp-Source: ABdhPJwum+xOJFKd8/0MIzATziKmIkNy8H8GGftnJJL2uXQhQ7N8PTxQFZ0LlSYff2MsfefKFNcy1Q==
X-Received: by 2002:a17:907:7d9e:b0:6df:9fe8:856a with SMTP id
 oz30-20020a1709077d9e00b006df9fe8856amr3709207ejc.373.1649966960401; 
 Thu, 14 Apr 2022 13:09:20 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 w22-20020a056402269600b004194f4eb3e7sm1569549edd.19.2022.04.14.13.09.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:09:19 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g18so8346105wrb.10
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 13:09:18 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr3122026wrb.513.1649966957865; Thu, 14
 Apr 2022 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
 <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
In-Reply-To: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 13:09:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 1/4] drm/msm/dp: Add eDP support via
 aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 12:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
> >
> > I think it's too verbose and a bit incorrect.

Not sure which part you're asserting is incorrect, but shorter is OK w/ me too.


> > This is a bit saner:
> > /*
> >   * These ops do not make sense for eDP, since they are provided
> >   * by the panel-bridge corresponding to the attached eDP panel.
> >   */
> >
> > My question was whether we really need to disable them for eDP since for
> > eDP the detect and and get_modes will be overridden anyway.

Hmm, interesting. Probably for DRM_BRIDGE_OP_MODES that will work?
It's definitely worth confirming but from my reading of the code it
_probably_ wouldn't hurt.

One thing someone would want to confirm would be what would happen if
we move this code and the panel code to implement DRM_BRIDGE_OP_EDID
properly. It looks as if both actually ought to be implementing that
instead of DRM_BRIDGE_OP_MODES, at least in some cases. A fix for a
future day. Could we get into trouble if one moved before the other?
Then the panel would no longer override the eDP controller and the eDP
controller would try to read from a possibly unpowered panel?

So I guess in the end my preference would be that we know that driving
the EDID read from the controller isn't a great idea for eDP (since we
have no way to ensure that the panel is powered) so why risk it and
set the bit saying we can do it?


For hotplug/detect I'm even less confident that setting the bits would
be harmless. I haven't sat down and traced everything, but from what I
can see the panel _doesn't_ set these bits, does it? I believe that
the rule is that when every bridge in the chain _doesn't_ implement
detect/hotplug that the panel is always present. The moment someone
says "hey, I can detect" then it suddenly becomes _not_ always
present. Yes, I guess we could have the panel implement "detect" and
return true, but I'm not convinced that's actually better...


> And to go further, I'd expect that a bridge should expose the
> functionality that it supports, regardless of what is connected down the
> chain. Otherwise we won't be able to mix and match bridges because the
> code is brittle, making assumptions about what is connected.

From my point of view the bridge simply doesn't support any of the
three things when we're in eDP mode. Yes, it's the same driver. Yes,
eDP and DP share nearly the same signalling on the wire. Yes, it's
easily possible to make a single controller that supports DP and eDP.
...but the rules around detection and power sequencing are simply
different for the two cases. The controller simply _cannot_ detect
whether the panel is connected in the eDP case and it _must_ assume
that the panel is always connected. Yes, it has an HPD pin. No, that
HPD pin doesn't tell when the panel is present. The panel is always
present. The panel is always present.

So, IMO, it is _incorrect_ to say we can support HPD and DETECT if we
know we're in eDP mode.

-Doug
