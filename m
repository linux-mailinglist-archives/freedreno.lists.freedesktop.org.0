Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0C56CE4F
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 11:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD3211A193;
	Sun, 10 Jul 2022 09:00:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B731125D1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n18so2563222lfq.1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKPLzcLCnVt5d9BV+HTHGXAGRfU803LtHdkNeW57BKA=;
 b=mhZuhioPs/xJBAAt7SiW3JYPKxd4OC9J//9TDeWnFEAnUaHtCUFsMqF+4U86yAGdV2
 R83k2tEDkMJASu7UAF+1Y2U1IfXPfTLvyjOZMJHGNsJZqaUYjsxaGtdFqSIhusv/aKa6
 T6+HFbgncVGrnAr3t6Jw58navdw4kifU4Dp/RKGEvcbchG0vmxFmsdJkzTLQ3n6feHNo
 K1D734YrCLnbGYLsbCX0uU3so+BoAnmfotWxdWdczh+buc5eg48g8p5H42MMoPRVX4y+
 kmom+YFf7ZhwBnt2qjmrM6XcaDQ2gTZFRF01/z+p4H0R8v2ouSXl5/c89bU2FUuPU0zK
 Si3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKPLzcLCnVt5d9BV+HTHGXAGRfU803LtHdkNeW57BKA=;
 b=UnwSa8NysgKLVAjIOGj8+zs59Y95M9fIlW2maM1t/ZgbLayV0PHjf4AsFvfdkTz32d
 iddqK3FeDi704gnMFZah2HZK1fhm1umCPw1cXs6XCZAgJTOH/BGwA6YwngPbNmFiftGU
 F0Vfo3ckBfXSFKxL/LC106l+QXVplrg5J5LeI61DGaMnUhfbk34WSqhkqvgeE6ZQOian
 DyQPoTqasUVxi5YEcmsLapeIY7wtgEEJpDLMQ0JksDoy91aOHMbYQkwEM7bbUtwrqf9j
 I1eqzQxy8+SKx2OtiS1Rrr4lur+3LvudRu/O2A+C0FKg246lpzdmYL7vk91sw4l9E4gv
 3uVg==
X-Gm-Message-State: AJIora/z/JON8Q1bMlYkenAB/iDoRzMISG8mHuqNY7ymWOrkV4cBeGle
 LrpCq9tloOn68Q5Po0KAvwxKrA==
X-Google-Smtp-Source: AGRyM1toGG+Xak6dPl4GT94gmwO9qkHMJvne1cv+sCD8rUg+eLqdPcm+Mthip2GC52KAiuuUEUcl2Q==
X-Received: by 2002:a05:6512:e90:b0:489:cd56:4610 with SMTP id
 bi16-20020a0565120e9000b00489cd564610mr4650254lfb.483.1657443647728; 
 Sun, 10 Jul 2022 02:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 12:00:37 +0300
Message-Id: <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/11] dt-bindings: display/msm: move qcom,
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

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
index b1c7193417be..7359b233f3eb 100644
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
 
   "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
     oneOf:
+      - $ref: dpu-qcm2290.yaml
       - $ref: dpu-sc7180.yaml
       - $ref: dpu-sc7280.yaml
       - $ref: dpu-sdm845.yaml
-- 
2.35.1

