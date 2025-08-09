Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE21B1F38D
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 11:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399AE10E084;
	Sat,  9 Aug 2025 09:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0OjB3f7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EC310E2C0
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794eAa8011018
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=C0OjB3f706CYlkxv
 cwXbx7kRj/bM0XIwbNTToqwZRPWZhWTPCp+3Mah37qeICbPpTy0U8ZmJSQ+ZCifg
 zNiy7YCbzrDIGBtjGhiqzUXZgKNgQebivI4RKE2jPqS3FHcgzOfyhgGSnaJFxybY
 0pBp0XXUwlVL7zqPwFXnZdf+m49P7ybBGLOevma9W8oN4V/DELGlwWuPuYioFcqV
 sbNyj1cWVOSrsCBF9dNzhoKByaKTBdd6PgfN3EsrqwW7yOe6BU8LC+YhVyzs3TdV
 4NkqrcW5RWsB7TazjODnvaACEtF2QcDiQRjhiYuMZZEVTJ2anoH2oPlWZ8ges7jn
 h/xZbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm8ajf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e826e0d7abso544061485a.0
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730990; x=1755335790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
 b=VdsnZRICiElwlWOoOkYAVhX5wCszSgq7bi9RX6EDV/a6qHlgsy7U3E1NLyJ8Vf4BYU
 WbRxm76G5oXOWpwV4O9q6aSinAp0OA1J9hBOXXdUy9rmYYXmljh5cZ5lwFsdsVg+yh4l
 0VPfKsVNVuybA37NZ9b5nPITpdQj3FliCiZQ8lGc1HLUR9rFmCPnjQK+M+F+eXhrkt0T
 0H7jqMmm5vTqmtA7pDZFyYgGUjjCcss1xhZhS9frZEICiOSiGFuL2jin4imWOyF5NWJ9
 Cj2eotd4zqfwZGy9qu07N3dTsdXuowz70x/2nftG2tqJRWKiPZ/FjaTtPx0aNo0MMGh1
 +ABA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxLBMOiuJytkOcx/DCT3YptdmdH4SIAeMjqC6/0u/i8UL1sRHt3C2Kahz8UFjXYknhNi0VkEdjjnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZJhQ//T+wtqgl1R71SXrDQk040uU3gvKXP5HA0eVIWcSLYMN1
 eNyPZsYc4DkmKxfzRErDkKwRS7wxMgWB8v0A1tMPZ8VH/iMfQoFkF/a34hmlp5DVEMGpZA++Xb9
 s73TH+A2/XeHV7AYLrHN13u13lBmOmPu/MVN1njOiMj7VHwDuzmyxk987Zle1QY3kWA6SBSk=
X-Gm-Gg: ASbGncuWo5qOnqEm93v0b0oJBJmc15dcgdFyTsJTEJ11LYqThe8/PLwDx5NKpxiipfI
 MlHnmUvulluVFqEdEAfbqmEA/L9ZIznrkIYfFKaFB5fAltqQb7BFcTuMERVZfpsDyw/kwSNfWRg
 FldpMLYwORYtINUjQo3DHvzUEXGTVNPYB/5si1JzRRGqmxF+p7NfqVDm9mT0+A3kZC6MtAWa0RK
 qFQOq+EvLYY9OJoHwFie3b9DnJ4LPceMGxB//klgSzCalwG99n/DPs5fz/TC3SeEV3vHIG4eYVz
 8aZs7lkeCKE/PRiA/lxqmLtgTC9axuwm5llD6En90XrNv4bgjScrTnj+Gp1b9xfM8g3sZoHEz0U
 oosOO4XkdGUF3OFaxbsqTLimAgEAAbzQ3idsMk4Fjj9LJe8kXxbfT
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id
 d75a77b69052e-4b0aedd7d11mr84492421cf.39.1754730990061; 
 Sat, 09 Aug 2025 02:16:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPjyRAUyTPcM8WjrcEB+3Rkbk5GGRbERk2o3qm81l1UEMInYTDTY07fgMwvBEs7bG4cUrOlw==
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id
 d75a77b69052e-4b0aedd7d11mr84492021cf.39.1754730989488; 
 Sat, 09 Aug 2025 02:16:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:17 +0300
Subject: [PATCH v5 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-3-b185fe574f38@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiSpd85CuK/DvwuBUFFI5kVBcK7LTK068hP
 V/tFn2s5oiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1cfBB/92IEVyNDnG5Q7zSljS6tiy2BKiQ6l6UmbPq1QGjtSFEUPS3PRb/NKZx4qSoMzUL0J9kVd
 aP4GObjTYqgE348Bv/hT0KOnue04WmqSQDXmBA+829EGsW3rVf07K0ByxGCYQb/mamYWPOrliUZ
 pDlNty8T8N7/RNEGT1QMs0X0+H8YNhg/HAejEx+bOmCL/g4jJEb+XR37jqM/lPgP5Md7xkFAbpF
 hnC1JpyGG6DW5t51jZ0D9+iUdaWaPrX1UzClqtNu6vo7MbZE1pHC3OMUZvOd84u8Lsc+t5AaE52
 Jx9Vnjbo/0u5yEo55L/1D4w9AW6CdjXwOgzgWiyWhmEp3Fg/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX80Jfv2l3B9/m
 Tr4DbcgJ1TgP+zfHzu1sO1E+VHnFVnW6xeFpa9uxnb/SAWBQFK6r8bPlXNvKIih1m19N3rkjRdl
 TIjJqhPbDibEY45Y+QMUqcSaiiCbhf4SdH+DbcCsUjcdmoO2ITCH0SEgpesO4b43s2Z9izRTQ/y
 tSS65RhbV3UQgMgkgKQzcTtAztXqJ2v1xBQzmHjHTvNZ5Jvw/7YON82TMTf98W/WFHIgeHtpLG2
 v7XjnltICwLe7Y889XNx5+WVlnyO0uLGzLCNf1nFy10OEwEVwTk5GDsCBq85vFy9Tca3blY9God
 VdVjdKfey7sVFDTVHxgtj5ZgHTEGQG7UbU/ZzsG1wZGvJWFHPitOYhsNCsAry1OWBHqyeaxPQoc
 MWTcbtUG
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689711f2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZE3Ant8tpL3sd5WsEzzoh-7zAfzi3Wt_
X-Proofpoint-ORIG-GUID: ZE3Ant8tpL3sd5WsEzzoh-7zAfzi3Wt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5

