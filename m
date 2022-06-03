Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B259253CBD8
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 16:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434F10FD0A;
	Fri,  3 Jun 2022 14:56:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7C10FD0A
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jun 2022 14:56:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y19so16426064ejq.6
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4a6KGVhjH6y6xz434jAPlzbw5+tQRvsZavD2ogDpA40=;
 b=ZN3iQHwhLE5qo3rpIL9Vu2Mv6k9taHjnyCkzFkyAhP4P7SnJwDM7bilg9UU1yypXH6
 RfcQ1ogSV7zl6uyFog1yuB3eOMNolwbpUyMFaE7GJxP81N7/S8fMUQJ/4QfAoKIFpoZs
 PQEi07K/NfJ7a7p7Y/j2BZ1ueqkgKprsgDVZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4a6KGVhjH6y6xz434jAPlzbw5+tQRvsZavD2ogDpA40=;
 b=Q9hpJmakQYRNKisnUHBRgZgMfdg694o+bGox/5Zp1m0795KBuZNS4iIwDstFt8wB+c
 eDB0e2z7ShJ89xAomYdxs4ostsjR4MDbG9AL3llnc1DJKm2H0A3IiUA3p3FKaJE6IfRE
 ZqMtV7/RQ0mH6LzMWlG4DBlC4mPFgvwpCwYBv1fDvTDQIuV2pAUrBQA98jM8S62NQrUw
 hh6xPh1ltJRSDqwDA88Cj7GBm3LJhZeeEuk7rkdqSzAUPRiDjqJNqWuoaqiRQlalg1Rs
 L4zNSkQqWJGBN7t8vc951pKd1fct+POFowCbu07adwLQVRcqXd1lJCkRmJEOAET6HwKK
 csIQ==
X-Gm-Message-State: AOAM532TOYGVj1SNH9swzwalExddawFtucCeLq5K78/7Nva5JCA9befC
 Cw/ChDP3ACpfxk0vp2u+VfSp+HzfKxLQ85nQs9s=
X-Google-Smtp-Source: ABdhPJzApJB1Trgchu6N/U08Zs07W4QKrWwpSSaQihG7zVkHJXn4v+m2EraE3sbd3uApu8mCAeN0ug==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr8848534ejc.260.1654268198997; 
 Fri, 03 Jun 2022 07:56:38 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 ex1-20020a170907954100b007052b183d51sm2895737ejc.132.2022.06.03.07.56.30
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 07:56:34 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id h5so10772801wrb.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 07:56:30 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr8307872wry.513.1654268189313; Fri, 03 Jun
 2022 07:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
 <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
 <20220603141405.dybjn3blifau6662@penduick>
