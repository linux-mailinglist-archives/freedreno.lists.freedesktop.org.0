Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F347B0D299
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5674D10E5EF;
	Tue, 22 Jul 2025 07:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA2DS2cn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D4910E5F2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2H51H005659
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=; b=jA2DS2cnWB8l7V+7
 ogovGQRFNcB+J1U2DHnr6lCDgPuP+LaiSlHoY9OGragpXdHErAz5aooOIGibHDz7
 lAxWJCWTqQVC9Fy4lIVdLmzs7AeNn4qZ6dMDJu5LahAW3WMrtU6zykcMOJu3e9ye
 YnnG2YS0+AHnYDN8V1rDbU8WAC427KpQ/znWKBfUhnoRGrdP9z1E0DwwmPjsjlGn
 g0WK5/4Dh2bR0x6Nq3PjEyY5SPi71obxzceQpxdnremrXZkrG7ij7lhgJlZbWltG
 F7Dq9usQPg2ntgfCtsggjoyMfyIbrna6HZwrCZCrnASStYPSCbSajRAzBALJ9cWn
 AcEWrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q8h6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-234d1bbd3c8so1133275ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168965; x=1753773765;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=;
 b=J9sF8az62Rd6AVVB771AyPlbGoosfJ7DB/AS7K+YJsXxzgXML7qKV20eV38imEHAhL
 V186mUA5hG6UKemQfzSYEUa846xxFcTHftZmLSbChqwfdzTR2o5EmKzuuKUjXwjK/txm
 /cDsqM04vFQ4oTJzC2JYkS7tv8Qvh9FNKZYI65/xp4uhcITeqUQzN3RO56uzhp63Oqpe
 dgWj9N1C1ruw83GxAmVuFwVE5AoqdccBQ7OZ/2e7SLc4IaIDI6wNHHp8k6oXCCb5geV+
 j2BlU48U7drWiA1bHg3h4UdxCFVQd3Xxf0PWCFB8K5ApacaiOM+WYqn7b+H8Xm6WCkwR
 U09A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDKLQJRcqTUR0qD+szQUaB9j4ETJowOF9OyGp9yKmGF96wKNzNe6hsIlQlTDrgcvQc3OddzCLDuao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7siYYbodn33LxAyAgC4gOplD7A9YT9H0csxNp7+HHRfkY/7t/
 QsCJc1LK4aGUR4bISHy1ETzYw0LHAbFr0e3/qtTmPdf3uWP+oZiEzNJsamAesby4AMI4j3NVkkO
 scWiDYS3JFhcTeWqeULW/4cavv0vl5ssFdEjl2F8k7W0Q/cWyZjX6gKpLneENqjZfgN3Sk04=
X-Gm-Gg: ASbGncvvgUrNFglFvERL6pmO/yYCyytveEfs6IbevFgkcI+piZ72NFb7VVKL7VMRg5w
 Fy2Ifd02Grq7SmLmy1fW4CXhifarrKtyOps2Saaoo8w9p//5yGve1HozX5pc4Ax4hm75Xg4UiJV
 t0FF8fxBb402/vNkov6GiS2JZ/CSihq39SERVvXYUu9p9uQyDxOW2ejmfXxErPbhXHstES1neVo
 zpMNlhPxFee8pdONtQKjkJs6b8q7dShGwC3HveFrQ7vXu650apPj+3tg1daJMvZe+fS7B3LQttK
 wYwdkitYXyJGWgvIz5Jj7vn8YOmqPicFJFI4ByMPYY7wU9l46+i2b4hQp7/b/F8xG1U4YyIQ2iB
 3EmPIQSFBmFC3GbsM0/mJ4i/DYo84MHNEG4r2TVXH1OAfHn7RSoMl+7Zw
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-23e24ecc5bdmr132166405ad.3.1753168965179; 
 Tue, 22 Jul 2025 00:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG70wgcxv2Og+kPKUjYru/eTK2MCHabUKt0QBDH4BfkImjNq4j8b/P4oRqYxZYzHj6XtGxz9w==
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-23e24ecc5bdmr132166155ad.3.1753168964744; 
 Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:04 +0800
Subject: [PATCH v2 03/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support dual TCSR registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-3-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=2537;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=71nsNROW8nOruef5bHMWdW3ozXU/NjQImv6aKmL0T24=;
 b=dLa0B1WM5pUjkW4SwnkHpZoEZpTLwSATWGvvZEls9+EyqvaTXc0lRt/0UyqWmrJRqq5wLe/z9
 j/MpgPhJxb5CZpHDFqsNvkHX+TzWVnCqfLppugMnbDEfKk+5I/8/cZX
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX4N6U6obUQMQ9
 gmphWRz5t9PMeGVgRWz5p4WMCIIerLtt4d7q3s8jqFeuH39nWz6X1cGYEXY26At7ezz3YJDEFnk
 j1EZ+b+2o8MPXwkRECRHXqyGRQD/yZdee9naMsgJ19YmTvmcWMNJdKbxPF8GIVfWPOmY77nlc3d
 EwSx2qIBpDPit2iXW5f0xcfP2pQiqfYicQmQjDsN6aJyBV3HiiHcEzH7PfpiIyCnXRIFcMUAW8L
 SyVxtZIBPqFAN2rZtxPJtOybmCFwNEBSP3XrPi/x9TRBI9futaJKiYNsGagkdNcuYDPhmF7RvXI
 HAOiHEybI2EVHQtBRb4OfXwKxwtVkKD+jhU+dThit6vlh1MZrUKU1DnEI1jEllaLYahalGeFuaO
 wc7yYghpZsN1tIc0j7yWs9R0NBYuc457xRGtaWoHR2ISRwMPqCc1p4qb79No0Obw5O4OFgmM
X-Proofpoint-ORIG-GUID: fWaa5_1IaP7J_HRFlmyvKXoJSpq-6-WL
X-Proofpoint-GUID: fWaa5_1IaP7J_HRFlmyvKXoJSpq-6-WL
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f3c46 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=nxDEYaoXc1MktuKintAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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

Add support for specifying two TCSR register addresses in the
qcom,tcsr-reg property to enable DP-only mode switching. This change
maintains backward compatibility with the original single-register
format.

Also update #clock-cells and #phy-cells to <1> to support clock and PHY
provider interfaces, respectively. This is required for platforms that
consume the PHY clock and select PHY mode dynamically.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe535c430fdf792b33a5e9c523de323b..badfc46cda6c3a128688ac63b00d97dc2ba742d6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -44,13 +44,21 @@ properties:
   vdda-pll-supply: true
 
   "#clock-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms without clock provider
+        const: 0
+      - description: Set to 1 to expose PHY pipe clock.
+        const: 1
 
   clock-output-names:
     maxItems: 1
 
   "#phy-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms
+        const: 0
+      - description: Set to 1 to supports mode selection (e.g. USB/DP)
+        const: 1
 
   orientation-switch:
     description:
@@ -59,11 +67,19 @@ properties:
 
   qcom,tcsr-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
+    description: Clamp and PHY mode register present in the TCSR
+    oneOf:
+      - items:
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
       - items:
-          - description: phandle to TCSR hardware block
-          - description: offset of the VLS CLAMP register
-    description: Clamp register present in the TCSR
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the DP PHY mode register
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.34.1

