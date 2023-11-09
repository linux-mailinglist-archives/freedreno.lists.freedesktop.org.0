Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7397E62CB
	for <lists+freedreno@lfdr.de>; Thu,  9 Nov 2023 05:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FE110E1AD;
	Thu,  9 Nov 2023 04:20:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873B10E1AD
 for <freedreno@lists.freedesktop.org>; Thu,  9 Nov 2023 04:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02568CE09B6;
 Thu,  9 Nov 2023 04:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFCAC433C8;
 Thu,  9 Nov 2023 04:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699503653;
 bh=0SQWSMIi883/HdwEd1xVNfN88/dFmDtQT/Ub+e7K/QE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N9bv8l2MJX2/9VtJpjKeGCALywdzPdblbCdpblnZuVTGWcOP5vIspSBw8RXw/sbg3
 aFMtTkNXTb2pMYNGuRbesj125kFJ8FxeAlFuhgLeNQQ7xDrQcWeQjVyTfiIH0+LBu0
 dehR5m82qt7m7lyzSjcmj4ruyoWl8J4KJOvXvY9OvcAmfwdC2G4aTAmSwlTs4eKkjN
 7WwuYpeEo7ceu+tJPd48hHBIKEp4rBQbQVy6rI1lSJypXclz5zUGUy3FZXMOL1rXRh
 SkWpjuKqUsT3uSgHo8zhNJ0KusBYzoJ1OXtDFvr3Ae3VBDhtbOdBijBuJRIEY4yQra
 NxkS8IxmFDbAg==
Message-ID: <28c8559b9eba1a2b7c3554859c095cde.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e20129cd99e0685de27d48d73cc2b045.sboyd@kernel.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
 <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
 <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
 <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
 <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com>
 <849046e96437d11e8fb997597b40979e.sboyd@kernel.org>
 <e20129cd99e0685de27d48d73cc2b045.sboyd@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 08 Nov 2023 20:20:50 -0800
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

Quoting Stephen Boyd (2023-11-07 19:18:45)
>=20
> I also tried skipping slamming a bunch of PLL config register writes
> into the PLL at probe by removing the clk_fabia_pll_configure() call but
> it doesn't fix it. Maybe I need to measure the clk at probe time to see
> if it is actually on XO or if it is stuck on the PLL but all the
> registers are saying it is XO.
>=20

I'm still chasing this, but I have another update. I tried moving mdp
and rot to XO from disp_cc_pll0 at init, and left 'parked_cfg' at
default value of 0. Then I disabled disp_cc_pll0 at the end of clk
driver probe. This fixes the problem. In this case, the perceived parent
of mdp and rot is XO because 'parked_cfg' is 0.

Then I tried the same sequence above, but disabled and then enabled the
disp_cc_pll0. This also worked. The disp_cc_pll0 was disabled during
late init because it was unused, but otherwise everything is fine. This
means that disabling and then enabling when nothing is sourcing the PLL
somehow "fixes" it.

Then I tried some wacky stuff. I moved rot to XO and left mdp on
disp_cc_pll0, and left 'parked_cfg' at default value of 0. Then I
disabled and enabled disp_cc_pll0 at driver probe. This also fixed the
problem. I would think disabling the PLL while mdp is sourcing from it
would cause the branch to be stuck, but apparently nothing goes wrong.
During boot, mdp is switched to XO when the clk is 'restored' for
clk_enable(), and then the branch is enabled and it reports the clk as
on.

Then I tried leaving rot on disp_cc_pll0, moving mdp to XO, and leaving
'parked_cfg' at default value of 0. Then I disabled and enabled
disp_cc_pll0 at driver probe. This didn't work. During boot and up to
the time of being stuck off, mdp is parked and unparked but it's always
sourcing from XO. I don't understand this part. mdp was moved to XO very
early, while rot was still sourcing from disp_cc_pll0 when we turned off
the PLL during late init. Presumably mdp shouldn't be stuck.

Then I tried leaving rot on disp_cc_pll0, moving mdp to XO, and leaving
'parked_cfg' at default value of 0. I skipped the PLL enable/disable
dance. This didn't work either. During late init, the rot branch clk
(disp_cc_mdss_rot_clk) is disabled, but the rot rcg is still configured
to source from disp_cc_pll0.

