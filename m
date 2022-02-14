Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B484B54FE
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 16:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177C610E1BC;
	Mon, 14 Feb 2022 15:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA7310E14C
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 15:29:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h6so27450732wrb.9
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=82zctBdAR+xxKfzKfqIvB015sU9OBDs6azQtyHWTspY=;
 b=NRzeTBcVEemSJSxDheG8JbsWM7NHqBHERZ27+hzZzs5XoLMw8rcXaOX3rc+PHdBqDT
 OmKDymBupJtKToIyciZATUWT+NitYIRPbj1iO6Q9I5XzIDWZJmOxSnafWjoWTLuxKYg0
 yl1n5c0yOq9KQ/1SyNJ6azHmRpm0b8akaTSm9MLPz9uL8dY3H0lYivvm1tfL9d3hZ1dV
 fi3wI0DJ0RRz1zi2ZoF7uRdsqLfpAu53CADSDWF2HYw5aHPLppwJEW3Vlo2PtyMTxXpM
 kNlQrCXmz2hMSO5II/f7Cg3i7k8o6Ex9G7eDtTOkMvaA7f4F6MTuS4QqPtdaGc0BU/Kl
 +P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=82zctBdAR+xxKfzKfqIvB015sU9OBDs6azQtyHWTspY=;
 b=m1UFZdyaXYWTj6JFQkeMYgDMUjgSxGqooajv/TyX1zmv3Z5mSYA8ypqiqoChRQuiWq
 3O+Qo8qmoXxAcYP3lZjckLEkeMlMTmPBcb1ZFSP6dDymbJddfhuaM0Qi2Ys0bscE7Wj6
 MxFa40g3YD64BU0TF1KtoYFSgka81dANXwV89D+FxbfhcQKqLTsKN4YmYfbffekEubF1
 paJlLuF03RkVtJXvk4BkfhbvYv/EJDIQdgLxpLwTqVtRJ3evRBwPehoLgDJTlGqpLY14
 yhf4Kn2CExzbTGK02mfQH4rgmkvBH8KTPxlwjjo+aeyfuC7UvJBcwYKt7X0RmyezfXcc
 WxWg==
X-Gm-Message-State: AOAM5322P6NJpO8fybviZWb+TlofJHRvTD3Qf418lFJyum83YYmJoA7k
 MwXLSGRZ0XZ5qkUC4Y2YGzL4SA6MiU9SLw==
X-Google-Smtp-Source: ABdhPJxv1I3Nl4Zdh+K87qCrxt+Jbam4j8djzc+9cgVDciCDhq8pbn2scWl8lsHaUf/FPKgCJfFNgQ==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr108949wri.661.1644852552536; 
 Mon, 14 Feb 2022 07:29:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
 by smtp.gmail.com with ESMTPSA id
 w3sm30657229wra.67.2022.02.14.07.29.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 07:29:12 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: dmitry.baryshkov@linaro.org,
	robdclark@gmail.com,
	robh+dt@kernel.org
Date: Mon, 14 Feb 2022 16:29:07 +0100
Message-Id: <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
X-Mailman-Approved-At: Mon, 14 Feb 2022 15:39:46 +0000
Subject: [Freedreno] [PATCH v3 2/2] dt-bindings: msm: disp: add yaml schemas
 for QCM2290 DPU bindings
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
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: no change
 v3: no change (resent with reviewed-by + freedreno list)

 .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
new file mode 100644
index 00000000..8766b13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for QCM2290 target
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  and DPU are mentioned for QCM2290 target.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+
+  interconnect-names:
+    const: mdp0-mem
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,qcm2290-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display AXI clock from gcc
+          - description: Display AHB clock from dispcc
+          - description: Display core clock from dispcc
+          - description: Display lut clock from dispcc
+          - description: Display vsync clock from dispcc
+
+      clock-names:
+        items:
+          - const: bus
+          - const: iface
+          - const: core
+          - const: lut
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU_INTF1 (DSI1)
+
+        required:
+          - port@0
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss: mdss@5e00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmrt_virt MASTER_MDP0 &bimc SLAVE_EBI1>;
+        interconnect-names = "mdp0-mem";
+
+        iommus = <&apps_smmu 0x420 0x2>,
+                 <&apps_smmu 0x421 0x0>;
+        ranges;
+
+        mdss_mdp: mdp@5e01000 {
+                compatible = "qcom,qcm2290-dpu";
+                reg = <0x05e01000 0x8f000>,
+                      <0x05eb0000 0x2008>;
+                reg-names = "mdp", "vbif";
+
+                clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                         <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                         <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                         <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+                clock-names = "bus", "iface", "core", "lut", "vsync";
+
+                operating-points-v2 = <&mdp_opp_table>;
+                power-domains = <&rpmpd QCM2290_VDDCX>;
+
+                interrupt-parent = <&mdss>;
+                interrupts = <0 IRQ_TYPE_NONE>;
+
+                ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                                reg = <0>;
+                                dpu_intf1_out: endpoint {
+                                        remote-endpoint = <&dsi0_in>;
+                                };
+                        };
+                 };
+         };
+...
-- 
2.7.4

