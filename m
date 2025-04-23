Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644DA99A30
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379D10E6F6;
	Wed, 23 Apr 2025 21:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ggdfl194";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9742C10E6F2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYNCH016872
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xz6606WXp+s9b+803uz3n9kdD2ssImwJCn8lGI/+dS4=; b=Ggdfl194mz3a5lqo
 UHi3+ZdQvrGy7Xt/VT7CKJLjZHyl+aIvn0/14xhiQmVdutsTCEAMLKNZMk6cqFh7
 BGq4O0SetELWifoqNkV/xT2GPICT8uZaN36uvv3WoWIM4xxVTvCjO5Tqgm4/qDcU
 bMwyiN0Jy4yPNkjWAMgIXc2Ysh8XHiS/l/mOHJXOui5EEGSxtmSWqjB8SzlZXhgZ
 zMeesULX0T5C/L+VQHqIP6gWVFagVXAMsICEm1udnZdxPdNpZ25qP5sLK5IQVUgw
 Cqwr0rYFPKfL7FgQM1b2W19j02STk7/YXciDt/ZzwYqC0Xxqhlt6uaGy9SNVUaUW
 UNpO/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so82992585a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442672; x=1746047472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xz6606WXp+s9b+803uz3n9kdD2ssImwJCn8lGI/+dS4=;
 b=s3U13vHHObAUbobeNuoJBS9Z0GxOi1+cck0PBcQKmhJqQvRjlLbk9SQXGXZP23djX4
 rBb6tO8k9p6lR50lF2BnRQ5URTBTxkp92FVrITjbinQesoh+Aht0rfEq14QwMg2kAfoo
 T0GJq7XajiFS9BZMRdTaKE7ZWskNaVdRgkTgbNbKQz7J73PfAC0aC6B6YLnkDAJbJAj3
 2JYHcsRULeH9IaE2XQ/JXUxAOOTB8kEHigmap8ampxICeMasU4lMpy851ZJ2zw73wc3V
 pB60/tn1bdf1ldUO4dPtuyh6OpnJwWwkTsQmHrXw518IxWvFuv/2kvtWv2bDucGwle4z
 ev9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx0qUsp3VgYPetYR/HoXZHLMg2xeDNTbOS8Q57c08WlPVxiUnr8CS+73AuRnsY+H3Et1TbaZioqCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR+66eqqC7OpFkt/9C3+U5ke4le7/8swMWw0QOFsLAO3GH66K0
 Lw62wrj/2m6VbW/5ZmurS+tc3WDMrFGn/L+td7dQysZeGCiETutL74+XdTnSMP5nOYJLE8TQ+yM
 cJ8e3Ii75bt2zSB8Udw6soCG4SgvEqosxdRVr4ZVZYi5hnc4a4rX3wiueytllDEeJLMo=
X-Gm-Gg: ASbGncuy6PgCZF+TquZkuRI8aQSt4+nOygOlsy8kOGVgST8zIS21wzJW9ht4HFo1jYS
 DMDxT0C0+fbn67PdrLFRA9jDFoMWTu4lbMAPH72nHywI9orlXpctBXqGj0TK7FDywHsp/+8t8oj
 zHoc1yVm4FP/5CY/9o6cy+Y58jJquodO6KvmLwSJF9QimdD+vqwT/khzGyms8/i/nVbK++I8aV4
 MjB6UXWK6MZtDdWDlMDYfq6cTHoBcL61pFu+HrHNeft+3eKEmUDxp8NUNtrmlbOwfO6znlLY6v0
 RPpPpU8U/9OeCnFqGwZgOw9OGal8lKt3+r518rA0PzIMqR2ZKcd7EzsjFSd1U9mdFzDxyZU7usc
 dQhbGW12bWMizkVeH/AEFUlG+
X-Received: by 2002:a05:620a:199f:b0:7c5:5670:bd6a with SMTP id
 af79cd13be357-7c956eb157bmr50596685a.24.1745442671942; 
 Wed, 23 Apr 2025 14:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESPt3RK64BW1DTE00z0O3BAxspMGtVLb4ytLZd2o4Tr0I2+Z/OZa3mf6XxcQZ70Pa1hOgpYQ==
