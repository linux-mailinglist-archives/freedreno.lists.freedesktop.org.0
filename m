Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CD41CE35
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 23:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E000E6E24D;
	Wed, 29 Sep 2021 21:32:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739DC6E284
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 21:32:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i4so16587756lfv.4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyvRXRJIN0JGO2z+iTfwM/2km8Qc2JRyvbE8jVheW14=;
 b=Tz1sGN5q0uPhAJZEBV1c2JFll3sO0aavEkQmgvrTC5DpecOKnV9Dug1agqnqXbCf+R
 HcwU/sLgwraouecgvM/0VmaTqor/Uxjcnh9e7yuJdoc9cj5PiTqB7hyujhf1pUjIgmMi
 MxpCBXc6uZSR0rfzOpZ6WgYGDXPJbUGtPGZKiUL9zagm3vf+IQ09TteKCT6NBT6sNgXM
 Bcao+esrUxW0ZVFzLS4q+O1i5GJVFdBkBUL/euVkyrhCSNI+/iY9Gn9nxFXN3vhD6NdA
 XE1PMXRUgbsjUtdwD2zkOH82wNl/kzfYQDFZ6zBhxW0v2BwXnxCSGpj1CEweJKIdb9r7
 F9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyvRXRJIN0JGO2z+iTfwM/2km8Qc2JRyvbE8jVheW14=;
 b=EdRpo2QkWtCFBfclrIQc5oZKBBaq+zbChJqRe82clgA0vlXSXSoFIJqBmctmgwMmob
 xeymyHXA89XUUFiBhZ0yVy9ftVVKZdvoAvJ5ngPs43dNXq/4jjSpFaHO4srW4QVzp60f
 Cv5zFkjiR1QXNZYycndvb7aMzk1LcpsEyj3WV/jh/x9IznctvoJqS6O+gzTWyVQq6mNE
 l/TktffO0mCz+6h1gANeL3F8zzdmPiW/mAGu6x9PrYMO0x54jBavdK0s3wwDgweqtS59
 gJxC0MIYuOEZsLF428hywWR3p8OiIR0BejRoSyZP6LyJGyGS/Zbe69cNqD7uV1MxKjSl
 k48A==
X-Gm-Message-State: AOAM532e26MOonlkSWQ0JPOYOHhnX9rm3+xeYtJMrc4ZDheJ1SlKobd3
 2Dnf+MneORFbkC5xfsFdDDO+iV2DLiCSp5Rb8XQYJw==
X-Google-Smtp-Source: ABdhPJzxjh5WV2S7M9wFWBsOPeN/ZTQy2ruhaonK+SblPudFb+1vFApq5vYIpNRNQCUmqkiX2geh0I3MqSfhloaCmUs=
X-Received: by 2002:a05:6512:ea5:: with SMTP id
 bi37mr2007442lfb.36.1632951146848; 
 Wed, 29 Sep 2021 14:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
In-Reply-To: <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 29 Sep 2021 14:32:14 -0700
Message-ID: <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <sean@poorly.run>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 lkml <linux-kernel@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>, 
 Inki Dae <inki.dae@samsung.com>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 00/24] drm/bridge: Make panel and bridge
 probe order consistent
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

On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > We've encountered an issue with the RaspberryPi DSI panel that prevented the
> > whole display driver from probing.
> >
> > The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:
> > Only register our component once a DSI device is attached"), but the basic idea
> > is that since the panel is probed through i2c, there's no synchronization
> > between its probe and the registration of the MIPI-DSI host it's attached to.
> >
> > We initially moved the component framework registration to the MIPI-DSI Host
> > attach hook to make sure we register our component only when we have a DSI
> > device attached to our MIPI-DSI host, and then use lookup our DSI device in our
> > bind hook.
> >
> > However, all the DSI bridges controlled through i2c are only registering their
> > associated DSI device in their bridge attach hook, meaning with our change
> > above, we never got that far, and therefore ended up in the same situation than
> > the one we were trying to fix for panels.
> >
> > The best practice to avoid those issues is to register its functions only after
> > all its dependencies are live. We also shouldn't wait any longer than we should
> > to play nice with the other components that are waiting for us, so in our case
> > that would mean moving the DSI device registration to the bridge probe.
> >
> > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > would be affected by this and wouldn't probe anymore after those changes.
> > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > requires to be tested), but the changes in msm seemed to be far more important
> > and I wasn't confortable doing them.
>
>
> Hey Maxime,
>   Sorry for taking so long to get to this, but now that plumbers is
> over I've had a chance to check it out on kirin
>
> Rob Clark pointed me to his branch with some fixups here:
>    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
>
> But trying to boot hikey with that, I see the following loop indefinitely:
> [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> [    4.681898] adv7511 2-0039: failed to find dsi host

I just realized Rob's tree is missing the kirin patch. My apologies!
I'll retest and let you know.

thanks
-john
