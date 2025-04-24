Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CACA9A7ED
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61D10E7AE;
	Thu, 24 Apr 2025 09:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7TmY9aP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4610E790
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6uJ013087
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SejrFGzUZ3kFShcktbFsTSzpZWaEgxbcsEESujMNhDU=; b=W7TmY9aPh/aHrPRK
 vL/Gq2KNUszZ03TXkr9rLrqBCoJ5flbv5IFmQr9Rv9rWvyi2o2aP0UvTGxgvg76t
 xtFWAbFQDAhU+JUlzUx9DqJ8cOwPEHC3T/N+zz5FRxJKKci3r4jBsytB58AobHhN
 u7Fc0UNDXSNJYJIyIBdyLeDetzLN+eirweeVWMxwhmKkO9pEd6C9uVjXKwVm9rr3
 C1oHBZhMs1XZkoHUPvRDGrlxJI5B6xRySo1SxnqBRG2luo/yZkpbwCH1cNeybN0c
 Cd7LVSetcOQMEeoT2TaXMe+7DfFuF8ThAx1CNZafSUq3dCHd/pVKjuvGmEKh43hE
 g0p2+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d06s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f0c089909aso14793786d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487065; x=1746091865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SejrFGzUZ3kFShcktbFsTSzpZWaEgxbcsEESujMNhDU=;
 b=wKEcIvGD+BigI0oBsmFe2wDFxN5iX+rhw3icsY4HoN4PvM3qCBV2wc/ESEXP6pfi/8
 GBOy58cXWA9Lqk91eXkUY+8jFqpDfHqXYae6mcjMa79lYXu4TZzomJAOh734MNfBexcg
 X1AyXLFXv1dr2eaurJhMt0J/RZrOZj/fjulMWSLJlty/ip+RFMbGKEvReHH/bA0dJJ7e
 xtRB7RDB526rFl8Owu2+wmMGHtMGawTtVfvQwczKeMYQBPgghY3zM7+4wx167E5cUN7j
 5PXxTJigmLkFSvDA+l6vXW58RUKKgkEKGMCxShDRj7K5TbfvUju/GAzZBpUs3F5Dq1tb
 /iYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTo/OZ0HHr+OFzzfeVOoQr2h5/iimv9PafaAmNav4cz4gutyqbPBzqBXTDU209un93xkq9kpUDlmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFuQVuqAf24/BvXys0k7oSigvZW5FIJ69af8OHrNq4K19FBxlZ
 o190J+IxG4qcq/D5EsQejJ2YTTi+TeSqOqNGXDsWEffvqILrV1h74/nYLG+LYkEe8+D8RmBvNmE
 js47zjaCBlKyTl6019ZDAE6vn59YOw0mlDMT4jzemknM5vpBiFrp/AIttV29hWQuewJJJWIKor5
 s=
X-Gm-Gg: ASbGncs7iBEo6De0L/El5/DHujtj4HJFYgWRGRaDpJK7fGtu6UotuEHc/0xfdO1b/uF
 /kjSYsdYLF8rdaIyL3HVb2PcvCrfy4BlD5VaGDsSVBZcc+wmVtb+49TTkE5f5uPQiWwHDbcdoKM
 PC/Go0lgiN7RYNen3rDgokfz8aOjh3h8rMhyNXhG10A3CephKwCtJYCWzMA0mddKHSJrpqDsZ60
 iwHkPJ9sC8TeQtGc40bPvYo8ChJxp7hkoohJa7C3AL5d5rns8oTsMxgfr9Ph6zmGjEZLe470XwM
 Nnt+4hwEowvvMWO1xvmXV/wZtODmLZgln9dVzTkTeu3LeJnJ5bPRaRyR4N7DpPrIiwB5xvQPF0M
 KuNeZ+Cnzn3lMgvn93lo9V4IR
X-Received: by 2002:a05:6214:2265:b0:6e4:3eb1:2bde with SMTP id
 6a1803df08f44-6f4bfbf7c75mr35753936d6.19.1745487065588; 
 Thu, 24 Apr 2025 02:31:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuvDq7PRXtyL337isMbNw0whC03Huj9hquF1Ds8ItN3e2etA+3UBBGy9s4LWZnk0LkPFpV7A==
