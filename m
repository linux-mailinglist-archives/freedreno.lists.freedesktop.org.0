Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ABD41CFE2
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 01:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406006E296;
	Wed, 29 Sep 2021 23:25:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE86E296
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 23:25:21 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m3so17211071lfu.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iudu1NuMMrBKlVbFNDhSrHphI49VjbXq5YXusn6JK4g=;
 b=WX5TKUFXXv+Fdy6tPXiPKfQZTjSwoKn7odf4rCT9Qlg0s8WjFFFdYja4MipzQmgFmw
 uR0pcTCAzcpEjBI3C27HAlDzIvRNU/sTfGLfoftKa7qSm4pR5XIpTwRHAXoX1PErTMsc
 yohx44i/ZIKON4aM+13vLJKCKBlJU9wRNspYRuExmjpneqt5fUBWx7hLYZCKm7wRaAJ5
 X/EbXZgGfBx8eCr9ZLxyWudx5QTp/077VcnjOwe123XapRub1qlN3NHXGLG9KpOHmM9E
 QASMxjVVEhrDqgl8vRFN9a9s2QYAkNKjJHPueqYZfTF8NqsEP4f0vjan8s+RyCnNOBsw
 2bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iudu1NuMMrBKlVbFNDhSrHphI49VjbXq5YXusn6JK4g=;
 b=LGTQ+UHq+G4cYHI4EspmczQ9SswxCLkXDKRAMxJI1b7J17HDtAGL6LjMKKCYGIvKEx
 vE/9U4iHZY2HE71VXXqpgQ04p45ihgywplVVmai3dQB5IKTBU+hxXTW3GNrEAPFCLYiW
 AAIL8F424HAixp4/yf2LZO0Zv1Ox9aLh1GQVWLVWn+lMqt263vqvMoq18JF6ZHR9RZfo
 EZrNt+cTGUnbk8lmKnR0wPUN9wASR3qjgqdinzBNTSkcRumd3og0vyxmr/onBA5Tz82Q
 xZmJilz51hVHLY0yM6GkXofYy69oYSoWw0c27CcxE8bw9TpASgzl8M3gUBGg5gti0FHw
 OTTw==
X-Gm-Message-State: AOAM530c3vdu9Kb1sj8qhQnU3KPnSr0Qb53FonCCwOglrTlE+PD3K1xu
 0hIzaMvD+72i3BuaegQRx+AI4n0y2n8dRQyBtRmbbA==
X-Google-Smtp-Source: ABdhPJybaulauRAXjdC5zqmBgkdMsvIaNK9dxko8i9oHpO3s/Hr6Mk+XpCbJGecas/KqB+EkdXtmSfH4o1SDWlT8KvY=
X-Received: by 2002:a05:6512:1189:: with SMTP id
 g9mr2335815lfr.661.1632957919857; 
 Wed, 29 Sep 2021 16:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
In-Reply-To: <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 29 Sep 2021 16:25:07 -0700
Message-ID: <CALAqxLUAKChvD_Nhst0=Z0=5wv+xUN1tnbiKmjWftzzC_H1x4A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>, 
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Joonyoung Shim <jy0922.shim@samsung.com>, Amit Pundir <amit.pundir@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
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

On Wed, Sep 29, 2021 at 4:20 PM Rob Clark <robdclark@gmail.com> wrote:
> On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > The best practice to avoid those issues is to register its functions only after
> > > > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > > > to play nice with the other components that are waiting for us, so in our case
> > > > > that would mean moving the DSI device registration to the bridge probe.
> > > > >
> > > > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > > > would be affected by this and wouldn't probe anymore after those changes.
> > > > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > > > requires to be tested), but the changes in msm seemed to be far more important
> > > > > and I wasn't confortable doing them.
> > > >
> > > >
> > > > Hey Maxime,
> > > >   Sorry for taking so long to get to this, but now that plumbers is
> > > > over I've had a chance to check it out on kirin
> > > >
> > > > Rob Clark pointed me to his branch with some fixups here:
> > > >    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > > >
> > > > But trying to boot hikey with that, I see the following loop indefinitely:
> > > > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > >
> > > I just realized Rob's tree is missing the kirin patch. My apologies!
> > > I'll retest and let you know.
> >
> > Ok, just retested including the kirin patch and unfortunately I'm
> > still seeing the same thing.  :(
> >
> > Will dig a bit and let you know when I find more.
>
> Did you have a chance to test it on anything using drm/msm with DSI
> panels?  That would at least confirm that I didn't miss anything in
> the drm/msm patch to swap the dsi-host vs bridge ordering..

I believe Amit(cc'ed) tried to give it a run on his pocof1, but had
some troubles getting it working against a kernel that wasn't
suffering other regressions at the moment.

Amit/Caleb: Any chance one of you could try again w/ these merged to 5.15-rc3?

thanks
-john
