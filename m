Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19F242E36
	for <lists+freedreno@lfdr.de>; Wed, 12 Aug 2020 19:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE836E948;
	Wed, 12 Aug 2020 17:44:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64789F53
 for <freedreno@lists.freedesktop.org>; Wed, 12 Aug 2020 17:44:30 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31ABD20781;
 Wed, 12 Aug 2020 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597254270;
 bh=28DUEag+8EHTAqymbd12JJo2CcoS2UDf2nbADDMAw8o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TD1K2eLRsFkw1pUi6MRPtrhRIEWAKzNvstiEGr0NudRvwcqMv9bBJzasuUao9Wca4
 9zB4zfWRjRp7MbfjoWUO/B9qDO8avGbG9BlQMsnY6PRmyeP47R2LjL7wYlLfokUpgI
 VjIoZG+ogWktoIfhIGCKTytYWHNyZCHvkpSced3Y=
MIME-Version: 1.0
In-Reply-To: <159549996283.3847286.2480782726716664105@swboyd.mtv.corp.google.com>
References: <CA+G9fYvGXOcsF=70FVwOxqVYOeGTUuzhUzh5od1cKV1hshsW_g@mail.gmail.com>
 <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com>
 <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
 <CA+G9fYte5U-D7fqps2qJga_LSuGrb6t9Y1rOvPCPzz46BwchyA@mail.gmail.com>
 <159549996283.3847286.2480782726716664105@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 12 Aug 2020 10:44:28 -0700
Message-ID: <159725426896.33733.4908725817224764584@swboyd.mtv.corp.google.com>
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

Quoting Stephen Boyd (2020-07-23 03:26:02)
> Quoting Naresh Kamboju (2020-07-23 03:10:37)
> > On Thu, 23 Jul 2020 at 13:36, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > It sounds like maybe you need this patch?
> > >
> > > bdcf1dc25324 ("clk: Evict unregistered clks from parent caches")
> > 
> > Cherry-pick did not work on stable-rc 4.14
> > this patch might need backporting.
> > I am not sure.
> > 
> 
> Ok. That commit fixes a regression in the 3.x series of the kernel so it
> should go back to any LTS kernels. It looks like at least on 4.14 it's a
> trivial conflict. Here's a backport to 4.14

Did this help?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
