Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E144F60B215
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 18:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6274810E4B8;
	Mon, 24 Oct 2022 16:42:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B0D10E450
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j4so17780249lfk.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=us17Onp7GR3mizhlh7cq4mCVrkwlX+F6mp/vco5VcC4=;
 b=Xyg8FAI9DnXWCQXiNBc/C/F3fiGJUJbgyplTQjvKsNryQPr5tixbUEtGFKQOjK7NPS
 77LKe4JqxbAM34qKOC7Grdc4l/BLsKxNGVo45LCx0iaFgNHSMQcU1Ywst8bgtH3rL4Vx
 O0xST5gmnIHrxOtd9TC/0Asv9plnxb76wYTbIkRLN0RX2T/bW099bJyVsJFwJU07Pz9f
 fnUJW7qfUVeUFlsC1FwLuw/C7DislcidI38YwEXlN6shO7LmtkeysshIMpHl56YbhuSk
 oL2Rf/5XJNm4zzC49nY3uPvYIy155Jjjs04LlENDZIm/O135Lslj1QU+ogy9/sN9xd9V
 e9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=us17Onp7GR3mizhlh7cq4mCVrkwlX+F6mp/vco5VcC4=;
 b=n/UP8lmcGLnS6C12juL7+aV0PZr+25gHqxe+Zo2/36yaED+zWqtYq1XlIS4RiKlyBs
 ZnQLAYhtZDH6F1KK+9EVXPN/q3MPzQsea2ByyIuwQMs1ZF9A/PDKPvZVKBxXWYdT26j+
 5df1ny7j4Mvyh1aueP/ukCVUvqpTJfA3CtKaN2ZPQO8u19RMxcpDlj6cItu1fpWRrML/
 xOMExxEToihFwm470wH9C7EZn6830ANdzZzDiDi8Cs2KkO0Zl2udi11krIiXrsYsKPuA
 W/17ZMi9ytonPdeyIFc/web8vMeSLX9v8hpQXO6qfEqimEdvY22FnA7bdUZrNu/jeEDn
 clJw==
X-Gm-Message-State: ACrzQf28obKZ3aEyswAx/Ju1DOiZx8PmwnfvoTKYCz4jMFy37KZozDEq
 V2ah/1zwkMh1mjDvEOF1gMK5rg==
X-Google-Smtp-Source: AMsMyM6aNMjF775ghrixwogZ6MnfgzEBaFRXCI4J2VZgnWzzhted7AevGH7HY6DW9JfDGqlc416Upg==
X-Received: by 2002:a05:6512:6d0:b0:4a4:45c3:8d8a with SMTP id
 u16-20020a05651206d000b004a445c38d8amr13059320lff.329.1666629754028; 
 Mon, 24 Oct 2022 09:42:34 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 24 Oct 2022 19:42:22 +0300
Message-Id: <20221024164225.3236654-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v9 09/12] dt-bindings: display/msm: split
 dpu-msm8998 into DPU and MDSS parts
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

In order to make the schema more readable, split dpu-msm8998 into the DPU
and MDSS parts, each one describing just a single device binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/qcom,msm8998-dpu.yaml         | 95 +++++++++++++++++++
 ...pu-msm8998.yaml => qcom,msm8998-mdss.yaml} | 47 ++-------
 2 files changed, 101 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 rename Documentation/devicetree/bindings/display/msm/{dpu-msm8998.yaml => qcom,msm8998-mdss.yaml} (69%)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
new file mode 100644
index 000000000000..b02adba36e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for MSM8998 target
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,msm8998-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: regdma
+      - const: vbif
+      - const: vbif_nrt
+
+  clocks:
+    items:
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: mnoc
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@c901000 {
+        compatible = "qcom,msm8998-dpu";
+        reg = <0x0c901000 0x8f000>,
+              <0x0c9a8e00 0xf0>,
+              <0x0c9b0000 0x2008>,
+              <0x0c9b8000 0x1040>;
+        reg-names = "mdp", "regdma", "vbif", "vbif_nrt";
+
+        clocks = <&mmcc MDSS_AHB_CLK>,
+                 <&mmcc MDSS_AXI_CLK>,
+                 <&mmcc MNOC_AHB_CLK>,
+                 <&mmcc MDSS_MDP_CLK>,
+                 <&mmcc MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "mnoc", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd MSM8998_VDDMX>;
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
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
similarity index 69%
rename from Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 67791dbc3b5d..192a832ef808 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -1,18 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dpu-msm8998.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,msm8998-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for MSM8998 target
+title: Qualcomm MSM8998 Display MDSS
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
-description: |
+description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+  bindings of MDSS are mentioned for MSM8998 target.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
@@ -39,44 +39,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
     properties:
       compatible:
-        items:
-          - const: qcom,msm8998-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for regdma register set
-          - description: Address offset and size for vbif register set
-          - description: Address offset and size for non-realtime vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: regdma
-          - const: vbif
-          - const: vbif_nrt
-
-      clocks:
-        items:
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display mem-noc clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: mnoc
-          - const: core
-          - const: vsync
+        const: qcom,msm8998-dpu
 
 unevaluatedProperties: false
 
@@ -86,7 +51,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss: display-subsystem@c900000 {
+    display-subsystem@c900000 {
         compatible = "qcom,msm8998-mdss";
         reg = <0x0c900000 0x1000>;
         reg-names = "mdss";
-- 
2.35.1

