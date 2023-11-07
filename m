Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B7E7E4C0B
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 23:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8E10E166;
	Tue,  7 Nov 2023 22:50:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF10510E166
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 22:50:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F2426B818FB;
 Tue,  7 Nov 2023 22:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF90C433C7;
 Tue,  7 Nov 2023 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699397420;
 bh=vhpxP9W32kSckOc73FHFhFgFKCzMo9dlSgDTjFo24Mc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jeDml5Iu/1vS+TGsS0SOoccFl9S4bi4nD8PVxo6ZHTYKaJnlE+EHANnFTyTD+tf6/
 O+D1NsLbeT9CNPYxcyf5zTwI/2Xs16dNe8LwM9R0vLjEOsQRC8St3abRGjNlIk4A2J
 34Ln2wfbWn4ydNq38CVJ5P/g8i5wiJ78b20dSh7roMmzpUiyu59RA7tUhzsxEti1Lo
 0VHgBhEQnZ/qvnBsLTgAKgJNdc4XbGYKQgAHrcIkkjKSRkn65SSQ0NMaa+vB4DOBcF
 Wjf6kNVkLaqFfl3oCUE4VzTJ1cYIvMftiDWrPGfXS0pC06DjPhKYyI8ECv8/LV8Y0v
 jU9UAOUIzF0lg==
Message-ID: <849046e96437d11e8fb997597b40979e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
 <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
 <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
 <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
 <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 07 Nov 2023 14:50:18 -0800
User-Agent: alot/0.10
Subject: Re: [Freedreno] [RFC PATCH v2 2/3] clk: qcom: implement RCG2
 'parked' clock support
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-clk@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-11-06 18:00:04)
> On Tue, 7 Nov 2023 at 03:36, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Stephen Boyd (2023-11-03 18:24:47)
> >
> > I looked at this more today. It seems that I need to both read the
> > config register at init and also move over the rcg to the safe source at
> > init (i.e. park the clk at init). That's doable with a call to
> > clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
> > get a stuck clk warning.
> >
> > Either
> >
> >  disp_cc_mdss_mdp_clk status stuck at 'off'
> >
> > or
> >
> >  disp_cc_mdss_rot_clk status stuck at 'on'
> >
> > When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
> > disabling of unused clks. I think I understand that problem. What
> > happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
> > both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping makes
> > it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
> > disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
> > from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
> > both the rcgs at clk registration time we avoid this problem because the
> > PLL is disabled but nothing is actually a child clk. The act of reading
> > the config register and stashing that in the 'parked_cfg' only helps
> > avoid duplicate calls to change the rate, and doesn't help when we try
> > to repoint the clk at XO when the parent PLL is off.
> >
> > The part I still don't understand is why reading the config register at
> > init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
> > stuck at off problem. I see that the branch clk is turned off and on
> > many times during boot and there aren't any warnings regardless of
> > stashing the config register. That means we should be moving the RCG to
> > XO source, between forcibly enabling and disabling the RCG, which
> > presumably would complain about being unable to update the config
> > register, but it doesn't. Only after late init does the clk fail to
> > enable, and the source is still XO at that time. Something else must be
> > happening that wedges the branch to the point that it can't be
> > recovered. But simply reporting the proper parent is enough for
> > disp_cc_mdss_mdp_clk.
>=20
> I suppose that the issue is caused by mdss_gdsc or mmcx also being
> shut down at the late_init. And if I remember correctly, properly
> parking disp_cc_mdss_mdp_clk to the XO solves this issue. This is
> where is_enabled comes to play. Adding it changes the
> clk_disable_unused behaviour.

The thing is that disp_cc_mdss_mdp_clk_src has been parked to XO by the
time late_init runs. The branch clk (disp_cc_mdss_mdp_clk) has been
enabled and disabled repeatedly during boot as well, and all those times
nothing has signaled a failure. That means the RCG has supposedly
switched away from the disp_cc_pll0 to XO (parked) and the branch isn't
stuck on or off. So how does turning the mdss_gdsc or mmcx off during
late_init cause the branch to get stuck off if the parent of the RCG is
XO? Is something changing the parent back to the display PLL?
