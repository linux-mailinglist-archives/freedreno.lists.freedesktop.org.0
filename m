Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98EB5366B
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6B10E395;
	Thu, 11 Sep 2025 14:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWa2rwR9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73B10E37F
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB4mJi006784
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=OWa2rwR9JtE0Pi3E
 +VVmB9lAdF4GiGxz+77B3UPGSlLm7tlINIrm0wv1hVvZpywBjDiafCuGLmH3q2pN
 Ce3+OCnwsiOZnKHvBEXVexJJeJmwQtsPZFr1C7fCfEYu0UYMatUMWf02EAzrbpWE
 2//eJRAW21/1cBzgfsBrdmyBooiOApSHXkPkgsNyn6LUn0REtjcR2t8U30ffMStQ
 TfLVPpoS2IbH9wFFfMVb5n7XkU3PPeNcJ2Fg3VZ8t6Mxf6960P6uK6X5i55EHJvu
 5n2ciqIrHME8O4/yBWohYxG4EsKtVAMdUjaVhbMYHtGnSxHE80/b4HxsmOZQPXwa
 ZpegLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ag547-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581a191bso1543205ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602542; x=1758207342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
 b=O+7hHu6Vdc92+VkcMrcJ5b3d9eCRAR7/qaWHCNGiN8Wd36VGWpbuqsx9Pko/WXEADz
 LfWEDlpaIr4oomBcbgGuU4xH024mRl3Ibr0NFTLAS4aF0m/Z2iukz7ehktJvywU2K17g
 d7ZUvaBs4XHubkExwKdixncIFcGPQDoQM4xgp/WO++R5MCtLNBdO6hyBPI04yjTCb1xP
 S3qWdAG+nEEHjQvq6aqPK6A5+PznZh0mTxhmavKHF9a4b36vcStTlWqyPB5p+L0JIf8/
 OdM1G2rnXCAXwt2WsXb756uRi5ZK3KTSO8dWxjHCCVDQKE+FwesVhNYgzr5irczv0H+N
 VOeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVboYYatvs/qDhRwXqMm3kmLHAcnTywxjWxM8KRhgiHeKm39BfTi/8tikEN3abZGDRo2x+ZuDlFj4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz90lMktTHAP2JSeAsiwPcer8eAcye46rvHzRLaYuc0UtyMcVDS
 sCLw2BbRbgeEnjfhS9FfpJFwg6ziHvPrOUYTbyIMFdsZCjXEFShFXCpvkm+VkgTFUgiQAB6qydi
 fk7kVQLGSYs2ENFsHVygI7Kd0+psXQltXI51N4gl7IrhtApkvkIFV1sesdtQDF8WQ5UY+SD0=
X-Gm-Gg: ASbGnctMpiHitjAsiX7hN+Ax1mVdP/d5L7WfCkOL2HhB1a5t21tmpflhYqGGWPZ9T6d
 JVKuKtMjg4dGGtbckT/VU/4L2BT3ZbG/0xIQGi0dhxTNJW/AoDTcPRWxgHqxgiHy+EckYEHwy9A
 SnIu55Awnnkqdx9l2OeDEA20Ma4u7gMcowloXKSFJh1OQl3BDrJVrf/rcfhYVmxy3lJJXGObC3w
 AlRtWungIyPFjTD57D7rLzSBDrxLe+fQ0M7DteaGf9mGc1aylizyKrW5pBYqv99VuP/V9fbyN90
 wiY8UPaf2caRFvOsMciovhWShwu4r1SftG/Za8TRU+QEss9uJ3DKZfORK+OnahRTtJdHsxBS9pl
 rfJzBovggS9a1JyYi7sXfzB8ahKwFOQkpOZZLbcpi9rV0UmGglnjpY/Mv
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id
 d9443c01a7336-2516f23de24mr132990865ad.5.1757602542182; 
 Thu, 11 Sep 2025 07:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEtpsa7qlUyYAsgBCQGIBTzIJxW2bcMhr8lZkbI7bFHvqypkmZ+m9OuDf0/hYNs6aysv1XsQ==
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id
 d9443c01a7336-2516f23de24mr132990335ad.5.1757602541465; 
 Thu, 11 Sep 2025 07:55:41 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:55:41 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:54:58 +0800
Subject: [PATCH v4 01/13] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-1-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=mXj8P2zI5LqxmvJf/ITJhpiVlig+/0otZwvxQRDsBRti9c9obJVcSQTesm+iB69NrWfS1lqLZ
 V6KJztXRPxcBV79k9PWjTr9xRHUa2hlg3SDAYgvXdXof961JAOSGaTy
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2e2ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: UzF8QV6SPJFJLVgf-MliEm_KslQZFk10
X-Proofpoint-ORIG-GUID: UzF8QV6SPJFJLVgf-MliEm_KslQZFk10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXw662sfzt8USj
 Gsj+mgf+4WfP4+SQ54RZ/HgK6VFxlcxKciKVby35NcL0AWzaD24zRVHdbmt1XRDxEfnjqZ2dSBa
 SiioH3QWhGEQJCFB7ROY0WykzCzqm+7B9/Tm7yEg6Y3f9VphiCi36j0jKPB+dHAOSOXmBMGEXII
 GUxke63zlBdec9Jl08gSyR0Gnwgbsump3gq9vu4ccQwqhaod1mKpRagvcNRm9jR3lmCt/R02pOa
 G6vFb6Q8YNZsrPU8eww8V0PbUO1goq7SQaZCaxSdz30UKGo8IGxaX20YWUYWZqEXl4pFinNspN2
 wazoy8rSBhhEZPlDBPDWLx7sLgh9418iyWTJDVCGDn1ZEqjm8Kv8q06gFc+gSeIg0tUF8v4rGdb
 QkBAkRIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

