Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC68B34E
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691710E2B5;
	Mon,  6 Feb 2023 00:27:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9B910E0C6
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ml19so30024095ejb.0
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
 b=HULpsXVGKRFy+h69lzY/L1ZYutzwew53C7+pgIYNEeIeDJsMUY7bxZbtbW01I3baTm
 eFNmrrTrOWe/9b+8D95YsVYZ4LvuQMDB73UuEJsliTFpr3MKqN12u+Cx3WQUZ8vcshPj
 SMjbZlG+thtWRa7UJIYEvTTOGPiyfb2JWO1vpXVe/doVRSBsjs2XOqNr2zVZ3criO9ne
 gPNN+z9aDBbZq4G/6wf7RTf9A71lEV/N88bsJBWprpj21HKGQEIUp+BasEeOzvKW4JTC
 tct1SmqhCI2LRdyun9JwmN7Pb8MNkAzhqkX6z+c6HJvXTSTry+f9CYHGbJE6AFoGLLXA
 zxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
 b=wU38YMHjt04MED4u78VwqvT37uDswcJ80vKztdcYGlaO47GjQPvhVvePsLyK+xNMtW
 l6Al+CAFHftVhOKb1nIjWeSgbKe+MZEezPlSrbIEgkxvNYiEyOpOQzrXmvh4z4RxWEcY
 wi+fh97zJ7LMYYl+L64oq3YiIowoSLPZyOfQTA6YV0JJQzI3Jyz8HxpLNrN52zRAl/Ls
 XQX0kT7kLZrrU0MRjBpHXv+p5RgIfJIs0OwpNuOr4eF1MNVJ4HLsbHhsauCrPOSnMw1E
 5VnxaKeOwRMOF6BULe8qQ/Zg5hSs1QkS8O+Xaa5A5sgxFrqLLUhR99oUMI36awT1Wv4L
 wG5Q==
X-Gm-Message-State: AO0yUKV3WBmgSSqkKAuGOll/BqxTzg5NQCKU0HTaNjcep79sHIySwVMp
 4Hm6rgjkAW0itPXlpkhCLoDeew==
X-Google-Smtp-Source: AK7set/n2hRRJljwHkVMRXSMpZMx6IoxKU6T9qwpJCv1uTh2yARMMOvKgJD+paX8nsKxzTILG6UZEg==
X-Received: by 2002:a17:906:4fc7:b0:87b:1be:a8c2 with SMTP id
 i7-20020a1709064fc700b0087b01bea8c2mr23061840ejw.73.1675643258870; 
 Sun, 05 Feb 2023 16:27:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:27 +0200
Message-Id: <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/8] dt-bindings: clock: Merge qcom,
 gpucc-sm8350 into qcom, gpucc.yaml
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The GPU clock controller bindings for the Qualcomm sm8350 platform are
not correct. The driver uses .fw_name instead of using indices to bind
parent clocks, thus demanding the clock-names usage. With the proper
clock-names in place, the bindings becomes equal to the bindings defined
by qcom,gpucc.yaml, so it is impractical to keep them in a separate
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
 .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
deleted file mode 100644
index fb7ae3d18503..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
+++ /dev/null
@@ -1,71 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,gpucc-sm8350.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Graphics Clock & Reset Controller on SM8350
-
-maintainers:
-  - Robert Foss <robert.foss@linaro.org>
-
-description: |
-  Qualcomm graphics clock control module provides the clocks, resets and power
-  domains on Qualcomm SoCs.
-
-  See also:: include/dt-bindings/clock/qcom,gpucc-sm8350.h
-
-properties:
-  compatible:
-    enum:
-      - qcom,sm8350-gpucc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: GPLL0 main branch source
-      - description: GPLL0 div branch source
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
-    #include <dt-bindings/clock/qcom,rpmh.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        clock-controller@3d90000 {
-            compatible = "qcom,sm8350-gpucc";
-            reg = <0 0x03d90000 0 0x9000>;
-            clocks = <&rpmhcc RPMH_CXO_CLK>,
-                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-            #clock-cells = <1>;
-            #reset-cells = <1>;
-            #power-domain-cells = <1>;
-        };
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 7256c438a4cf..db53eb288995 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,6 +21,7 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sm6350.h
     include/dt-bindings/clock/qcom,gpucc-sm8150.h
     include/dt-bindings/clock/qcom,gpucc-sm8250.h
+    include/dt-bindings/clock/qcom,gpucc-sm8350.h
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - qcom,sm6350-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc
+      - qcom,sm8350-gpucc
 
   clocks:
     items:
-- 
2.39.1

