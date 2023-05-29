Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B80714ABD
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 15:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5610E293;
	Mon, 29 May 2023 13:52:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8D10E296
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 13:52:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so34890461fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368348; x=1687960348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=49E8NammB9b0i0yjicnQMIMZLXUM56GNXPHK3LYqmjk=;
 b=wRESbY6LzGnYEBmuGjiH+lcgaSgRYlCX7Y7CtbBJx651yXxemjegPXCdoCfhSD+031
 nwvv7RWeTxJtdemDZrIpU6i0yFD2N97n5hOixCECuseVwu2SOfN9rFuz0YjsoDvglqtg
 NknTOi4wPyARNB6YzNF8b1Lap4QfFYxyNRthcQ1aQlHQQE+cqJZeTP8dgEmwNGsqMugM
 20T2Ks963yLATFvYHj0qL4imppB5DkYN/AaV6C81lL5qfGg4pVgqryaNTNutYbnSy5C5
 1cRvq0NWx4UR/JDo6pwJDRXbktFbxYJvKsAYRin4RhdMdrARYbL6Vvq1rMX4o0eNPCDP
 Sa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368348; x=1687960348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49E8NammB9b0i0yjicnQMIMZLXUM56GNXPHK3LYqmjk=;
 b=N5ainpZIhHa8xUHLeebwNmANkNhgaeb3PtJ6fi6nS4Mxn+0+SPG2UFgTu4UAhMo0Sl
 rXI84ioKqg7Jyb1S2qeMeT6ELOGKkKtuMUyG0y+f+Q/37HPrlmZPDCoEJnL67+mTv3ga
 o6Z5pdCcrG5YdiIMRhEBRvbRdRqU6qCFoQ2UQ7I2Pd8ug3vU6tRr89YowkVZ6g9c4ox1
 BTlLWmJNjrHAAMzQGxgN13PdyYCS+VFfZhQiSlB+eT369tvkGNpXLhwyezLQ1itYdEly
 42FMiQtYviVEuTmDfb0ERhste7lQmG3F08QwM4m+ttzcNRWfwOTrOqWtZhMeUBuRlKLc
 WVeg==
X-Gm-Message-State: AC+VfDxxyjJqvr5mJGAupE9pEYgbDqHRrj4Rznms9zc2FW7F/9CLaMcD
 7/fvKEETin8tp1Hu2gDUUONm1Q==
X-Google-Smtp-Source: ACHHUZ6RY9vWwNC2OBidQOI5atysP7WKpSvYfufck1sydfHbe57c1PSIeJZDkD0HVqhrCswugTx5aw==
X-Received: by 2002:ac2:5297:0:b0:4f2:5c4b:e69b with SMTP id
 q23-20020ac25297000000b004f25c4be69bmr3557027lfm.67.1685368348281; 
 Mon, 29 May 2023 06:52:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-2-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=3381;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=r/EBMgU06Tp71cfVplwZRxg54jR5hfGl93vpjcsu/ME=;
 b=AoFlK9crbxlkVpGPNu4hjQytqvO2j7fMJH34VpPs2eRJmNR/MHQEdwOq5nWx2CAs6OQObSMps
 QvXNukTjlmcD2ISVT4x9t412GMbmzO1lzEmatwWqb+GqaOo4Gf3xKed
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v8 02/18] dt-bindings: display/msm/gmu: Add GMU
 wrapper
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
we'd normally assign to the GMU as if they were a part of the GMU, even
though they are not". It's a (good) software representation of the GMU_CX
and GMU_GX register spaces within the GPUSS that helps us programatically
treat these de-facto GMU-less parts in a way that's very similar to their
GMU-equipped cousins, massively saving up on code duplication.

The "wrapper" register space was specifically designed to mimic the layout
of a real GMU, though it rather obviously does not have the M3 core et al.

To sum it all up, the GMU wrapper is essentially a register space within
the GPU, which Linux sees as a dumbed-down regular GMU: there's no clocks,
interrupts, multiple reg spaces, iommus and OPP. Document it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 50 ++++++++++++++++------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index f31a26305ca9..5fc4106110ad 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -19,16 +19,18 @@ description: |
 
 properties:
   compatible:
-    items:
-      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
-      - const: qcom,adreno-gmu
+    oneOf:
+      - items:
+          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno-gmu
+      - const: qcom,adreno-gmu-wrapper
 
   reg:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   reg-names:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   clocks:
@@ -44,7 +46,6 @@ properties:
       - description: GMU HFI interrupt
       - description: GMU interrupt
 
-
   interrupt-names:
     items:
       - const: hfi
@@ -72,14 +73,8 @@ required:
   - compatible
   - reg
   - reg-names
-  - clocks
-  - clock-names
-  - interrupts
-  - interrupt-names
   - power-domains
   - power-domain-names
-  - iommus
-  - operating-points-v2
 
 additionalProperties: false
 
@@ -218,6 +213,28 @@ allOf:
             - const: axi
             - const: memnoc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-wrapper
+    then:
+      properties:
+        reg:
+          items:
+            - description: GMU wrapper register space
+        reg-names:
+          items:
+            - const: gmu
+    else:
+      required:
+        - clocks
+        - clock-names
+        - interrupts
+        - interrupt-names
+        - iommus
+        - operating-points-v2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
@@ -250,3 +267,12 @@ examples:
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
     };
+
+    gmu_wrapper: gmu@596a000 {
+        compatible = "qcom,adreno-gmu-wrapper";
+        reg = <0x0596a000 0x30000>;
+        reg-names = "gmu";
+        power-domains = <&gpucc GPU_CX_GDSC>,
+                        <&gpucc GPU_GX_GDSC>;
+        power-domain-names = "cx", "gx";
+    };

-- 
2.40.1

