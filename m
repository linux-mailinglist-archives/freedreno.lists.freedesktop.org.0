Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23798A3F85E
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A5410EA9A;
	Fri, 21 Feb 2025 15:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVhmpZae";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2874710EA96
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:00 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso34127266b.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151499; x=1740756299; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=sVhmpZaeS6QZcNWDjRAKpWOH3Mq+w1aGVHkGoCoEbQ61Wn7zc53CUq4sB4k221Pcxf
 fJDeO4Hg4I9tVz+WdojexvH3T39hbY0C3mBwH7aTIqQUMnAYWCjCxqS59fzOL2xrZ/m5
 YJe5l8ph07H9EVLJUDySYSrtzyCRjbDFGcWOBDxmSC8Rik4+ZVjZfSWN4cUWYNIRkpcX
 meX1/aZ0W3xkOMofXCk/t7r1PAzFsO1zdRCrdL0V2ETmrRjhdSgB1ucU0aLTav6souoh
 A2aVq3iqcKpE+vI+nVr6zy5X8xgYU3xi+K5c77z1Ddzhb9xTx8a0KU+dT6vq76F0soZL
 /+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151499; x=1740756299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=lq/ip74f7lpDPCuhaE6deFj1iYePPfFYQrDC2l3le6tfYSjWTJTo8P0+m15NKDjnzo
 bF9zEvfEM/ER9T9iN4TlfX6RQBSADzEPPU0wi/xFngnLI9DEr5nrveJHClTiE2i3YYIJ
 NKcLClPYbsguEbOgurAh4UdPMdcsMc97fs9dStABz5wpiw49wMCatg34YE7aihSgRNps
 1YULCRXZDTVa2KsvyBqs/+8CDWs0brhN/9QzBB6XFoUUC5rl3Az1t5cxGgPEo7BVSTY0
 JXpi1/b1TvlckDEAq8ltJg5KAq6LUA8XrH4NhVVjZ1nK6DMt38+WzrTTpSF8KBYoVige
 6Kuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb3klTbb7BpewlieBYrTY5cbPm1eet6Cp1RUFyMbuB/bFZq+lIhpUjejmgnI26EH/yVgj1N1d0qWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoxiq1COwsXsvbgt2ARhYLiwwidbPVgD1If2xr/nsPg+xT2vsW
 b8pbu2XOvj+6r/kJ53VEDutFaNgfHNG0QD/jgWWxbIY+a31iEcGjJJEiUuQOH7c=
X-Gm-Gg: ASbGnct1SbI7UmQDMB8GbPdsr6rpQY6+cNEQ2A744aWhQTaGR/9U9RkcjvB3q0eyjyc
 RmaCky1XFaHe8jNlTKnvl/z1oCCEnDBXQMquzy2j7kUvsB8lj/FKl9Wp2diZD5Vkbx5BD4M0vPp
 zoc+NQ4qgpq6cbqD1dR352f18rfUo8Va8EWAOaJgORzmXPanDxkZHv8Ztgwy4M5pQoROoCTc1X5
 ewiYks9vH1bPI6vK1wL9+wwht89znyxC9n2rj9GVDtJcXfHnev5HndEmiqhlz8DiOWrMFbmwek7
 1kLBn/tsu2L6p0kJinTfBOJehGWou5DDSckU1oHpP35J9zjqbjzx+ELuE9yihbRIkvsHnjz2KFc
 z
X-Google-Smtp-Source: AGHT+IFKiCGs8WGJjCjTwDeH5gItqV3Z4eBJ2EseKZT54AU+egPgFTE16MYl1DUKy6/45OfK9TlWOQ==
X-Received: by 2002:a17:907:2d22:b0:ab3:8bcc:3d97 with SMTP id
 a640c23a62f3a-abc09a46c73mr147170066b.5.1740151498576; 
 Fri, 21 Feb 2025 07:24:58 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:14 +0100
Subject: [PATCH v3 04/21] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-4-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sQUir1TiVRbtsw+Rrr4J2GdnerWUccENvKyAuylyDIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqvbfkL6mifLhnkJ8uZyWrdVvqdxgfUK+3Eg
 sWqITQW+uqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarwAKCRDBN2bmhouD
 17ScD/0WhW0eY92Rf1M1qxmQ9bWlOi0q6oHKlhME2auE7BpgsJHCJtPsQFg8ZCPpnVkwDPXU7Kj
 JE45JCNTiIcbBznrQaw57ao2XQTnW2WgrpEAeFcRbvdUaeOWhZlkbQ762LGD36nlUiYAQixXTRj
 TtaVv9vO9IlnUQ2Ej4cg1r0ByY29f4pnY3z65T6kVLVFruL92YrR6btwijpiyuqJeWpXxyS2NvY
 ZtTis85EqKruB+RIwxjGmFIHytjTkUffiliCYFEcKAHRx8upuqW0NuKGCAjW5Vna2uq11Jx3hxg
 XowEPVduEhaa9+QqAJF5Ir4FK/Sh3msX4sPdUmTJ2Or1QB55OLVbyyGX9lDwS1ochXYyk1Buef3
 gtzfMmHj/fmECtg+RGU6Njb95awMv4OqzRczYUeluLUxAOyOp476LAQwcVrySnyA3jLzBt1xtI3
 ArRRs1sFbOiFfyZcyWeiMeVpD91yyCj0Vo1ewChFxFmHvF/qq3lhRoEHGTG6eyFguI1Adjsl1ok
 DJ1TIxO/JHORazEkOrtHImUUVPy/e9Zak56HRdyQa3X1jfbGtqKWhKEO2xpcvLIzSasjQ5jyMb+
 +deP5RYyfejTHOxRlHCyWcSJL9xC6KzyO/iqmVKqHdS4G+1bWitDFHeZYEXtn39FSJsnqNUK3bg
 Z/OoH8n7yIpfFeA==
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

