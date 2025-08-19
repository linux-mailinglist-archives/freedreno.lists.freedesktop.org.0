Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2282B2C29F
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D0F10E5C8;
	Tue, 19 Aug 2025 12:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXYv47w0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F9510E525
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IMhpUh026820
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 87YUgQQPTRuBrNxZ7K2LEM1CG60UDLM3XWSwUouNtgs=; b=NXYv47w0XLZ0etqn
 U3/ZFoJ6fER9zn/OS/id+PAInwM8cKfUDJAjFlpaHvoH5lSy0KMw4z6tuOp6tSX+
 VVedvKPrQFhU8vL3sn0RgIMCuSsmV4xcYgWuN4snxfloiO5utUydjem9fFLMpybD
 sy75WsyAzN1IQKDMzGs8Ao4qKijBrHSLKsNa0pUkWwg+ZE86crFnMfJCRnGgmnr3
 IUtj4+cP94BTEYJ/RpFJPZ4xFGDR/3SDwDNqSObIMmmUGEbz1fw8N05+ypoLKInG
 IE2zg4ifxSA6/tg9sf5Ap/IBA0FKBVf0Zp6hj4+L1GqfxBc2tBPWBtgxyUyMYsOX
 /8veaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunu87s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-323766e64d5so1229193a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574449; x=1756179249;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87YUgQQPTRuBrNxZ7K2LEM1CG60UDLM3XWSwUouNtgs=;
 b=p3b/G2T0Ox391bi2VQulacvvSq0pIMOp8Z108hCLtyABjKMh7q0LI9SvotTS+AmlE3
 anRzC6wO3NbJhe7cqUVL3ZGdAZPsIczyz8lYEz7aQXES6WIbkhVwWWPHS4R6W1PUG7f/
 sKIdjmv6QlTKOHXZ8F+3HwdnO2rPdf7xsLkaqk0k3EmZUzUenseCzBnnWHmpvCswp5oA
 p/xQT7iJQ7owfujZh5+tgZmyLq1ZcIfYPfUUvWGSF74kt+1C335lUQM1E/sBEdt8WNhk
 msrtW3gk1lCMUj/Ab1/gYzQIz0xQYy3ROxBorTaOBaeMydO0tG9LS7/XKxEeSZunBIvq
 CnLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqWPRPpbFVJ496grgj7ZQT9v5KCj02XciuCdOrVruSYeaMfCOdRz8Xpg1OkS5ZqjLzOtYTNRBb0d0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1GUmvJvFlbAQrNYJ7rNetHlkdDCXu/0uJGE7UCSnj0FxeLpYe
 i4lkatCjihNQ9efxEFmW/9/yCeSRiRSA8b6GKBjnyEVs3GAmMDe7TgSmqU7wxigsAWTZJVlUcum
 mNuWMOlU9JJ2bQfDl4RLKc6yUJ6xhbRJHYKAf4CSAxtLxT5YB4o8t11hzut8dq8Is4OOgLL8=
X-Gm-Gg: ASbGncvz/wPXWkijCWN0wOK1in9QNaJGtP6nS3+K1Lk/iPiZS2pk4kqovi0uUASrwHI
 pjzhcgKyuCbjs4o+Bo6sLeJU1NX0+dsO1mmEIHwITWx64mgIWPWxb3hpfYGhWDS00BvScpRa4Nx
 5RFYCBQExdX6k3RwWYjaBWYMB7vbBV2eOxfX1plw6nDAbfyNzR/CfnZ3qpg24axmJecduc77Hs7
 81ALX0V2bpzaLcYlk/1uamE1/pdMywCjyDjIORUGWwIEh+higRgTiNveuvWhWRvv8gVsON0dTd8
 Cbdyv4nohOKHlfAakHckmmKm60XKQBdE7NsEYSJWB3neuOoKqnfLLdz92eIHf8tKUeZZJzk=
X-Received: by 2002:a17:903:11d1:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-245e0eb9d4cmr9920475ad.14.1755574448414; 
 Mon, 18 Aug 2025 20:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWhwpVUkX2ye/OZpyid0P3l7BJisssSc43x34vQBSucCRnkmKAQZ+uiuAr4SwQWZXnctibyg==
X-Received: by 2002:a17:903:11d1:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-245e0eb9d4cmr9919825ad.14.1755574447890; 
 Mon, 18 Aug 2025 20:34:07 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:29 +0800
Subject: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574426; l=1832;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=QnxcyA2I15PFGprmlotWeGRQtMp+i/s/DgtWXJl8lG4=;
 b=HqEhByeRXqiHzIa4ch2zSFoAWOuFImPKR7WmRzmAehg4nt/3hs/awQcKGG7d9aj/sMJR/gbjm
 N9IwfWrKqJpCn8AZWObN8dz9LM1V1Dk8gNhn6PcK0ozQwuge62KbNR5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: l6FXB0uKzp9bAYDzVyR24bIfaRur_FPz
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a3f0b2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TDvFBFFeHOCVSu0WV4EA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfXxSTEkE7fcQk7
 qMa7FRv9RzPdMuXQKEi7dY5Xq2gZxT/nmz1i5sy9Sf6yqUkZxcVticy+zw1Ywq4aGIB0uS/ycrG
 EAa9Hrd7Ua9a5qPinOERavXRHd7YeWVxkEuXbkSG0S80DAUNYnjwgpLC/jBojDr1vp8Y48oS4XE
 ljrtEMUpCPqkAaMVIjZvWVslD0SyxqcB9GjM8gh14gikT9KP8I/nm5eoJxz1ketWqD6ZldoFUTh
 40qxlw9HAtocGptXj3Anu7DCx9fGhO7As2SQs5kzsynGjt8szgP2fm45nb0vml1Y4CwoxXQxefU
 JBmNhnaxm5LTGlwAq/Uw2fJAxjajP/2622ATfw0rRHN0AX4y49N3ky1YuFxE7us/vJS4OAl+exy
 oCIZloa9
X-Proofpoint-ORIG-GUID: l6FXB0uKzp9bAYDzVyR24bIfaRur_FPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
X-Mailman-Approved-At: Tue, 19 Aug 2025 12:04:42 +0000
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
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 as
fallback to enable SST on QCS8300.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
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
@@ -179,6 +180,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -217,8 +219,9 @@ allOf:
           compatible:
             contains:
               enum:
-                # some of SA8775P DP controllers support 4 streams MST,
+                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
                 # others just 2 streams MST
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
       then:
         properties:

-- 
2.34.1

