Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866561705C
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 23:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310C210E688;
	Wed,  2 Nov 2022 22:08:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87C10E688
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 22:08:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d25so29973934lfb.7
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 15:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jxf+3weLPmHOsW22Oh8OM73R5y6QA68Q4Pf4wCJwkio=;
 b=kadRqGI+2FF/FktDUBYoVshyIJK/JqECqTbHQOsRSrf1S5ZqkiEbKFLtwsxtyTeof+
 2tSR4KCYMsZT+20XewP5ZfOEaJhjU5uqQo6hdtSTIYwv1dXfmZtTj5uDOCKO6lWVb2uO
 Dl/Mi6TC+8pvMsT6aRkf2xBWxSjC358mPbLrSO71RkwylR2N2cY+QgND/cWJL6GrE9oi
 M4wT5LVk4cx5ug3SAabFNT+X1ITt/i9O6Y2MCsC3tcUZn6ge7WWG+AQ2PJFKu8XPj50n
 5u+WzeWmAc32aivp8G16838VdohDWcAsVQR9BZr4/I4YlIK0CHwiQTVuZF6ttnVrnMTW
 SZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jxf+3weLPmHOsW22Oh8OM73R5y6QA68Q4Pf4wCJwkio=;
 b=ay6ex/vWRdkYakFhLbJ0JtLYtEEa0/DBu3IQdG2WOmmB+35q67LEBB7kW3fL0goi7z
 g8ufV3vz6/DETLJQBlclbSZOGTcrdr4PBRloKUcyMxFni50rlC+MhcWorDiunE8tAiP7
 4osP3F+bNiFv6LkDBFJqKrMxwL2aYmuC0w/GNd0bojzTh3xb5LIrWzNfNvP8dHd/f5x3
 IT0yxPlUj8NYQqlcvU/cvP3HRDWtliRloULq0Yz/bqttkKjLmhxd6+g3KmpsHltsF2Id
 4rK2dMgujUm6iqTlKi6Q6NfROouUbDbNbWIp7k29JgFCmMJCeLGioe6ey55zCznErelW
 0EWg==
X-Gm-Message-State: ACrzQf11jSgr0tvdg6qGIpJJaoWbBe5w9+wZD1FWaDk9837yeYq+PSJE
 cQy8t7ATBku8ylOW7o6Ecz7yLg==
X-Google-Smtp-Source: AMsMyM451RSohmI/c32I5kiPLMPxKaS8IBsoqFGlV4uZyygNSQVGXqEiV1vMJ36TINWJ1bvsXOC8zA==
X-Received: by 2002:a05:6512:314a:b0:4aa:2381:6fde with SMTP id
 s10-20020a056512314a00b004aa23816fdemr10944453lfi.36.1667426925866; 
 Wed, 02 Nov 2022 15:08:45 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a056512313400b00494747ba5f7sm2149212lfd.272.2022.11.02.15.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:08:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 01:08:44 +0300
Message-Id: <20221102220844.569977-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH v1] dt-bindings: display/msm: convert
 MDP5 schema to YAML format
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
 - MSM8996 has additional "iommu" clock, define it separately
 - Add new properties used on some of platforms:
   - interconnects, interconnect-names
   - iommus
   - power-domains
   - operating-points-v2, opp-table

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Resending as I noticed that I didn't include devicetree maintainers and
list in the first attempt.

---
 .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 137 ++++++++++++++++++
 2 files changed, 137 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
