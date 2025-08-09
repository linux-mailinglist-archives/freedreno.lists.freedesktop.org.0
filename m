Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA2B1F387
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 11:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E3E10E2AE;
	Sat,  9 Aug 2025 09:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn5mIsbW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4910E2AE
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5798RaVI020269
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=fn5mIsbWRWgBpZsO
 OKqATLLR+TyK436b2ljC/4Azo3Ti+ij5pua8ZG7WMIft2ansSCoFgE0uVohJjzfi
 tldH5aIp6V+tnFu9mX5+m+9MVAcPzVkgsLiyG7NOUyYYDtSNiekF9x8vR4ua4tcV
 KXxnvq6X18BySJH6+OWKzI847owOFkOg0fuY0ocnF+Kdk9HPwclLNv8rVfEAJe+V
 sNkDFRMZtOMTw2ew9szwV867tB5tddd8B142lSYiIqknENzWi8b/26Bv0UPiO+G6
 cRj4P/mcRyfywwVIf2P0tddrLFg2ak5zg9IjhFH//f9MMS7D3IVckZMJlKyTGLOR
 QATNxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwngrf1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0884559cdso40290331cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730986; x=1755335786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
 b=keEHHWLQQcgv78wUJzYWliZUtPHITrC1PPaz3BxtnXGTj9qNXYF5jVaPWCctrhOMBN
 Cl5lPHcaO4sGhQ9KBAKqgODXPq10FXf5naTnj+WVv7d4cfcaWlXxJ2iinM2VDVrNVV/Q
 z95QpiyacsLlvVZkwI32BJI7JGtaVxSd22AWyTRyvvAiUyAN7novGa9Wm7kbUVKp+ZZA
 RSdHy9qikOI9BMvOFxixwbxKbqUj4XrwIVbUsqZPfhiENb3/yPwCBELc0TIzywsV4QQz
 PEu6GtZ0vlVpHbelrZtw0f78raSO50/y2EMDvRxkRF/eilCDsmdHYBOuCRgcsJh2UXme
 QkHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs0I835N3bB4/sBULRXf8xBPq3kcY2y1VZSA31B9c068kqhvZ6qlD09E7Md5RMbGzTle9DoJlgCyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1TtGRbLpANpFZk+3aabAtujCx3ZFPWfUkxrQv92YHTOamOhOh
 xztaQqWnxBbj1fDT8YwDssGHgM6dHcmqML0++guUj+htRfd/e5L5g3PZRwkRQmDXdOrBxPMCvsP
 6AaFs/u4qKaHsxvwATPeAZwtMBHLqFHJ4POXRx3UGV8qttiJiR1tU8jSVAgZJUpj+Xznux0M=
X-Gm-Gg: ASbGncvFPnZc5aVdBM5nhn0ZGhqzkky1J23brEMBuMaKYr27ToS5tbxK79WmOlVf52G
 L1UNC+nKzg2yvdVHDC34NAmkQEKhbHUXY6Esy5QgGJW9M9xysItR1n9CiQwekkcUVnrXdjODJp3
 HulfN0IJgMmH1lIKWZPMscmpqZcgBjirpfx5aflFWnt/f/EoC5YplzhnznPFCWqnc5YCcTs7PUA
 cGKSMzcoLf9mxFPK3QSGwkRid8CUl2BRFkwaVo3/yN85spZLAphD+wWVIUg0J0Omoc7X54l1ijY
 Jzbo75eAzGQCyRkDqfMeInXkQ2tXuDmJq6chL1/D/yu6eBqVif5bz0Jz+BvpCjuEUVJNwLHxPPv
 KZ/tZORwkWVT1NLn6P4RLKiI+vaKDgPLzE5vKCFUlzwRGgPQeQrxd
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b0aedd7c35mr96176541cf.38.1754730985800; 
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbn+j3VRJGx8/ht60WZkPpDMpeHGZ9tFQkrI4f2soZwGGzxl43DRhjFw07MRX4FV4PJWf9Dw==
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b0aedd7c35mr96176301cf.38.1754730985409; 
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:15 +0300
Subject: [PATCH v5 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-1-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHip3RY4bSc97JuF5htWVTzp4BE/6CgqBmbf
 WBSRHZgOw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1eVWCACl+QuJRQmjzmthSRPrrgvGLOXJ0Wa0bo/mvMwIgh5UXfoECTWXn9ZzRLyWrYMD+XY8A7o
 AGCR5SPempa60En1FGWeFtbIaMFOGlIhQopFJyiTT4TahDDXRQDILESmOiwsII+RNPJP3di5he7
 PhDCM2QtLByA2/sORcyeoOuVro0Kt5f7q810eEVE93KCtIx3HR+LKc0/mY5XvvQIAYYDz7qjH49
 vzqc82tcSqCFl044wQAg/459esVRX2YaOsFp0PY7eton9lIvTxxw2c8rIZYY4XFI1kijb8xQ6/V
 ZjEEiZ8EfsTji9pv6/+ZQ8SYBB/+Ln9zhkYXj6it7Oefv+LH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qjEwTW9rSxec8Hi4awRiTHxJF5u0a4Z4
X-Authority-Analysis: v=2.4 cv=RunFLDmK c=1 sm=1 tr=0 ts=689711ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qjEwTW9rSxec8Hi4awRiTHxJF5u0a4Z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxOCBTYWx0ZWRfXzEGrBh51NVJD
 dQS2xEbrk2Q+8hEzVsG62HjHkA1jpdryeB1txCJKIocwwJRjOvivffHqwhJG+21v3kyTTzm7pQf
 8k3a+AE7fHQU+SG4mdJ94Spbw0RNGdPK08oIhTjpyC2mJYWjdXa0MLhdGwSqemIjrMC7uTmGNGi
 xNkYVFxlOwjuZnBlFo4kp+Cn1in/m5akQetFI8wILFMCfmjTvA2QQF27BRFcsLDMerXfDFQPTVV
 xq4aiupeO5XdZIrIwtwB8YTgEEBKME1uLMp+vv+6TKxG1GDWYHQBAVE1ygf5xXPSr5aHlFiENFu
 LxQJPYAxCF1ds3qMmDHlh9qeXT6Ulb3JSW6TapZ3YWdUaWPEMp8QKmpXekb2P+8bCN1iQY2bQZ6
 Fx8fMFgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090018
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

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.39.5

