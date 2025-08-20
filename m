Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB9B2D85C
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6310E6C7;
	Wed, 20 Aug 2025 09:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="israyspq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A2710E6CA
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ow9U004061
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=; b=israyspqpbWd2wp8
 leQfCenqxm2845XZ5xLbsqfuzlVK+zU6/lRl0sCjKN34B0Iiaagf43GLo4kBa5t5
 aSb6d8MEfAOG6wSJr6K49b6UNI8y6QXrb3AZET286aM7EN8CmPLsm7C0oX2R/kTw
 qJkiwa68HLMww/eTBN3bKU1iIWJSV79eQr4PXwjcUgUOcgyI7ipbdKTxHsgRDVh5
 OzTqLBsMEzDx4si0I+FXl/7eG4JGZ1gOwkiVwfCE3QyBlWj0sGi/6CCf1iT8LYp1
 vCQBhJkYqz4aWAenF7AbSFB+DwvgHmvFUF0/poHBilaE9XOU/MxC8PKOBqnf/Kwn
 HvLk0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah6ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244582e9d17so16141135ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682547; x=1756287347;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=;
 b=LcKW3nikIzOdRJ/s1E+l2KCXNcThaAXnWMRY6Gc8fOoV6Guz2kl0+/z6a7/GgvYhG3
 5c9q5sgYuz9g6/RjRLU6GZhjwp59HupDd+O2ZyqplH0HS53vAX4M/H4l3wqmJPGOR8Tm
 Gdn7r2EunCm+vacszWPHWGWp2TCxNGelLy2xLLwm9K6Y/jhenVuZuTGpNpIxp9EXzK2x
 7FlqoHakTG5eHjkuyXXTUjVvKzQEbJys6uDo5yPoLzOFiN+NofQWBZj4uOFU4ehVl0J/
 kWAXFXtZl562Ott1pcX+Jnw5D6y7Iq/5S9Qh8FRBZoKEvpRVeh/kNpeLe+p0NG0liHGd
 lR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0il5vT33bANdBKXqRq/I9RwpMGJvEnpetgG60l5E0xFiMELApsd+J+OcKepPfPOFdDUjM/UeEsdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznXB13mdX5wMxtSgpYSj7PCIx/6ONO70AvCW8Fg4XuuQNK1Qgh
 B0QsbXCEdbVbkzp30XsH/AvEL617WgbmI4g//PP3jA0ZlTJjoZdU/dfFt15P9UBi7qJtot5lqIy
 Z4uve3GEEjlFHX6BFQpmGVQYJti+JjE9JvFtsl2aMURYytZCpzBdg4clTHiR1eyg9M/s585o=
X-Gm-Gg: ASbGncuoru2cMO69Z8N5b0vG+8hEV1MX40xY+cjIEQYzwlG7u3kjOFGrRg2XeX99Shl
 V/0OMwAzGMou+AxK+pukT8xinKsGW1TKcTCUSDQUxV8Xbu6GTFF5/cGk2XYcLSq3cg5JJCO94uT
 2Lnwp7OHDzK/b4H06FUdkVVPHvO5s2tUaPxQ2LPJJ3vPLQr9+LEtIIrzEsSgNJwyuvYA6sLCt3N
 vxyWRDjh+w+vtlHQwo62XtY+Q5IETLOB2nqeYEcALechEH87zpXcMQTesbO62cY3zVU53XrsEHr
 labPJJ274UqPyArt1ALZQtL0Va7N/DtE60zjRsUvb8i9e3Dn/EnJovkWPpyD6BG/x5rp0n6SnUY
 GpgJoYot1be1IsyjCrhsQoh4HoEWSDY+gDstbQbQOTMejv1CqlFEN2hiw
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-245ef289590mr14784985ad.10.1755682547325; 
 Wed, 20 Aug 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN7kE8X7szS3MCwXFpbr5XYPBLHKFwJ2wnJ+GWqlR/yDhGf6M8mCARQFC3BCAmxLuxBIVsiA==
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-245ef289590mr14784525ad.10.1755682546776; 
 Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:44 +0800
Subject: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=3426;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=955LdwJghMXcL5Oa+X/F1FbgTdWO2XwHgQyUzbm6CDw=;
 b=nRN16ajcM4hDuEKG4MGhqYaO9MQPThBPfr7/k5iQv2p8RAz3Bpvm3qgoHRjh9h0AQnJ7Lr8uJ
 zPjRkWKFQ6FDsj88aANvA9/ugZbqSMVWLWriyLXGLLoVvPm0Bkvhv/o
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: GIsm9y3Y8zarosUXNjkpofGGwOsqJ_UC
X-Proofpoint-ORIG-GUID: GIsm9y3Y8zarosUXNjkpofGGwOsqJ_UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX07AVCBazYb1+
 J8C/iyjZ6GrhAXkBZztRSvz1kY47aAtQJk/tKgVCSgxZ0S8scpptq6wQLkycURym4EY+YgX3KjX
 3/Xp/eBVhKSg1MZNZBh/wGOX9+MNocSjcYj2skl2D7x56Fz3QhW+ZRvxVfFhpcq3aaL4oETcFG2
 2XpR/vf8Jnf6A1QujesUT0clqkYxC4+eFSJ0YFsja2xEypYsmeh7dSxbNVKikg1xwrWSd3/sy5X
 RClfr+c/s8xHAd01Drddx9lAYkhAvlUNnhuiKm5wYPyXBqNucRqEYREQ5v58Rdcy4qw1xvnelRn
 WX9BrdvhTGoZjiT9Ub+Apdrw3Rz1b0CUGsAqk+RxDVM2EiPvAvPR5RRnnMNpgpdOUyrcVyStE4I
 rE3Fp12X8Q6j+wXvNODxlTZOloce2A==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a596f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=W1uZXkYdwnJCVkvvQWQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both
+  USB3 and DisplayPort over USB-C. While it enables mode switching
+  between USB3 and DisplayPort, but does not support combo mode.
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cfg_ahb
+      - const: ref
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
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the DP PHY mode register
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
+      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+      clock-names = "cfg_ahb",
+                    "ref";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l11a>;
+      vdda-pll-supply = <&vreg_l5a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0>,
+                      <&tcsr 0xb24c>;
+    };

-- 
2.34.1

