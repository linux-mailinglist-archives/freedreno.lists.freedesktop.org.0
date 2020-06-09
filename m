Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8B1F32AD
	for <lists+freedreno@lfdr.de>; Tue,  9 Jun 2020 05:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE46C6E15B;
	Tue,  9 Jun 2020 03:44:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B263F6E15B
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jun 2020 03:44:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591674260; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=gj5L2L5Kq70eW9k326LM/3poAponas8UdRiylaFEIws=;
 b=tyZ3QUdyktZ6iuyWB6vFknmuN5iJ59+4p4LbcccZDmkz9/U5Q50subjC9AkxWy2TElWpLXbo
 2mS0vKU4MZeK58qwuG0mcTFGbKJcmKsjVRQCnpHaeiGK18+jS7LQPdnYRv93qiVqhIaRpk4J
 n1tclQ/bHUO6H/KLbfOmxSlB/Ts=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5edf0442cea6afef5fccc52b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 03:38:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 97820C43387; Tue,  9 Jun 2020 03:38:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tanmshah-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 00791C433C6;
 Tue,  9 Jun 2020 03:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00791C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: devicetree@vger.kernel.org
Date: Mon,  8 Jun 2020 20:38:18 -0700
Message-Id: <20200609033818.9028-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of
 DP/DP-PLL driver for Snapdragon
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, sam@ravnborg.org,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add bindings for Snapdragon DisplayPort controller driver.

Changes in V2:
Provide details about sel-gpio

Changes in V4:
Provide details about max dp lanes
Change the commit text

Changes in V5:
moved dp.txt to yaml file

Changes in v6:
- Squash all AUX LUT properties into one pattern Property
- Make aux-cfg[0-9]-settings properties optional
- Remove PLL/PHY bindings from DP controller dts
- Add DP clocks description
- Remove _clk suffix from clock names
- Rename pixel clock to stream_pixel
- Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
- Fix indentation
- Add Display Port as interface of DPU in DPU bindings
  and add port mapping accordingly.

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 .../devicetree/bindings/display/msm/dp-sc7180.yaml | 142 +++++++++++++++++++++
 .../devicetree/bindings/display/msm/dpu.txt        |   8 ++
 2 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
new file mode 100644
index 0000000..5fdb915
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Port Controller.
+
+maintainers:
+  - Chandan Uddaraju <chandanu@codeaurora.org>
+  - Vara Reddy <varar@codeaurora.org>
+  - Tanmay Shah <tanmay@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Display Port which supports DP host controllers
+  that are compatible with VESA Display Port interface specification.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,dp-display
+
+  cell-index:
+    description: Specifies the controller instance.
+
+  reg:
+    items:
+      - description: DP controller registers
+
+  interrupts:
+    description: The interrupt signal from the DP block.
+
+  clocks:
+    description: List of clock specifiers for clocks needed by the device.
+    items:
+      - description: Display Port AUX clock
+      - description: Display Port Link clock
+      - description: Link interface clock between DP and PHY
+      - description: Display Port Pixel clock
+      - description: Root clock generator for pixel clock
+
+  clock-names:
+    description: |
+      Device clock names in the same order as mentioned in clocks property.
+      The required clocks are mentioned below.
+    items:
+      - const: core_aux
+      - const: ctrl_link
+      - const: ctrl_link_iface
+      - const: stream_pixel
+      - const: pixel_rcg
+  "#clock-cells":
+    const: 1
+
+  vdda-1p2-supply:
+    description: phandle to vdda 1.2V regulator node.
+
+  vdda-0p9-supply:
+    description: phandle to vdda 0.9V regulator node.
+
+  data-lanes = <0 1>:
+    type: object
+    description: Maximum number of lanes that can be used for Display port.
+
+  ports:
+    description: |
+       Contains display port controller endpoint subnode.
+       remote-endpoint: |
+         For port@0, set to phandle of the connected panel/bridge's
+         input endpoint. For port@1, set to the DPU interface output.
+         Documentation/devicetree/bindings/graph.txt and
+         Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+patternProperties:
+  "^aux-cfg([0-9])-settings$":
+    type: object
+    description: |
+      Specifies the DP AUX configuration [0-9] settings.
+      The first entry in this array corresponds to the register offset
+      within DP AUX, while the remaining entries indicate the
+      programmable values.
+
+required:
+  - compatible
+  - cell-index
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - vdda-1p2-supply
+  - vdda-0p9-supply
+  - data-lanes
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    msm_dp: displayport-controller@ae90000{
+        compatible = "qcom,dp-display";
+        cell-index = <0>;
+        reg = <0 0xae90000 0 0x1400>;
+        reg-names = "dp_controller";
+
+        interrupt-parent = <&display_subsystem>;
+        interrupts = <12 0>;
+
+        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+        clock-names = "core_aux",
+                      "ctrl_link",
+                      "ctrl_link_iface", "stream_pixel",
+                      "pixel_rcg";
+        #clock-cells = <1>;
+
+        vdda-1p2-supply = <&vreg_l3c_1p2>;
+        vdda-0p9-supply = <&vreg_l4a_0p8>;
+
+        data-lanes = <0 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dp_in: endpoint {
+                    remote-endpoint = <&dpu_intf0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dp_out: endpoint {
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26..30c8ab4 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -65,6 +65,7 @@ Required properties:
 
 	Port 0 -> DPU_INTF1 (DSI1)
 	Port 1 -> DPU_INTF2 (DSI2)
+	Port 2 -> DPU_INTF0 (DP)
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -136,6 +137,13 @@ Example:
 						remote-endpoint = <&dsi1_in>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+					dpu_intf0_out: endpoint {
+						remote-endpoint = <&dp_in>;
+					};
+				};
 			};
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
