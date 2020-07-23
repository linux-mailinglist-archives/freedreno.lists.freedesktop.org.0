Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDB22AA52
	for <lists+freedreno@lfdr.de>; Thu, 23 Jul 2020 10:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744586E85C;
	Thu, 23 Jul 2020 08:06:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123706E85C
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jul 2020 08:06:39 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE4BD20888;
 Thu, 23 Jul 2020 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595491598;
 bh=4JGlD1TbFFWSg+P/0Pdxr7uW71kuoH7GfKoYbWbz4BU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lX458IbiTO0ynEufOwB3W12aiXAlmMXEuxF79prWdjzw+veZgSATz/xrQfhAarY8L
 p+kCqR4aIFWPNSyfGJfEUJAGYXa7AM26Mb7gaOsOXyW6P2Zk8XbAv0NaGBHdPdZ++M
 Fc8boQfFt44GfftAgM8IC6OYdWUQkwY0+oOpDGns=
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com>
References: <CA+G9fYvGXOcsF=70FVwOxqVYOeGTUuzhUzh5od1cKV1hshsW_g@mail.gmail.com>
 <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 23 Jul 2020 01:06:37 -0700
Message-ID: <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 samuel@sholland.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
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

Quoting Arnd Bergmann (2020-07-21 02:51:32)
>                         __clk_set_parent_before(orphan, parent);
> 
> None of the above have changed in stable kernels.
> 
> > [    5.633668]  pll_28nm_register+0xa4/0x340 [msm]
> > [    5.637492]  msm_dsi_pll_28nm_init+0xc8/0x1d8 [msm]
> > [    5.642007]  msm_dsi_pll_init+0x34/0xe0 [msm]
> > [    5.646870]  dsi_phy_driver_probe+0x1cc/0x310 [msm]
> 
> The only changes to the dsi driver in v4.14-stable were:
> 
> 89e30bb46074 drm/msm/dsi: save pll state before dsi host is powered off
> 892afde0f4a1 drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI
> 35ff594b0da2 drm/msm/dsi: Implement reset correctly
> 5151a0c8d730 drm/msm/dsi: use correct enum in dsi_get_cmd_fmt
> e6bc3a4b0c23 clk: divider: fix incorrect usage of container_of
> 
> None of these look suspicious to me.
> 

It sounds like maybe you need this patch?

bdcf1dc25324 ("clk: Evict unregistered clks from parent caches")

or 

4368a1539c6b ("drm/msm: Depopulate platform on probe failure")

I vaguelly recall that the display driver wasn't removing clks becaues
it wasn't removing devices when probe defer happened and then we had
dangling clks in the parent cache confusing things.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
