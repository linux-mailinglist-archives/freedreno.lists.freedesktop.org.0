Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7524566D1FA
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 23:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AECF10E50B;
	Mon, 16 Jan 2023 22:52:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAE510E508
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 22:52:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n7so2764243wrx.5
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 14:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmeDpbhWHrjy4et1mvXgnkvbOqusPhVJXfUWrZk3WAA=;
 b=Q4oQlqC0/lNEBHfh/qdBkRjWNeJbBwfq7tRheaKNqlz/wW6bOr+f0czYNt89NzfWo9
 Gp/erEcDV1fM2OY7EbOrTji2N7WvOXatdSFsTsHdjMp7TuGIB2mzdYEoM5Ta9CxLHs2I
 MV7Y0acWYCknuuWanTdGGZowOzMuQ7rL186mHMEp7c4z4TFVJEvQaS/MP3ExYLkpYF23
 8wj5a8uCgvBZCNZNzWyfvz5Qhhf8gFTsJGt3rVistwX8LBSxojMVAdBIc2kLA+bmgIUH
 488FcatOj6fGKpLCQtp1mwPVEG7C3BHLTy3vOUyJsyFEE9OZkwUtKL1Zlq9y142r5vBI
 R9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmeDpbhWHrjy4et1mvXgnkvbOqusPhVJXfUWrZk3WAA=;
 b=HTNMUWR3VZIpl1OGsX/IBLh8I2W5kFEGrrUA/Ia9gtlBLJl+usxYMoMxsGww0AmJJC
 XHsCLKrTBhYg+fiL4YsItTOpTGGp375K+bMcJ+3zQXA82MdQfWF+EvvfEYX44K3JnCPt
 NWFDMN/ZMNBaDzOZEDFWDqQKby7baMpaBKvKsW8a2a0HgeLaIXTjJLkeyBeYRVUO4mnx
 q59hE8NiCY8vB9OIQqbWFZhemxVUExXDuZItXE6icMiB5Nvo9iE2DZs7UxHGdE4frK/y
 OLWZAU/Zqwmi+wfs9WgBXZG1mSgN77LjZ4ZviTk+yrVu1j6eZYyTLw+N+7DaKOmgdUAf
 kHdw==
X-Gm-Message-State: AFqh2kqkEmgUG/S6xsSMrGYc4sMgNW/CwfeevHQevLfMo5HG5FMuBy5i
 pb0edNfiYDykgFYcMAaDFM/ysA==
X-Google-Smtp-Source: AMrXdXuB7cO5P8iSgtylPEJIfPrnq4kX7KayrcYRnylx335hHDvgt1djoiR2xGMxZ5g6YnIZovC5Lg==
X-Received: by 2002:a5d:53d1:0:b0:24f:a289:b422 with SMTP id
 a17-20020a5d53d1000000b0024fa289b422mr860153wrw.16.1673909542498; 
 Mon, 16 Jan 2023 14:52:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 q15-20020adfab0f000000b002bde7999cd6sm9247880wrc.61.2023.01.16.14.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:52:22 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Mon, 16 Jan 2023 22:52:16 +0000
Message-Id: <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v8 2/3] dt-bindings: msm: dsi-controller-main:
 Document clocks on a per compatible basis
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, sean@poorly.run, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com, david@ixit.cz,
 dianders@chromium.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Each compatible has a different set of clocks which are associated with it.
Add in the list of clocks for each compatible.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 219 ++++++++++++++++--
 1 file changed, 202 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 35668caa190c4..47faf08a37443 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: "../dsi-controller.yaml#"
-
 properties:
   compatible:
     oneOf:
@@ -50,22 +47,23 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display core clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - bus:: Display AHB clock.
+       - byte:: Display byte clock.
+       - byte_intf:: Display byte interface clock.
+       - core:: Display core clock.
+       - core_mss:: Core MultiMedia SubSystem clock.
+       - iface:: Display AXI clock.
+       - mdp_core:: MDP Core clock.
+       - mnoc:: MNOC clock
+       - pixel:: Display pixel clock.
+    minItems: 3
+    maxItems: 9
 
   clock-names:
-    items:
-      - const: byte
-      - const: byte_intf
-      - const: pixel
-      - const: core
-      - const: iface
-      - const: bus
+    minItems: 3
+    maxItems: 9
 
   phys:
     maxItems: 1
@@ -161,6 +159,193 @@ required:
   - assigned-clock-parents
   - ports
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8064-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: src
+            - const: byte
+            - const: pixel
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8916-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: bus
+            - const: byte
+            - const: pixel
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: bus
+            - const: byte
+            - const: pixel
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: bus
+            - const: vsync
+            - const: byte
+            - const: pixel
+            - const: core
+            - const: core_mmss
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: byte
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: pixel
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+              - qcom,sm8150-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+              - qcom,sm8350-dsi-ctrl
+              - qcom,sm8450-dsi-ctrl
+              - qcom,sm8550-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm660-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 9
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: byte
+            - const: byte_intf
+            - const: mnoc
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: pixel
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+
 additionalProperties: false
 
 examples:
-- 
2.38.1