Then I tried leaving rot on disp_cc_pll0, moving mdp to XO, and leaving
'parked_cfg' at default value of 0. I only disable the PLL during probe.
This didn't work either! In fact, mdp is stuck after being turned on and
off once (but shouldn't it be sourcing from XO?).

Then I tried leaving rot on disp_cc_pll0, moving mdp to XO, and leaving
'parked_cfg' at default value of 0. I only enable the PLL during probe.
This didn't work either. mdp gets stuck after late init, but it is
supposed to be sourcing from XO.

I'm thinking what's happening is that disabling the PLL during late init
is hanging the branch, but only when an rcg is sourcing from the PLL.
Or maybe what's happening is the rot branch register value is wrong and
it's actually swapped with the mdp branch in the driver, or the rcg for
mdp and rot are swapped. In the cases above, it only breaks when the rot
rcg is sourcing from disp_cc_pll0, and disp_cc_pll0 is disabled.

Here's what's happening without any changes

 1. mdp and rot are sourcing from disp_cc_pll0 at driver probe, disp_cc_pll=
0 is enabled
 2. mdp is configured to restore on XO
 3. rot is configured to restore on XO
 4. mdp is switched to XO on clk_enable()
 5. mdp is switched to XO on clk_disable()
 6. disp_cc_pll0 is left untouched
 7. rot branch clk is disabled during late init (disp_cc_mdss_rot_clk)
 8. rot rcg is still enabled
 9. disp_cc_pll0 is disabled during late init
 10. mdp is switched to XO on clk_enable()
 11. mdp branch is stuck off

I could see the problem happening if mdp branch and rot branch were
swapped. When we enable/disable mdp branch it will actually
enable/disable the rot rcg because feedback is going there. During boot
this is fine because disp_cc_pll0 is enabled. Leaving it enabled
throughout boot hides the problem because enabling mdp branch is
actually enabling rot branch. Once we get to late init, we disable rot
branch (actually mdp branch). The mdp rcg is already parked, so this
should be OK. The problem is the mdp branch (actually rot branch) has
been disabled, while the rot rcg is still sourcing disp_cc_pll0. We'll
disable the pll during late init, and this will wedge the clk off. When
we go to turn on the mdp branch (actually the rot branch) after late
init, we'll try to turn on the branch and the rot rcg will be parented
to the disp_cc_pll0 still (because we never moved it off).

This patch fixes the problem for me. Obviously, things are still bad
though because we don't report the proper parent to the framework. We
can do that pretty easily by parking at clk registration time though and
also by saving the config register.

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7=
180.c
index 9536bfc72a43..26eea1e962d3 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -499,10 +499,10 @@ static struct clk_branch disp_cc_mdss_esc0_clk =3D {
 };
=20
 static struct clk_branch disp_cc_mdss_mdp_clk =3D {
-	.halt_reg =3D 0x200c,
+	.halt_reg =3D 0x2014,
 	.halt_check =3D BRANCH_HALT,
 	.clkr =3D {
-		.enable_reg =3D 0x200c,
+		.enable_reg =3D 0x2014,
 		.enable_mask =3D BIT(0),
 		.hw.init =3D &(struct clk_init_data){
 			.name =3D "disp_cc_mdss_mdp_clk",
@@ -570,10 +570,10 @@ static struct clk_branch disp_cc_mdss_pclk0_clk =3D {
 };
=20
 static struct clk_branch disp_cc_mdss_rot_clk =3D {
-	.halt_reg =3D 0x2014,
+	.halt_reg =3D 0x200c,
 	.halt_check =3D BRANCH_HALT,
 	.clkr =3D {
-		.enable_reg =3D 0x2014,
+		.enable_reg =3D 0x200c,
 		.enable_mask =3D BIT(0),
 		.hw.init =3D &(struct clk_init_data){
 			.name =3D "disp_cc_mdss_rot_clk",

TL;DR: Taniya or anyone at qcom, please double check that the
disp_cc_mdss_mdp_clk register is correct and not actually swapped with
disp_cc_mdss_rot_clk.

I tried swapping the rcg registers, and was met with a blue screen, so I
believe the rcg registers are correct. testclock confirmed as well. My
next experiment is to figure out a way to turn off the rot branch
and measure.
