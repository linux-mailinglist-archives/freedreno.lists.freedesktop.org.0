Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D982FB41DF3
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F5710E7BD;
	Wed,  3 Sep 2025 11:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1LVA8zy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B4210E7B9
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF2E3010113
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r0xPMPdjC1SNu6J74OSyptSDeIyByGI1ODski72XcQk=; b=M1LVA8zyE+wLXtXE
 kKRT1oFTP1GhLEyBQc8rWPCOopFXOjbYaHaTsZOzy7Fzcuu9GVUa/Ozd81KZ4i4T
 E8y3PBFEiGJPuvbVMWB2x6DzP8qx6Kyjsb25BzOjh2BR4owGhTvVLwRZ8TQInr65
 rGSaC4Lnm4/08GYs70fxqyt78oDWqxtT7pdON+WwSQn37lv51vvLh351X7eKv0ay
 6ecOUrAWph2k/FA7echL3RvPJaEJYvjmaZ/spyZa4lis+eIaevUACvP2xb7If4lF
 lFjYjN3r+1U/qV3GlJr5N6ts2i8kE5J/ruIIXbSZ0jxlYJqc/1JBkyUNfd83JGzE
 1Udymw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ufqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7211f13bc24so28546186d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900716; x=1757505516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0xPMPdjC1SNu6J74OSyptSDeIyByGI1ODski72XcQk=;
 b=WDHz6IT9WPP5W4qbx48O7MWXUf8a+RYOQky615dAcYTB6H1pNv37EuqWAR0XGHqNBh
 FeaP3O5M5lU5UJGJSswkMCyfU+i2/iF6FrTsB0VqTl/qFL5jFeejT4DjbEpfMleGjl1h
 926QUIVGbfLneH8aDKftypadX4VNFvXEYz0Rnc6keZZn9xfT57mKqZeCi9Fmc3vivxFq
 b5vtBgw+2NAxUWcRTG8tztCbFe+vKX4SCulCEYIIVevtQscgWmgkaXE+2ioHpvZKLTbM
 H69ZPzJ3FoNlb97ogyaIO9ATKCWw221LgpfLGXnRM0yVdGn7VLcISc5puFYInTB2szGi
 /UXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAIcJG0PzIyEWKWAe14cwtsLyUt03aQUE+0gSIvqTAl3l6rqaJBWXEB/k3Zbn0rFNqNCYDOE/4i5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRv/wGFdnEiYtAeXuXsOe8mW2BuqEOk65PwlskFTw6645WYsK5
 EgqzpoYoH7O+L4ZPTuA/O5rgcU+VDEkWZAjaoj55pmtUMHpkXfnLy1tWydohVDPWzKGW3ORSfZz
 fgRmcFgOLLdK6MEp/xJKzbjsG9sTgo1W8K4XDS+1OK063vw0uu01dOKgI6F2uQO4kZyO2VyA=
X-Gm-Gg: ASbGnctP2NkolI2UfoRu7YjIRkn1EqnVAjaKWHgEcaq9rrlugHY71m34B/CwvT4OSCP
 G1w8qyC3EH+xvFiqDh8WVWk40E2KmqRBlNMmT0OjAC8XclYbyX06k0n7Py39TXfGSS+pR73e+aB
 1gokGd2WXnoj/0TjK72zWTyw4CoVE/uGgYH+V6iCP09bKD6BES3hhtIWE5uYa6GmQn4FreBFj7C
 +1jE2QOMV9eusGjTREJZcpSY2l0K+Q1S/C4f4N9Ia+GfwrlCVPJ16ZoCIjdYt/x8oWH67trJj07
 Lfd2rfSvFaaLY5Aq3C/PlpwllH5FQhU6VXyyrXFkBiQ7bWft5F8s57M0bogV3qdZEx1WwS0UBwy
 UbesmiTjQBIpefvHNiSA3SosG5RmyMsd+mzNDT65kwYXrU9yFscpG
X-Received: by 2002:a05:6214:d02:b0:70f:a15a:9262 with SMTP id
 6a1803df08f44-70fac913518mr156788316d6.51.1756900715710; 
 Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0SuucAVxarCRPLTRQqLCBZ9vgTwGAR38CNe/suqV5ZdIiT7GcfkR7BtO6JAAehjJ+4N8lVQ==
X-Received: by 2002:a05:6214:d02:b0:70f:a15a:9262 with SMTP id
 6a1803df08f44-70fac913518mr156788056d6.51.1756900715127; 
 Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:18 +0300
