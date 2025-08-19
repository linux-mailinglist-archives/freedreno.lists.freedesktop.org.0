Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30AB2C298
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC06410E0C9;
	Tue, 19 Aug 2025 12:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBKnSicd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E8510E0DF
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J038Vv022565
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=QBKnSicdQ60U/RwN
 rM6ti3M1BzNnCvfb60iv4nHKRyBJOZ6zFdz3gGXKfue0X2x7mBm1deVbpbV9GDF0
 2QQW2+NbvJTGkCsJ1ees8a3yJFgoq+r0rFhwac3NRrDZJDVCTWuX+LQvBRrsfo2L
 WFmN/bNLWs/MZ/P4XP/dwWiA9zL9UMInCRS78jIcz4UvT/3YCy3qv2kqcYyltXqA
 o5/XizvG21twe/cuJxfqlKFYl8oYTV0c6xrxxQzTAPFHjERLCbTE0da08jOdtFTe
 5noXDm3aKwatKwF5l8o3FMCpQuhx4RK31pDU/g+h64b20/CvCoWQb/IvA7n4loY6
 6Jw0Ww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99pyfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458067fdeso57980965ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574442; x=1756179242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
 b=R9RjomTVoQJUGrSU6F0Dpc54Pd3YzYphnTqO579Wxp/id2Sgp5QiOmvol9ZVZxFg5W
 KL2u8+58abSAk4U6krN4Hpu2n11vhTDPXoHIVM5u1LmnGzrzFhnETlvgPbtPjEoyfmbk
 /SMP9PQLaK7YH65JaFqG0FH3VcJYbAGWzngNzA3m2w7A7Cj3y7YPAQwIi4RcxBwS7uVn
 Tiq0kTH/bxq6DIBYPPYrvHa6H4RB6xm1RTUY/sC47v0hlRHpQe7KZjBGqcvru/T7UYQM
 8o6F9qSgK2d65rZH9vzQwgQxnz1TZ4dYAZu0nJNTEQIy5FdOlwcBsaUNh0ji5SJC70Fg
 e4LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpXBN7+A9jHhAcNpyryFCBUPS7QAKwjQF6ghyx+SIpEJpi3q2mK6H3TeHjvuMP9RDCIOwR257h5R8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4WS7PUStqS4nH90qBXuAQqF3cK/eW1DwFnvi57rGMOdmMOaKW
 BZqFfZa44BOXLFS9xlyCDi8ei6xKBhivhDVVZ1PoC+eQyatvfEBovwVxWcf9QrqjGPUDEdeg8CZ
 aiD4UX8WnOga2Homcthjwnj1r9hSPuxMAJIepxdbwl574/N3VpcG/1R/MejifLDdXZuTRt0A=
X-Gm-Gg: ASbGncuNoLsEOHm5yN2igiWKfBlgS+fxuMUpv/AJDFyY8NXfmaNNVrFA1fZ8qrMDz9e
 ndE0MhLEw0PLJcDJNZD8XnNe4jCFrsfPSF0koTKj7mVWisOgMNG7INR0lGIAACCxodqGo41ibej
 zBTCJKr+TAaYLQvMdcUhSzdSQCaFb7cMPeWAx15YTxbfDRdcIX6LJJS5J84pqhesobmqprxcBDI
 EbQJNyGEEs8XJqxn28fYu2XvIGHhDMtAS6aPVtd3NKD1jH5QwwZrDjSuWySWdMej7MCzHFpz0u7
 n88oy3gmlEN+nvAa8WelnYjf+Xd6M2jV24rQTfyaXoDKDr3SpRID+hsyvdPbj9Pkekh5QMg=
X-Received: by 2002:a17:902:da92:b0:242:eb33:96a0 with SMTP id
 d9443c01a7336-245e0328fc4mr13756365ad.25.1755574441581; 
 Mon, 18 Aug 2025 20:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNApVEFRaReBUGFIN+/yStP1nVoxmL/eBm8PHCEFQfNZ6i4GKi9pKkySdHpDkpBiZwAMlig==
X-Received: by 2002:a17:902:da92:b0:242:eb33:96a0 with SMTP id
 d9443c01a7336-245e0328fc4mr13756125ad.25.1755574441145; 
 Mon, 18 Aug 2025 20:34:01 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:00 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:28 +0800
Subject: [PATCH v7 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-1-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574426; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=mUJMxoOSV81o4koxqdJbI5N6soG55O7wbqXD0dzr+1rxU6/SC3oVCKT8159FPywHXQQd8ZJ94
 FWOBhhiXatDCGTTsP7IYgNL+9ROa6RylZU+9nOngybefW6dHuZUr5tm
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 1lqm8O1-MXM4eS27horl4G9ScU5caEmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXywHnJKnVU7qw
 IjWgz8fK9fY1kyGjigOmFIZGoLv1YZDu7irnDmbJIo1FoTyXFwp3l6vjDqadaaoYyiVwNrFHzDb
 FaQlXekJrLHYvBuk7L3gVrl6WHxSWanGDBzOPPetQzY5HSfwEN5sgO6iuS5t1826JNP2vKSJurZ
 zfqcoSQRPpGGcmSkQBYx0aZDdaJPoON46dpsRT72IU8kOpfOVv1rDedy9yYpBZdAm3wf0k7yOhh
 TY0nkc6PddXb6CZjN9PJf9fApCWHgKE/TZpA8YE6L71aJhbPrg9JDQfqasWrzpveLWUFs3a89RW
 eMH3yCQMqHj3Siik9R4OWgzReCZxbll2pRJ/ZgHTtU3Yjt054XJuzz+1Okgu+sL3giTuzYQKImC
 2npyav9+
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a3f0aa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1lqm8O1-MXM4eS27horl4G9ScU5caEmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
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