X-Received: by 2002:a05:6214:2265:b0:6e4:3eb1:2bde with SMTP id
 6a1803df08f44-6f4bfbf7c75mr35753446d6.19.1745487065131; 
 Thu, 24 Apr 2025 02:31:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:26 +0300
Subject: [PATCH v3 22/33] drm/msm/dpu: get rid of DPU_DIM_LAYER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-22-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5770;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zPzoSre6QlYhSZgH7eVz8ApdAwO0iDMR9kpYQh6k0wA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSuco4C7iqbAq1sRE+ubkpew4WjhD1s21BHe
 Rj6XtiWSXKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1Tt3B/9oCdW/g+rDJFr0tiFBV8vFJIROnR+I5OktIYU8v6C/tdJNIySmYtyVpbNjIGZlZFHBMe7
 KVAbEF79Qte1VIYuw2rf4Z1zaIm3iKFsHe7ib6pHwff2/qS4RbpIuNSdiTDJ/Ym+HPOJq5auBUN
 zBr/F5d1X25gPoR3QY+3Wp7tCzyaveTuSZkrAYZ/V1DEsyJh8EsFobwAig3fZzEpba/kWNS+Yqo
 ZbYH4PKgaYNuJBN5AexBCctnwOuF6pZtkiv+DFvaMLlheW9pwvqTa39P088yU+lP+nLhEHfDKWf
 +la1l0I2ARtqF29JGGlo2QlqryWq2+2g0+K2vs+WKMO84J1K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cGmwYI021O-HpqUk6Afp_XXiK3WjJeBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXxtzzx7hn2/6i
 plph/Fhe8Uh6PEU8N+dd8j5R4QjVrx7KHK6Fi9NOj5ABfgFMmIT+n9N6XBjbcYApmyX9+1FaFY0
 VG9hNjvvlrTcplFRi6TBfHddE/izmmzI/A+XOlMsz6fdMAVpzShTfqDSaQSMWrTPNFa6wNTEGDm
 Kdf9KEP6uNPxwVl7J+eME6IzTbbFD4zjXI8iLxzH4If3DEbivfzJb83joDIYiFkYkq3mZNxAr9F
 F1BjCKk1mF8yvJaSLBBujpZSnMS8VHSlsEOEWLGwCaravR08EF1nsiviSGYxmgWZysh/8XCIzgI
 jCMogSekhIgG6k8QMgVrUskkiG5ZtHCn1H/80AeGiE6tV2XFQ5M5z19rzFg3+G8e2hTVf6wjNTv
 fmqQr+u1NP0RikxeSuNPB+nN+7tU0ZOXJBN6cQbnEuEQ9RHPJClewIiFA3H8iypw6TlMs028
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a04db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=whSD1cen4EvMnTwSsNsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cGmwYI021O-HpqUk6Afp_XXiK3WjJeBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

Continue migration to the MDSS-revision based checks and drop the
DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 7 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index e2306d314ef8f8b59078a8ca8c529f2e56385c98..8fb926bff36d32fb4ce1036cb69513599dc7b6b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -107,20 +107,17 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index c75d0d42b6d856f98580068a5ac7f82f90380ac9..af7433fc6c128c2e29381ba6bf56388bccdd93f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
@@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 		.dspp = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 842505ab5c4a6555e0a3223804065e68a5a4e680..155db203282f687e5632dcb042393951bb03876f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7087c3c2e728c51f070b67ab0f8039f74eb7da6c..708cf1544bd1d5c72a125b572e51d628c53f5033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a2fdbe39e4415c1da1da0517db2284f368bfa07b..b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.lm_pair = 0,
 		.pingpong = PINGPONG_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e22ad69e451bb5ed38f056e95b0944fb5c21ec7b..5ca696b8cd92cefe295cc7e45974e1da0d420cad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,7 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1fc6fdd8864b017bec35e448ef15420530e018b..8e6fcb51aad8278eb80570a44a423c2443744c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -84,14 +84,12 @@ enum {
  * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
- * @DPU_DIM_LAYER             Layer mixer supports dim layer
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
 	DPU_MIXER_LAYER = 0x1,
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
-	DPU_DIM_LAYER,
 	DPU_MIXER_MAX
 };
 

-- 
2.39.5

