Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC2BA2B57
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 09:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645710E9E3;
	Fri, 26 Sep 2025 07:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVd4pMNv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361C010E9E1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6jYag005850
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=; b=XVd4pMNvfugGo4ho
 rsQfGkE9d6MGZmPhUheVr4VWV6ar7uge2eUpr1UnNvtruQoLX4pQ/RcgCRTW+7a5
 OgaU7isGRulQf+1XolJPPBBikmIXPhPmpYHmqk5gd5gQBt6TZzm982CRo6k9sZAX
 X6FbeWzSI01RLoaJQ+KdIjJCvPCRk/WSBsoT2kdRxNdkQQITLGjgJrkD7PdvPbAw
 mDOtsE/pUPRJXRbS6BvKqyeRlqITZSXQK3XgQXAS6t7WjOrMHPo00PENgfVC93Mx
 5EybkFVLjdts/fprbM53MgoKXN1f6SW+hJ+ILirsRlVk9QqjFYTMlS58OTFoyC3i
 MwPH/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db321vgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2728a359f2aso5031245ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871580; x=1759476380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=;
 b=PnH71/ha6j9OGNj41PU/90fNNE8R1qdKk8xHIyIelFLULRrZOO3bra3CwpAs2rupjh
 dSTOVDFAyU41uh/oFSq1PrqI+XHa0Bs5QW8N5OJx4dlnJg28aKvhKoJ0ZRsv0x+9cexL
 SsfcKgfWTmLQCgVFh/YQTtQJf/HCk/B/c/LRJRzJg8BxrRO0RfikpxYgwiSCYrSYqqwf
 fPh+wS9WA4clJ/mk9tv3qnU8WlDbsjovQubB2rmD5jhsJdkmdG23eY02DfmdoGkRvV5F
 hAeh5JQk9Ml4lZi9pG9i398wnXE5jg4I1JiQkNrNX6PcRIqpdrTq4LTs5B97lnXK4GAx
 39wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9MmRU9pZ8aY43XxLMW5uIAtPt8Jq+lsAODbfw+GavaTVTmJA2I8ZIC/aqFL+/SwN3yHsfv9Z3ouY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh8/w0YhdCz8C/SmswtrKCytluEPstRt2ak6QVRHobX6XvVXrb
 hDhGYiOr9deeyTC1sSwXZTTdKwNuKhEs3y9VV8tdKlqQuxzeOi+rfQqJl3JYKW/HlF2Wt5gRaPc
 3fJPhC8wWaTr0xxMehN3MtOKNGrVqvjQIiSPxKkTZIS2TrrM3j6hpDCRWVGl+jChjpo7YnZs=
X-Gm-Gg: ASbGncuTwUKgIx2nlypLodor7yqT7/YiK7QPyQB2Ub7vF2JhCvlA+TwXn8f/QEwU84n
 HpqEavGOQsP57WPlf7rVknLCDqeiwmrs/8NqHQoOzc5Nxc7nVK7hCGFNrph+7Mwr7OqiKnQDBeE
 3+Unb9Bs6/IoWyLcgLpUsKlwteYlnOnMW3Pc6NG8W33MYK3ZPTyzTVHZBHiob8u6c/7+IeyGL+h
 pNFQeV6ph+VOFRphdnMl9QyBzVPsZEZ0Bx1qYGmheagKBqxxsnQlza/x5GEonN8jd30NoOItrwR
 qphMDgfjSNvML+jk64EoRKfcip5ru4yH0oTkn6TDh8EgFQpbgWyDHjvuvx0ABeW9q+I7ZjcnNmx
 yh55C09j7kN8pkaRpmsJWsWkKRydFkrFoxqFeXrpttXgOjLAVTUQQoUZ6
X-Received: by 2002:a17:902:8210:b0:27e:eabe:7604 with SMTP id
 d9443c01a7336-27eeabe7ad7mr12133715ad.9.1758871579491; 
 Fri, 26 Sep 2025 00:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAa2bZIUvZ/fMfkpjyLvaZZws4+i1XtR3RZF24APnyUt8R5PXamasJ9KugA1kJ8xeGnyatmg==
X-Received: by 2002:a17:902:8210:b0:27e:eabe:7604 with SMTP id
 d9443c01a7336-27eeabe7ad7mr12133375ad.9.1758871578931; 
 Fri, 26 Sep 2025 00:26:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:37 +0800
Subject: [PATCH v7 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871562; l=3580;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=upWyBh8lqfmu6LV7sTpbUr+WwNLCQ/FfInBDAu5O+9Q=;
 b=JfaeqU3+hlJ1OLbENBUNv32kEiS9ilat5jb4eIX6JV/6qs0s1jIEQdNeG7Q3eHdAOyUTNVxcY
 Ifpbu8NIITtBig+3IbyNrnLGoEmW0ri2aMMjpaGkCrpcwkZhzWWhzrO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d6401c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 24RouiaVMv4hjMCCvQP4m0lLejYQHcxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX17MdiJmtcUg5
 oMiJTWoBpEpm7/WdzlznJU8LZKDD0xyyXq3VLrZDsyFmgY1g0m1JAflJLD6ceZbw8SK7z73umVV
 odmk+sc/r/PFOKEelWDMbbbIinzqoZWUmn6Dh83BFmL34lZpLhj5+AM7KhViNLfDRytnEAGxHi6
 FJRJ5EO6XwN70KLtvO+Mw8uwztYzW0/UUaiZ3A6BFv/bHCaQPWebtkoKfe6s/EeE7GGzuuKvPz5
 GJZYdQRvvDOGPYKz3gTXQJ/JLYGEwic7nzB/k4p3PrJfPlXLzIikBLzpYHfof0KdHpyQmzBtH5R
 mNc5Jst0tdTurDLnZO9/GcCDFFbC+yBMJkgny0/Y198wCyYmZPRLKI4bYocsguALvy/0U2d5IO/
 0/0MarB0f3h1ic0cQBh43lv6JOivPw==
X-Proofpoint-GUID: 24RouiaVMv4hjMCCvQP4m0lLejYQHcxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efb465c71c1b5870bd7ad3b0ec215cf693a32f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both USB3
+  and DisplayPort over USB-C. While it enables mode switching between USB3 and
+  DisplayPort, but does not support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-usb3-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: ref
+      - const: cfg_ahb
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy_phy
+      - const: dp_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+          - description: offset of the PHY mode register
+    description: Clamp and PHY mode register present in the TCSR
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+  - qcom,tcsr-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e8000 {
+      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+      reg = <0x88e8000 0x2000>;
+
+      clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+               <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l5a>;
+      vdda-pll-supply = <&vreg_l12a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+    };

-- 
2.34.1

