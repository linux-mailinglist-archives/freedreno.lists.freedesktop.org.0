Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534BA99A26
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD510E2BB;
	Wed, 23 Apr 2025 21:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQr22wc+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E7E10E2BB
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAt7ZG017255
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZEsuroTWszN2wj13HS3Cwvyjj5S8svV/2Gf/nALxW50=; b=gQr22wc+MqAFqgyn
 nlwv4+cqVuDU3TH/pYM1+H+Izw/nSQ90K0AaDJBdyYly7nwExHli5QCEwTSV0pr/
 Yd9byWaImoe1NvD35VDoaa9CfD6OyC+/1ViJBsce9b/Q5K/ChPHHg6gD4O1h0C58
 suNHlnaHNPyoEGN4LAs7sxWnF2v2gUiNjSVF1sdua0v3x8lNeQ1pdcwXdq4bDUvS
 FfAQbNKkpSYXrwuPuZYpjQTnAhqsOwDwoVm4yt1kwPg0g6MhZc+r5S7E/VEYkm9M
 L3rOFRKH+4pkag9jpcI/lqaykzO+ZHjkxOPIujmhwrzhFHyTRwpgGeP1fcqaifNA
 KFmMHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c790dc38b4so60372985a.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442656; x=1746047456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEsuroTWszN2wj13HS3Cwvyjj5S8svV/2Gf/nALxW50=;
 b=Rlr0XHrnAVBv2c2bvjBM2a/3qywe5tfr9rMCPiSF0MSFwgb6EgSjB3G94vuv+q6OSP
 uBlLV8KxH/eAzQdsLgGBtHPRngkmw2F4j+Ee/391+3Lm+voESRKT0Nn452P18bWNz6eb
 pn3eFxy2+IByoR9MYQj6xk8XBXlbdYWSpzlXy9cGYTh8wPER+9dKkbyCREwkxUY/0mlx
 tx6loX5tSWpSZKX85dDQaXZygV+HMneuFakYV/UlVAjxpkWNhegeMxk4SEqTSB8cxf2Z
 +Ln56irkDNgJRJ/1at9BTFedAZXPvZNcy5tJeYuuxGLXDTZ15PaQ+KA2COrYh2kA4eDF
 BFsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSMIajPmdOHv3SRBIJAIpoPvMBCtCDxSie23oLgVAsWwBF8+V6Q8ohd5Dlm5weAyNVtuhGi8y11DQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Hu+MAg+Gys4OKd/KMFQ0rRFyTTBIGb9GMxUSHwwliDd6GXti
 5TD68FiTpO5jLlKSDsfGi1VEsdfKY4V7xb3V0LGyGKbr+11g3I/Btha0X25RoZDwFYmehWAzDdh
 eNhaXpdYhhg6Y9qKW2PvcNZ7YJXM2hoLm4/pD4NaXd6TfcI8UqQcRl483xfqNqPtrqA4=
X-Gm-Gg: ASbGnctBfmca0E/w2DoldR1tPi1YEGW3/jnXB4REIyCF8SUnEkvQAZFZjw4FID3ZKLg
 xxTdRAGuWYKqTyWQjsMRlb+XBjgQytzBYpGpy6mMqDj+4hvsVTCyHrZ2e5lzTJkrw5UGHn6bezU
 Vqu51eo0NhJSFw0p2buMW6S9OYuQYPMCA+FNTpBQ8H3qdKpkqyCfbIaGcXdDjy1nJC2MxWuTEWM
 jnblFiLXXfONV9IHAIhdlmxRf1u527atDnD4WbH0HNFwqI/BNPU9qFyzqUywvJAFeFbWKzdrolm
 9fe18N9hHB3wFh6RoMT6SMDyjN7uKLeS7lDBQi1hW/59l8q4ty94K/+wWb0lWwl98s/HVlF0ene
 7c5RAyD83C1/xAKeDGt+uAExt
X-Received: by 2002:a05:620a:172b:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7c957852ac2mr12346885a.14.1745442656213; 
 Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzE6aMjIkL4DPCcVQFSEs2GIlRLgaZNwRREDy5KUAX+YaRA6Dy/3Z/S/Md2OzrSCtXnbDwA==
