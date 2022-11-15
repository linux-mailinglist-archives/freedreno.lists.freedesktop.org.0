Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574F629A48
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575E710E3DC;
	Tue, 15 Nov 2022 13:31:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1010E3DB
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v27so21895074eda.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BI4uKN83KwpFv+aZH8WcfU1uC+N8zfagUkvOFMX2f/0=;
 b=paG/2fJENIvm8NnWAawUhhBzGSPdHRUpmbX4bOrjkAokwgW0r0gNTXCK9Zf+jwsSax
 k8F1TG1paJuubjAzS5iLwmaEavsKZkxKPlXnDnjEok59ScH5ZjSdN+xtgF6dasadbWXl
 R/nbD24qHP7qcJ/VBNcX68QJhF60mKMl8CBp1Oxc6oMngar7Uh6Ec427ORMXsM93P1xQ
 VlTuH6S5YVIScNueY0JEMKkQ1JinpLtVv712a7i/XwL26wZ+aaK+POyI8QMHqxzUkd1F
 ftru4A7QfO8njAqTbaYU1NgA4Nkvbi6IKQXydF95oYdU225WFkcxZqO0bF4FaLef0XNA
 JMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BI4uKN83KwpFv+aZH8WcfU1uC+N8zfagUkvOFMX2f/0=;
 b=riL83ApV3HJmYpjecsm2K4B97+Hcl6JNpVZ0fj9dw3x0tsp1/L1wLoBOlO0HyQgUuB
 KDodqHtgEbrco3UoAmnCTYblaj60vLBsGY7Vf+jSsRyMjnThgfz0VkaREq5xGoyK4JJQ
 lVwaKiTKAjgF7HgmxMAcaTJDznfLAgYW9Xsxhh9zeJxTzLAbi1f+ivDDfN3chS7CHIZY
 2QiVHdjfJ3eN4NgF/q8mA6KNp1XJTYCcy3gWoIoko05fegQNkk34BMsN5UQqqk5SDggG
 hBldwBVsZF0sZsG1TphjJj2espi0cZhhLpnsnRgnXa/Nhdh2dGt0GqgTmBqdybItrJE/
 0Z3A==
X-Gm-Message-State: ANoB5plpPa+VnVguQH4c+KdZkKEV1fRNVN3oOrU1DbRO3MgJcPYCwjXQ
 EV+M2+03Ug7Tj+OVN2UVQ7gKYA==
X-Google-Smtp-Source: AA0mqf7JZToraL1ximlhe1IQa5XejnrUhUva884fFu71/bfihz2zI7eZX+2nHb5XQCXMz8jq9lSo7A==
X-Received: by 2002:aa7:d64a:0:b0:45b:cb6b:c342 with SMTP id
 v10-20020aa7d64a000000b0045bcb6bc342mr15099503edr.282.1668519072342; 
 Tue, 15 Nov 2022 05:31:12 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:11 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Tue, 15 Nov 2022 14:30:54 +0100
Message-Id: <20221115133105.980877-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/12] dt-bindings: display: msm: Add qcom,
 sm8350-dpu binding
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

Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
new file mode 100644
index 000000000000..120500395c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Display DPU
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8350-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8350-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8350_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-345000000 {
+                opp-hz = /bits/ 64 <345000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-460000000 {
+                opp-hz = /bits/ 64 <460000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
-- 
2.34.1

