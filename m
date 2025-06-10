Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA39AD3A4A
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27A410E571;
	Tue, 10 Jun 2025 14:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IxjNY3J/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02310E56F
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a4eb4acf29so680952f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564374; x=1750169174; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
 b=IxjNY3J/szSFyn/hLRdrhM5ub0OA53VKNkILo6eCo/FivAXX/cKRlxGGYhtOLpG2BV
 wTW6NjwLBVTcook8Wk8Yh4MvH1kKgDHI+1KZX8hULOKL84JK2B/PdUUGR6TPDSOaMBd+
 EfXJL6CyHTFH5LSByNPpRYU3gELkjLn6ufmbpoiBjLGVXsG+YW8JDQkmiIbSQVoF9f82
 nWSO7Iws9Y1U450hsVEoFL7jhqv+RCSk/a4prlD6nhvC7soxR/H6QIUFOOGNk+mSNXd4
 2urJCf1jrjSwObnvAdmlRtoecF5HQf14ecDb32jJaAaOQW8VYFQ8je4kqWKuTdl1Au8s
 BGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564374; x=1750169174;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
 b=hKH4op0DPhHb59exqsL4qm1kTl0N1BTFVQ4yUClOaRYZqugAqpOCQHDJnFK69VpIXk
 kfYrIVTpx03OA/G1xDEPCfDExJtWwgAAfdSc/lXMzx8n9ZG6e6lfDPkJEBoYnUK8HQnL
 KuyFglSK0al6/YSNYCkS2Sq+mWSKIhbkRc6XKkYASj2ZlXijVvYlPTvwZJzMfNsLhahA
 UThvS2l27U8EhP55ViWSNpS5Xgf4USzHD1mO7QWoi0sQu/+3NQCFOPckJhu4YjXd2i4k
 JK4W11Is4grLxJRBwji/MdFf4IIVQ8+073rn5inq1PHhbLsScg+cOgJ6qd9EN2jvTtW9
 0A+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDofaeDh4A1oBrSylmtoqX1pQO0UUJx/Z9jwziuaWfxQa4RRoNIvffrNuvYB2gyh5Za5LJhUe6p2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeuORAkmfnFhQE3e1C5L0e03YafjA03JCiD3KNENwm6R0uHCW3
 wSSjDmUgPHXCnnp9AXpT3mtqnqpNNY1K+BcF4BOfT1b/YNzgwzyj+13W18cLVnWkDVc=
X-Gm-Gg: ASbGncvaBDHAXhvIABHXi7oUIFt1n/g3Q6fB2jgRFSj4AIWs9bZFrhT4eFVvFoVl1rF
 Ah4VCkvQabtCrxiAfQY/K3cGcB18hPJ+Cn3+KFwR9x4DWTaAumotpZ4eSpkUjDOSmTDZ8G/0MsF
 VkSY3gYtmKBzp+m0v7mXgYXcyiNcQ2BCE99u4xVD6R0+fhIDKvfAaqnvP8rjU0fDrmh1XANRE7H
 cROsB3kT5oLXTnx73uP+pQWkdzHMc1oxQx7vYNoh0YjDvxV/5UNhEk1Gsa0l/5k/8JdIIgkjoSd
 gqFczQWrfD4nkg+IsjxZgC8082KPAxhMv42l/SX89stDZFy48f/mPDyrPtGd0BfuABCoDrPtfsp
 KzVflWg==
X-Google-Smtp-Source: AGHT+IE8m9vNXCXJib4lvAobDyKN92NL9hduxtJo+sH3CDc8emVv2Z83tmvOkDG0E5rFAG5xNiixzw==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f8a9:ba02 with SMTP id
 ffacd0b85a97d-3a533143257mr4846738f8f.1.1749564373627; 
 Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:40 +0200
Subject: [PATCH v6 02/17] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-2-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvAnTGYNiceDs1Si8NBAvdNZ2GTuc/x9HM/Y
 lE2QCBPEAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wAAKCRDBN2bmhouD
 147UD/9+eGofQl+6iI1dCqHNQL6e/FHxAyir4raIkr/ZKhgiqQ+7u3O0H2x7OT93P87jrkpqB2R
 UaVvdIKwpUWxgpfm6d2F11C3UglzRoRSdCyXnhww9DNf7eT6K3cbo+z0dn6IzNP4qbZZSI2t8Gu
 MWoDfbuZReYnQtIeCEQcgFleQgDseodzVg0GCDfhmZy/U2eodJl+4QlcZjEnGSRnOFa2Oo1CDZt
 TO8HPNl3xapxWyLr0bvm8vk6dD958R/zp7vAHHJbOnK1hwjCvDSPc2W14nfSN4NX7diFmtH8nTv
 /zVTfR0d5qk658B7xhVxbblBBsWGoVx/SvuCXtefAbF+Vig+hWWoXumGDVqU7K1CC4IR0klqH3s
 6Il4oDQNwi7MxtYR7fwVSUbinD5hpyYKFxOKemFT80hsqYL3Puvp6a7ob3t105q/O0QcLTaxEQl
 vcPUS6rGrs9vTg9Ba6LTXntsyGrJ5FHP8/5304ffFk8VUctdk601pzvj/ui9veGw8Hzd7awYem7
 7XTBcecsFtA4mOFJ0LcctlOeg+/wfLGWvY29oKYd9QrvWF4083FSeddw14msEaQPPCZlMENPSQx
 JaN1Nc0lvlYfnvucJuYFyBLsqra6/i3BfwVlQZ5EDASlk7QOiw+xi1PkH1QGZHK5HS3Oo05qtkI
 E9+5mL32MqGToSQ==
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 82fe95a6d9599b5799549356451278564dc070de..d4bb65c660af8ce8a6bda129a8275c579a705871 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -70,11 +71,11 @@ properties:
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
@@ -109,7 +110,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -218,8 +220,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -244,6 +244,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -266,6 +269,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -288,6 +294,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -309,6 +318,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -346,6 +358,35 @@ allOf:
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
@@ -369,6 +410,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2