X-Received: by 2002:a05:620a:172b:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7c957852ac2mr12343585a.14.1745442655733; 
 Wed, 23 Apr 2025 14:10:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:15 +0300
Subject: [PATCH v2 19/33] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-19-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qbAqux1dNcQt1qGmHQYeMqCZv03w8t4uvcu6nMew/Ic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctN2VJoEZ6XeoArJuMgx7tFuyrk25dkQuk7
 Gkf3d7G24eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1cwMCACzsJ2Z6bhdpOMTXn+jBYiT3wVURkObXES/6eTLTUNibdCPtNk12Fsx4ooTv1ePOjzfpEL
 ykgzIzM+7Z/fkWQ7cwM71mVd3bHvFQGODyjujZGlcuLku6nBpD5RZwFY9xQ/Oy8DBkSN/nIHolp
 YkMhQ8gI/DRFY+J1cFXScJD+tqiHkgFvF2bthgwVODjxVDIE8IS4/4KdgbYGLJHNo7rkiP2K7sk
 PhkILV/YPe1aOZY0JKHtx9q4BMIrnh5Xwd3UmFKL2BYtuyu/6KWEtne3Kob2XUSLnkqACEmyML7
 0TFLKgw1XwIYpGco5tzujP/mzEH9onMDY7dqbE2t20GooRn2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1xZSoE8MV105iobpmGfHZVwavQP2IaTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXyIWb+BJ80Q/Z
 bVbMSBXj0GuiOdLHKKBZafvGFrNN0ScBkeWZEsOUWrlZJyDlkW7xQhZ32TvnVjem12ieQjpTkpT
 vfMAxn90WXrs8rD6ld+/J6RXPfl56XYm0OAEeLBx7W2a8AF61UESFBXtSpRp+ufClVKkbQEw4qv
 aiVF8xStQG6KhUxPZwNlxOi25SpNdHoQ9CGJ8Bp5rulAsdUUWB0q3MD06oDYoNW5fobXn7kg7bG
 6REi3N4qlB9AHF99sjNNEF1jMr1dnynclH5omYWo0XYRPftJpOnwPTeuhDneeIZJhT8LNm0eROV
 Rme1PCHqnkWgXen2HpgX/16Mp7sVXXX7wQp8CZhzCu7Es09jQNYEyFJjNkmJwXi86gjM2ffHoeQ
 cpD0vcvjGIthD5JWsHLifXke3wJguJJuaw6mySqrZp11gjuN0c0H9/qgAcl/ePjZcWJ3KaIu
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68095762 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aymVMRhB4c0mkscYco0A:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1xZSoE8MV105iobpmGfHZVwavQP2IaTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 9 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index bc013fb6705d0e5b8e1f5304ebe9318227450cae..d64366f608ea673422bbf4e5b6ae7f4ad8570784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
 static const struct dpu_mdp_cfg sm8650_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index e16fa6d8a431f55643c9ed9c8b3845a790a7e268..43916752cfd5836718a3770df4c8767635f77ee9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3059b9f88567c6f667ac456fa49de73f3f212ad5..d58d5b7ce79b8c069d111c3c2aa3e9cdb2c1a435 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 786071b35b7b66e202899849b0e06762c8d1c57d..064546d4fd4538cd5a6b56fca3ee12d482a7dbb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
 static const struct dpu_mdp_cfg sa8775p_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index fb31699cf5bf11036315984ab95240a312703afc..959f3e9dbc5455fe53c1bb240b5db57212f2d4eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 67fc0098836f72b6b67da68a6c41c18f334afd94..174cfdfcfdf9860ea86c983c6b6591ba98da5400 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
 static const struct dpu_mdp_cfg x1e80100_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3a0de200cc5c9751adebe681f80679e0d527ab1c..0f8c24ad346568464206eaaeeb199955788ed505 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,8 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
- *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -41,7 +39,6 @@ enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
-	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
+	else if (mdss_rev->core_major_ver < 8)
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3305ad0623ca41882db0172e65a9beb7ebe00b6c..f3f84c8c302fb1bfe6e6d70e4110d0b89259e55c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->wb[i].base, "%s",
 				cat->wb[i].name);
 
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,

-- 
2.39.5