In-Reply-To: <20220603141405.dybjn3blifau6662@penduick>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Jun 2022 07:56:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy_HnshYRcLFRddo0-w=v6sfnzhRYJd+eH0S7uMPxqaQ@mail.gmail.com>
Message-ID: <CAD=FV=Wy_HnshYRcLFRddo0-w=v6sfnzhRYJd+eH0S7uMPxqaQ@mail.gmail.com>
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
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 3, 2022 at 7:14 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Jun 03, 2022 at 01:19:16PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > > > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > > > * In general we have a "struct device" for bridges that makes a good
> > > > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > > >   device. That's not the right device to use for lifetime management.
> > > > > > >
> > > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > >
> > > > > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > > > > introduce them as DRM-managed, and not device managed.
> > > > > >
> > > > > > Otherwise, you'll end up in a weird state when a device has been removed
> > > > > > but the DRM device is still around.
> > > > >
> > > > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > > encoder device. I wasn't personally involved in discussions about it,
> > > > > but I was under the impression that this was expected / normal. Thus
> > > > > we can't make this DRM-managed.
> > > >
> > > > Since I didn't hear a reply,
> > >
> > > Gah, I replied but it looks like somehow it never reached the ML...
> > >
> > > Here was my original reply:
> > >
> > > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > > * In general we have a "struct device" for bridges that makes a good
> > > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > >   device. That's not the right device to use for lifetime management.
> > > > > >
> > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > > > introduce them as DRM-managed, and not device managed.
> > > > >
> > > > > Otherwise, you'll end up in a weird state when a device has been removed
> > > > > but the DRM device is still around.
> > > >=20
> > > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > encoder device.
> > >
> > > bridge->dev seems right though?
> > >
> > > > I wasn't personally involved in discussions about it, but I was under
> > > > the impression that this was expected / normal. Thus we can't make
> > > > this DRM-managed.
> > >
> > > Still, I don't think devm is the right solution to this either.
> > >
> > > The underlying issue is two-fold:
> > >
> > >   - Encoders can have a pointer to a bridge through of_drm_find_bridge
> > >     or similar. However, bridges are traditionally tied to their device
> > >     lifetime (by calling drm_bridge_add in probe, and drm_bridge_remove
> > >     in remove). Encoders will typically be tied to the DRM device
> > >     however, and that one sticks around until the last application
> > >     closes it. We can thus very easily end up with a dangling pointer,
> > >     and a use-after-free.
> > >
> > >   - It's not the case yet, but it doesn't seem far fetch to expose
> > >     properties of bridges to the userspace. In that case, the userspace
> > >     would be likely to still hold references to objects that aren't
> > >     there anymore when the bridge is gone.
> > >
> > > The first is obviously a larger concern, but if we can find a solution
> > > that would accomodate the second it would be great.
> > >
> > > As far as I can see, we should fix in two steps:
> > >
> > >   - in drm_bridge_attach, we should add a device-managed call that will
> > >     unregister the main DRM device. We don't allow to probe the main DRM
> > >     device when the bridge isn't there yet in most case, so it makes
> > >     sense to remove it once the bridge is no longer there as well.
> >
> > The problem is that I do not see a good way to unregister the main DRM
> > device outside of it's driver code.
>
> That's what drmm helpers are doing though: they'll defer the cleanup
> until the last user has closed its fd.

I'm a bit confused here. I'll take the concrete example of ps8640
since that's what I was working on here.

...right now the fact that we're using devm means that
drm_bridge_remove() will get called when a ps8640 device is unbound,
right? I guess you're saying that the "drm_bridge" memory needs to
outlast this, right? That being said, even if the actual memory for
drm_bridge outlasts the ps8640 driver lifetime, much of the data would
need to be marked invalid I think. If nothing else all function
pointers that point into the driver would have to be made NULL, right?
Once the device has been unbound it's possible that the underlying
module might be removed. I suspect that we'd need to do more than just
bogus-up the function pointers, though.

...so it feels like any solution here needs to take into account
_both_ the lifetime of the "struct device" and the "struct
drm_device". If the "struct device" goes away but the "struct
drm_device" is still around then we need to essentially transition the
"struct drm_device" over to a dummy, right? In my perhaps naive view
that means that a dmm_bridge_add() wouldn't be enough because it
wouldn't know when the "struct device" went away.


> > >   - When the DRM device is removed, have the core cleanup any bridge
> > >     registered. That will remove the need to have drm_bridge_remove in
> > >     the first place.
> > >
> > > > I'll assume that my response addressed your concerns. Assuming I get
> > > > reviews for the other two patches in this series I'll plan to land
> > > > this with Dmitry's review.
> > >
> > > I still don't think it's a good idea to merge it. It gives an illusion
> > > of being safe, but it's really far from it.
> >
> > It is more of removing the boilerplate code spread over all the
> > drivers rather than about particular safety.
> >
> > I'd propose to land devm_drm_bridge_add (and deprecate calling
> > drm_bridge_remove from the bridge driver at some point) and work on
> > the whole drm_device <-> drm_bridge problem in the meantime.
>
> Do you really expect that to happen? :)
>
> Anyway, it's been merged, it's too late now anyway. I don't really feel
> like it's a good thing, but it doesn't really make the situation worse
> either.

A revert is really not that hard to do if the consensus is that we
really don't want this.


-Doug
