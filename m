Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBECBCFB8
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0B310E3A7;
	Mon, 15 Dec 2025 08:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="goziGgG0";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbEBQMnG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1F510E3A7
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMQGKl3646606
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ejOLCXs2H6V
 eH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=; b=goziGgG0IItSySQrlKxP+XsOHrT
 rlBOewv2PZTaQm0KiIlo3bo5kOdGTpybHsFpJrrm8A0l15YJBxbSS1YOsDz1fePc
 i4g0IfQAopF2jze9fIXBu8sL2ZinRDBVgCnYzhgezX1vbcpsfCY4k0Oxu8sGA8tC
 Hd6ndep0mXWt9vKRDIzqDGG6+LHw2jVYcgiSKLGXvHr4thW2d0rSRQWeIO0JPP2M
 56o1Nop0mJCcnZ9SkoSB0Qv8/InuPn+1xLjXW6F2xJJQmRlMkfMMgwLCAX9vJI29
 U/FIQmEkzNT/g6+LGu1VE83z4LfX2f4QPAUnFEEiBRZ8/BfIfIKaalNQ3Og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7ursq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee21a0d326so33105271cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788021; x=1766392821;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
 b=WbEBQMnG6ALtqgliZ1TDO/fbrsp9brkang1SX+UqFXoEamE94/j9y5OOvCtJOywisU
 3NRIpnHOs/JgI8anU5lvvdDnbht1qH1N2zX0k6ziA29Awz62pKnBveQNE69vg5S4JHBX
 7ej3IHSTFLhjQJypIGBJmMTHd0AZMnZSciwC7YekRzLr3FIh0BoBlykE+XcI1GV7enVY
 VLtUiVHHzuNIZ69o4f6AJcyLe3DQrhSIlP2YiFAreD9hlrArJPZbw8PC7g0SpQvlQGHi
 Bzxie6LDqS6RRgoHgJesAnIzCs9gB+RbLMxkh/zm2lc/FbcmLxCjSJNlMKI4g+mBBP0h
 gAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788021; x=1766392821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
 b=rTPlB7kIrcMo6ruz/ryiSC3b4+RdDJduq8mvb/CN/tzVlwd6YQlLgNAqXJCnYzchkC
 CiaUxzG/KG7fFv6es2qsPTi0lmU0PjjKEwIve06wmrwQ3OpXKWH4OWCafc0UKYvymK8L
 cz6sedLLjB6RB7+IaaYbH8Ukz9zFrDxLRZ/rKHsUinVTvEI5oZl3CJ5aanGfk8ZBRS96
 UeWZ/kEEMkG0Wn5yf/eE7hfnyo8tHxybmPJa2QzXbpErRy+WeTl7g7gqJbxeCV083Dpq
 MuMIx+COyUjw08J4mxiG/v7sCQEaEuRZvYu2ZQ4T1PLuezNReFnKmI48R0ZyrgQsLgg8
 c+QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIVbQqzr6L1JLxeUojyOh11JQNju6XCYOVLb5r9VU/vPrU6P1lIcuDV39UZl9FpjkVDKS1krmQ3Dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlS9cIC9plR+Nmq71eXuMCosnYUerql9Fmm5p98PP4eougg6qA
 kj+jUiUdwcliAr4f6dnqbM0jAlNESpM4H2KGaFQU8/3x/l1X63l8bd0myAyrH9MsTvpVFSWZWVF
 p+aHDslQh9PTaHMfHNfdjhbks8epK3j17YbWR79+v5xiQmTfQtIR7v5LrWhFjsULCHHY+7Ws=
