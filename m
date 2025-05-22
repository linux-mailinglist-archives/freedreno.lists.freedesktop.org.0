Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7FAAC1415
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B32610E93F;
	Thu, 22 May 2025 19:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyEoVaIh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162A10E81D
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGIVlM020937
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=; b=QyEoVaIhuvRvU3j/
 Itei7IHdJGkKg3Scy62+ehhTh17RIMBgCvO4oTbG0eFOXjDuhj6JoyY99/OmCykX
 +Y8i81hInD86xFTea0DmLDpszMQWYOWqSPR5IGKAfochP2BF1mLoaDEFBhKEVQID
 hq7Nm0N1eTysKGM/B2ShrjwPPmawoPh/pdkTz03PTfvB3/FFRw9VE+oaWhwPKZ5Z
 YOCYkS+id/5v2MiNXyl3npSgRsD8nIcVtZPhTfKdxVz62VunqL5Jjr6YqPYw4uyD
 2BYfCOkSVqLVdgNnTTxkC3GWneqTngdiVQ9Oul0FNSz6RtEiDpm3/Z34EB8psd4z
 viI0hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07nyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c53e316734so1470664285a.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940688; x=1748545488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=;
 b=mWQZ1by0qCyVpy/nWXTbTWfrsl0YVnFtcVsAGY54grPseF8eRklCXrMwgEc7eVNx/b
 Rc8L+EV1COq4uQ9EJCOiM7tr/NlDZPYlzBxO1MNJutDhgb3Eg6xhsW4CrbRmX87ssb8Q
 4Y0s0YAi98EzQ4eNMXVkMPXJlHpyIR69Udw5BO/oS1y2iZ1tNXbMjqr0oOTx5GcXhlgE
 Y4pZuC/2CMbSwy3imNwPCRgJYMVX3lAQeiuawaDRTNECbtGFzl+x9YZIMefjsz2YWEN4
 QzX6b5FY1CNTwpJhhvPM6Yf1A6H+kEMld3LjcUGJ5ZFT/QPQDLQyULiwJb5n//Nj2fSz
 2jAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp7OQOVUiizhsJQY9meQlw7prENeDqsB+DbT0v0kk+JNtyIBAwbet+HyYwdKEWd+nZNwrSyiK79bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT3JijlwkoYdxJ4PG3Tu2/qu12Dx8CNRv+UM1/I+s7ghETCiRK
 3/wfnw52nS8tTgobuUN22vHzmkLwAMF+7eLGBVO7J/cUUBUiTui4UmPOesIzh9/SplIW2QJtqTL
 PI5+zPjZlrH64E3oN+55+pYdJM0Q0UEDdkYCBvDOdx0UMMHZVplKjQKsCFWNoZCFu0Wnz+yTd9G
 3HKWE=
X-Gm-Gg: ASbGncth4MceP9hTA3HoXWD9N7Vyzj+fgM2a9TVMQcPE1WMuMQkDC7Advd4UoFhF9Up
 VGdY81/WJzmaBCxBePJ3mGeiu/xsxJll7Ar5wBcg45NwLrPIqGrd9bZl7BLYJq/ecKggGI3cChx
 uWje+M0s1yxK+OigYmmWcEEgRdOsRs7GHL2g+G3t3h16VeaK/snUiQUlrk9M13xiKNCyZJLiAsU
 H+9lYsxWuD3XKciV0c7/1tsdJML4DX8f6RxNsA8p/Vs6Q3wM54ruPdzLBpycKwikmHCBGEM74qL
 H4e5JtBCZsiE7ofTCO7rWU6oDnsxH/s5zUiE99yOtlD3SIIkCqtQXZK/U38aB5eDMuPfRPYV/7u
 ZGMgU8Zgz9T313e1vp7nXFqwP
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7cee31bb78amr10259285a.30.1747940688519; 
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkQf4iYOb+R7gZkuxnEEAFbAY9pkxcEXxvh6KgjMPAunK1Wl091Ux8xgk6avNXsw0IdSEwhw==
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7cee31bb78amr10255385a.30.1747940688112; 
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:45 +0300
Subject: [PATCH v5 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-26-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4092;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7M/iNn8Ew4gxIUAAXQyq3p4514IfgJwZSifVWuJ64Es=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/ltEETAjjBBBfUagRxTpTHI0tUcNcahXfZ
 MqaHz2NJgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1TZgB/9iGw+xNjh+CkkKPHpQuXxKnjnNTGVmcvXJoW5SnupSoYZuyMKdnY2UwfQnu+LcX2hRLMh
 O0f5woQIGva/LbgbGJHOr4hTw1NX/t9QZwgKJ641Pvtas99rJJXjp0GuQEmIHKhiA3b2SiGrwHx
 ib150tZBk8rSS//Dt767F6RLDBwJrvzQDpa4/7urHXIew1asEKMThkaxGQLfmsMskHEDQjC85BU
 SrZ4kX61Cn+FJP1G7BAZowppSLTqrRDfqTnuthLBy0hSmW6ZjgdAWFicYmuIHe35LFC7so8Teut
 ZW74cv6xlxMMQbyAKec64kZkotTDWgcTzXRSa1WYIe3WbUP8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g6lQ8xb9acGzreeyVdxijVbwuN-Ux1a-
X-Proofpoint-ORIG-GUID: g6lQ8xb9acGzreeyVdxijVbwuN-Ux1a-
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f7552 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J_vUdAVH12ZdhNMp4K8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXxRdbvNGvZB+Q
 x7ISAsyjCB7pqH+Noe9yYZ+c8D66Kxv7N5n/7cLtnbVW5VJRdhVF83yoGrYo0Z461cbLzu3B1V0
 +1OI1OAE4WIqWAs3CjJek8DBdz4KBu6uWmvY90jJfgDuRnzoDGntUoVqEIlDO+z9ZyrkH0ECXLM
 UKBnVKxBMgBUwdH/CwOPbfyf0z9ciq6cVh2rmjpz7IJjIOZQCwAIvrXtjB4vZvVl9t+TimwtxNj
 cNRIARqi33+nwQIRKkaiDz4xmqkAj7VSzP20jgCClOhNaMay9hmlv4FB+vUUWvlE4uajsQDUaOH
 8RfjBpVxNsqJgEjD5DFSgYv2jYXhCR5YANuHjCKbSpx1cdEjJVgtEaGX0bw3c+h/gScA+hbCLzq
 xIM3BgNkjg76ySJtwQIRiwFNGVFWoxDqfg5E7CD8tuju0Oq6zdSgeAY1zdfufnWlz2Oq8IrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_NO_SDMA \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK_NO_SDMA \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,7 +50,6 @@ enum {
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
  * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
- * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
  * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
  * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
@@ -68,7 +67,6 @@ enum {
 	DPU_SSPP_CSC_10BIT,
 	DPU_SSPP_CURSOR,
 	DPU_SSPP_QOS,
-	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
 	DPU_SSPP_SMART_DMA_V1,
 	DPU_SSPP_SMART_DMA_V2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 		return;
 
 	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
-			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      ctx->mdss_ver->core_major_ver >= 4,
 			      cfg);
 }
 
@@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
+
+	hw_pipe->mdss_ver = mdss_rev;
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -314,6 +314,8 @@ struct dpu_hw_sspp {
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* Ops */
 	struct dpu_hw_sspp_ops ops;
 };

-- 
2.39.5

