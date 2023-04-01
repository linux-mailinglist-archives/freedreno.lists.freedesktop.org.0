Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748826D305B
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 13:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2C10E260;
	Sat,  1 Apr 2023 11:55:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4CB10E22D
 for <freedreno@lists.freedesktop.org>; Sat,  1 Apr 2023 11:54:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c29so32250386lfv.3
 for <freedreno@lists.freedesktop.org>; Sat, 01 Apr 2023 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350098;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HnEMhNsn7kHL6KC8gQ4HhHhkok2Hiu0bEYeYgvAPNX0=;
 b=mRPItMZ+WrNjgMnxSc9haKnqlugPzGyt2cBKUaFlSCaAv5RHs6s+Vs25TkZwsiCdpt
 Uft/buXPDJ+2IbEpuzfpuxUR8n+xXuWo5lJRQnzCbbA0r6LLwR6ZCAUCDVxUGLLYYi2J
 JkTh8Yiienili892i0eEGcvlx5p4c+Kn2y6SM8vwaC3M1mo5uJShde1lyKZ3UBFtdhlC
 jXChioEAZg/FzuQMpgfSaeszbCt+bTSj6X87fRfDEOTS+O4R4eSMSccWv8wcho1H7xb7
 5nHIkQU9FDbfnXhjU9rchcvHB9ARnhxGF/e6M3FCskJ+tCaaiUU7yZTsj0rB/SAPIBPc
 LdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350098;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnEMhNsn7kHL6KC8gQ4HhHhkok2Hiu0bEYeYgvAPNX0=;
 b=XiVt9gFAT1tylwwlWjR9o/v1KIgUXYuCG1dPlOrSbAwtkYdzn7qmJDi68l8vlxaNSP
 xC2HmXrL3SLll79gBp/DIt368Sjfz7UBnlOD+qwIj4XAhMDxGVa/hgAfhxc1RZ6SxVRz
 1Gq0zXQsoHxGza8G03CUWIC/8w185l7qotyAYYEKQ9Ki9lyGC/gMRq8qZw54dQrkuoDC
 ToT/MVkspt9DjwYq2HmFN4H4nrMyKpMtwdYzXbUwg+yz5VH9X5V8sVnFpW05Eo7Riu0R
 UJ/F6RqFU0UcE/wwMLXwfuWm52Dp2NbmDDrLROK2cTMtDRPZy7eqLt6saWfP8XN4dgQa
 +sOQ==
X-Gm-Message-State: AAQBX9dBncyaNSZbj/n34Iokxhp3c6HlsZJISj1rhvCgBw0b9fGUSOLI
 yKcBspWByz3OdouJM/lLLkMrFQ==
X-Google-Smtp-Source: AKy350bfnPEXAN3ouyNj2TtaVOBpXsh2+aVPtdalJp3W0r3qtfzTzq9fzTA3aAUJqokjMngHioNYvA==
X-Received: by 2002:ac2:4889:0:b0:4e0:61a6:c158 with SMTP id
 x9-20020ac24889000000b004e061a6c158mr8474555lfc.36.1680350097834; 
 Sat, 01 Apr 2023 04:54:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:54:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-3-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=3381;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gRbQW6m4WkjCaooGTDuAvaThk4xamrj0048X6Oez/Ng=;
 b=YkV+Gd21MkX/28W5SFDiGNyKn8qyn7PFblseYbJE0b0W6XqkjW8tVuil7YsKSCvVx5nqKhjFxHPD
 TsrdSNWMB7qMRxb4zJnGH3gzxufQSD21jECfU5DcIZx04fagzPHT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 03/15] dt-bindings: display/msm/gmu: Add GMU
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
index 029d72822d8b..e36c40b935de 100644
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
 
@@ -217,6 +212,28 @@ allOf:
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
@@ -249,3 +266,12 @@ examples:
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
2.40.0

