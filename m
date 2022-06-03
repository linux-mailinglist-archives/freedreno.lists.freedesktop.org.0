Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0B53C882
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 12:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB14710E5D1;
	Fri,  3 Jun 2022 10:19:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A6810E5D1
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jun 2022 10:19:27 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id s10so2120563qvt.8
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UMpW2GQFjbsAh4Z5E0cvPjEi6lZODEcP2+hYnwC+bE=;
 b=zkYz2hGQ1rahMqWa937cH83pVnLOTqmdXNQFV1d1uS6u6aMj6SPNQ9yOFFN00ysLMX
 jUuAr5G7K4WTsp3BRQ/W+wjUDU3Dd0I0+Ku7oPNjCuEGNCC0Ww7/T88ekjo7m8hkooCW
 wZjrIspW94cmLUoBhvkgkad+qwItBz0RGN2yAH9oxYP1JhVS2lT+VSN2HdfejhqjN+sP
 VxYoY7vUAdFgjk8lpGRJ9ntj+LeaIt5Ri18B5vb3zKIVQ3Se/4O7f/hKLIJl6Qj3nHnT
 N1RcbTDKcuGHQzkJbstZ9TgqQiLmHFFS8rpdNWxYzMk5r2oy4EqRV1nLAUM2gu4ezrOb
 XicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UMpW2GQFjbsAh4Z5E0cvPjEi6lZODEcP2+hYnwC+bE=;
 b=35TGsga/ObGQHM6GSVi70shAlZIY8cGcYIicKN53ww4naP5qMV49vT4s0NuntWk7m3
 P1H4M6ckwFpObhYC9hQBZpprV2Gl0JvRmnkBoc+jTyPDTJ3WAy/Rr/JBsKsWXoaP0Pzl
 sdf5+0eMcotqQCfKIplcgvigby6mbiWUUyR8Gww4Ojl8WYK6ATe6emRdCQIwfeQrjn1X
 T9wKCIlaWM+SJoV7Yvq8KhXY7qfqOn63xJeVRUjabttKx2CYCClwhqU1hXtF2nplRwme
 nTJHw7AR6M+YpZD7sXXjlu5RGlc9epZMiVR1Sh0Dj6dDMlkVBfHBw7cB/o6ZBk9PnGAf
 TcSg==
X-Gm-Message-State: AOAM530pk2Ndzu4h8HluQwNMKhEobo65U+TK1EQVpPjz7IV3Blbxlph7
 f/qExVrEGhU2pn6q8F8u3cDpY+0KiI3uj6JwSoEV4g==
X-Google-Smtp-Source: ABdhPJw8iJoGhy2MD45IsbCDP/yP/cDddSg1Ox604Dq9yoEDEqKfDIRzqKkUy7GFMX8kjhbpUdHowJBaBXsYNKHA+So=
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr8480006qvp.119.1654251567078; Fri, 03 Jun
 2022 03:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
In-Reply-To: <20220603082139.sfdxb5ndwpvlhklh@penduick>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 Jun 2022 13:19:16 +0300
Message-ID: <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
> > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > * In general we have a "struct device" for bridges that makes a good
> > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > >   device. That's not the right device to use for lifetime management.
> > > > >
> > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > > introduce them as DRM-managed, and not device managed.
> > > >
> > > > Otherwise, you'll end up in a weird state when a device has been removed
> > > > but the DRM device is still around.
> > >
> > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > encoder device. I wasn't personally involved in discussions about it,
> > > but I was under the impression that this was expected / normal. Thus
> > > we can't make this DRM-managed.
> >
> > Since I didn't hear a reply,
>
> Gah, I replied but it looks like somehow it never reached the ML...
>
> Here was my original reply:
>
> > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > * In general we have a "struct device" for bridges that makes a good
> > > >   candidate for where the lifetime matches exactly what we want.
> > > > * The "bridge->dev->dev" device appears to be the encoder
> > > >   device. That's not the right device to use for lifetime management.
> > > >
> > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > introduce them as DRM-managed, and not device managed.
> > >
> > > Otherwise, you'll end up in a weird state when a device has been removed
> > > but the DRM device is still around.
> >=20
> > I'm kinda confused. In this case there is no DRM device for the bridge
> > and, as per my CL description, "bridge-dev->dev" appears to be the
> > encoder device.
>
> bridge->dev seems right though?
>
> > I wasn't personally involved in discussions about it, but I was under
> > the impression that this was expected / normal. Thus we can't make
> > this DRM-managed.
>
> Still, I don't think devm is the right solution to this either.
>
> The underlying issue is two-fold:
>
>   - Encoders can have a pointer to a bridge through of_drm_find_bridge
>     or similar. However, bridges are traditionally tied to their device
>     lifetime (by calling drm_bridge_add in probe, and drm_bridge_remove
>     in remove). Encoders will typically be tied to the DRM device
>     however, and that one sticks around until the last application
>     closes it. We can thus very easily end up with a dangling pointer,
>     and a use-after-free.
>
>   - It's not the case yet, but it doesn't seem far fetch to expose
>     properties of bridges to the userspace. In that case, the userspace
>     would be likely to still hold references to objects that aren't
>     there anymore when the bridge is gone.
>
> The first is obviously a larger concern, but if we can find a solution
> that would accomodate the second it would be great.
>
> As far as I can see, we should fix in two steps:
>
>   - in drm_bridge_attach, we should add a device-managed call that will
>     unregister the main DRM device. We don't allow to probe the main DRM
>     device when the bridge isn't there yet in most case, so it makes
>     sense to remove it once the bridge is no longer there as well.

The problem is that I do not see a good way to unregister the main DRM
device outside of it's driver code.

>
>   - When the DRM device is removed, have the core cleanup any bridge
>     registered. That will remove the need to have drm_bridge_remove in
>     the first place.
>
> > I'll assume that my response addressed your concerns. Assuming I get
> > reviews for the other two patches in this series I'll plan to land
> > this with Dmitry's review.
>
> I still don't think it's a good idea to merge it. It gives an illusion
> of being safe, but it's really far from it.

It is more of removing the boilerplate code spread over all the
drivers rather than about particular safety.

I'd propose to land devm_drm_bridge_add (and deprecate calling
drm_bridge_remove from the bridge driver at some point) and work on
the whole drm_device <-> drm_bridge problem in the meantime.

-- 
With best wishes
Dmitry
