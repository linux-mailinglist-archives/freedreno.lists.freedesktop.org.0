Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A358EB3DF30
	for <lists+freedreno@lfdr.de>; Mon,  1 Sep 2025 11:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7410E321;
	Mon,  1 Sep 2025 09:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjdbIv+n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246D10E321
 for <freedreno@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819ePE8005043
 for <freedreno@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=; b=gjdbIv+nHm6u86Jh
 RNuWwgpHEJgkJSts8g/ySpsmyfzr5gFYe4uVsF8TrcVVxKiMgKV9WKPa4bVGBDdo
 CIsdF/bD7WsUB/XThT69KAnhHQPTqpH+f10B27KLs+pn+Xhat4JhIdmbOjOndKeb
 NRmse2w7ibWg28qiamem08e91QBi6p0tSA8EChyPcSNHan90xIagDHWmfeuS6Cvu
 hVFYZFnu5+midXHStNMsKYPlqsQfZJcxjRNE50O3jVHvngSN4dT36U4ZlJOpCzeX
 WJB6XauNkERmQ5fht4RhOm5eG7ueXP1KSy9y1qKHmkSwWRfrJY2i8MUAVvXbr4do
 C9oo8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecg3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7724688833bso1539609b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720692; x=1757325492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=;
 b=R70O88x1V+fOWb58TL/UCS5JBgydJVLsTCSH89j64EH4Bk+ja0fTf884M2i3tEFsn4
 Q9vDRdF39stl39eGuaxUGlPoXnuQmCF9RdBhzj8Go9mlL3z858ky7DSz3Th6OCFU/Zqv
 opin6yTYiTBweCeWuN2Thsxf9AAqTqc/kvDD872F50X7NS7okMFEj93V8biuILtWfz6U
 3GuOzz0P6LOGySfO8zeEZNsGlE1NaUwGh724+flKbO5D5/6GC37Vcy49GMZUJUqo1JqI
 dyXe78lE7kpxwRhPhhgCGtQXprvwAyFRni7OlIgeWskfOon8EdGiIekBu/Uyh7FGMPo6
 KYhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7IGlBRYbajvgLYHI35xsC1Lu4fVQT5ftWnHK+t8DMg8Z8B/6DmmycAN430y8bmIAMuuu9Y1LHNNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa8DQXxH9xIMLtN+ytgl6+3vTYYARItsu3OHpRXIpqbKgwDcPZ
 nKbrlirKWxkvp3O6UERgEi2c7jZUDm6OIs81kD1c+S9dW4IDPjD1zEqVcdAXZ1UgkmV0LCsE2Gb
 IoDMAjD8HHjlX/gsvnL+xyoX8Xk1laN0fBy5JGIqs+pjrWAZVg8GAXANacmq/+lQixyQUER8=
X-Gm-Gg: ASbGncuGmr0gMP0m0WjxiyZ0dX1IFXgMND2v/kRW7XHCrNU8VQPmOc2a89ruIjN5cqA
 2hFFRRqqwWCr5ReFM+fJsLxyxU0eqjrOrbeUSzp8hjrZJ8528l+OJfWkFbB2YRjqfu8jHMItGx7
 Hi5SrtApFBAL+SQu6uD879x2kvoDaraQYYJSP6Tlc63K63wMTMGh0fidhWKuqCD559ELU4QlpFB
 5NVGHp6XCp+b5BsrbrTQZb2c94WXLDNCRNhYBligwOnUpkJ/d46up4GmL0IKBH+DIiPzp0ipPSZ
 uE7aSxJZdayetbSGXiZfMgUgh3aywJfqh204siKensDZsihDuzajHevKP2UG/5tvRPVqY4A=
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id
 adf61e73a8af0-243d6e01092mr9275686637.22.1756720691883; 
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4FEkbxc8zJAVFcBNKH3By/scmpc66RdOPEWIriSFDM5liAVdwxSS2dSJZSUUOeU2APdJKw==
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id
 adf61e73a8af0-243d6e01092mr9275648637.22.1756720691417; 
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:30 +0800
Subject: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1711;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=3rkFDkEG8LVsFjeJ4SQMC5Gt/HRXtaQnkmz4irxbEPk=;
 b=x43dftNhgBfQgNOncIm3bxVBcJJxIETiS2CaQI7RYpFOenwd9rA2BLYjRxTAV3W+Ex42mMN2C
 yk/G2r32mMhB/S1lJzSLq2PRcaVDRtilS7PPRLPBisLMj9OqdzU6Y3Y
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: i-gjy44q7pmS3UOc2QyW3-fnCLBhSEKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5hlpYtIfsF4T
 oHo2m21nZFyalqHm+hr1y9obpSKLHN2wv8xEIDdJ+NihEGMk32XuU7mg0kPVd0AJ9LEJQS6vYfk
 WsKyEtLrcCDO0Kn/tx9PLjOHJpMgiIxduiXEgTnHWi4849YJdSm8UFfEirYEewH7f/yqJhYg4LO
 u7aQQ3nt7CUwHupk8X8tuAmzz7ywKe8xKQhCUGrqEFyKmaxjm5ev9gjRZ8krZ/VPvrtNQFzcEPN
 CZOlKrVD3lIBXzw4I9VeRADfHob4BXiLM+f17MDjhYHAm8kfxFWK4pL+kLPwEEqsQrVYLZPX7Um
 ihkiLZZRY4kQ1FJmbkrilDBuF78SkJBvQ4I8u69nP5fQnD4lP4hlpU7/tShPw5lpdBhsBf9LK9a
 bqqraFXL
X-Proofpoint-ORIG-GUID: i-gjy44q7pmS3UOc2QyW3-fnCLBhSEKD
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56e34 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cUk4fDKarN54sxZTNDcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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
 .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8282f3ca45c8b18f159670a7d8c4d9515cdb62ca..4f0dd80aebd1958327a06d31664dd68e02e5ba94 100644
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
@@ -283,6 +285,23 @@ allOf:
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
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

