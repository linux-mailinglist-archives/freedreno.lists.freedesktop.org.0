Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD3913A41
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 14:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3BB10E210;
	Sun, 23 Jun 2024 12:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nb4VXRZO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741CF10E210
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 12:00:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-424720e73e0so30689225e9.0
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719144033; x=1719748833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecK+toW3Ns4ZNrqgQybbNewCzjgaGGXdUaWN+FWF27c=;
 b=nb4VXRZOH79yNQkMFAz4/sC5vDesd7ZDK9y5EjWlr9ybW/Ari346D2P55FoMRJJigA
 O20aeVCMv2hrugTDQbvidMMnTgImvHcu6Y5u6soB6BzoOWRNoSnk1g5NQpdDOV8xWmcH
 nZWgwPhv0jU16fQs0ONQt+EX4qIWtnUiGP1+j0czte2PFDq3faXdw2cxOpR3QgYjr9sP
 7HsaUCMfyFYREeIA5l/WSKEZOXQCstM7gcNDf8xY3gkGECy9vqp90jZpfnS4INPGjELg
 N/eG5lu9fuLLXguG0mYDNKLp0lE/nksnyXtn1cxeuuTGwnmBnZ2YZ7yoAfWLgcpMCq/x
 dgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719144033; x=1719748833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecK+toW3Ns4ZNrqgQybbNewCzjgaGGXdUaWN+FWF27c=;
 b=mKu1u+RZONXMH+notgmMT2Ve2Oqloq30akMUYETyGvt0qaeTAQyUQBrWZQjao9mZRl
 uv7Hxm+NhSudF1MnfxvnalxsdHpIDILIKZnbvMnDG0vPljg9SpjXtDYcgx48g8MihjtO
 euntMEUgb4eH3Smq5FmRn9PMYfXzBTiZyhvsCH6aQE2f7wf9Fyhi23mIB67iQ5npaGH3
 1lZCI8fzRHMi94nDGkNkPeYXY63poqvtNJPQEGkoV6rkf+cKud8C8lVFX4Atg5j4hdMp
 BElQgHrorv20Qw3DcMytMHnpSAdsbQ+PUlFm5W5OATXXM6XYCDBC3CyGUVL3UyKdaI0A
 yWlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfD5pOZybvr+GEPMMQI/tx9rtnx+dQg5qtN0Wi5xpuyFu/DwSEdwOqsbhqE6vdYOLp0hn669S42GwZS2iVbaKNwB0d6DXFnXA2pV09foHQ
X-Gm-Message-State: AOJu0YwuxqcaX7t8j7dhP2t9JS77Zq9AziFi2eLbYijVJN5ygD4DMy/a
 90HosBESnSzfEYjcX3hV5a1z3tIPx8eB9GfE7yCLrJE9pt1i7QOIpnTbegRvM2Y=
X-Google-Smtp-Source: AGHT+IGH65kKS7M6vcnw+GFLjPcYiLfNI3yhUCA7KwnzudEhnrCZRo0tzHlu9MxebLYKwwKlOaegOQ==
X-Received: by 2002:a05:600c:3c93:b0:424:9024:d468 with SMTP id
 5b1f17b1804b1-4249024d4e1mr4347895e9.17.1719144032825; 
 Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: display/msm/gpu: constrain reg/reg-names per
 variant
Date: Sun, 23 Jun 2024 14:00:26 +0200
Message-ID: <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

MMIO address space is known per each variant of Adreno GPU, so we can
constrain the reg/reg-names entries for each variant.  There is no DTS
for A619, so that part is not accurate but could be corrected later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/gpu.yaml  | 87 +++++++++++++++++--
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index baea1946c65d..e83f13123fc9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -130,6 +130,22 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+    then:
+      properties:
+        reg:
+          minItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
   - if:
       properties:
         compatible:
@@ -164,6 +180,13 @@ allOf:
           minItems: 2
           maxItems: 7
 
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
       required:
         - clocks
         - clock-names
@@ -196,11 +219,12 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
+        reg:
+          maxItems: 1
+
         reg-names:
-          minItems: 1
           items:
             - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
 
       required:
         - clocks
@@ -217,12 +241,59 @@ allOf:
           clocks: false
           clock-names: false
 
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-640.1
+              - qcom,adreno-680.1
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-619.0
+              - qcom,adreno-630.2
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-618.0
+              - qcom,adreno-635.0
+              - qcom,adreno-690.0
+              - qcom,adreno-730.1
+    then:
+      properties:
+        reg:
+          minItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
 
 examples:
   - |
-- 
2.43.0