X-Gm-Gg: AY/fxX6wXcM+wNAmcNT1wXwfh29ztivxEUEapW25PGLIPHFJtlQr9tqfxy7FaVDY0SL
 NxbudH1r7vsOJfCpItbVfoVaaQ+nVeM3rb2WQyygNeuinlh8d8WD7zST0SRj9Hl1QHdxDaPOgBQ
 ngmVANMLWqU+X2hfGGThp+ALrJOl9YxyuSimDIZMy5qJwklK6k7gjblDSXfcXJ+ZTwGbzVzySHg
 pwU01Bxz1xhJPeFUDh8lKaO6R4LdMOyh819d+wVALkuyhKF99Li8qIIytSm8RKiOfqRmbDThHiX
 HEKMcm4qak9mlJlSomEebK6i8RglmX2pY6q8eFOuMZQLkGAZsHBWa7BNoSIhKJ/zLP8bLueq9L9
 +c84pFMyH5ql6iTBwCVJBXWuykHcwdXOSuq8ynl0RhmV3FrH6U9F1IjEgoD88nOCs4jI=
X-Received: by 2002:a05:622a:14:b0:4ee:739:149 with SMTP id
 d75a77b69052e-4f1d059e3a1mr136581681cf.46.1765788020581; 
 Mon, 15 Dec 2025 00:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmxFdMKPIKbwVSnYQ41ff/1mZalKEXYhAjGYgahZJ4WpTfUfg/F8/VvJ6t7RoZzhLyp5YFjg==
X-Received: by 2002:a05:622a:14:b0:4ee:739:149 with SMTP id
 d75a77b69052e-4f1d059e3a1mr136581431cf.46.1765788020149; 
 Mon, 15 Dec 2025 00:40:20 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:19 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 04/11] dt-bindings: display/msm: qcom,
 kaanapali-mdss: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:47 +0800
Message-Id: <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX8soE181+Zsun
 7sSDtzmp2h7HsNC+eVxdOCQFIf3OV0Fu6GoC4YnJx/PUfF7+tyPhKMJieueoERyYCnBxyHVNp8c
 H2CzGo+zdA+N6hJN/PrT8RTLjpmAi+WrjF1lByAn8Zy5pVHrhMKBwyed/Eld5OXiRxRUwoQFBUF
 YISCYrTkGP2kQVXngX1lzju3M0HdjOt7BCTAzknC0tvN0LIWvV70vcIsbSCLny+9MR4olKI5cGH
 FqXeMSI9A8glAzM2WL+lFNJyQ3OfHzOeh7GPIqFS6X2kcPYy0wT0cGpiWvLLp5lQ35Y7P6uwI2T
 wf1oVWAV4Qn9VQSdZGxBYGigpb7WSRF5IQnI9H/sXhhM1OAuZgZm8nYuPMZRhit8rkuzQPMGNWP
 pl4s59CquK/DJ+1OiSGtJiMCnkSJlA==
X-Proofpoint-ORIG-GUID: FNJcWKbGk2KO-_AXbtfZTAsVjM7U0kkK
X-Proofpoint-GUID: FNJcWKbGk2KO-_AXbtfZTAsVjM7U0kkK
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fc976 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
Kaanapali has significant register changes, making it incompatible
with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
new file mode 100644
index 000000000000..92293e2b4d94
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -0,0 +1,297 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,kaanapali-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Display MDSS
+
+maintainers:
+  - Yongxing Mou <yongxing.mou@oss.qualcomm.com>
+  - Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
+
+description:
+  Kaanapali MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kaanapali-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+      - description: Display AHB SWI
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,kaanapali-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@9800000 {
+        compatible = "qcom,kaanapali-mdss";
+        reg = <0x09800000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>,
+                 <&disp_cc_mdss_ahb_swi_clk>;
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@9801000 {
+            compatible = "qcom,kaanapali-dpu";
+            reg = <0x09801000 0x1c8000>,
+                  <0x09b16000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-156000000 {
+                    opp-hz = /bits/ 64 <156000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-337000000 {
+                    opp-hz = /bits/ 64 <337000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@9ac0000 {
+            compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x09ac0000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy 1>,
+                     <&mdss_dsi0_phy 0>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-250000000 {
+                    opp-hz = /bits/ 64 <250000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-312500000 {
+                    opp-hz = /bits/ 64 <312500000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@9ac1000 {
+            compatible = "qcom,kaanapali-dsi-phy-3nm";
+            reg = <0x0 0x09ac1000 0x0 0x1cc>,
+                  <0x0 0x09ac1200 0x0 0x80>,
+                  <0x0 0x09ac1500 0x0 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.34.1

