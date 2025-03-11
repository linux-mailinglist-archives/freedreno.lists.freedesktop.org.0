Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58839A5CE72
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C5E10E668;
	Tue, 11 Mar 2025 19:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jf8xhtpz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2BF10E667
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso571792f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719742; x=1742324542; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=jf8xhtpz2kFIVrrDnjdJ4nBIvX6Irm6Lg1kvi5FixNXu0bUUKXfz9eX2v8UNHPYzmv
 s9JFeJT99CXU8VhCD2o1oMdpe4wCVApRlAzr2M7DctCTvgOD+w33zl+pBPpEYrY1+oV1
 N+tR+mMwMZbQ+IStrbIRotMGg2SLOqWv4/PvcsIleVtmOX4h/Uy9FRqhZ+xb3vs58jVD
 qAIDNdUPSVPhFBE8/YVpnHGn+IzAdP0s9NiuIuUJzRb8Sr4N0mRmcFdkFg4aroyk9Q/l
 7Wy1mj+KMgRFsTfM2FtsHK/iT2Pu9/jyqozaAx3RgckWF2NuAuhH2APRIhsHTV8oM7zp
 ufUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719742; x=1742324542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=mAj87tRQCCeziTuwrWs+MRxOwX8HHaNU9ZwplD692eGsUot4QeN/Yd+1QkMykkM8vA
 7kJ2/d6eEXwGeGmQrr3QkeSoiAfE3keLin/4KsQ9oGmEoMblGMECSnm1ESQCEzM8bSd3
 T+4oMXktfC3Pn42V9CIiNU5pbm6h0ZoCoHJUQ6E4mpHuwuf1DQa4m4XFqfgo0REdg3+B
 ZZp76wpoQ9q3mRk1nXPfPpFiAKyYHgOZ8SGCj9fz0bwyY2XpfcKOYfGnGGh0QZvK3l9f
 rz1kbcWyCLXZTwudZoSQVqT0PKATx0jadqouFDoHDbujsxKcq/tTzZZVgAMd9uV68e5c
 CWVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWNPNcaHzvHZZi+DVqfP8PE/bDVFqxrmQrvFLQSRHBi2sh4UqSm++MHZQw6WOmm5Uw1Yu+EfNH0KQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiKfp84rdVA0Wdg/U/d7CpjJQ1Kq4VLnuBLkY+3nJvP8D3INrh
 P64TgLH/geMedCeVAwJGMnucfbrIQdjqS6OG7CO3INcBdQJN3K6dNNcgogEVJwo=
X-Gm-Gg: ASbGncv3//BXYBSdjL7S9xVkweHYLUtsnsHvlCF5/igMxmyszLOX+af3sxZrJqz27xi
 mZqpHVUDNa7GB6K2T5bpTHY2htq/d5ouJVVCs0Ba5+ilyPLTfU3GPrgVW52Sie2lMzlTIPzD3EI
 GQHXhl4XXTUIealabglQn4aect4Vk4Alp8Z/8/psig3vpgfp9/JnFUsAI6hKbyNHPxx+KkgpkpT
 XpcXAVoj8tvfp+LyUtVcekj64IvK+qTpa7ezbLWulZieQZSAZwCxeVrpjCspBLE4A5jKVY3CrRJ
 93e62SYk/gVfE3D1+zqTP5YaJfzXzMUc942Chj7Lnv/V+VeMtDtwP+y5/ZM=
X-Google-Smtp-Source: AGHT+IF417WVwkhv/4kEj5mDmA48euPvIfgAetNKZ077oeDcX29A47ICgyJbHG2WlP6N8LBlrOLfhg==
X-Received: by 2002:a5d:598d:0:b0:38f:2833:2c87 with SMTP id
 ffacd0b85a97d-3913bbd0d34mr4867195f8f.11.1741719741888; 
 Tue, 11 Mar 2025 12:02:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:52 +0100
Subject: [PATCH v4 02/19] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-2-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sQUir1TiVRbtsw+Rrr4J2GdnerWUccENvKyAuylyDIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0Iim/DeJggisQZOiWbGTSOucZf+5Z6lD9UY2b
 NR1mQALSr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIpgAKCRDBN2bmhouD
 12NOD/0eVzZaD4fQjBBYiBAOPxLRo/Sm7deaZtAXBdyL9/HYJb8xLV4oZoAja8KYgQOXorIMPoj
 bX9BybGjnXaJgxcDLXaEu9BL+IZMMEHqhtb54jnFzyK/p4CWCEgCUgSC0UFsKZjEXpeBmOZkJFc
 6vk6IRa6wj9LedgNYdo6qWNZyfnAs8COTojDU7wDE5YkD+76CDVjSfbOmXaA3k+gEdNfFl/DED5
 ukw3aVk91nRCYY+iETIqzuCbRDy9OO9Xp/VaTM3Aa17PCluZD7UtAnlPqwjt6wNG2l9Oi0iYSlW
 FqcqPf3T1Qzl8IBUe+n3AJV81TIykkQh8pYa+iLvlcsiIP8C1NxV6lVZMvmFNT/5Y9kS5G7Nqbb
 EOdxKVbmwxIpXb7xlvmnXcN+eP0NeKg4R1zgjeQkrwaEu6M1JpujbWQ8Qxhk1iyIxz5XJSwDR5C
 BR6S1SlWFxYzP80fGuT4EBTXCV/K4f2fc1ri3xKR+rn2xrij3zfwjFSQeI7YFodC/AQgmQtSVhR
 wm4lYoOFWMACJPDy/tgpZbnlDeKz03cK3t5efJVsRJFXkjA+czVHYiDWtU+WmcroMFJmZU1h+yr
 aZWAXQEfgC+hr9ySFX/xx4Y5YDh3diWXwfX1c81a7vYzhilb8V8kfvgVlAIQ41ZRia9mVMc6VX/
 y36CkiidRFk69Hw==
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

