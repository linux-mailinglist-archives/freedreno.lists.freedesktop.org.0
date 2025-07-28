Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1AB1434E
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643B710E593;
	Mon, 28 Jul 2025 20:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FA1Q0dNl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B3210E593
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMac012151
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FblfID0Tg34
 q4efy9/6mUQC/8o/8akfX96cV9gNqkhk=; b=FA1Q0dNl4ZOlo74+lWU/K+j9SLn
 jsjEAa/cqprycRJPxnNmUbP5+DGx9b1x6qkxk6DFI0ULhCn6nc/j4F221+n3TXwm
 8QpimZafMakw53DB4k06w5XRnYvA+yCWwIChEjfaSLqdEOlL/qeng7N07gGd2WdS
 MNN1lA1AyXOLDh7wpF8jV9i738Ne0KRcHfkpKw9UHamcwW4VKl6i4UyErcs7cf/i
 5+KGZ7Al25qVvuMxB1CdIwDfzvlpvnD6zqHCCTenOlzApGHcNe281LYxi/AxQRDn
 4X2GPBzX5eKKCfxUfbuEApBfol8bbrDDf0K7klO0+qc+RSyBYWfdHJUsmYw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk5rtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-75494e5417bso298350b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734864; x=1754339664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FblfID0Tg34q4efy9/6mUQC/8o/8akfX96cV9gNqkhk=;
 b=ngdhdhNplkKwb+h86p4+JRfqxlWq6S0jyZLd2E1LU2HTm3gdoDdWTUgO4LsBV7Y9q5
 XHFOOnt2zgASDSGqfcO87aEaMzeZkEJDt4LcGJVR6/iKGZwzSTQOPUbmGIb39ym+Z7Ri
 mmh+2+6EWBXvhvQDFvAS8q+tU0SQpfQtl30F+Bl3+on+eIM06Hm9SKT3TDQaAZfgPKpN
 E0RbiBek3Ii4r/uYNbz6SgS1kbVAQR1RYX8KeAxZtdC1zCOj0fqHDuuEasE6KYEoex/+
 MOpU9KpTK0skrYGMqXqVV1DIzAvrb5HKt2IyOv6yM25lWgN/zSspB5N5UeWZaETkEx+k
 jYeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEkLBOL7fF58DMbzNmtyXJIQzAaVGJcxYybwTwypnfMbcbkiAXpX9dlgQI0n3iZw5bWfToAp7cQ5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi5MX2A2GNeqbcEowu/3VbN715arNSEoxG/vOjCi/16EXMp/tB
 cFWpx5s/mm5EQGlqJ7sGWuVRwGm5k2zGQ4vRjcjvFIQSDcfvcovedxwSBzjS3QwVqeg9JTCJAzI
 RepabFeJUOEHgT7Jz7goQYaRm/B537AwfJBUNNPpFfKSkyj2gyCf0rDPaBzRjemHY/9EuWWm4gu
 zgXJs=
X-Gm-Gg: ASbGnctmdv+0UYdQKgGp+lW7uLN0QmDO++A0jKbPy9wkQyeQHrYVWOLBtG++prdTBqg
 MuYpGH7L7rOVyUGyIqm2uKweShXjKcIj5cwb6XfVyGZi1QNm0gkgWiOTN6vAn2zcjfMo0sump4e
 ILdsoB9sPw7KdYcvIO/DRv65ySfspTtmME2wtNAe/z941AMd2FbL5fRECGGWgbvs+VO3UklXppj
 22jiKMeWx1lai59hcKw3rES3MoWBiwpdFj1dp/O3GH3JLgzRCt9BRUiuFQX5nK08XwaF+w0hveX
 q7xwrTuviM1WGDNVsrQyO6KJmyyMYbGBxSn77Hyy/7zyyM31DsY=
X-Received: by 2002:a05:6a00:3a09:b0:742:b31e:e9c1 with SMTP id
 d2e1a72fcca58-76967c8f960mr1024036b3a.11.1753734863976; 
 Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6V857zu2K5JXW/da9VThTUPhbu/3BvEVZayXh4F3IPipEL9YGCsaSIVW60VyqWLz3F3Hnsw==
X-Received: by 2002:a05:6a00:3a09:b0:742:b31e:e9c1 with SMTP id
 d2e1a72fcca58-76967c8f960mr1024004b3a.11.1753734863448; 
 Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-767bc848735sm2919670b3a.28.2025.07.28.13.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/7] drm/msm: Constify snapshot tables
Date: Mon, 28 Jul 2025 13:34:04 -0700
Message-ID: <20250728203412.22573-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6887ded1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=3YnKlkqyfxy5QV46dWoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _hb74OVPEQIMB0TbRvXbMjf9lXpkA0lK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfXxIJ1Ii8zViIn
 AseZ92ipZQIFjba8ue2MkbVzzJb4UYjI0Pkmp7QNPw1DkafAwfgKkyJicwnY55Nl5hVMYFH9svi
 aXH4Brem3tt3LJ7HgL6reh9rdDrZaB8QQOcCQJgTWndpb/XC0hxf6/oqKge9M8sHLZao1lUtg4l
 2mSB9+ljTfDP2ev5BUYgSMzRBIwwpA+ntqwY2RGFEtQt80yt/eoyXzaPsuj/+bDd3/2x0tNMZj/
 fIiZUfpqsJhWV5vSPEM7zqC4SMBFLul8tym3sE+3y5k7ZfvIS+tizB1Diuij3jBtlcOt1yHxJp6
 yfYJFQCxhHLq/4JSuhASbyOdrVl8ViNwKcDgcxj4fvuVo9M3Io7UF51TIxrEwTMBtImHNop2mFb
 Up/bHPCFpBU/fE9eR8Ke1qns9yf3i3MqSvKXpwAz5aOU8aG8031l5B2AwPXGqQTOLel/d4WC
