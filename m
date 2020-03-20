Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8E18CE78
	for <lists+freedreno@lfdr.de>; Fri, 20 Mar 2020 14:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC04189DB2;
	Fri, 20 Mar 2020 13:11:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDEA89DB2;
 Fri, 20 Mar 2020 13:11:28 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Mar 2020 18:41:26 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 20 Mar 2020 18:41:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id C1C1A4509; Fri, 20 Mar 2020 18:41:06 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Fri, 20 Mar 2020 18:41:04 +0530
Message-Id: <1584709864-5587-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [v3] arm64: dts: sc7180: modify assigned clocks for
 sc7180 target
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add DISP_CC_MDSS_ROT_CLK and DISP_CC_MDSS_AHB_CLK
in the assigned clocks list as these are display
specific clocks and needs to be initialized from
the client side. Adding the default rate of
19.2 mhz for these clocks for sc7180 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v3:
	- Change in commit message
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101..e3b60f1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1544,8 +1544,12 @@
 				clock-names = "iface", "rot", "lut", "core",
 					      "vsync";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+						  <&dispcc DISP_CC_MDSS_ROT_CLK>,
+						  <&dispcc DISP_CC_MDSS_AHB_CLK>;
 				assigned-clock-rates = <300000000>,
+						       <19200000>,
+						       <19200000>,
 						       <19200000>;
 
 				interrupt-parent = <&mdss>;
-- 
1.9.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