Subject: [PATCH v8 7/9] dt-bindings: display/msm: expand to support MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtHyzGTb9hrM/WTe1AikW5eypI0AzlUrgR71ld9KC4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y/Ov7hP+0RfhsbREPtQrI7EbtVDbgL2Mnb
 OfGf0ybedqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1XbICACH7tBodo+5AqLshUai3suEs3+I6C/qFG56DfxXrBFYVPzokXXb0BN9PXyh4d6R8Re8J1i
 1aXhp9ky6a5KA/rWByQynQ4BRthTnqmKfWbvuLHy1DkUgFN0qQFB7bJDeO4VsVmwEELYKbgJEHR
 O3e75omP2lDcYuMiyoeSoeo+SF5Y04Xw3lDAMjHA1AqAod7x54LI2rIs2YdJ74tB2aHIK6EJCHT
 6Y7OP7DhZqvdJ2NrJ//L8rzeR/Zta1PAwFy5Pxez+uiXy9XXv55Xh5iTnx8uJ+C9YFMmGWaYC5+
 nADFdN9PUDG7KMERXf7B4Yva38dCRRhRvQtmJhqVFxtBW/a3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5NcH70UEBoQhOffmUQqP2V1QA-y2C0uJ
X-Proofpoint-GUID: 5NcH70UEBoQhOffmUQqP2V1QA-y2C0uJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXw6hUZ8SiHNya
 +k0bU/8jLNjkb1eKygkW3XhoMtzsUrS+DauEpcBgOgE1GmA5X+tgctrN1GGmmPgQ3RBMFSu6ySd
 tniUh3nzuTTzRhYl+553mmYgwIBN9MjQWDjwU/LaIuJEspLeYuuSCEKUlJhz1cUyAUUSOw6H8kI
 aEbs3w+5uBVihP3PBZGuzhmt5c7S/3gVH3atn+qMYkImFFOWX2tn5LdsPM0J68C0AAwU2xiWeik
 pw8KSKPeJsdjGZ+lu9Kq0cAse7S/Uc5jrGpmxiu4Y4pfPZpLftOvlBW55sr4hT0+NjKV0tUawHd
 q1T2tt8YX88RiIozwN4I2nlJ+5/l7lT3d4xvjvXAmGXU37xBqIAjL5qSkqvi0tWLg5ScP2xiFqP
 9KfKFChs
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82d6c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uRafYTt1GBQvBzODlV0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

On a vast majority of Qualcomm chipsets DisplayPort controller can
support several MST streams (up to 4x). To support MST these chipsets
use up to 4 stream pixel clocks for the DisplayPort controller and
several extra register regions. Expand corresponding region and clock
bindings for these platforms and fix example schema files to follow
updated bindings.

Note: On chipsets that support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 103 ++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  10 +-
 7 files changed, 150 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index afe01332d66c3c2e6e5848ce3d864079ce71f3cd..aeb4e4f36044a0ff1e78ad47b867e232b21df509 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -66,25 +66,37 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: p2 register block
+      - description: p3 register block
+      - description: mst2link register block
+      - description: mst3link register block
 
   interrupts:
     maxItems: 1
 
   clocks:
+    minItems: 5
     items:
       - description: AHB clock to enable register access
       - description: Display Port AUX clock
       - description: Display Port Link clock
       - description: Link interface clock between DP and PHY
-      - description: Display Port Pixel clock
+      - description: Display Port stream 0 Pixel clock
+      - description: Display Port stream 1 Pixel clock
+      - description: Display Port stream 2 Pixel clock
+      - description: Display Port stream 3 Pixel clock
 
   clock-names:
+    minItems: 5
     items:
       - const: core_iface
       - const: core_aux
       - const: ctrl_link
       - const: ctrl_link_iface
       - const: stream_pixel
+      - const: stream_1_pixel
+      - const: stream_2_pixel
+      - const: stream_3_pixel
 
   phys:
     maxItems: 1
@@ -166,7 +178,6 @@ required:
 allOf:
   # AUX BUS does not exist on DP controllers
   # Audio output also is present only on DP output
-  # p1 regions is present on DP, but not on eDP
   - if:
       properties:
         compatible:
@@ -195,11 +206,95 @@ allOf:
       else:
         properties:
           aux-bus: false
-          reg:
-            minItems: 5
         required:
           - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support SST only
