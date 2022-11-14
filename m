Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD4628690
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FD910E2FA;
	Mon, 14 Nov 2022 17:06:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7C10E210
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h12so14046526ljg.9
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ea5Uaq+yCu3Bhg+2skGWB1tgC1rGJXv0/NT43e/8qQ0=;
 b=gjzX28jYfag2dKv8gVZOhtav4Divmseos/wBBPN3VoteTHb6/blQR9C5ozteNi2WH6
 KbVvFDYsC9Gkby2CwIeURC4WDENucrfJo4x0P6DNQPCPzk+xeV3zrhVGDRvj2QoqNb3t
 6HyGLmlSwciCqIwKT5T7xVUk7+cMLh+ZFoO7HOq1fo9mkKsO+FFlmMfvB/siQxU9yv5g
 cCPAxj468p1SonFJZc+SvW91CdECzKbZwgtRhozNZCaweP8CzjWwOnmivn3RU23X3jpN
 PX6294xUYpeqCkA22Ov1lr6nx+L3QrIYNdjeaE/AovHJaIuTbocjA9Frf6Hh8cmOKvcz
 ddRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ea5Uaq+yCu3Bhg+2skGWB1tgC1rGJXv0/NT43e/8qQ0=;
 b=6sMM/dP2/aim3Eh5/7seZXx6mGn+Rmrfj/eW9zEWQyxWF9pkSwdmXoMk5tpTvmKOPp
 HwPzqUCk6Bc2N95vy1e4FUsRHrxRw+Un999a3lFmCQoZZ9pMrEdeMzRCitPcOFuZc5Tw
 u/hwmPQ7k8aOeKhtrGdyYeF2saosKR9pFOpQqGWIkuS2EV1RcuI2VDL4xtf8v8VANzpE
 axHt4rK4YtJ0uC7it4BbBioykxwdv1FHbzCZgDy/WuaoNofAyx04d0MyFuJ+Ha2oD86P
 B5QZU5tHwbKkhyy2cr/ScGlvlKBzUCmxdkYkU8yGS/DGJTMCo/FVHfFMOck5uOleni/6
 zwLw==
X-Gm-Message-State: ANoB5pk5lgvaE7jEIPmN07HAV0cdtim09uA3xgg/LXPzJdBzRqmqSC9A
 M1IeRto8FB7YFK8Pjdzsj7VOuQ==
X-Google-Smtp-Source: AA0mqf5ujGOmfS1y4Y7C9QcGvLTvnfjct6sVPJ9etlukkDP5+lSoQjsAVoqfVDJMHpPtEo7lPHDTow==
X-Received: by 2002:a2e:9e46:0:b0:26c:5cf3:cc89 with SMTP id
 g6-20020a2e9e46000000b0026c5cf3cc89mr4610957ljk.483.1668445597957; 
 Mon, 14 Nov 2022 09:06:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:27 +0300
Message-Id: <20221114170635.1406534-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 02/10] dt-bindings: arm-smmu: fix
 clocks/clock-names schema
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rework clocks/clock-names properties schema to properly describe
possible usage cases.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index aa863811996f..99f34a40cfe2 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -161,16 +161,12 @@ properties:
       present in such cases.
 
   clock-names:
-    items:
-      - const: bus
-      - const: iface
+    minItems: 1
+    maxItems: 7
 
   clocks:
-    items:
-      - description: bus clock required for downstream bus access and for the
-          smmu ptw
-      - description: interface clock required to access smmu's registers
-          through the TCU's programming interface.
+    minItems: 1
+    maxItems: 7
 
   power-domains:
     maxItems: 1
@@ -220,6 +216,123 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
+    then:
+      anyOf:
+        - properties:
+            clock-names:
+              items:
+                - const: bus
+            clocks:
+              items:
+                - description: bus clock required for downstream bus access and for
+                    the smmu ptw
+        - properties:
+            clock-names:
+              items:
+                - const: iface
+                - const: mem
+                - const: mem_iface
+            clocks:
+              items:
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for memory access
+                - description: bus clock required for GPU memory access
+        - properties:
+            clock-names:
+              items:
+                - const: iface-mm
+                - const: iface-smmu
+                - const: bus-mm
+                - const: bus-smmu
+            clocks:
+              items:
+                - description: interface clock required to access mnoc's registers
+                    through the TCU's programming interface.
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for downstream bus access
+                - description: bus clock required for the smmu ptw
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-smmu-v2
+              - qcom,sc7180-smmu-v2
+              - qcom,sdm845-smmu-v2
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+
+        clocks:
+          items:
+            - description: bus clock required for downstream bus access and for
+                the smmu ptw
+            - description: interface clock required to access smmu's registers
+                through the TCU's programming interface.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: gcc_gpu_memnoc_gfx_clk
+            - const: gcc_gpu_snoc_dvm_gfx_clk
+            - const: gpu_cc_ahb_clk
+            - const: gpu_cc_hlos1_vote_gpu_smmu_clk
+            - const: gpu_cc_cx_gmu_clk
+            - const: gpu_cc_hub_cx_int_clk
+            - const: gpu_cc_hub_aon_clk
+
+        clocks:
+          items:
+            - description: GPU memnoc_gfx clock
+            - description: GPU snoc_dvm_gfx clock
+            - description: GPU ahb clock
+            - description: GPU hlos1_vote_GPU smmu clock
+            - description: GPU cx_gmu clock
+            - description: GPU hub_cx_int clock
+            - description: GPU hub_aon clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahb
+            - const: bus
+            - const: iface
+
+        clocks:
+          items:
+            - description: bus clock required for AHB bus access
+            - description: bus clock required for downstream bus access and for
+                the smmu ptw
+            - description: interface clock required to access smmu's registers
+                through the TCU's programming interface.
+
 examples:
   - |+
     /* SMMU with stream matching or stream indexing */
-- 
2.35.1

