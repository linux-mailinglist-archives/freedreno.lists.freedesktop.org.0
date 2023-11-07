Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710897E32A0
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 02:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510C10E49F;
	Tue,  7 Nov 2023 01:36:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66A10E49F
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 01:36:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BB905B81283;
 Tue,  7 Nov 2023 01:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC55C433C7;
 Tue,  7 Nov 2023 01:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699320972;
 bh=kL48fIOTndmBh9Sq5LIKKaJC+DRa+TCqhCyeEJzBeMM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bT6izTAGxcTL/ZNfNkJosin+OA6yE/q62UZD4hOeuNGWMWsUfLiY4Bs66omKmdIue
 hTPLvI4TT1Hj/3UlDOLEKAyG0zkdF9r6uGPoWPxv5AV88qfUI7H20JvsigwGRayd3m
 U6/nivePTruLGPCjMzhgwSc6naHAafLVgXDxIvhsJm5ay2wCF0TmfwU1dmQCPa3QJ5
 zxGqZbM3aPQvoPu7pyM2HRwl7Cn4otihDAx7venQDwcsfTlNXqdrR6ti+bbhza3e3o
 XLREMr07NH3WqyLLUiOXB45F+kWIZzfAbqLO8bkOPQ9QxhnfoKOMIQfxGJFkiyQgTd
 SOjeflTLK0+lg==
Message-ID: <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
 <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
 <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 06 Nov 2023 17:36:09 -0800
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2023-11-03 18:24:47)
> Quoting Dmitry Baryshkov (2023-10-03 18:23:07)
> > +
> > +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, =
&cfg);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return FIELD_GET(CFG_SRC_SEL_MASK, cfg) !=3D rcg->safe_src_inde=
x;
> > +}
> > +
> > +static int clk_rcg2_parked_init(struct clk_hw *hw)
> > +{
> > +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> > +       const struct freq_tbl *f =3D rcg->freq_tbl;
> > +
> > +       regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked=
_cfg);
>=20
> I need this part today to fix a stuck clk problem I see on trogdor.lazor
> where during registration a call to clk_ops::get_parent() sees the clk
> isn't enabled at boot (because there isn't a clk_ops::is_enabled()
> function) so clk_rcg2_shared_get_parent() reads the parent from the
> 'parked_cfg' value, which is zero. If the hardware actually has non-zero
> for the parent then the framework will get the wrong parent, which is
> what happens on trogdor when the devmode screen is shown. The parent is
> the display PLL instead of XO. I haven't dug far enough to understand
> why disabling unused clks wedges the branch when we try to enable it
> again, but not disabling unused clks fixes the problem or reading the
> config register at registration to get the proper parent also fixes it.
> I guess the problem is that we're switching the RCG value when we
> shouldn't be doing that.
>=20

I looked at this more today. It seems that I need to both read the
config register at init and also move over the rcg to the safe source at
init (i.e. park the clk at init). That's doable with a call to
clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
get a stuck clk warning.

Either

 disp_cc_mdss_mdp_clk status stuck at 'off'

or

 disp_cc_mdss_rot_clk status stuck at 'on'

When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
disabling of unused clks. I think I understand that problem. What
happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping makes
it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
both the rcgs at clk registration time we avoid this problem because the
PLL is disabled but nothing is actually a child clk. The act of reading
the config register and stashing that in the 'parked_cfg' only helps
avoid duplicate calls to change the rate, and doesn't help when we try
to repoint the clk at XO when the parent PLL is off.

The part I still don't understand is why reading the config register at
init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
stuck at off problem. I see that the branch clk is turned off and on
many times during boot and there aren't any warnings regardless of
stashing the config register. That means we should be moving the RCG to
XO source, between forcibly enabling and disabling the RCG, which
presumably would complain about being unable to update the config
register, but it doesn't. Only after late init does the clk fail to
enable, and the source is still XO at that time. Something else must be
happening that wedges the branch to the point that it can't be
recovered. But simply reporting the proper parent is enough for
disp_cc_mdss_mdp_clk.
