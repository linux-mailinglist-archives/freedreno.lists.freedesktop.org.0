Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7022AC32
	for <lists+freedreno@lfdr.de>; Thu, 23 Jul 2020 12:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779B66E8A4;
	Thu, 23 Jul 2020 10:10:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF586E89E
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jul 2020 10:10:49 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id k7so1602610uan.13
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jul 2020 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yoJQz6lc93ZFuC1vSh5aTw5SRyF7ZD50XPwFhu/krQ=;
 b=XCKk9hOqO0p5OWBU7kP/quBONyMD7A9N/NDx4dZesyLHCwi2Ujzv1+piwUlOI64CyA
 NCUIU6xdnEDK0mKCCEPOLd7ehUPoq1Q0e2udZf/ZTrXxNOL0BQj5UnmvhPom8yiANGaV
 kAMRAdu4YzM9tt1D2WRPKTpGCbjNTwTWEdLkok9I2O2mk/Ytx30jI1Y+UwQNEaIxcAJM
 AZzWRLvS0J/nTOQc2co0+wkWhXLzjWZZ+NpgbgVZGFqcnbBpIecpenwYZMfmLjt7FSdP
 c8h3VGbqmmoWIL54h1rS/XqozcfJljW7oM6ODqpZ90nsm16tGf6C9t/912+nio0BWIBH
 PA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yoJQz6lc93ZFuC1vSh5aTw5SRyF7ZD50XPwFhu/krQ=;
 b=gvSH2+rrabgGPr23Bc8AFbKCsuYkc0cJXfuaG2p98y/Of/SkC6iZcvUoNXEpRaWz6g
 eAgUXQ5KbYX8+hCVeFNLrior9p2NoT3EqBbhPEQXtiLswvbh6XpjFJOf87LFJU6mNHHn
 dBdv/wsuQDusmadcjG7Idx4vaz889qJhnfdWHyV8FnyH+XLlPfS3AXWiYtZMCfkLBYtc
 xb4z58FHbvWg0P07Cer6VYyTFyN0qL1Az1GRrCEhYXIHGxTFTaI/NzaExGN8H/T/FIjk
 kjF1FifhUgHvW56BaUDyDkgTezQ/I5g50uaHIF28QUUh9IbqaEpZ4uAktaJumycXz6m2
 KNTg==
X-Gm-Message-State: AOAM530MvyINZIgbDbO4pwL4WwDhYuHYkSu+mfwoYWmG+KVI5CfVjJpu
 dUQ/kNSUHE003c9N2qesAHwSoU+4G3zJOwzG4ROB9Q==
X-Google-Smtp-Source: ABdhPJxxlPWeM9mTT10PFLdHevZKA9RcowuhyqKZiYf5pxjOTON0R9TbU9qezUZcD9P6HDAOYt8ORXwcxVMOt6xhnjU=
X-Received: by 2002:a9f:236c:: with SMTP id 99mr3553006uae.14.1595499048751;
 Thu, 23 Jul 2020 03:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvGXOcsF=70FVwOxqVYOeGTUuzhUzh5od1cKV1hshsW_g@mail.gmail.com>
 <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com>
 <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
In-Reply-To: <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 23 Jul 2020 15:40:37 +0530
Message-ID: <CA+G9fYte5U-D7fqps2qJga_LSuGrb6t9Y1rOvPCPzz46BwchyA@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Freedreno] stable-rc 4.14: arm64: Internal error: Oops:
 clk_reparent __clk_set_parent_before on db410c
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
Cc: Sasha Levin <sashal@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, samuel@sholland.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Eric Anholt <eric@anholt.net>, Jordan Crouse <jcrouse@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 lkft-triage@lists.linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 23 Jul 2020 at 13:36, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Arnd Bergmann (2020-07-21 02:51:32)
> >                         __clk_set_parent_before(orphan, parent);
> >
> > None of the above have changed in stable kernels.
> >
> > > [    5.633668]  pll_28nm_register+0xa4/0x340 [msm]
> > > [    5.637492]  msm_dsi_pll_28nm_init+0xc8/0x1d8 [msm]
> > > [    5.642007]  msm_dsi_pll_init+0x34/0xe0 [msm]
> > > [    5.646870]  dsi_phy_driver_probe+0x1cc/0x310 [msm]
> >
> > The only changes to the dsi driver in v4.14-stable were:
> >
> > 89e30bb46074 drm/msm/dsi: save pll state before dsi host is powered off
> > 892afde0f4a1 drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI
> > 35ff594b0da2 drm/msm/dsi: Implement reset correctly
> > 5151a0c8d730 drm/msm/dsi: use correct enum in dsi_get_cmd_fmt
> > e6bc3a4b0c23 clk: divider: fix incorrect usage of container_of
> >
> > None of these look suspicious to me.
> >
>
> It sounds like maybe you need this patch?
>
> bdcf1dc25324 ("clk: Evict unregistered clks from parent caches")

Cherry-pick did not work on stable-rc 4.14
this patch might need backporting.
I am not sure.

>
> or
>
> 4368a1539c6b ("drm/msm: Depopulate platform on probe failure")

This commit already is in stable-rc 4.14 branch.
    drm/msm: Depopulate platform on probe failure

    [ Upstream commit 4368a1539c6b41ac3cddc06f5a5117952998804c ]

> I vaguelly recall that the display driver wasn't removing clks becaues
> it wasn't removing devices when probe defer happened and then we had
> dangling clks in the parent cache confusing things.

Thanks for your email.

- Naresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
