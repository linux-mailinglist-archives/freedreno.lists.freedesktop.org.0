Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD226ABC3A0
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A289F10E333;
	Mon, 19 May 2025 16:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMUY1qn3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A326E10E37D
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GhXJ023299
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=; b=IMUY1qn3awswp/IF
 OmB0H/BYTlsH7TBnYhohJCpnDa0QfMgpdUmNcYkpFCzUJ5j6CKb4eBioBEMpoXfu
 YjiOcF4Xjw0DiuWPu098C86szSruaQd5sSsitj8q2TnIEBCpm+RHjZUCcnXVOk1X
 cUg6GGyccLv2GXRAcjrS5wJFsNZQHoxji7Si2jaCbuAXEBr01glCI58YN4ytWRpl
 N+/IFNdVcEY0g1uERZWPmJ62hPZX5z+5IEN48OVEzk3jFy0N8nDdOUkcpyht45Tx
 z3QeGlDuSbYXyv2+Ig6R6fdElIBcmR70aJvnVSLDAfqqUW2LxudRCYU/4NfAHEi9
 sUv0mA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041sg1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3fa52ae463aso4440601b6e.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670700; x=1748275500;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=;
 b=pQZ0sVQZWmucjCCLoBieX5qcOgH7KUKPyW20jZ+vHyWizqoIB9gjquUWzTV70GJABN
 3MZ9DyEGyQsTKfAT5DKzvOXXhrhK0PL9M8R8aiMJe6LNpAbZ5GwAo+PIIqjNcmn9nUTW
 Jzuc/zyrqzdDqwuAC9l86qszden4lHWbp444DZQl3JkIVHGl/Jz+VDyOB///QfLTbj/i
 YuZGgeirQkSV7hGCAZAkdwYaWL1YzflkWcxkni1rhPr4NWk8B6arv99CuDbCwjzC7d3I
 5zGHl2+phJ0LI1MJUTlbo9WpxPzdcPf+IFZZxG5AKJBWHHUw1F8H6pfDGApXqtrLtNeD
 021A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKx6MVvpd0yF4CLHE8zyKDqvvxBcDMyuWET2NJxaajGvNQFJx6PZPHed1GpkPIpF1664LFbczJTCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNjgKXsRDriczvfokcVuTF2/g62EtnCzl7QJSmjL+D4J/lyplH
 okeOrV5suTrJgGmIFiXT9QvCpQ4GMYMlniWbiXK3yLXV1/ZhN4eFQwThwK9/JSQTOo4dM/ixQZU
 zv9U1v1KWHSro5Ce2kktwZo0aaOHMNvg5JRKbR8fSh6g/fMVGkSuaQheck2i2DHoZwxTvYMs=
X-Gm-Gg: ASbGncvsBjOaB5pfjbZ0DgvyehimqdNrpp2VS34QBlLxrWIb9xgSgS2/iQQ2ic9w4VI
 4RKQNsxFQeRTISXM9EYAxF7fum3fzHB8PJF9tFVeccUw9Olew/zFLyzTrSn34L3w1hKxLhFwOWE
 X3CRHlP3JSBdr7MfYOGB5pwKef8m5431Dqms6Peih1SQg5sl95RvcOKLO/CohwbRYLCsHGN3zNq
 SMLPluG5fL8a3qVmuZiQl/7zoR18tggJ6B8SFQpXsfa1YihEefhI6cd/XyY307K2z+IvwAFRJl/
 Qf/wH49J52Q9SMAa8Z4xNrmexZZ3eVNG2rqs9yYEVhdXRcIbUnkxVRJZOa9ycIOSP7vmYdGYqkn
 XNMNK0Hs1AVD1k6PLHK1MsfrO
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id
 5614622812f47-404d88068fdmr8771179b6e.28.1747670699955; 
 Mon, 19 May 2025 09:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyzcW01pX71dS1sAOYRiLBWX0d/KLCmHb1i4QId1HV/+zFOfyPK66kJTMlnD6NrzfYSkV6jw==
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id
 5614622812f47-404d88068fdmr8771140b6e.28.1747670699576; 
 Mon, 19 May 2025 09:04:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:22 +0300
Subject: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HAI8Ve+Cj2eUNr5mYSEgP72ltCdvLNDcdsj28COl2yk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8BmXJXf2u8JXfW1972eXfGG/4AEqY8ZPT/
 5He7tJ+Xn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1XpxCACGoDLLweKclOAJ4QyMyeZPo/7qE7AVlXTgbgg9yI9wyXpIxzC6BwY1D88meLjpxlkkRVz
 NJ7dj0im+gGkFmLODBaYNCMgjPcAG1bFm351k5EjLGHnMBgzMpJEbo6H4YC6hGM6/Gm029g+yHm
 I7vLpMIR52D3egf8p4BO807z5K1PJb3w35WwbSMeFQ0LnZ2YEuldoSuzAW0FAZEkYtP78nODjEc
 3ucO5EH5CNMbrciHEkUTf0iZTwW8/Bscir+Jwg/3UHrhTOgEYo2xerrLgcSbwHYMWB3VPsKwsNQ
 LqV1Ga5nVNkqyqR1XbeF2Rx1V1lRsplCksa71Bw94/KRjv79
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/+cznq8bfCpQ
 u367WU2apQTTpeA1Ig79acbVvUIPG8d8R1nM3UeWjft7y9U/ITzxUAMHr6gWEY3SFI1QMFtWYwb
 cDvq8c4ARhosJp9Xm4WYQ83POUMwE8uOonP/nLem1W+UPqZ5dQPMsU+uO4CaDgpo+4Wz9Yl0i2Y
 3XmGT4IYzu1xn6xagnNYD3iMpb5g7VYRRhtTyiitLyZd7IFitX5TXe84rwtL7OXiLHmuMySRqGR
 6LP5httzkhrayECt8PIFQaG5WcV+unTERaOL5TFEHcZpFUuqgPYNpgS1F6Ip+pucLU11Jpve3rG
 NafFFmlbBs8kc8WACCGNUrGhe5XE8oAFmtivbC3OU1uMXpKVcjBoH5rFgWqz5ldCmdVwS6gnohQ
 7DDDEvXOC+ljHPKyK2OrzScDWiCztZULDxQ2dotj+z3cWTZfHNpPTCSweZl2Wd/GaxWZumjn
X-Proofpoint-ORIG-GUID: 55gCgGOIGljQm9Gxp9Umk31_0MkLsuNe
X-Proofpoint-GUID: 55gCgGOIGljQm9Gxp9Umk31_0MkLsuNe
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b56ad cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
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
index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
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
index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
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
index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
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
index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
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

