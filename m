Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC941CE75
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 23:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5AA6EADD;
	Wed, 29 Sep 2021 21:51:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975FF6E28A
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 21:51:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z24so16518723lfu.13
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyZa3HE5AzTnbENME0c+EUQpZhFABdDt4UxWcwk5TJM=;
 b=WWSFtRfbtLI608F0Gg2VZAh1FMB0Sw410UJ0duopP3lRsTt2hsmEipXag4AOmfxKDI
 7MKAWksjJLNofeIXURHWexv8M+/uA52YQKQkh6xlO2dp3qnuJcucj0QF0wlPnLL7G+CY
 vm2f8FUQ2HJroOq/HBQmmnTux3c0KCmIJ8SUs4luaUj+t+NA9kCp/3y39C1zf3Qvtwpf
 LaCbBmt7Fn2L7n4sydcITz+aUSsAAesmTGZv9p/uG9nxPdodqC85lWRJ+Bkcy3x5h7U+
 kvlhXXwiSiJTjoKUItoLWB52VKpFPFSnkHXcneT1iPORQErRMM0LTsgEQjrmGpj1t4WQ
 hDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyZa3HE5AzTnbENME0c+EUQpZhFABdDt4UxWcwk5TJM=;
 b=0YcLXb0m3YWhiPp8fvjpECCVZ/6CWciRPjsDaSiIxfqt6cuKyPwL4TDrRW4l1oooon
 3vvOVsWdHSzDxehrag3HjezgHXEebThCIzIfIhZDRBez/aK/BzbgGYdlWTCiiil1/Fib
 jJo1EQY0CF3xQbCMlGjzE3jB9/V+TKJL8AoElVCo2oz2urBGIs6k3lpkbRTtLG/2C/P6
 qSi1+xaVN/mIF6LsD+zmhKTGLkINjDcb3BGiqdLjqDXM5UrG84m4h28lnTnZ+ZVeoTNx
 /hfvxxtSfRRaDQwm1+j3QNpgNjsyd3QP8qgDEFv4YMJhpqsTMcoV8bUTjQOxcAzIhiC+
 1Nkw==
X-Gm-Message-State: AOAM530isZEp9Ucbz0OUBlzw9vvTd/El9eWzDVFwHs1kFYTG0ZfXymtL
 4rmljZX6zc4qm07MQ9UcKE49X4Tl3OfmweTxIw9VMw==
X-Google-Smtp-Source: ABdhPJxGvqFYzY22yc3Fsk+wgOe6xikVy1hR2J76T+Qxsjp4YCP2wTkaTdeqY+ydE1oYOitVBr5bbHaK9AS6FwbyCYM=
X-Received: by 2002:a05:6512:3e11:: with SMTP id
 i17mr2037444lfv.613.1632952312913; 
 Wed, 29 Sep 2021 14:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
In-Reply-To: <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 29 Sep 2021 14:51:40 -0700
Message-ID: <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
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

On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > The best practice to avoid those issues is to register its functions only after
> > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > to play nice with the other components that are waiting for us, so in our case
> > > that would mean moving the DSI device registration to the bridge probe.
> > >
> > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > would be affected by this and wouldn't probe anymore after those changes.
> > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > requires to be tested), but the changes in msm seemed to be far more important
> > > and I wasn't confortable doing them.
> >
> >
> > Hey Maxime,
> >   Sorry for taking so long to get to this, but now that plumbers is
> > over I've had a chance to check it out on kirin
> >
> > Rob Clark pointed me to his branch with some fixups here:
> >    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> >
> > But trying to boot hikey with that, I see the following loop indefinitely:
> > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > [    4.681898] adv7511 2-0039: failed to find dsi host
>
> I just realized Rob's tree is missing the kirin patch. My apologies!
> I'll retest and let you know.

Ok, just retested including the kirin patch and unfortunately I'm
still seeing the same thing.  :(

Will dig a bit and let you know when I find more.

thanks
-john