deleted file mode 100644
index 65d03c58dee6..000000000000
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-Qualcomm adreno/snapdragon MDP5 display controller
-
-Description:
-
-This is the bindings documentation for the MDP5 display
-controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
-
-MDP5:
-Required properties:
-- compatible:
-  * "qcom,mdp5" - MDP5
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdp_phys"
-- interrupts: Interrupt line from MDP5 to MDSS interrupt controller.
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
--   * "bus"
--   * "iface"
--   * "core"
--   * "vsync"
-- ports: contains the list of output ports from MDP. These connect to interfaces
-  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
-  special case since it is a part of the MDP block itself).
-
-  Each output port contains an endpoint that describes how it is connected to an
-  external interface. These are described by the standard properties documented
-  here:
-	Documentation/devicetree/bindings/graph.txt
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-
-  The availability of output ports can vary across SoC revisions:
-
-  For MSM8974 and APQ8084:
-	 Port 0 -> MDP_INTF0 (eDP)
-	 Port 1 -> MDP_INTF1 (DSI1)
-	 Port 2 -> MDP_INTF2 (DSI2)
-	 Port 3 -> MDP_INTF3 (HDMI)
-
-  For MSM8916:
-	 Port 0 -> MDP_INTF1 (DSI1)
-
-  For MSM8994 and MSM8996:
-	 Port 0 -> MDP_INTF1 (DSI1)
-	 Port 1 -> MDP_INTF2 (DSI2)
-	 Port 2 -> MDP_INTF3 (HDMI)
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-  * "tbu"
-  * "tbu_rt"
-
-Example:
-
-/ {
-	...
-
-	mdss: mdss@1a00000 {
-		compatible = "qcom,mdss";
-		reg = <0x1a00000 0x1000>,
-		      <0x1ac8000 0x3000>;
-		reg-names = "mdss_phys", "vbif_phys";
-
-		power-domains = <&gcc MDSS_GDSC>;
-
-		clocks = <&gcc GCC_MDSS_AHB_CLK>,
-			 <&gcc GCC_MDSS_AXI_CLK>,
-			 <&gcc GCC_MDSS_VSYNC_CLK>;
-		clock-names = "iface",
-			      "bus",
-			      "vsync"
-
-		interrupts = <0 72 0>;
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		mdp: mdp@1a01000 {
-			compatible = "qcom,mdp5";
-			reg = <0x1a01000 0x90000>;
-			reg-names = "mdp_phys";
-
-			interrupt-parent = <&mdss>;
-			interrupts = <0 0>;
-
-			clocks = <&gcc GCC_MDSS_AHB_CLK>,
-				 <&gcc GCC_MDSS_AXI_CLK>,
-				 <&gcc GCC_MDSS_MDP_CLK>,
-				 <&gcc GCC_MDSS_VSYNC_CLK>;
-			clock-names = "iface",
-				      "bus",
-				      "core",
-				      "vsync";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					mdp5_intf1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
-					};
-				};
-			};
-		};
-
-		dsi0: dsi@1a98000 {
-			...
-			ports {
-				...
-				port@0 {
-					reg = <0>;
-					dsi0_in: endpoint {
-						remote-endpoint = <&mdp5_intf1_out>;
-					};
-				};
-				...
-			};
-			...
-		};
-
-		dsi_phy0: dsi-phy@1a98300 {
-			...
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
new file mode 100644
index 000000000000..574e8b7bd67b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno/Snapdragon Mobile Display controller (MDP5)
+
+description: >
+  MDP5 display controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994
+  and MSM8996.
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    const: qcom,mdp5
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: mdp_phys
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 7
+
+  clock-names:
+    oneOf:
+      - minItems: 4
+        items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: vsync
+          - const: lut
+          - const: tbu
+          - const: tbu_rt
+        #MSM8996 has additional iommu clock
+      - items:
+          - const: iface
+          - const: bus
+          - const: core
+          - const: iommu
+          - const: vsync
+
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from rotator port to the data bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+      - const: rotator-mem
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc.
+
+    patternProperties:
+      "^port@[0-9a-f]+$":
+        $ref: /schemas/graph.yaml#/properties/port
+
+    # at least one port is required
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdp@1a01000 {
+        compatible = "qcom,mdp5";
+        reg = <0x1a01000 0x90000>;
+        reg-names = "mdp_phys";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        clocks = <&gcc GCC_MDSS_AHB_CLK>,
+                 <&gcc GCC_MDSS_AXI_CLK>,
+                 <&gcc GCC_MDSS_MDP_CLK>,
+                 <&gcc GCC_MDSS_VSYNC_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.35.1

