Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22325A0D27
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 11:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CE41139BD;
	Thu, 25 Aug 2022 09:51:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAA711216C
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:08 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d8so15112822lfq.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zWKtgCgwZZgC5f9GsWm7np14RFmpgHY79lEXnopj1ws=;
 b=wLASKggMZdRTOZseTW9I9mmBrVGxL/PN9VYLTEaAeSO7iCUhiygwKcY+v5V/FHZDeD
 tVEq+1GUATi6sNnNjiNCGLT2RuU29qBLZQOfmVEonjNGobctiTkAU93MHbmFbPBNfj1Y
 49qaYzC63Mtpru5n1P0GcDnL6Yx204H6pDh319PF0Cw5kjIQz+0DYAKR0BwzEu0tZQXz
 aQabYYPkPaCc553gWy42OAxU/cVpzLwUAIYneGmWxisHTg46HZKrO/yLYKTpxax/WPBY
 kBLp4emyKNZM80p9l0mh3UVbAlRynStjZGQqt2e1HouBwjPltshWbPAHZ/rqm0tVATqb
 eEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zWKtgCgwZZgC5f9GsWm7np14RFmpgHY79lEXnopj1ws=;
 b=Uw2GmcS0DdGTQYPNg1YBpW/p0iHO6AmviCY7Z6RhTLq0aS5EBxlWy9VVqFXr9jQhJ8
 HXtFZ6Y+q1FECLPmuPJW3vE6McM3aiL0kDItZsIoDbGpQtlZyU8UtoYAzsPjBhdPyeoG
 CF+WejE6/Gl7o//0KYJeREY18wIVqmlq9sUa+qhGKgWeWqmfJlOFARkbKuKDbRRfs/Pc
 GJ6kIJxFVr3Goqy6OkEKlgO0/PkNFcqMueZqvZx7KeuJTzC6wfhxm5OvepQvEL/u9ExB
 sUZveQ7TqvFDU00ZvccWPQVsY1aapL+0iID/bbSjDPgUDswivVpmLI8TiAm5hyyu2V/x
 rZOg==
X-Gm-Message-State: ACgBeo1APY3+tJsBott4GGJq3gbyHlXVO0ePJop+ajALsDSr623VGFQw
 v19Ld8WYcbxlysnQEX6Dzj1Cow==
X-Google-Smtp-Source: AA6agR4Ht1JX8SPjimMrPZ1pZRlPJWDsLH31Ole52fwVDxTwYWAWKuLMhzyt3S3uDWMHQJVjpxPkXg==
X-Received: by 2002:a05:6512:3984:b0:492:da1b:9683 with SMTP id
 j4-20020a056512398400b00492da1b9683mr946589lfu.58.1661421065814; 
 Thu, 25 Aug 2022 02:51:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 25 Aug 2022 12:50:54 +0300
Message-Id: <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/10] dt-bindings: display/msm: split qcom,
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
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
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +--
 .../devicetree/bindings/display/msm/mdss.yaml | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+), 29 deletions(-)
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
index 000000000000..afc48d2b02f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -0,0 +1,183 @@
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
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
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
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
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

