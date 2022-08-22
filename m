Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC059C9DF
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 22:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBCBA1A6F;
	Mon, 22 Aug 2022 20:18:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12EA1A3B
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m5so6179222lfj.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rtwJSbwBDW6xMyEuSZ0+6cZQE4P+BjzRStFe+hWY/1Y=;
 b=JJrb4ieMKtW3IIzf+R1c/60CrgRH/hNZHWTgN3sq3sR4AqX1dlpNXR6Wn5qHLReEum
 WHYtzan2u+WfBqznGxDN7xnKtz16Kaowkoiejic4HJUbkM4mEh3vx1AVLYlARfXHHXnA
 EqwxvCFq2PpAACmoXIyF0xiRUtj9y3XXeZpFas4Ag24AQztdvdsFfO6PR3hz6JrjsMXw
 i8XC/6v1ZjhRUH75AEBOfjvQRCgHyNMrHhVEDrxIwPLZe0JgIqEtaFNGlc19DH19/fTd
 lXn1277U3K8VEG15rU6TzGOOTKeAgh/As2kasnMDb3zvRg9AvA2zTQscAqayTfEPBK2r
 pL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rtwJSbwBDW6xMyEuSZ0+6cZQE4P+BjzRStFe+hWY/1Y=;
 b=hHdSMSgNt8499sh87za3Mc/mcKTjIaCV5hYEOE52sxJQhWMY6BGfOsHN44btqVMmRK
 pXynPGHur1meAylPV2YDeXhK2oG/atGP6njnlfTWpdhPoNYownGwrdVWRWCUKHShfb7r
 dYtGxHdzkzbqMv7kbDrsB8HhpZn/uwzdsjTfz7fLyMbjwPPC2L9yEu2tCjG4HRB/cWai
 Le7syY6TxCJcS7D18nypS5FTSDr1iJzeOJVWy/yzdt3WDtSTAhPD5t9LneK9ibGZclqj
 2qUd3DDYrX7nz9zEumAzn1jJsp75yPgaM9F9wCcJMBCa3Ish3AqcJmn/w06+9O15vRHR
 5ufQ==
X-Gm-Message-State: ACgBeo23C+KVN3HTdipzCl0b99ltxQl70rFKW3FWkqZwdr1DpevgyBda
 WV1U5eC5r0AJCnJyjk5Y7bS7/Q==
X-Google-Smtp-Source: AA6agR4kDOgMZ9nSQAfZDQc4C7Eh+cxEqVREQ6/rSvsCsEDzm6Z+PFNIajhoAuV0ZUczp0h1DIId6w==
X-Received: by 2002:ac2:4144:0:b0:492:eb38:d8e9 with SMTP id
 c4-20020ac24144000000b00492eb38d8e9mr1643527lfi.215.1661199494791; 
 Mon, 22 Aug 2022 13:18:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 22 Aug 2022 23:18:04 +0300
Message-Id: <20220822201808.347783-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/9] dt-bindings: display/msm: move qcom,
 qcm2290-mdss schema to mdss.yaml
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 140 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
 2 files changed, 57 insertions(+), 107 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..8027319b1aad 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -10,146 +10,72 @@ maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  and DPU are mentioned for QCM2290 target.
+  Device tree bindings for the DPU display controller for QCM2290 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,qcm2290-mdss
+      - const: qcom,qcm2290-dpu
 
   reg:
-    maxItems: 1
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
 
   reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
+    items:
+      - const: mdp
+      - const: vbif
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
-      - description: Display AXI clock
-      - description: Display core clock
+      - description: Display AXI clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock from dispcc
+      - description: Display lut clock from dispcc
+      - description: Display vsync clock from dispcc
 
   clock-names:
     items:
-      - const: iface
       - const: bus
+      - const: iface
       - const: core
+      - const: lut
+      - const: vsync
 
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
-  iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
-
-  interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
-
-  interconnect-names:
-    const: mdp0-mem
+  power-domains:
+    maxItems: 1
 
-  resets:
-    items:
-      - description: MDSS_CORE reset
+  operating-points-v2: true
 
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI. Each output port contains an endpoint that
+      describes how it is connected to an external interface.
 
     properties:
-      compatible:
-        items:
-          - const: qcom,qcm2290-dpu
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
-          - description: Display AXI clock from gcc
-          - description: Display AHB clock from dispcc
-          - description: Display core clock from dispcc
-          - description: Display lut clock from dispcc
-          - description: Display vsync clock from dispcc
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: core
-          - const: lut
-          - const: vsync
-
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
 
     required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
+      - port@0
 
 required:
   - compatible
   - reg
   - reg-names
-  - power-domains
   - clocks
   - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
+  - power-domains
+  - operating-points-v2
+  - ports
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 25815acd37f3..8bb7525681de 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
       - qcom,sdm845-mdss
@@ -142,6 +143,28 @@ allOf:
       required:
         - iommus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display AXI clock
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: core
+
+        iommus:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -207,6 +230,7 @@ patternProperties:
 
   "^display-controller@[1-9a-f][0-9a-f]*$":
     oneOf:
+      - $ref: dpu-qcm2290.yaml
       - $ref: dpu-sc7180.yaml
       - $ref: dpu-sc7280.yaml
       - $ref: dpu-sdm845.yaml
-- 
2.35.1

