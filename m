Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08425A38998
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 17:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57E510E547;
	Mon, 17 Feb 2025 16:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e+TfsZR/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1210E55A
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abb4944fa73so42917466b.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810511; x=1740415311; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XMKKgpnl8eYech7ysqKuZzSoqRmn3tzrEprN1J+JmkM=;
 b=e+TfsZR/7YxrBqPNcltBPB42sh8g7TtdqNSqsDgOdYV7AElmd3G63xCWhdVFRUfLxt
 MRT/MwadrNb484gQM7GyAEXMnvF1JyPn+yG7V/TpZVG8CASMk9PKNd2beVs/iY7eqFTQ
 tXPOIMK7SDXWyQYJOpnvm13+FxdTpdNRSRchHpIRIub1yAgqevfenDfOpIE+BY5/sMYB
 1imz6qyfIAQ5FhQzzjTiYFeohYBlmq9xF3I8pMYrYfhDPEo0UtkDl8TcooGzFszAsTE2
 28X68TCbJ2Sx3CARTHa0hsHRGtp2GGcx8WcEledLZEHonbwig8AOISw0AGAE+E+VlfzC
 23og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810511; x=1740415311;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMKKgpnl8eYech7ysqKuZzSoqRmn3tzrEprN1J+JmkM=;
 b=NduW23dR7vUX1MzJbmw5mQR2P8Hl5XJ7lAbxbMd1ItWLoE0mmIZr5IKGd14qb+m/va
 fRk04BDl0DX/+07pjryF52KyzIJc6A9Liyn2IBx+ANGEwU5cYYO9IHaBwIjjhlovRBcV
 mJ6pvU9O8sK9uTsvEVp88xADDrhq9D2bHK0eGgnbScV019Im58OOj5yFRgngU1Iz9k7f
 SPunwITHKw6MxeBzHIrf1LDGFr5sHYp/F9F2QqddjkuiNLeUvKI5YTnA9uc7F6rz8oN+
 /XAyhmMDushY4K+RfX8xagrLOT9RL1/M5+tAULxKZAakUKUU8+Lf6mdegxZ6b5N8ZPZI
 X2AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYaYO1p65aZ3Hkpg4gaEO3r88SZiSJfst9ieT+UgSNcyc4yDII7mk2JA0DzTsxJZts5sMRMtpHlmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN0WLwxgoO/+4fmsykDUr4x/i5Mke9W4UgCQpeDPpKjrUUUEh+
 ZHbISeiM7q+S7rD3rt2Wtn1QHFRQmYX9ZTlkqfXgWMZ+GAPX7ZtsXgLuNIUeMaU=
X-Gm-Gg: ASbGncvnUwO84OpMJtCtmuHjyiUnMcOSmg3k8hq5LA2ceb53s7be5u4atLYJwQ9iVU9
 72UVnNeZOlBECW3S/hhj+VP9PHsmHfWaVSAGFgesYLrKCNb2OqYpkHiBR90qxvKWGe7RVtANSwM
 hZVtYYZNRcCuUVC6xsIq1diL7jTWK27Sism66cqu/KySKNTPNCY8Oc5/GPodqjb0qPJojqpsBH7
 4yvJ9EoURllzMtOhNvxooK3FHH+MZdp41IIy3zc+jsxPcoszMFPx7+U2d+7KiNrofYmErfGIyR/
 T0JtOgI7tsbo4HmFCGQrmwFtOdJtnB0=
X-Google-Smtp-Source: AGHT+IGTzswrtCJPCqfyggi5m80u/jkul3kNxHxJa5SXSan9y/8fkbrnZlDazfpdDBs98is0eJDstg==
X-Received: by 2002:a17:907:d8b:b0:aa6:6792:8bce with SMTP id
 a640c23a62f3a-abb709319d6mr401797666b.3.1739810511229; 
 Mon, 17 Feb 2025 08:41:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:25 +0100
Subject: [PATCH v2 04/16] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FNsPxO6mm9uvgk0lAHityCPGUm1IzGbPMEBflLcDTzQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a6eg8jKK/RyyaSz8JokEoix1Mba5jwcyKxz
 FO5fmLKv6WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmugAKCRDBN2bmhouD
 11K6D/9qb6pfJNR2w2GtVlMN7d8ELbhuFInPw/YrDqYbjRjjK8MhlXYbxJTlajHlFjFi3ExrZGx
 sBE3DApk9QvzyBCSGHOfZGJNuBDb9zfiAkZt7Ex92J/MYL/C2Bg1Wh+4QAoDAXIwaUwoCEaETQc
 caUPi68WvWibTHHsc/rQ9TsEjVy+itoerpNvAJSTitx+8NsA8LDCFehtWhwQi2RpVIYS8m1tKmn
 ksS/cAr4+cv1K8ugg8QAcam5ocLhlP4vz5SPSE86Fzv4atS46ElxDsQDhejkRLO5hSs6Vyu1F10
 lxB2c4WXY3najNn2IiqNyKm/gevpykFBuTO+8IJ7MEyoH2VchQaLB7SrCudDOREu6cH/5WDSB0h
 silAL371P/9bSpWtPo0TeiTt12hfvONwbfUHwGK4SRO14Qr2w6rGfmos6AisxRJvkbqBV2wmvd7
 JR1K61cvTQS9ar5LXko4R5mVMdo3XYNaM1zX9zpUmHcS3yoycR4LWnPrYKJbXABGss3Slk5do/+
 tNfiRY33icnQKFLtak6GypMaMPzR3ePvODZa9vSgeVuXFDC7e+BrRtkNBJIeB4HH25Y40yfvkMR
 iIjsSB8gFp1Xmv7awTYvw/VokxjsgpcJmvNZrNk5J00+cEgaZw7lqFaKc97MeuIo2HmpsfdVLfV
 7XM1+fP1WV+e7bg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..8ecb2d8e296edf555df7380eac284b41a3f000a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -68,11 +69,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -107,7 +108,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -216,8 +218,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -242,6 +242,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -264,6 +267,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -286,6 +292,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -307,6 +316,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -342,6 +354,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -365,6 +406,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.43.0

