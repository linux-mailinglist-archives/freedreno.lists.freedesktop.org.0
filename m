Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EB5A9466
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 12:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D410E6A7;
	Thu,  1 Sep 2022 10:23:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC8B10E69B
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id v26so13490473lfd.10
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZfqFyT7S0ZfiEJmx9fjpRZIwg/bPMIzLWs0Tq9ZEHog=;
 b=oRYHXxMgLKCLv1jzOpg1CaZ6K9r9Z7CfxQKYQtcxxJqS380eepMT/Q0XUszDdRIU38
 8znGXnrHdVJhq48N1mtJzfZlH49txd1hgwgeoIcq2OZxcBvisCsV3doS91jOtTlAs1iY
 Qb/TulpC0DBwgaG3UfpMSPJ//+3NWRcrZ/zEBAZvGNjEbjt6cT8+h9zZz99zbVHnQ2nX
 HsRNvw2pa/nIXfm6pJp2RoUgtIEm7GZM/CpoxmSFlAuhAilHk4CoFZpF3giG5cQJs015
 TweHoKB7WoXGlcAWukQE2g7Lk++/TnOdr2KymzLxD7MDE3xZufHFcy2hT0HEJmFTJ6zV
 Ejpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZfqFyT7S0ZfiEJmx9fjpRZIwg/bPMIzLWs0Tq9ZEHog=;
 b=vXtWUZ8qTAy9a2fApogAvTqX4kqyEDipBO0QwsBVTpQou23jACNmayjKJ7UIvLdB5j
 nzQqGw+05I7koMaB65lf6LLypECQtaeKDb7O4zGscJa9/FGM8Y/lXVN4R2FK4lhVu+EP
 DAOPa7b/WooL9OxstgwI47vDg7uMTB7jmmLUR/33vSau+uW0qiulz3/rZvPhcgyb6k9l
 6dulkozlc2IQdaI7ifJ7FGJrQs1VqQjiXvrD5GsdeY2fcjJvsl19oaiVSO4pNPQK7ScG
 40VlEKZzPIQRau2+iZFGCkOyyRo8A/8Ijl7nTBdoKRxxxmveOi3a44q7B2TFeyeoyL+Q
 AfOg==
X-Gm-Message-State: ACgBeo2UMuTWZRPBAchIrQvPSlOQWwZdGRiwa5SyPZm6gMMtZBMJDv9Z
 WsFYmi0blPHvavGgw6tCjaJ+ew==
X-Google-Smtp-Source: AA6agR6hK1KU2tLqmeZNVOP7pTPHtVRoago83HKU3i/0MGbYj1BVOsLF2ezW/0NvteeOOCSWhr7s2w==
X-Received: by 2002:a05:6512:3b9d:b0:492:d0c5:c3a5 with SMTP id
 g29-20020a0565123b9d00b00492d0c5c3a5mr10084130lfv.129.1662027799731; 
 Thu, 01 Sep 2022 03:23:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  1 Sep 2022 13:23:06 +0300
Message-Id: <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 06/12] dt-bindings: display/msm: split
 dpu-sc7180 into DPU and MDSS parts
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In order to make the schema more readable, split dpu-sc7180 into the DPU
and MDSS parts, each one describing just a single device binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml      | 185 ++++++------------
 .../bindings/display/msm/mdss-sc7180.yaml     |  85 ++++++++
 2 files changed, 146 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 47e74f78e939..0ed64fe065c2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -9,81 +9,43 @@ title: Qualcomm Display DPU dt properties for SC7180 target
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7180 target.
+description: Device tree bindings for the SC7180 DPU display controller.
 
 allOf:
-  - $ref: /schemas/display/msm/mdss-common.yaml#
+  - $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
     items:
-      - const: qcom,sc7180-mdss
+      - const: qcom,sc7180-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
-      - description: Display AHB clock from dispcc
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
       - const: iface
-      - const: ahb
+      - const: rot
+      - const: lut
       - const: core
-
-  iommus:
-    maxItems: 1
-
-  interconnects:
-    maxItems: 1
-
-  interconnect-names:
-    maxItems: 1
-
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    allOf:
-      - $ref: /schemas/display/msm/dpu-common.yaml#
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,sc7180-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: vbif
-
-      clocks:
-        items:
-          - description: Display hf axi clock
-          - description: Display ahb clock
-          - description: Display rotator clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: rot
-          - const: lut
-          - const: core
-          - const: vsync
+      - const: vsync
 
 unevaluatedProperties: false
 
@@ -91,71 +53,46 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sdm845.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    display-subsystem@ae00000 {
-         #address-cells = <1>;
-         #size-cells = <1>;
-         compatible = "qcom,sc7180-mdss";
-         reg = <0xae00000 0x1000>;
-         reg-names = "mdss";
-         power-domains = <&dispcc MDSS_GDSC>;
-         clocks = <&gcc GCC_DISP_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
-         clock-names = "iface", "ahb", "core";
-
-         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-         interrupt-controller;
-         #interrupt-cells = <1>;
-
-         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
-         interconnect-names = "mdp0-mem";
-
-         iommus = <&apps_smmu 0x800 0x2>;
-         ranges;
-
-         display-controller@ae01000 {
-                   compatible = "qcom,sc7180-dpu";
-                   reg = <0x0ae01000 0x8f000>,
-                         <0x0aeb0000 0x2008>;
-
-                   reg-names = "mdp", "vbif";
-
-                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                   clock-names = "bus", "iface", "rot", "lut", "core",
-                                 "vsync";
-
-                   interrupt-parent = <&mdss>;
-                   interrupts = <0>;
-                   power-domains = <&rpmhpd SC7180_CX>;
-                   operating-points-v2 = <&mdp_opp_table>;
-
-                   ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                                  remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                            port@2 {
-                                    reg = <2>;
-                                    dpu_intf0_out: endpoint {
-                                                   remote-endpoint = <&dp_in>;
-                                    };
-                            };
-                   };
-         };
+    display-controller@ae01000 {
+               compatible = "qcom,sc7180-dpu";
+               reg = <0x0ae01000 0x8f000>,
+                     <0x0aeb0000 0x2008>;
+
+               reg-names = "mdp", "vbif";
+
+               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+               clock-names = "bus", "iface", "rot", "lut", "core",
+                             "vsync";
+
+               interrupt-parent = <&mdss>;
+               interrupts = <0>;
+               power-domains = <&rpmhpd SC7180_CX>;
+               operating-points-v2 = <&mdp_opp_table>;
+
+               ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 {
+                               reg = <0>;
+                               dpu_intf1_out: endpoint {
+                                              remote-endpoint = <&dsi0_in>;
+                               };
+                       };
+
+                        port@2 {
+                                reg = <2>;
+                                dpu_intf0_out: endpoint {
+                                               remote-endpoint = <&dp_in>;
+                                };
+                        };
+               };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
new file mode 100644
index 000000000000..27d944f0e471
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for SC7180 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SC7180 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sc7180-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    maxItems: 1
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7180-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+         #address-cells = <1>;
+         #size-cells = <1>;
+         compatible = "qcom,sc7180-mdss";
+         reg = <0xae00000 0x1000>;
+         reg-names = "mdss";
+         power-domains = <&dispcc MDSS_GDSC>;
+         clocks = <&gcc GCC_DISP_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
+         clock-names = "iface", "ahb", "core";
+
+         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+         interrupt-controller;
+         #interrupt-cells = <1>;
+
+         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+         interconnect-names = "mdp0-mem";
+
+         iommus = <&apps_smmu 0x800 0x2>;
+         ranges;
+    };
+...
-- 
2.35.1

