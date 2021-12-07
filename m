Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BF46BAAA
	for <lists+freedreno@lfdr.de>; Tue,  7 Dec 2021 13:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AC5EB782;
	Tue,  7 Dec 2021 12:05:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06411EB781
 for <freedreno@lists.freedesktop.org>; Tue,  7 Dec 2021 12:05:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 60779CE1A77;
 Tue,  7 Dec 2021 12:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0A1C341C3;
 Tue,  7 Dec 2021 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638878703;
 bh=ujCHnMR34AzoG3Vi8aJNN8FINppyuK04wRnq0gfNiQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZoqarWRRmjq2S95AYjelwGU5/W9x8CNj0QiHigq0C1l9A5f2d31V2UOqzQpHQpNk
 G6N7GU7Cl5HYfJkeRrJsyy/JE2KLDapb8lJnhKYkdYZqco9sy2gm5h3fTztMKRiDih
 E6NpUpWLQ0jFms5nBU05FQ2OAkH7NZBl+hHBlGmFG31S5/cAnamjaARGcPCg+42Q4L
 kbtGwgxiSSecsQFgy63b1QH2yF+AAHrmwGBD6qVc82OCt+CeP7C0rpz/8ta1SQxGIx
 gJ3ktWVVbQswr9+p5D2Y5e7zp68iKGMm64Lg7D+c+S4Ejl50IwDP09QsCRGyGxVsDX
 noNVVuLEFk49g==
Date: Tue, 7 Dec 2021 17:34:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <Ya9N65mseobpBrYx@matsya>
References: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
 <CAE-0n51OA3c_hcnpJ-k5ZQvCN3kv8PcjLMRw4BLx9OKZPjGLcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51OA3c_hcnpJ-k5ZQvCN3kv8PcjLMRw4BLx9OKZPjGLcA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4] phy: qcom-qmp: add support for display
 port voltage and pre-emphasis swing
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
Cc: devicetree@vger.kernel.org, kishon@ti.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, agross@kernel.org,
 abhinavk@codeaurora.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02-12-21, 14:51, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-09-14 12:49:13)
> > Quoting Kuogee Hsieh (2021-09-14 09:45:01)
> > > Both voltage and pre-emphasis swing level are set during link training
> > > negotiation between host and sink. There are totally four tables added.
> > > A voltage swing table for both hbr and hbr1, a voltage table for both
> > > hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> > > table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> > > added to complete the sequence of configure dp phy base on HPG.
> > >
> > > Chnages in v2:
> > > -- revise commit test
> > > -- add Fixes tag
> > > -- replaced voltage_swing_cfg with voltage
> > > -- replaced pre_emphasis_cfg with emphasis
> > > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> > > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> > >
> > > Changes in V3:
> > > -- add __qcom_qmp_phy_configure_dp_swing() to commit swing/pre-emphasis level
> > >
> > > Changes in V4:
> > > -- pass 2D array to __qcom_qmp_phy_configure_dp_swing()
> > >
> > > Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> > > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > > ---
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Can this patch be picked up?

Somehow this is not in my queue. Kuogee can you add tags received and
rebase and send please


-- 
~Vinod
