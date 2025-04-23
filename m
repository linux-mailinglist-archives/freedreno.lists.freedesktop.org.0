Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B94A99A28
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207D10E2F3;
	Wed, 23 Apr 2025 21:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnQfSZxg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA4610E304
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAJGPO014896
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=; b=lnQfSZxgM/HXigxB
 xK9OuqSy4rU8tOJacd4Y7x8se/CPTsIkQoJ26PEaIr+UYvy9fgB4/hdkWclnNL/U
 ghsKS6KRascJcojTvJ+lOqZDfwacWVPfZz07yo0j8N+Cb8XxtRcx6sOb5e/OSQyh
 CKKp+2FZ6UsZsyHbN4Vf+BZL5+NqoOW1ndSflB0tz6InZZWNUReiTrLDnkc8UMcs
 GlBgGYdANvzBNqQiefnI+pnMkVURvrvdzqLLizvAgT16/2pGShwz+FiJThw9yULq
 +5pYYcMAedPR9nwlvaUKCxhUsrSXy5VChWztdQsO/RilBrHeRQQ9yX/D/OGuqpa+
 VXHM/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso43913485a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442659; x=1746047459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=;
 b=S9se+n+UjCDHZ0piKL1cR7/O3x7fW1etgoxWXHeRto0+qO+TOVk1E7Ugga5E9mPV8H
 aM41pVACJn0jglUr8L9aUjLmcsbGTmK/EFLKfpA4Vp8NGpKHmSwXI/3NdQuoAqJzevk5
 +GqCiE0LlabOk7X9gu5JhQPFdft2YSNnBSwn8G4MGuSsspoWcfGpR27rX070xpK4M2rH
 c83IboTxvq0PdIgCCe/OTe65ZyKES6fpUEv64XEXVAJ3xHuF6OHfZQ4IVFiAeD/7sjeD
 JYWZ8nKys3Xny6g/KYR8aH68PhFg0wAGGkJr3KRWkjTazzloJ1dK9/h8d66Dng4GcH2c
 3xKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPHE/BaLl9OeTrsVkU+1QqN5/Sqo1l7xH52MSBiqne8vxhnxJ2wfEFlMrkWy6WJLSf/UTWMaTctH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUFYgwaUjybxcb4O8Nc16IQm7ZDz6OUbNY8chwEAPdOQAvW8ZK
 z3V9jVxGbAWuRkozHS12Eg7nqzXtMKVfQSvhzcmKuhfjtlR3pJ6fn3ZufaCVUS1dgFG7QC/SmZZ
 E0/RuU51emZQtKJO9t9cu7HwU2fYD1K2C+BlFf+kMRdKlgGkGxF1CCU+gLfQUDXxchuk=
X-Gm-Gg: ASbGncv5zxEWd+1QkMmrqgKMgy0W9kBrwyztx74+GSk3ZawDpiHPBQzfih57MtRnTI6
 loXbu5LSA8a47IU52wsaBqPVj3l8AVhC7PBoiaPpmx4bjZvFy4XgcX3wB6Vo3Ryjbpso5+iX6et
 +k8nWnFEiKEe2OyKhi8EF3Xxk4+fYZrXlCWM866HflzymPvSQoj8gC2qVGL7JYI6ZaoUjpq3Bt9
 G8jiD3un6SlirKS50kZSvjZilQeE0npnuLQibXoa0PaGdvieVq5wtUypQc3/L7XZUgb4Egeuq2m
 nr3DkEVXA/XoP/P5uUGi99FAleZBUOYPmG1RoMMgy+cmQDTpG4Ta0q8E4uKKuJYS3xQJ4FFilYe
 k1zk3Ya1rMDMtbeUnuCJ6uNRf
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id
 af79cd13be357-7c956f33756mr50592285a.35.1745442659351; 
 Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6ywVyzz7LTrJkvHpxsr9G9arHXs/wv9WiLaahFB+vwKNB4aqPf3qOvnuTxPjxtgHKakUVw==
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id
 af79cd13be357-7c956f33756mr50588685a.35.1745442658998; 
 Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:16 +0300
Subject: [PATCH v2 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-20-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctv7pebZX8R6HIgsPPMTWV8ZnTuEFol68ym
 Gt9euCIW86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1QXYB/4g/IoeKLNQZJl+v4Uyd8xxAlDD+c+En9zi8L7yWLn0PTQJJxH9hbTxO5r9p5mn1eeeBHl
 hFPs6rM1ieQUr6qai6xrm/oQwPzIbcmG14ux2tH/E3V1L5R4Gz8GGDXfPQK9GmqlcBjqrLCtbLX
 OaiAHFoW5ZeelSZi80nsPKml+r2rmR0bO/dSm7ImeGNB0pvTbvPzUL39xBYLPl/MDz2zSWsYPCm
 dbBE5PY26a1q87tmtrrVfNk7/cDDwxXK8VaM1kmDlJ3KUqYfILg8HopWs0z66msUrLKCOzHriHa
 b7WbrevaWJ2RPORPz/5nPCheDPEJTDhvk9feainFErzV8xRJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cuRyk2SX34e2UEHmcyEtU8jW7viYTDOK
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095764 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cuRyk2SX34e2UEHmcyEtU8jW7viYTDOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/WBtWi97Prks
 cPYgbAp8GZjcQ+9SRkAOjILgiqxqKU5+8yzr0/sobH1cd4Ha7KzeQG+dhwczcfIvayOhqcNMFL/
 iUIDUhTNWzpLoRPZ48EGdZ3XYNJV8xaOHjn9oxqPt79k2lFR0y5nlSqvOn4LqxeDGChoyB4vclB
 IkzEyQOF0yNRRWRJfQZQD46adwe0vkQ9qPNcyMucmA9l/dI/ctkpXVbIHgavA5yzipYRQ2NJUvk
 Ni8h0gQkmWroxQxvw6lWjJZH0fBNKav2JhHAGeT+YgTQzRC75BwdDD0ieyesVXiDa4zeJQLFYtc
 eWowHrN/uu/FHdRGCTjfo8Xt+MNDnWnjpJ0toH892cp1bHaPoJ0krnvdmQ+QH+Mp7EU1+JJEsU8
 5e3vKr2LMt1VvBwd4WYzx8b6HbDbLUX4aW1bVjP7YZcfSfYGEpYHtcSQqtFWujZm1A8sMS4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
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
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