X-Received: by 2002:a05:620a:199f:b0:7c5:5670:bd6a with SMTP id
 af79cd13be357-7c956eb157bmr50592585a.24.1745442671428; 
 Wed, 23 Apr 2025 14:11:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:20 +0300
Subject: [PATCH v2 24/33] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-24-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8937;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HOkBs/6zBYjscOwL9t+s9f3+kkK5I+SwIYI8RcLTw34=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctmgVurNwAYEJFpA4Zw9ZG1w4hRQEdFFqVj
 kg93M3vUnaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1f1NB/wMU4ysJvf0NiIhGNgq4avl1Ut1itt5HDEzi3JmSh23hMOp1Mi95CcfDn7Y1OW33FPWHdc
 nx6ddCXDHRKZdlFMiCiGc2VMaYuuoR7/7p2JTBY1gNE1ngmMgtY5ZXjMx4vk8dOUJSfCbo861vD
 sX9n+BTW9+bdNJ9cWt16iH6PsBwwe5In36Mucg2agXtnd43GeN+hkoNSghw4rG2sOvdRb9NlpQX
 yQLjmLcTDwbvMNTJOTO5xYSbptk5JkU7/qjtHaOloj2P7fgIjo4ocsC9QMoXWJSbgvBfrFvw3aw
 xq2aPY0IBBoUBGlJR40V7uY/kkIP0dK1IMlqQthz/WkiczpV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX8ETsyeqEcpO9
 nzypn10mF9XowmLCxuW3RWFM/93Rf/3QwrkdZAe3/AYeRMYwK9RRMoSaeWEzlDB7Ufal1ap0Ht/
 TVjcNDRkrVn/jjFn8u7PJueR54a4Pb4DmhlzLcGs/B2Ncar9b3QgxLbfPtayjVSAGNL26Oohnay
 z8chx1QLi21CTDXZH4OfJhsAjVtxNdvXsnrhzBTR4aA/oqQ6z7Xa0SqHMA6ZpiVfmd7eyTQ1DX3
 /aBRBs0fnec6CLENgck/BRVHptRoMqbT6A3Z2yOuMzOLcwfMPHUhbS2erK3uI10ATpXzXYgObj9
 Ff5AuMThR4yiuu8xDL69bVnTLkHbY5rlDLrT850ix6WbcEw2jVxhK9vKtvjAMU4AJgP+Hysn9VA
 cQxPLuO7H3iRTV8pPI2C/6jKjolWAvOAjyE4Agg5pyKmJgsxYGS6PxwSYaQ9w18ZdabQK2ag
X-Proofpoint-GUID: 5JW5MeR2twE3JxMg4PfkvJ--GZJF2tzM
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68095771 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=s0E_TIProlikEKm38KMA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5JW5MeR2twE3JxMg4PfkvJ--GZJF2tzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 634b7dc452839f994c948601fe9a09581cb42a42..c5d964e915cdde1f8a83c2793b0020d7cecde672 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -262,19 +262,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 59e280edcd508c14ee297857a19e9974970566de..dc21c5c232a7ce7d8c21d3a3f30a5c1bc352ddd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -261,27 +261,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index af0d789c47917e9b712282a542c3d0886313c049..c1e620ae9596f400655b64b47e6b51a8d25e1428 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -195,11 +195,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 4da7445aa8019894b35b12ace18c0bd6209b9148..81af11630202943b910cd5896f07a32e53a23c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -261,19 +261,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 6563296190bb27b6cab1b03921af6cff34037cd2..8cdd601a5350e80a5324db42c23bdeb474a59b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f..c08d8bae3293d00ef7ff28942699ae2a52e2cea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ee8dd66a68f421161961495dd68d39dd4622ecf6..981d259c33631d31f0216f5cfae948b828d03592 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,14 +176,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f917ffb85d2f1b1a0ee826f125d02980b7a79052..f118c6caa1b9007eb03fa9b39efa87dfb46583ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -169,7 +169,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5

