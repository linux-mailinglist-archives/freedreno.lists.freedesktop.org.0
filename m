Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0783FB9B4
	for <lists+freedreno@lfdr.de>; Mon, 30 Aug 2021 18:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BBC89C5E;
	Mon, 30 Aug 2021 16:05:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9F89C5E
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 16:05:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630339520; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AhYDa4UTLC4jIGO17fGnHbzpCStT+TLgkWbSA//0TlQ=;
 b=SatnR/lK/aRtSuvzT2s0nioQpxf6yyCW9mtFseoHMJTkuOJJmgDaIhWH9VyRtXmP7WetW6Xf
 pAhpQLwQYZsMniA5OjNJRfIvqWLoRTmpFHswm/wwEvYuaPYk/8G/6JRNG93gkpJzUaG6Mp0D
 1pqY/Fktmh0bwRai5H26Gsxt4I0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 612d01abc603a0154fa6d2a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 16:04:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1095DC43617; Mon, 30 Aug 2021 16:04:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83DEDC43460;
 Mon, 30 Aug 2021 16:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 83DEDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, kalyan_t@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 30 Aug 2021 09:04:49 -0700
Message-Id: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7280: Add Display Port
 node
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

Changes in v2:
-- break this patch into 3 patches

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 88 +++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c29226b..f224029 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3202,6 +3202,13 @@
 							remote-endpoint = <&edp_in>;
 						};
 					};
+
+					port@2 {
+                                                reg = <2>;
+                                                dpu_intf0_out: endpoint {
+                                                        remote-endpoint = <&dp_in>;
+                                                };
+                                        };
 				};
 
 				mdp_opp_table: mdp-opp-table {
@@ -3389,6 +3396,78 @@
 					};
 				};
 			};
+
+			msm_dp: displayport-controller@ae90000 {
+				status = "disabled";
+				compatible = "qcom,sc7180-dp", "qcom,sc7280-dp";
+
+				reg = <0 0x0ae90000 0 0x1400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names =	"core_iface",
+						"core_aux",
+						"ctrl_link",
+					     	"ctrl_link_iface",
+						"stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+				phys = <&dp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				#sound-dai-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dp_out: endpoint { };
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -3398,7 +3477,8 @@
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>, <0>,
+			  	 <&dp_phy 0>,
+			  	 <&dp_phy 1>,
 				 <&msm_edp 0>,
 				 <&msm_edp 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
@@ -3525,6 +3605,12 @@
                                 };
                         };
 
+			dp_hot_plug_det: dp-hot-plug-det {
+				pins = "gpio47";
+				function = "dp_hot";
+				bias-disable;
+                        };
+
 			qspi_clk: qspi-clk {
 				pins = "gpio14";
 				function = "qspi_clk";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

