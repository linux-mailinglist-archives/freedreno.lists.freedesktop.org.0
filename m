Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAC5A9458
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 12:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532910E69B;
	Thu,  1 Sep 2022 10:23:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42FE10E698
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:16 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z23so14523246ljk.1
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+X49tA4IIhRMp2sWT4xg9kHfflR0SXAycywENlVYMSw=;
 b=AlN/rHQHyslodmHFA0DSP1Z7vPUXWF12PCQppLQdKGifT4sx3ygedlWWCMGXU6EEVq
 jJBxhAh6IcOvlf99hFQPX0pl88OJpEYMu6/CuXUhP6o1wRIzaffcO4fG0WzP9LfLsClw
 B1TG2RBQpGKTCuZed80s506TVkAYkPgCe6TDcyvBvPXW0NUbP9QrBgOBAFeXUA/pvbez
 HfgY5l7VDMt2F2pzJekpJuDvA2soWcSgxNhmdN6FegEowr8SrZnhsFsvwx4CFjlqVAmS
 c2Lvg9H9+Zb22lzDV+YMCvtgUEFY80ulGdEhGyKaVscu4pIDjQEDfgFm3YRYlAz9nsga
 YCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+X49tA4IIhRMp2sWT4xg9kHfflR0SXAycywENlVYMSw=;
 b=uHInYqGI9LGSBPdVCq+d3EdWkWUeVKoKhmXcNZiar4y9+PIAg1oDuiskzxn/O/4KGA
 RJbICDY4BSJ8ZKWLLMJ22Ezm4C7EM9/QFY12cWkF4fpKZAHR0/E4PNLL6ZuIYoErhjE6
 1zgf9dysZY/BNt58mVtdFhne4/3h94yaVID0N7cKUh7rYSOdswc0sn6YwJv4bk3bc7NE
 GwBFmWNAeS3/TQBmFfo2KkXeuKmZukvWDF347SteW4wWhz8K2nXL3w4pt/zswK/r0+wo
 jMlw0Bvy1f4VsUhPolLvogTlwSL9d5+woMzTDx7BZO+kmorpAC7wYLZd/mUQ5S4dm8FZ
 3hEg==
X-Gm-Message-State: ACgBeo0seEXlVEybRgYoQ6iDAHmc3Mfl37tUAPElGhbrn5owaYtAVCqx
 gFaYN56l5Tu4so97tYClOzOqzA==
X-Google-Smtp-Source: AA6agR5d30YfnEkzK36R9lksTE9+rC9koZKL+N1b6Q5MYmekU/vYoOCRvJUUvkLfzgS2dRRQIEZfww==
X-Received: by 2002:a2e:910:0:b0:267:c001:c93e with SMTP id
 16-20020a2e0910000000b00267c001c93emr3104829ljj.439.1662027794938; 
 Thu, 01 Sep 2022 03:23:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  1 Sep 2022 13:23:01 +0300
Message-Id: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 01/12] dt-bindings: display/msm: split qcom,
 mdss bindings
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Split Mobile Display SubSystem (MDSS) root node bindings to the separate
yaml file. Changes to the existing (txt) schema:
 - Added optional "vbif_nrt_phys" region used by msm8996
 - Made "bus" and "vsync" clocks optional (they are not used by some
   platforms)
 - Added (optional) "core" clock added recently to the mdss driver
 - Added optional resets property referencing MDSS reset
 - Defined child nodes pointing to corresponding reference schema.
 - Dropped the "lut" clock. It was added to the schema by mistake (it is
   a part of mdp4 schema, not the mdss).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
 .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..65d03c58dee6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
 
 Description:
 
-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
-encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
+This is the bindings documentation for the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
 
-MDSS:
-Required properties:
-- compatible:
-  * "qcom,mdss" - MDSS
-- reg: Physical base address and length of the controller's registers.
-- reg-names: The names of register regions. The following regions are required:
-  * "mdss_phys"
-  * "vbif_phys"
-- interrupts: The interrupt signal from MDSS.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
-- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  * "iface"
-  * "bus"
-  * "vsync"
-- #address-cells: number of address cells for the MDSS children. Should be 1.
-- #size-cells: Should be 1.
-- ranges: parent bus address space is the same as the child bus address space.
-
-Optional properties:
-- clock-names: the following clocks are optional:
-  * "lut"
-
 MDP5:
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
new file mode 100644
index 000000000000..8860fc55cca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mobile Display SubSystem (MDSS)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
+
+properties:
+  compatible:
+    enum:
+      - qcom,mdss
+
+  reg:
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: mdss_phys
+      - const: vbif_phys
+      - const: vbif_nrt_phys
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller:
+    true
+
+  "#interrupt-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+    description: |
+      The MDSS power domain provided by GCC
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Display abh clock
+      - description: Display axi clock
+      - description: Display vsync clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: iface
+      - const: bus
+      - const: vsync
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    true
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - power-domains
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "^mdp@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdp5
+
+  "^dsi@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,dsi-phy-14nm
+          - qcom,dsi-phy-14nm-660
+          - qcom,dsi-phy-20nm
+          - qcom,dsi-phy-28nm-hpm
+          - qcom,dsi-phy-28nm-lp
+
+  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-phy-8084
+          - qcom,hdmi-phy-8660
+          - qcom,hdmi-phy-8960
+          - qcom,hdmi-phy-8974
+          - qcom,hdmi-phy-8996
+
+  "^hdmi-tx@[1-9a-f][0-9a-f]*$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,hdmi-tx-8084
+          - qcom,hdmi-tx-8660
+          - qcom,hdmi-tx-8960
+          - qcom,hdmi-tx-8974
+          - qcom,hdmi-tx-8994
+          - qcom,hdmi-tx-8996
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdss@1a00000 {
+      compatible = "qcom,mdss";
+      reg = <0x1a00000 0x1000>,
+            <0x1ac8000 0x3000>;
+      reg-names = "mdss_phys", "vbif_phys";
+
+      power-domains = <&gcc MDSS_GDSC>;
+
+      clocks = <&gcc GCC_MDSS_AHB_CLK>,
+               <&gcc GCC_MDSS_AXI_CLK>,
+               <&gcc GCC_MDSS_VSYNC_CLK>;
+      clock-names = "iface",
+                    "bus",
+                    "vsync";
+
+      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+    };
+...
-- 
2.35.1

