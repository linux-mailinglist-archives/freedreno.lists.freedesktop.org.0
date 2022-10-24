Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E360B213
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B2C10E459;
	Mon, 24 Oct 2022 16:42:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55110E43A
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bp15so17605108lfb.13
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/p+wu+qO1dEA7awSlPgVOsmmcvG8R8xP2JrDxBtQS+M=;
 b=cuChuB3Ph//JTuWunrzwDfC0AEJr7lUMm6LQg7UQvomZYNzNIeqoonJnYDNXzJFG5s
 f5fgOzdiA77cVkHgBFjDSdZavxtVFu7CK1kVjld+phfSqqsNzh54hANEkcTq6jqHEOJK
 VpKtfr9uAW9kj2iaEILl5klitxy5Wab4eWhrFYDwTjuPweeyUk06NwkmEwilYFDtgOk3
 KqZWfoPTLZ6/mkkZNClwIthp/yOLaCWof93MzP1Qtu/IZk1YV4wBblAuH7FNwMzwU/Sd
 +I6LYyhyWBus039xfn7E/OzDhKp9oWXiCZIgFWHnTofDle6QZkwZSPBD8HxIs7lLtZj8
 NWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/p+wu+qO1dEA7awSlPgVOsmmcvG8R8xP2JrDxBtQS+M=;
 b=sb4qzSK00cnP3kYnEenNxq9jeTfSjMY2dnp8n+cCbbRZ310UkzT1uhgBWPHaCpvYHn
 AYLBN7yllyuqoVF/KVOlXDG2q4I6lWeINVk66aRDnB6CXTVEe55n6+11voSukvPgV4R+
 EGqln2ZAs77QgjpeOtikf6nH6rDOUqdwyEuNS6i68DfowQQvoqmcG8PNZbrqUwWZOw9A
 UeyqIevZtvbaZ+tSt7u8ewNvtNicj8aZPAJCmHjTREVoSDfLToTalYMT+THzviPYz0sB
 9QZheLJBkKl7DmxadD6ttmYCq+z0tKBU8cPyUH/X+GPjjcO2s7Kaf3m1xT22XQJsLxAE
 cXOw==
X-Gm-Message-State: ACrzQf3R61BQTlkE5v22DwrT4p/leIwqCiZG/EBLEKPB5d3VnAFO2GQB
 ub2UmFskDECkCSIuxX8LkFQcKA==
X-Google-Smtp-Source: AMsMyM5Tecyt5hJnyfN4cz52ynyaQNfBhRNKBmvobSycJFpMazGxxGEHCq+06OWcf9j1BnhCnc55jg==
X-Received: by 2002:a05:6512:38d2:b0:4ab:e4dd:6d18 with SMTP id
 p18-20020a05651238d200b004abe4dd6d18mr1938202lft.157.1666629751435; 
 Mon, 24 Oct 2022 09:42:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 24 Oct 2022 19:42:19 +0300
Message-Id: <20221024164225.3236654-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v9 06/12] dt-bindings: display/msm: split
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In order to make the schema more readable, split dpu-sc7180 into the DPU
and MDSS parts, each one describing just a single device binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml      | 158 ------------------
 .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 +++++++++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 125 ++++++++++++++
 3 files changed, 220 insertions(+), 158 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
deleted file mode 100644
index 99d6bbd45faf..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ /dev/null
@@ -1,158 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for SC7180 target
-
-maintainers:
-  - Krishna Manikandan <quic_mkrishn@quicinc.com>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7180 target.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: qcom,sc7180-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock from gcc
-      - description: Display AHB clock from dispcc
-      - description: Display core clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: ahb
-      - const: core
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
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
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
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
-    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sdm845.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
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
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
new file mode 100644
index 000000000000..bd590a6b5b96
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SC7180 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
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
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: rot
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sc7180-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus", "iface", "rot", "lut", "core",
+                      "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SC7180_CX>;
+        operating-points-v2 = <&mdp_opp_table>;
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
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&dp_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
new file mode 100644
index 000000000000..103cfd60c61b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7180 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SC7180 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
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
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sc7180-mdss";
+        reg = <0xae00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "ahb", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x800 0x2>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sc7180-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus", "iface", "rot", "lut", "core",
+                          "vsync";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            power-domains = <&rpmhpd SC7180_CX>;
+            operating-points-v2 = <&mdp_opp_table>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&dp_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.35.1

