Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B2B433C4
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 09:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781A10E993;
	Thu,  4 Sep 2025 07:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhLEI/44";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213210E989
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 07:23:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58411eJY007597
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 07:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IU5cufGmzzYIjzid/BiRcbiln05RcV2CZkR0KkZBDZM=; b=jhLEI/449Th/2S0b
 yB8jz/PzwDHvlUpWEAPaa/Jk5QypLvBhbqDWuh5OtQYE0kCukp2ceCjYn4OF1iHZ
 vOzdV7M1Qat7F78FCVN5VOGpFtWwh36/BKtdNAoM//LhEtwLA59dz+c9PIrF0tc0
 5Zzs1vGtoO5qe/9S9fInBMq8zIxKSVc/VLA16XEnr+h7U++k7q1Vjg/ajm8pqGZA
 8gLhdvK/COpiqzYObN8UUC0N10sc4C4ff0ve19l24Q4+2s8wIRSxiUVBPQRY5U1F
 DAsSAvcsldRx/kFAnxNk18dPluyPWOYxKNTLnv8P3pBCSsHBaxeBCd3+jcJERSCV
 j+XUog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv6r35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 07:23:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4f86568434so551420a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 00:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756970636; x=1757575436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IU5cufGmzzYIjzid/BiRcbiln05RcV2CZkR0KkZBDZM=;
 b=AMGT57Dj8b5IFfQZZKoWeLceULxSQ3xGCnokve5TGq3tWmYKujYLQQky7fF+oYTMgT
 rBII2LEAbUaptR4Vh6mjNP6Dk/E+kROTw1FEwjA2fgjBwFqueOXcFgIZ7GybvMGsBYJq
 Flpf6NGMLRE5fX+EBmeYXRPS7vLt5sNxMh7b/0E6+v379c6Osb3DKnBdN7SyFFvFFaRm
 vjMncMFPXzpddnObaGouylO3IrVlLDqPmy+RPXiYc04v1QKKISg60XnpinyTpy/cupY6
 UXtRl0xnYoZv8Hdmd2nuDTNXL/G0xF+Dge0D0ZBBLe3/KjWGR59OlTDEEX5ipAYMq4j/
 mQag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxmYid7jFglbzHu2hJsrtE6BGsKiSe2C2s/kUU+pNfn7GlSu8sVk1CCk5f2qgBUO7EHdwqx58tZ1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXReBxIf1QpDYgSbUBGXiU0zGkUHBTNyCQ56DLoUy+pOU6SSsl
 d+ks5T49LM1TyjkqRSxdRUi6bUw+7MOEyRkp/HRCvIELfayQd4tig0OvJJ52Evevzp0ck2y1oya
 xr8iAxW8KnN5i9RlFIX8+f0XI7vvXCZI7CLjkMfZ7evR2Gz6qg2Y62yVKszA8TTRss4RLj84=
X-Gm-Gg: ASbGncvBBexoMosgQP8QbVLI55XbXVtU72teHSJlGqRK4fg5f5ojXICEjYfvYwUWn0v
 s+pIk2AoArRL0EDcwH8IqfBSDclm0MLY9Xm0/siAZpPmWly9Q/mwlfMwOTmaBDUW9nlBxl3bn/a
 0nzbLL0r2nEFMNurV6PbkMmnNTgH2Dxzy4xyZfTzZ8qBQY0WwGHizjSB7Qs/yr0w9NZ6H8t1n6E
 L/vHxj7yYN7+kTEH7/e8zjbWfxh83Xo/vcZACmZc9o5GpVaFNdnJ2v1MPA1pV0d6f313inf6h6Q
 LCumh0gqAfgyYiEUjb9VzsAoN5ojAr3WwsvQ5Rx4vtceGuPcdjDiEstvDUdPzHcDb3wXMAU=
X-Received: by 2002:a05:6300:218e:b0:243:aa4c:afd9 with SMTP id
 adf61e73a8af0-243d6f03239mr24769360637.35.1756970635761; 
 Thu, 04 Sep 2025 00:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDePBQvO93ASzEYF1+34i/DP2V1A20QvNO3VpmRY7W2WN8nqtwQh7SOiu6OgkszsPY/xvBAA==
X-Received: by 2002:a05:6300:218e:b0:243:aa4c:afd9 with SMTP id
 adf61e73a8af0-243d6f03239mr24769313637.35.1756970635249; 
 Thu, 04 Sep 2025 00:23:55 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 00:23:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:37 +0800
Subject: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970611; l=1783;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+O3JVszsjnLSrzFlB2OH9FsEdDEqIq5Fgx/8nAIsEh4=;
 b=Kfi4EmWe6GawXwHy9Ndco2Y9vej8kL59cvhYCKx46sfAb4L2FFOtnKHbKSIfKrGR8u3g6mTY3
 am8xMIDU7JFCQjofxPqxW9QOtw2NWgL+ViIv0KJj0LSh+8VgL2QTKhx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX1lgNYA7VJPSE
 1hgXT+yW+rXa0xR5yiGiujCmFtCRgBgQNUbl2VePOoIlhB2/hD4XK2aEiNjLf5752t6lDho+gum
 NAtqADzBLDc8kqKdaOz/vPGjXccpMo4w8w60DjswCFhDCUuquvqY0KrdBht3yB6RfJyweYkqiMg
 PSPxLUX4hW4i88/RPJfb+qBnS0D1sCCZSmWp8duKKqZmYJlMyYJHL7w+0yrXniaqz5WNXqx3jBq
 IkyGcPKFKcWFTRi0uquX3MrlMC533o9ulhNARbKbfa9td4vok6hkgoinAVgxWw0euYHblp2xH58
 8FhB5PZP01uYMLbtwEpaPVYAAzvqYGwWe8SHSyoEOsR2zZxGR/oW7Nx3H0G80/zIGshfcDRvjgJ
 JUD3dr/L
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b93e8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EzsmDbvTTSquCHoeoRYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XoEOFMWfmiNa6pawwkPapcuCL8Wk1mwo
X-Proofpoint-GUID: XoEOFMWfmiNa6pawwkPapcuCL8Wk1mwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -295,6 +297,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # QCS8300 only has one DP controller that supports 4
+              # streams MST.
+              - qcom,qcs8300-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clocks-names:
+          minItems: 8
+          maxItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

