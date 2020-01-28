Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC814B4D3
	for <lists+freedreno@lfdr.de>; Tue, 28 Jan 2020 14:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F346E077;
	Tue, 28 Jan 2020 13:25:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136A288549;
 Tue, 28 Jan 2020 13:25:11 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 28 Jan 2020 18:55:08 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 28 Jan 2020 18:54:48 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id D02882830; Tue, 28 Jan 2020 18:54:46 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Tue, 28 Jan 2020 18:54:44 +0530
Message-Id: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [v4] arm64: dts: sc7180: add display dt nodes
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
Cc: Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add display, DSI hardware DT nodes for sc7180.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v1:
	-Added display DT nodes for sc7180
Changes in v2:
	-Renamed node names
	-Corrected code alignments
	-Removed extra new line
	-Added DISP AHB clock for register access
	under display_subsystem node for global settings
Changes in v3:
	-Modified node names
	-Modified hard coded values
	-Removed mdss reg entry
Changes in v4:
	-Reverting mdp node name
	-Setting status to disabled in main SOC dtsi file
	-Replacing _ to - for node names
	-Adding clock dependency patch link
	-Splitting idp dt file to a separate patch

This patch has dependency on the below series
https://lkml.org/lkml/2019/12/27/73
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 +++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3bc3f64..c3883af 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1184,6 +1184,134 @@
 			#power-domain-cells = <1>;
 		};
 
+		mdss: mdss@ae00000 {
+			compatible = "qcom,sc7180-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface", "gcc_bus", "ahb", "core";
+
+			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			assigned-clock-rates = <300000000>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x800 0x2>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			mdss_mdp: mdp@ae01000 {
+				compatible = "qcom,sc7180-dpu";
+				reg = <0 0x0ae01000 0 0x8f000>,
+				      <0 0x0aeb0000 0 0x2008>,
+				      <0 0x0af03000 0 0x16>;
+				reg-names = "mdp", "vbif", "disp_cc";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "iface", "rot", "lut", "core",
+					      "vsync";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <300000000>,
+						       <19200000>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+				};
+			};
+
+			dsi_controller: dsi-controller@ae94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				phys = <&dsi_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy: dsi-phy@ae94400 {
+				compatible = "qcom,dsi-phy-10nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94a00 0 0x1e0>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "iface";
+
+				status = "disabled";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
