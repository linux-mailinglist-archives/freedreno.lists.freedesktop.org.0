Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20910B5364D
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B123C10E379;
	Thu, 11 Sep 2025 14:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcALeOKq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321910E374
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAqXW4005396
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=OcALeOKqq5FfiH5Q
 Py/QQNLNC7rX/Jvk5AmVTJFz88Oe1YAdz8BSgnMrb/WAv6e63K/Uug1JNpAS/tYx
 ShKC5dv3Mef2IyOGWSAzfQlV+gdKwokiiHuBFHrzCrMsAd9vgXU+ShjOn3uOGcrk
 slSaU7MsJr5MExTLVwoh+62ssdm+t+mBdLBq0D/s7pdyteUqznEqwBrb6oGwvorx
 NF0n+SN6+LN7GsMO5nzltelUsrzsBp9RcM6MzZvvqIOnY+OSk2+q99sG/pLztVVC
 vXum7oNR1aho9RUlMtTLXttrGRn3olEW+NZSCgrkNRz0dhiHWHKjENi/e95SHcO0
 16Idag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2c76u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-329976ff73cso212678a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602247; x=1758207047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
 b=SnqojSZ/x/f/NcKfyXdw672RYL4ngu53KerZXjAATCr+f1nImd0FCx3mCBvI5UzF0b
 oZTJqR11lnbpbw8+NoTwOiKHiY2KEx9A8Exp/Ylo0tvUf4X0BylZC9PEz6INjD+gAvzK
 XJTDrljLLRBqb42IR9YO4r/5wh8JYLAHE2VcmSAbrBRAyKH2r+EHvyMLWmppufvGnuoO
 /B/n2ABJlKhcBo38whOPibLBr2KJjQGGAT2Juh+ra2QTNR6h0jGl9+YkeQfI1Xa/BKwZ
 D+GHp9AmCCpGZqgaT1iYNKxo5w9YeZRjGmwvr9PUyYi7KQy5ELTrsNNsXAbeLiMiYbLW
 JW/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgrIlevI/P4VAPRy6R6XHG10IPV/hrJmtyuDDpx6IS/e/Ip2hTBiK2vbDv6vBHnzbOEdlYWTp34Ck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcUtlUgkuhyt/df/2LP3ysCD9es52aPRJQ+kYb0JVUnoOgwN1a
 thLXSJBt6mNEKlCScajEVPargawzPSVAHeUSo29JTNwWeaDocLLgZYZa3wEAqZCqIeSnWygWidO
 4IcC6zlk/uTvrwM1y0maXhEXZmh3jhV4dJbebfJgA26RGZ3P8/LmazpeP6z0G9iWL9I3ElAI=
X-Gm-Gg: ASbGncvget6ybS9RtYc5nVezyUuHNS0/BFG0J8S0RSF1QJePOAcELSaRtA9Bx3phsiQ
 Sdl/gE9WJMJQwX9LJZaapOWh0Ky9HJIN+9I4eEYmxvGisB2hnLq1bvDZLPeNNAfZCG7ULqxyU4e
 IGkA3nC9tvvDHWIWQYLdensmy6JmXmaedZCfrihPKsi5f5REyQ6MhfFMLvQHYa4k+GGYEmPFqul
 CiR3rIXmpBHZXQa2F6HTBsLgDlsmdNqzesdwfqV0EQYoRj3QCqI+xt76L1A1MuEtNi/1b4ZS7JN
 B2QiHc4sTVYn7zggqAzSe3Aq4Guwqtg7Iwcg0AgV0b0QuJssldlQ8M+VXQ+xySyQsQuJUMwKOW6
 O61ZziZsBPPqDeZxQpWDCQF6P3bYSP2VNb1XLdIPvoNqqapSI1NnCXHLe
X-Received: by 2002:a17:90b:1a8d:b0:327:c784:7c37 with SMTP id
 98e67ed59e1d1-32d43e2917dmr14750888a91.0.1757602247035; 
 Thu, 11 Sep 2025 07:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7xvZXGDe4gGeaoUOspB4SP+Qsy4fBUGY1A5emQkBUdAaDIYlttMk2dqbZSQPTGCSsk4VkxQ==
X-Received: by 2002:a17:90b:1a8d:b0:327:c784:7c37 with SMTP id
 98e67ed59e1d1-32d43e2917dmr14750843a91.0.1757602246317; 
 Thu, 11 Sep 2025 07:50:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd6307590sm2934648a91.16.2025.09.11.07.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:50:45 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:46:08 +0800
Subject: [PATCH v4 01/13] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-1-177348170c2d@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602231; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=qc4pX6kLKMoQjj45+8At2VeBeL4dm1JdeB+kNKD7kalxk9Tt5QDSuBldZaZaADwgeBZOZ/Jh3
 Rl//lKlw+bnDcHgiBAN82wKoU/3KmCQYDgTPVLd/kZkokweVPv3gmM2
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c2e1c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: I5PZMiKWY7aXjX50yLW8RW9VNQQdRqaZ
X-Proofpoint-GUID: I5PZMiKWY7aXjX50yLW8RW9VNQQdRqaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX2w7Ln1aaL791
 Onxif4nIdPCW65eHS8mb8/LNL9mf2HBnJT1m7/ISS0EBIf1p7HfcXXDUb3Pjeb2Ql/Otz1nPX7S
 BxJlrFFNXdKsMP2wADJBKRccYqF/Bw9ccOlpb8qmdgY9aXXhNVsXqpoc2XJOi67Cn4exM9zJp4N
 FFl8pr2IJpcXE4mToACxii34HtA/vnLlhYuceDfQ9+3i7QsrO4RzqSA0tWmTjygcedshUppXBzf
 5mUexRQCtYBi9qeJcKDg2cW0R5wTNxGaLvzCFveUlaETKV3/qJ5L7Hh3xAB1spY7wU8BHBDuq0z
 7WM4KKv1jYckVk2vT+V7eTg+n0nskGZtbt7BtQb2G1WhJYU3quMN5d0zJF8iH0o0KXynHKGeBLJ
 cfvR2FT+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