+              - qcom,sc7180-dp
+              - qcom,sc7280-dp
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clocks-names:
+          minItems: 5
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only
+              - qcom,sc8280xp-dp
+              - qcom,x1e80100-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            # 2 streams MST
+            enum:
+              - qcom,sc8180x-dp
+              - qcom,sdm845-dp
+              - qcom,sm8350-dp
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clocks-names:
+          minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 4 stream MST on first DP,
+              # 2 streams MST on the second one.
+              - qcom,sa8775p-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 8
+        clocks-names:
+          minItems: 6
+          maxItems: 8
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc49086185d17c7c18d56fb4caf98c2eda..e2730a2f25cfb0496f47ad9f3f9cbf69b1d4649f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -375,7 +375,11 @@ examples:
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
                   <0xaf56000 0x09c>,
-                  <0xaf57000 0x09c>;
+                  <0xaf57000 0x09c>,
+                  <0xaf58000 0x09c>,
+                  <0xaf59000 0x09c>,
+                  <0xaf5a000 0x23c>,
+                  <0xaf5b000 0x23c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;
@@ -384,16 +388,28 @@ examples:
                      <&dispcc_dptx0_aux_clk>,
                      <&dispcc_dptx0_link_clk>,
                      <&dispcc_dptx0_link_intf_clk>,
-                     <&dispcc_dptx0_pixel0_clk>;
+                     <&dispcc_dptx0_pixel0_clk>,
+                     <&dispcc_dptx0_pixel1_clk>,
+                     <&dispcc_dptx0_pixel2_clk>,
+                     <&dispcc_dptx0_pixel3_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel",
+                          "stream_2_pixel",
+                          "stream_3_pixel";
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+                              <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel2_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel3_clk_src>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec9d3e0892276e14b49b745d021879..44c1bb9e41094197b2a6855c0d992fda8c1240a4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -207,16 +207,20 @@ examples:
                      <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
-                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel1_clk_src>;
             assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>,
                                      <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585216ca0e1eab6a79afcb21323b201..b643d3adf66947095490b51625a03635c64c37c2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -281,7 +281,8 @@ examples:
             reg = <0xaea0000 0x200>,
                   <0xaea0200 0x200>,
                   <0xaea0400 0xc00>,
-                  <0xaea1000 0x400>;
+                  <0xaea1000 0x400>,
+                  <0xaea1400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <14>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index c5d209019124da3127285f61bf5a27d346a3d8a1..9b0621d88d508fb441f004261c42c2473bea2bcb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -394,16 +394,20 @@ examples:
                      <&dispcc_mdss_dp_aux_clk>,
                      <&dispcc_mdss_dp_link_clk>,
                      <&dispcc_mdss_dp_link_intf_clk>,
-                     <&dispcc_mdss_dp_pixel_clk>;
+                     <&dispcc_mdss_dp_pixel_clk>,
+                     <&dispcc_mdss_dp_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
+                              <&dispcc_mdss_dp_pixel_clk_src>,
+                              <&dispcc_mdss_dp_pixel1_clk_src>;
             assigned-clock-parents = <&dp_phy 0>,
+                                     <&dp_phy 1>,
                                      <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34..4151f475f3bc36a584493722db207a3dd5f96eed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -401,16 +401,20 @@ examples:
                          <&disp_cc_mdss_dptx0_aux_clk>,
                          <&disp_cc_mdss_dptx0_link_clk>,
                          <&disp_cc_mdss_dptx0_link_intf_clk>,
-                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                         <&disp_cc_mdss_dptx0_pixel0_clk>,
+                         <&disp_cc_mdss_dptx0_pixel1_clk>;
                 clock-names = "core_iface",
                               "core_aux",
                               "ctrl_link",
                               "ctrl_link_iface",
-                              "stream_pixel";
+                              "stream_pixel",
+                              "stream_1_pixel";
 
                 assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel1_clk_src>;
                 assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                                          <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
                 operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index e35230a864379c195600ff67820d6a39b6f73ef4..8d698a2e055a88b6485606d9708e488e6bc82341 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -183,15 +183,19 @@ examples:
                <&dispcc_dptx0_aux_clk>,
                <&dispcc_dptx0_link_clk>,
                <&dispcc_dptx0_link_intf_clk>,
-               <&dispcc_dptx0_pixel0_clk>;
+               <&dispcc_dptx0_pixel0_clk>,
+               <&dispcc_dptx0_pixel1_clk>;
             clock-names = "core_iface", "core_aux",
                     "ctrl_link",
                     "ctrl_link_iface",
-                    "stream_pixel";
+                    "stream_pixel",
+                    "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
+                  <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                  <&dispcc_mdss_dptx0_pixel1_clk_src>;
             assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                   <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;

-- 
2.47.2

