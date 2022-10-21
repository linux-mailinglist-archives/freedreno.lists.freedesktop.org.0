Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F67607CF3
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 18:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2937210E510;
	Fri, 21 Oct 2022 16:55:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B410E4CD
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 16:55:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id j14so4473781ljh.12
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLRVwuzN4HiLp/+xacM+aOVfSWVdtzFSHmnUe7sCpLs=;
 b=vlRYCUAJCcux+e92A5+Iy1SnwN0lO54WUHDQ4TRJ8HNh+tZUdOemk+rh4Tca7Y0Pff
 5C2Al59BhqR0Y/KiXkJuh3+C68gB+/EwL5rwBLAP+hn9HZ9afx7wFpKGhL0gOcmlbMY6
 iZc+9WwphAW3App0G4OWyNT74w5mAg4dthxfoNDungjamy6KJtwctHTh0euU+SSxat1y
 jNtm/Cr5vChgstG7rIH7GnhfBtQdv2XjhZLxFVdbK87fUo44ftXS1YQAhDw2YZ8r1yWR
 VetBkk+XyRtHVWWlvfAT9z1xzx+pVYc4WyIXbFZMrBMSAscoZAP2eglNGVrQbONmLIN5
 zWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oLRVwuzN4HiLp/+xacM+aOVfSWVdtzFSHmnUe7sCpLs=;
 b=CETsRu9fKWrZPfTzt7oiulrQgWably2WLUtWS9eCfcHcqsk308eFt+2Ho8sU8b2vS4
 uY7naCMI6F4pZxkObhgUo0ymDNbplF78nml2rw1ADVz/MvDTN+/L3rRDRWDwbzxPOHJn
 qaWmtLH113k/L5mRO7VjPK8CAdAkyRhuLtXdNUkObx4zp+7fcpWIYMQPCpEP/f8tX9UD
 PU2S2duuJJzSeC5uW8MtrIuPh79BYpxaKAsG73uHZXT7EYHPdc6lwEx8i9rUesG6kN+E
 2GteEYTRTomPVGtNpM+VsTzRDCLvF2PGHcSv6whkMMGz0Yw3BW4B8fPzHwmJcU6C0XNo
 pcRQ==
X-Gm-Message-State: ACrzQf3BOzWjrqgOsZJ5vbcC5eAe5KrKedL+CXjYIt+IPmVKMnyVvx0J
 10GJ29pzeJiLAcqGnEHlo6CkTg==
X-Google-Smtp-Source: AMsMyM7pI0+Xzp7stBcDXpGabUPSWu8ObYhROVsDjhcj/D6XJcjuqrTgSy9Q7rMyIjrXhBfeZBI/VQ==
X-Received: by 2002:a2e:a4ce:0:b0:26e:498:52f8 with SMTP id
 p14-20020a2ea4ce000000b0026e049852f8mr6820423ljm.99.1666371336764; 
 Fri, 21 Oct 2022 09:55:36 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:55:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Oct 2022 19:55:27 +0300
Message-Id: <20221021165534.2334329-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 2/9] dt-bindings: arm-smmu: fix
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rework clocks/clock-names properties schema to property describe
possible usage cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 34ee33a62ba5..bae9fb3ffadb 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -158,16 +158,12 @@ properties:
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
@@ -217,6 +213,123 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-smmu-v2
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

