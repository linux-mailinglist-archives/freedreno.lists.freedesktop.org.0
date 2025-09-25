Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F86B9DC0F
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705B10E850;
	Thu, 25 Sep 2025 07:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVaXGckP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138C910E852
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONHg4j027912
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=; b=aVaXGckP3xZHpeRH
 dWVjafdziEU7gMMx6CiLzbJg3WZpSYr2io6UOWDH6OzAVHAJD5VqVtB9X3eQZ/Qy
 JiKKEp9gZYNgPi1pN9C+IyC2s+UsyPGe0f2TQdUtkRVG2KoTX35JQkoz/Yj0SsdL
 rNW8ku3MkkTM0HPDUW8+XfLdVWwj2zbgqUwvdS11oTrhFVbFDiouacMwAUwOsKY3
 Gf7WeH2HEBYRwwrVexU412u7PbavGkkc4Fq0ZJcRS2xS+RDeINdNtdNU98rJ0/R5
 0Znv1YYe609GfF4bHYaUuCLJQqLZNXGL1H5lnNN6u0gNSSnpYXKn1juymL/fV7X8
 s1SFwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnyg62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-33052cda83bso169572a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783926; x=1759388726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=;
 b=xVb0E7GR3VmOtPCQayxAG2msWmGAnZKfP5sxdOg9oxawSfw5H3BKa6ohaeQrw2XGpm
 yAJBmYZhq3dE3jG1VmoANIqDMvAvy/1KStPb9/ovZ++3LyENJcbFyT3XM28WhBFckzn4
 YS6YSaP9/0EZxScGcONQVED4ENkt1ou7mLPP08nSNDC5pVDsehg6KItG4xxVJ/FoCdZm
 WhjO/iMGddA965n+TTzctwUq5FKs3cdv3h3frXS8BXnvQWw0EaiAwINnz/rYxIZ8zzr/
 JKFxXA0typL2OfDShMbvVBpdHJynkMCPosp12efTmenkAP2PVnMz8QoTJYcCkAtRg/eR
 hBag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxArylDXGSIYty0ZVLgPfWnDkSgJsDqIO6cDLRZrPHPUA6KhaL7t2EbulO7QIBJj/B1yvk90Y/k40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7VSItLLjoZqfDHjXp4Cz7ZfZ8Yh/pfrb7VAoioogakta07Xba
 EqfkCbF/kw7T+UvvXWEpyC6MCCRDWGsQQ8Ig1a7Otds+xb+4Mh2jS1W9Q/R5bNuSkPjVfnRcCAM
 02XVZiibDiHDnC1TFKIIEdHhEh3PcIo0azUk6pAk6euCQ85A0xgjiJNWpRGmlrH0dvKaTDzM=
X-Gm-Gg: ASbGncvBCIYO+EeRuMYqSo83mW4wJy+aPyd1H12aomEwAPiaygzg1n8kwS5mC6YsSsA
 7U4RwtadsgkIXMaeb1kbpl9VaGWh4v6o8fjHFqHSisQ0/KhOVaAicN7xIhbm3sw2yAABh+G9Dvo
 hXhDk/+BRtPLI67+ql5yf/1wihVLqHbnIo1gLh/VezPr1eDwCMY17fzK4Ag0IcMJiPNrV78v5Bf
 LShpVnOdFP9ypOoiqIiaLPTY5cACE7G1k/bn+gDC3kpyrxkL4SeXdzCbCtKJgxA31j+cEdcGiiS
 KFvDEEgOYNC29zHjjiQHdYIhT4bOC7LNAWX19rXqzGYaUQVNLRVQLFUuQZo7LUk3DBfWCC1Vv17
 qKq/qCuFY9VUzCI+PKPCfnLMHjCPgJ45yjq/cHRm/WEbDpxMJxR6IE48Q
X-Received: by 2002:a17:90b:4d0f:b0:330:b952:1069 with SMTP id
 98e67ed59e1d1-3342a2dbeaamr1385471a91.6.1758783925811; 
 Thu, 25 Sep 2025 00:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCpqcvdQExDN/tcMkaqHwuJZtGGTfCqnGGzDy5L8LFUtoOVfzw9y7B/380xTtLfWXC04SIqg==
X-Received: by 2002:a17:90b:4d0f:b0:330:b952:1069 with SMTP id
 98e67ed59e1d1-3342a2dbeaamr1385428a91.6.1758783925188; 
 Thu, 25 Sep 2025 00:05:25 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:47 +0800
Subject: [PATCH v6 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-1-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783908; l=3580;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=upWyBh8lqfmu6LV7sTpbUr+WwNLCQ/FfInBDAu5O+9Q=;
 b=q8QTjt4okaLrL3p8+JMm94E79JTZZNoDPRaTdjR9Z4pKfRZoQHUIoCdwtYknqyxQ/TKHScZ1h
 VvgnhdjPFT6AMHcRVzzdSJH+4MJR9pH5fUyv4MuUabA8/ITet6h1K0e
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4e9b7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 7HIaEJMnoEpwlw36qRFUZZMGulCC24hD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzNZceH6Xni3R
 a0aEV1Ii5DBvJ5c2BpKMUJQ6vSBPSnGwq9zXDK8lVDrHOYZSpPtLh6DlF7QZpkDrFwhRO7xDy5A
 qB9AdqcOxnkH5eXgCVjbqmFLoeToLwF24f4IteGnH8hwCRSvfHQpcYq2IR2C0C+KLmAnYT8BK8G
 KxM4/IbQkgZibk9FIcKTsunrza/mNoXIhsaP+yLxcEbYhd4SVIIT5B4TcLio2dad4R4t66W9nFP
 VUmM7WfWhdNf7s6O7ZB3Pvi+TDEBItRUM/sr82BILaPMo9xCWehdcI6wvR5GoSygY4rT6XH0ctZ
 zkvIGGj45Q78UP71nXAq4ppJrBIKOg4CcoVpnl5wLpEuBH8Bo7x3GmR4LTQ9ODnjugXpE6vguno
 y35XcQJW
X-Proofpoint-GUID: 7HIaEJMnoEpwlw36qRFUZZMGulCC24hD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

