Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE650B2EC0C
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 05:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CAB10E865;
	Thu, 21 Aug 2025 03:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCHRZkIe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863BD10E866
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L3VMbJ021486
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=HCHRZkIerCrMIhrc
 87VO+DoEZ6hB0/0EeyyvC3X4A3eGq5t6RZDk2aw6QOCt1EYvaT+EYWhiM+LE0bnu
 jGRnHpleK5IPrsILfVxEfQS/se6idJMqUK5LNd2LqAc4VEPdMBr5fIOYepvh4vFm
 IfeNnzpzz0MptC2e+sOnQXXVxQZ3UwrZnXXwR4Z5qkYQZ/cnm6eI43agHp+pX0oY
 h+tJggu38AV589419Hk2pHHVeP2lHPart0Q64cTCF/oQgXcd1bCn2ifYDBbzySZZ
 mBQueGiLaiPADakgYGThtmIIjGyAfOShcr05MHC/EmlEF9mM7NDomKZPPvZ4iLqB
 60PumQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhq0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4741e1cde6so422022a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747419; x=1756352219;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
 b=rGY9arMwcBdqQbaHWUAG7MEpGtCbUPIfqCVJG6rpFT9TiRjugynisOHq+WJ4sPS631
 KGDTEpqlPqGjZCT7iYwzxacSoTuv8yL5Z7pMBGMyKmIjBwFZU3xjYMV4FSwXjap/uAkD
 Z8r9hbXxxAFOlMCxXbLolQCSx1OuMt2EF1Zo1aIuWjU9n3OHe0rQV2z5s2Cxhimftn3/
 0l4ynKMjuvgWnblRKVF15RB6JxEhBkIePRxbe23H9mnpxEUNcBEqmGsQ1f4TjDceH8Po
 j/23dwpjQKUj/KVo8HOvq490vZbhPJAL+Cx2jpp3qcSMeXdeuWONVa3ug69ZjWc5T52Z
 UNEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRr+vIxgDxHuIsLy36vbR6q5H4Z5X6X5oB1Ve0YDgffrCT+zAXXmtJ7PLRxWmAwIqCUftqVPHwAMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDoMPi6yTg4huwUlZC8Ib+eOEV3ZWHQy4ETmSIJhBO+BZwAQ92
 cg6vgNt2A1wRmrJ/f61FsB7dM4Eq/9IqRSTBISOdm8HtELZh+Uzj2eMVEp3qptm/0vC9qcBVRV4
 HYFzefzJguT+v6iY1V8PhcYtSE5DZNoAlVn5YW1sUvlY/ltfii+7HJd8sfTBXTqddYsvmPRI=
X-Gm-Gg: ASbGncu1Gds1EPl2Jdfbpi/XuprhgmLVP7wqPQ0v4HPBufAtCjDFH9AFr6JbQZ7n93R
 enf6Y73uSr4LGWuQAHu5uKmP8WgIj7YOc4IfzAaCnTjuBuspluZ0I4PcuzTBpCrHTMLX5FNo4a2
 c6UPutqQd5e4ySCEMrzlJ5S+AiYs9Nsh8aCwpBakSzkQfFG+A0x2iofn3elXYzcFx0AVD0Epwij
 l9lKjCpSnjfUdo28P7hgPEEryvB0HOcpmL+wqdicW2KEth2Wyh1fh+L7OABZ+0/Z2vUw650v5Zs
 ZX/hVX06lEHJPzUB4fM49rkvQfnczno4oI1wMKoo4kpG4jEL3giIBpIJbWj3VkOnpOpqUrc=
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id
 adf61e73a8af0-243308a4f58mr1229013637.23.1755747419167; 
 Wed, 20 Aug 2025 20:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCZqNHbcoR5WRlRmiFsb0AFvSf5jLDkfv0v1YD2XuyCm5lD5AFBOU5mVx8s9zqhkJarHeSw==
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id
 adf61e73a8af0-243308a4f58mr1228977637.23.1755747418755; 
 Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:56 +0800
Subject: [PATCH v8 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-1-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747401; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=mOoNvDKKUBqUis++AdmyjQhAhpayazMlyAI7h/rxX74lbKBENchjmD48LzidbrrwemcyCDR8E
 ikJa/jGaKlYCBVOdRSYFe87K0ezatz8sbGSHwxJljoVUp4+/RX7rYnL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a6945c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: QjkAvRKuk2azrnCWhmgJ1i0vxIQ_RQwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXwAxRqb9CCYLg
 ieVxwV1kZDGDL/thO7NXvIFHQH7adx+d1g3bdjImY9EI6pG2U61hoBC65f9HNW5wYDUdWfDna2o
 T0HaOBwGZHKcTIy2QbrQ85aX09t0roOoJhldkA3aYxm9sOuMCf2FeOe0d8NYO3cY85uE7HRF5Jj
 mX+Tvx8K3yQZfC5+cgeaMymhfPA/RPN9NcRbP2Px0QVn004xRAp1z8EABEA6av/4eG9eFYj/9zR
 DMr6tENS2D/1S3VdfcbCfu49G0eS/Ip4WFYR5TFrI+NxGU7DooDvmLlV85Rdpq+Wr5KZTEDgdpc
 xXOb6DVIxySBIlrJjUClAXAwOXGRXiMtfPZrWL+BH6vDrsRys5LOcAUQWIWl1qwHQiZQkiMkHIe
 4chQCIACDPnEIkY2dpFWJ5Yb+voIeg==
X-Proofpoint-ORIG-GUID: QjkAvRKuk2azrnCWhmgJ1i0vxIQ_RQwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1

