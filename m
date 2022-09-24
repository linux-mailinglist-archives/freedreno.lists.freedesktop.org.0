Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A25E8C7F
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 14:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5410EC01;
	Sat, 24 Sep 2022 12:36:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622FF10E610
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 12:36:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o2so4104507lfc.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=W8xETFVxa6frSPagjYwS6wNERmdxaMo9I76yLHF+LsM=;
 b=TmQ3MTXfEYwUYXAFrQsFmy/5TTbpT16p4ffwE48cnZxRh1fHRRPVgibhQUIze1xR5h
 tGVqRU+tkwnbo/N1HGFvu8M8XMroRcImHjOrIOnu8B4m6/fDbKxBNsw7fBqeI/vn1Y84
 ZYlkyE++nxV7JOb/8fID8WctOz5ckm1eiw1JuYu64TNiNka2xGXJel8KhBwDOV8KYynK
 IU6RKuyiSmQrJp1Xi/rNt1aHjS1hn1CKzqXcQtafK818ed/YimhkLwh1T/noK8x9Htj4
 GBDzVGRkQki5WgYiUk9wbmM9yRwz8m54JECm1Foq/vM/JrwGe3pb/BnKlQDSMaxwNj7U
 y4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=W8xETFVxa6frSPagjYwS6wNERmdxaMo9I76yLHF+LsM=;
 b=pbeQ3R7haOu58oXvQUcLs3xNfYSBUaR9cNarKacVbCEBCvHcXioEsCniPVsPHqyNGc
 C7SyPvhDiTEf16DBMIUNDCGEtbIENubWhu0aMyYGJw/2gmdRf/80RquwbVITY1V3wv6o
 LfN4Hvam34V6wgwe+SmZqqUADN0B4VB+Jl1v9uFKZubmydSLEDxwTyoBXRq2yzTuqfKw
 lcRcajpOE8xYVv44nER+SO3dbUKD5qKDGytk2D2Jgkcl/trLMLURzHAq2q625c8gW4Qk
 mwAjyca9jDMSCU2wvJDjwDLZLg9pNiD5cMaGS6hwQ84NdzQcbJWTsqWoZeisOoSVhWJv
 /v0w==
X-Gm-Message-State: ACrzQf1258ptv3V9Qgomo3K4hbtCADzK0N7HfI05ND5unY9zBtbOBlaO
 LVJc2Nut1fDYt+JJzGh94pMsUQ==
X-Google-Smtp-Source: AMsMyM4RtK15sOA/r0KSGGBBp6sTrmUTMNL9qYKnagRIIZiQ9KXg97AJWA4PsHS2srQaVlhUDpi94w==
X-Received: by 2002:a05:6512:2303:b0:49b:ec39:c4ab with SMTP id
 o3-20020a056512230300b0049bec39c4abmr5122244lfu.512.1664022976264; 
 Sat, 24 Sep 2022 05:36:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 15:36:03 +0300
Message-Id: <20220924123611.225520-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v8 04/12] dt-bindings: display/msm: move common
 DPU properties to dpu-common.yaml
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

Move properties common to all DPU DT nodes to the dpu-common.yaml.

Note, this removes description of individual DPU port@ nodes. However
such definitions add no additional value. The reg values do not
correspond to hardware INTF indices. The driver discovers and binds
these ports not paying any care for the order of these items. Thus just
leave the reference to graph.yaml#/properties/ports and the description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-common.yaml      | 52 +++++++++++++++++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 44 +---------------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 39 +-------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 43 +--------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 43 +--------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 44 +---------------
 6 files changed, 62 insertions(+), 203 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
new file mode 100644
index 000000000000..8ffbc30c6b7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -0,0 +1,52 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU common properties
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
+  Common properties for QCom DPU display controller.
+
+properties:
+  interrupts:
+    maxItems: 1
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
+  - interrupts
+  - power-domains
+  - operating-points-v2
+  - ports
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 253665c693e6..200eeace1c71 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -61,8 +61,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    $ref: /schemas/display/msm/dpu-common.yaml#
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -99,47 +100,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index c5824e1d2382..d5f1d16b13d3 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -73,8 +73,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    $ref: /schemas/display/msm/dpu-common.yaml#
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -107,42 +108,6 @@ patternProperties:
           - const: lut
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
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
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 4890bc25f3fd..2ac10664d79a 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -72,8 +72,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    $ref: /schemas/display/msm/dpu-common.yaml#
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -108,46 +109,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-          port@2:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF0 (DP)
-
-        required:
-          - port@0
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 584d646021d5..4ca7bc7f0185 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -71,8 +71,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    $ref: /schemas/display/msm/dpu-common.yaml#
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -106,46 +107,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF5 (EDP)
-
-        required:
-          - port@0
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index a87deea8e9bc..de193ca11265 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -74,8 +74,9 @@ properties:
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
+    $ref: /schemas/display/msm/dpu-common.yaml#
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
 
     properties:
       compatible:
@@ -108,47 +109,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
-- 
2.35.1

