Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C74B433C2
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ED210E991;
	Thu,  4 Sep 2025 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+5s0AAB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7106910E991
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 07:23:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583NNMYN008347
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 07:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=Q+5s0AABPsLBVdYQ
 yBfCoRTYSloNTSGx2dRijI0cYn8BYQDfiM7/gl7//OEvc4ghl4YD1dVQS8JF05W5
 ANgUWIgfNnyM/8B0PYYTFwzXnWe9mCZ3FP5VkslfqCxT58adzrJrZ6FkY1ibcWIN
 neQJmowZJbGv5thRum95dzvxh1MKda4ci1VtHir2Y6hDLkup/Oh2aLsyo/sGQJvG
 1A4zgFcQDji2jawR1wT81y+Ge1jHg0bzTLKuideLCNSrUGD1YvzkG4Ol0HIbrAa8
 TdQtzBeAfoNOGcSKuYk6syFaD4x46hcP2iFxv8Fdq5r6ogbv1uo3A7GfF8BHnl1a
 UF3qjQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyagbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 07:23:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724ff1200eso695238b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 00:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756970628; x=1757575428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
 b=X6CccZIX3yB4NL6HufI7NiHoQMiL7+lcwsNmKBkiUWyyncso44c3aHBRnT38p61EEm
 YwvOQZyFa8I781sSXuZqthXIB6Ibut7NzesoB4YukaHTu2tp8faY+dCIMELtOi5wnVik
 QZedUES/1CC2fvfiYEZPQU5yLrPgdYdVL7dmnND+KiECigwUHfvhQNr/ngBDtGzC3L4r
 Pu+BlD28LfKCdfgR5patI0HK+ra9VNNL22tRJLQJ/Tz4Mu2cmlOdA8vaPU1BQPFcnDS6
 thHq15OOmdmehPnK3/EPUd96yiaphKgalhMkjGEM/GYEbtI+ByIsbWv154NLuTaD/I5v
 AJ/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHVQJ6OO7ktNOML4ICBcsyqZ7pPoF1gcdX+HnHyswJRSyhBh6Taby/JiC4dFT/mZ7Tt7UhCaX/kC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1b0WoCB6pKmasb82bizOJyI833LIvYsMHaLe7B8J35vwNwvmP
 Xs5EM7fEf4ciaE8mPXR4DWW1kfGHzyEAXTQQ4dG3Ev1zffG1AIPyhcxAgd3JIKcC3Eays1xTGiM
 3W03Mmc0bdNh/Px96J/pjtpNgUhgLLLzAGVBEHFWYtZzM8ktoJfXfzK+5DLeiZYI1T4qHDRY=
X-Gm-Gg: ASbGncsjYTDO2A0c7J85LqOcFW9zBaCtqrQ5SgBSApUXlsIMEQgSILo2VRgV4Wjq5ZL
 BS9SW3701YCj5T182fppHxI3Tlz6jvRIgJSriTrv8qFIiL2xcQ/q6UYgB3lSb+/f3v4ITmzHzxl
 OxTgcfKIldSid8Mh9EybfqJMrmB4Ms9WsYUjqx8NHy8NUxVkH9KYMuZraQ9r9BLih1fjDdHf3gN
 r0UPKy5tgVuz87CowDvXMRtGk/UbDdieQ5b56eIo+NKEm+RG1MW4Ri4AKkmxCbjrYmw299hhkCZ
 ctsB5Fo7UuvgF0Q3E7nsZeiXzPL2uoU2J8bcHIfxkScUmuOxvt/ZvGVumiNLHxk83nfirhw=
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id
 d2e1a72fcca58-7723e3b1c5fmr21478360b3a.24.1756970628141; 
 Thu, 04 Sep 2025 00:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOSmxB9zN4NxPoJkLTcpBFf0RO7oPiV/YSxMz4H00lZgVQ0z67xbJrlIxbtRFrShD+RZf8dw==
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id
 d2e1a72fcca58-7723e3b1c5fmr21478332b3a.24.1756970627705; 
 Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:36 +0800
Subject: [PATCH v11 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-1-bc8761964d76@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970610; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=gE0tbp59NwJVvTLAcNX2z9/BDrDyVvGpk3+A5/wtShwkT7Rbo8BvTh8rqL+gw+DngvaZ3T32b
 BaddeC9p5G/A67nsj6U5kK360spcmD2o/VAjIQc4qpJK1WZaSkQMItU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b93e85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PuACLpR-9Lk9E_F2YHD27LMxKxvWJfDO
X-Proofpoint-ORIG-GUID: PuACLpR-9Lk9E_F2YHD27LMxKxvWJfDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX363CPo7zWmhx
 Phh7ULesHJRxg/YgYfeQm0hgpJNSxNBo+RqYEoa/NzDzlYA+K2sftCo/E9E95+9ieVrxNa3DOZa
 PjL5Oxta3GzrroekFKDGCjQyVgxASPRWyywFrwm1+oFnxovwmA9AbEn3rUUmvIN38BDvnLBYp97
 M9LOaYufIwh0LRxtbiHn6vi+BSkSZfUWIaPvW6jXW5QRMVWFc12yE1o2rHdogGnxB8G55SlKv/9
 vU+d82gAkrq5dwQfsGXug4sRBd1A+VR2DRd4FKILVncCS+Kmjxr9majLojVIiIBPLQU8dw7Wbxv
 587DwAZ/3/qLwWACCOfCW4iy8NkysZP/rWtw6BEmAlEeNQZD6hbZDiOHsQxumuPotWqOtiMvtBN
 PtdFLmEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

