Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95FB41D171
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 04:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750026EB35;
	Thu, 30 Sep 2021 02:31:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A16EB3A
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 02:30:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so18852686lfr.10
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iQnUr5SY7f8OGO57S3EM4uCQ4piA9YupnmmYWxxVKyY=;
 b=LjS98cvidJEmDORic59MjQfO2hbiTgxfTPD9/2/BLF9ce//XnLIiWgiIkzSXr/gD2G
 y5tyf0KeEAoS49e4mYQdczDnBT/f/TJt3SBEcGDu/v6oInWf4J0R3Pzkdp4Zb5mTDBox
 FhQ1S4a8GrGLYeQg3WevOUEvv1xjquhZ8Oxl9NkWXS2zCJGbooU3psEId6fvcuChc6QX
 snU5E32PuJ8ewpYQoF4iRr3f0AIodLMCW/1RVwEEXXAjTVMeZ7bsg+LxDsWzfqHkVXyG
 KRffm+ELFqgSNXDqcF6/R2J0XIvvrxXGr1MkGPHdj1+fZQZesnPo12Y9vbyuZKN7xTYd
 kmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iQnUr5SY7f8OGO57S3EM4uCQ4piA9YupnmmYWxxVKyY=;
 b=VwTWZUJvm4kmo3jo4/Q5eiwVLQlC7XSOKh69aiMp92kcol5mAphIB7JBDv1gk67RET
 WSnIS3hlDwbPw8r0fSit8tATHAB5DFQLK7plPR13GmhcbcCZAOfZYNm3JuundRvfH+BU
 g5w7EleooG9TOSo9ZiJhHPqUr9AfpsKrAwskMptGEwiC+/HNRi1NZjZMUBEbIv2jEP9Y
 Nz1hWjM/+x4zwnk2nKLr/e01v+nbiYc2y5vHZ4ssR1zyu9iUdgcWolEazzjJCx4hn+0B
 XSsecFr1tjfnfam76/ovHZ5FmmG6nJCnc+CySvCZ5fPKiFKtP2LCrgkFatJa8mdKOxxp
 nm9w==
X-Gm-Message-State: AOAM5301cqDfPD/RSNEcSw2ozH/ptvvywKla9TDVpixfYFT2RKSj0LMN
 IEJFILUuguhMfs8u/rSyTgvBLLY2xG/SGCNicYx/cg==
X-Google-Smtp-Source: ABdhPJyTibsWlvwWrbIC7Ms+JKl21H1RF1ZZfVQil46L2bTnFKehzHlQGf3CLV72YRs7O3rCPip69Gu8jOrXs4PLVSM=
X-Received: by 2002:a2e:87c4:: with SMTP id v4mr3339415ljj.61.1632969056722;
 Wed, 29 Sep 2021 19:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
In-Reply-To: <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 29 Sep 2021 19:30:44 -0700
Message-ID: <CALAqxLXSbYpHhn0-cVoD0-Rcsz8H43+WnP4ftO0z6PwHDCiyAw@mail.gmail.com>
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

Not a dsi panel, but for what it's worth, I did just test the series
with the db845c w/ HDMI using the lt9611 bridge.
So at least that is looking ok.

thanks
-john