X-Proofpoint-ORIG-GUID: _hb74OVPEQIMB0TbRvXbMjf9lXpkA0lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280149
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

A bit of divergence from the downstream driver from which these headers
were imported.  But no need for these tables not to be const.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c           |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h |  8 ++++----
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  8 ++++----
 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 10 +++++-----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b253ef38eebf..7ba7113f33cd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -11,7 +11,7 @@
 static const unsigned int *gen7_0_0_external_core_regs[] __always_unused;
 static const unsigned int *gen7_2_0_external_core_regs[] __always_unused;
 static const unsigned int *gen7_9_0_external_core_regs[] __always_unused;
-static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __always_unused;
+static const struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __always_unused;
 static const u32 gen7_9_0_cx_debugbus_blocks[] __always_unused;
 
 #include "adreno_gen7_0_0_snapshot.h"
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index cb66ece6606b..afcc7498983f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -81,7 +81,7 @@ static const u32 gen7_0_0_debugbus_blocks[] = {
 	A7XX_DBGBUS_USPTP_7,
 };
 
-static struct gen7_shader_block gen7_0_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_0_0_shader_blocks[] = {
 	{A7XX_TP0_TMO_DATA,                 0x200, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_SMO_DATA,                  0x80, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
@@ -695,7 +695,7 @@ static const struct gen7_sel_reg gen7_0_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_0_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_0_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_br_registers, },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -764,7 +764,7 @@ static struct gen7_cluster_registers gen7_0_0_clusters[] = {
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
-static struct gen7_sptp_cluster_registers gen7_0_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_0_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -914,7 +914,7 @@ static const u32 gen7_0_0_dpm_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_dpm_registers), 8));
 
-static struct gen7_reg_list gen7_0_0_reg_list[] = {
+static const struct gen7_reg_list gen7_0_0_reg_list[] = {
 	{ gen7_0_0_gpu_registers, NULL },
 	{ gen7_0_0_cx_misc_registers, NULL },
 	{ gen7_0_0_dpm_registers, NULL },
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6f8ad50f32ce..6569f12bf12f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -95,7 +95,7 @@ static const u32 gen7_2_0_debugbus_blocks[] = {
 	A7XX_DBGBUS_CCHE_2,
 };
 
-static struct gen7_shader_block gen7_2_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_2_0_shader_blocks[] = {
 	{A7XX_TP0_TMO_DATA,                 0x200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_SMO_DATA,                  0x80, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
@@ -489,7 +489,7 @@ static const struct gen7_sel_reg gen7_2_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_2_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_2_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_pipe_br_registers, },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -558,7 +558,7 @@ static struct gen7_cluster_registers gen7_2_0_clusters[] = {
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
-static struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -737,7 +737,7 @@ static const u32 gen7_2_0_dpm_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_2_0_dpm_registers), 8));
 
-static struct gen7_reg_list gen7_2_0_reg_list[] = {
+static const struct gen7_reg_list gen7_2_0_reg_list[] = {
 	{ gen7_2_0_gpu_registers, NULL },
 	{ gen7_2_0_cx_misc_registers, NULL },
 	{ gen7_2_0_dpm_registers, NULL },
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index fc62820c0a9d..3785b644382e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -117,7 +117,7 @@ static const u32 gen7_9_0_cx_debugbus_blocks[] = {
 	A7XX_DBGBUS_GBIF_CX,
 };
 
-static struct gen7_shader_block gen7_9_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_9_0_shader_blocks[] = {
 	{ A7XX_TP0_TMO_DATA, 0x0200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
 	{ A7XX_TP0_SMO_DATA, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
 	{ A7XX_TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
@@ -1116,7 +1116,7 @@ static const struct gen7_sel_reg gen7_9_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_9_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_9_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_br_registers,  },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -1185,7 +1185,7 @@ static struct gen7_cluster_registers gen7_9_0_clusters[] = {
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
 };
 
-static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_state_registers, 0xae00},
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -1294,7 +1294,7 @@ static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
 };
 
-static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
+static const struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -1337,7 +1337,7 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A7XX_CP_AQE_STAT_DATA_1, 0x00040},
 };
 
-static struct gen7_reg_list gen7_9_0_reg_list[] = {
+static const struct gen7_reg_list gen7_9_0_reg_list[] = {
 	{ gen7_9_0_gpu_registers, NULL},
 	{ gen7_9_0_cx_misc_registers, NULL},
 	{ gen7_9_0_cx_dbgc_registers, NULL},
-- 
2.50.1

