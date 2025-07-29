Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D9B14FBD
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322B710E651;
	Tue, 29 Jul 2025 14:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5CY6nxQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520A910E650
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8kNwa031280
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=y7d4X4d5ItF
 0dDHDwv/IU2liYcNeWpQIM7vwyXcj+BU=; b=P5CY6nxQcFdMTGud3F7ywwefPek
 Mq535HfdQBeu8rbRpnXTcHVU9Rk2wmNR59t4Sjm5FFdyy/KMMkqnuX9RbObrTk+3
 edf/jtiohnEXKzRtHFeqzJrvQaWyqNFOAfWj/3f8c9zpy5ZX605GhKzIGrYQWTX9
 XotuwZmQdH399HbLjl3Mum61RPFl7wCBJPp8KUQDFfJF22nbSpL6+g7f9kV0DusM
 +JCwAqU+ROQDPgxh+ABbz/XU1ioFHJ+SaJEF9UVkBgxxbu/Wt7X1702gyhjqSlDb
 UUswABUTdDWETEII/aa6kWf95s6ii8OAXhDK4NmnmfqErhC3yrydPVU0hqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xdwm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31f32271a1fso1209226a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801064; x=1754405864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7d4X4d5ItF0dDHDwv/IU2liYcNeWpQIM7vwyXcj+BU=;
 b=oJVdXmJTu4TjfYxHJm/Wgr81nJ4M8b0FbBZ1ztT1QHRbNCoiF7rLI1QbOElRhc5haY
 nujwreiGxXUFZFotwA7BulQeR5lSAXubWbOGrVpG/W0+GWoltuWT5ppmgaZ+1r/FUClC
 hIQLTeJ56W1v0hcipmmuIVdQIwFHCrzwZt8R2v6RSIAxU+H89ocQT691ympdxEmKzDUC
 5KXGJyQwG8UI9n20YyOjDdpofkG3V3x3WV6UOyiO5BoBjTS59zK1NHQpkyVa3S4sgDzw
 +qrEgBHQKrVU3fBDSu6YIyDGDjSgpuk1aMQzk1SfBq1Fkpe8aInGm84O4/8T1OQ9HihB
 RMVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNSJyISEGFAKOLE5CbUVLRyktLUros4SHFDPgeqRlwAAXFNZNEPSs9QN47yMchMDeUKv+1+Rst9Jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0vcI/2hL/xSed1zLdLgsu70HnZBJPfjtE8U/m7rFK8dEB2u1U
 YG7Y6k6ezXVgFpgOfMCD1vU0TSDZ1U6VcXUaJVaUX5jK3Vd4h5/e/c0E0pZJa7A59JIdpghz7ID
 mT6qS2mexLi5Ntcd/vRSDfWVQ6GFCOBvD2qHdarph10J+dLHjuQxUEWX58l8brx5FtUn4q2U=
X-Gm-Gg: ASbGnct0EQ2P+Y432dk4TDjfWea9dFleIjfJ+0i1aj5RBaLm4UjE4XneEhRF0a+ZFzh
 FN6xV7uJc8wFgagW7WPHocTQTMlLuzl6L8TjCpugQh9S5ZvgG6i9I7lUl1WPxiwHAaMNqbj2C7B
 TIFP30rCA5KMkffkcJQUKK0Cxto8EraCEGK9ONx4+qG7jUFY47zd2yebVrjpP5jK41gaMfZs6hV
 ei1ABQXFBNKuzWjS79iO2xjPZ4HO/OFWPA11fA1x1faV+jIRwQ0X/8bZS6tExGgomeQgb2Qv2QP
 W8DYMYTDbh7RHrTYBLF9/jYlBZbMQzMxyg0GvxLaTklwUqJeZts=
X-Received: by 2002:a17:90b:5103:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-31f28c8db3fmr5467843a91.2.1753801063718; 
 Tue, 29 Jul 2025 07:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEErS7yrMdyPzrrL1N7Q4D4+DJ70Monuo9B0K5LgChnn+aazXuTnS9j1X614LdgBbPqry4rWg==
X-Received: by 2002:a17:90b:5103:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-31f28c8db3fmr5467776a91.2.1753801063043; 
 Tue, 29 Jul 2025 07:57:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e66eabf0esm12322932a91.11.2025.07.29.07.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/7] drm/msm: Constify snapshot tables
Date: Tue, 29 Jul 2025 07:57:21 -0700
Message-ID: <20250729145729.10905-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX3zKpXh1VMX4s
 e0odspWwF/wGaTRhmaNJq2qNTrsfLI7IOmPOB03g0g/feZ9z06gfMBoItE21D/aqjioo+taP6nb
 +R+THPY503pUbcDpLYzgHcKYlrZmhq3BvhcgdsuYQ9uTKYVl5eAZmZ+E6XzkV86pGXUX5XP/P3J
 yKzzHHCfObd78yUw2cAJbTbjOPWC4CHnFCu739efBEuzQfAX102LFzsd37ukTvsLpJ6AmzqJ2l8
 n7v9wQAfbMYRiSIWuBK/y7dbBRd8Zn2qihxZP/ES+jtSfBwQnkE/BfT4xZVVnH6wDEgMxdWPoQL
 5pih3Zk9hpeIFz5eoK05N8CiJbmtQacxdiXImgqR2/ZfHpdOCzNAJHu5nmk0LKygkjum263ugJY
 7nrwq+1mzgDUP0QMCW77Dv5y4VX6n3Q+Crc/aZg/Am9v7srelAOh2OQMcDhdjeuwcOgy+3gw
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888e168 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=3YnKlkqyfxy5QV46dWoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Q70J0gUuB-Bhx_2wevwB7ubJQYuEnsag
X-Proofpoint-GUID: Q70J0gUuB-Bhx_2wevwB7ubJQYuEnsag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114
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
index 5204b28fd7f9..173c14f215a7 100644
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

