Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A5B14FB8
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5E310E64D;
	Tue, 29 Jul 2025 14:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFZ8g4AE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB7510E64E
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8VoRA004983
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V64f0Tb0OQD
 ZfJWk6fOVfLfxBrme2uWqEWKLnRNchS8=; b=dFZ8g4AEFk1NulFFVw51H0SG9Mi
 pGNu9HqxxGfjVLVqzcM7M2K8T0TEdjMUql0bGQ9cLBuQ2cbgt2D7uEeohWTjlatB
 lITjyboGAMT2LJRpuse182ZzQfwpC0NSzb6/6xDS9H21WGli79t4iYnrO/czGKCe
 sV+cGALA9w47dsy3YWyNMEt1pG/UJ7s8ErGZ22sW3OpE9Msf3SOBQ6C2PJnplnMo
 uzYqZkggKxRGwX+eXIHVTS1/qx+VqAgArShDEPQRMP9ReCpynddiVPlzs3e+AVP+
 tBmq9twwucgX1TK67+oozxTOqLSyMZQxYKXSKT7I4ooots5n6q2UZrgaTGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu0s0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23ff6e5c131so21083065ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801061; x=1754405861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V64f0Tb0OQDZfJWk6fOVfLfxBrme2uWqEWKLnRNchS8=;
 b=DYqH7sR0xeaVBDETE+GBAUTG+rhhLqyY752cx1oi1P2MI6t2Dqhm0A9JuKMTq2WSJM
 UP+870c4hJPRzUlj6TRWhAtgMJ3tqwQwFYWXugV5PrNJhkIyGQ4/tWEIj4bgO8qgXUL7
 i+7mRrLuMC313Pn7g7zDX5LNDdYxmx+BhyV8nnEp7xmicF2vs2dArK6S/uZzH6yJ3saL
 T8gvr1Cmy+xgr+unNaV7+BeLvtgOE5KruOJOYP1UAqKBBBMbNmfm5Mj4rwx7dGcht1w6
 N2Mku1gCLRxgKXxeNYa4ov0TB2W3iUQYqssCVOqF2sA1w/tppw2Usub0DIoRCarYGLxk
 AEIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFjgow2p1WH7yeCVFVyxYo3WcptTENo2fpZujTCIZSEjlqdmlLnRhTQC2rlxJx+zfNVqc3hPwDB2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcPKn2xdOJVR8EgsfWay8P2LN069Gag1/19RZeSZLoRyRsbGxY
 WvD0hEBJAqJkX6Yqme/zHbNUXfgj5Oo4Y8cP3eKhTxlKiP4i6PBQ6sGGYhSTOZBya31vdxvxo7H
 GkSRWLeyfkA1eKONHsc/LhFKte7MzdlsgHeMt0vPKLwaXzXNqX0XB4lj89lFASa2BMKJiex0=
X-Gm-Gg: ASbGnctccJ1aM4jYt2aTHZsWfHpuwfEQdvUWcEbiC0gzu6yuaUmn4xbLcfvrTn9muur
 t3D/wj3OxDXeIWUfTCocNDiSFRzamX1orK6hHWtCaq9pMCZ9fSh+zsK4gYkbSL0HMBqxvchdkDV
 ntLpbKboXZCrwgmTZS3avlk4dJ0UMolBBP49X6wp/F1ihHjaAe9az9YeJNj6NVWSYnFaR21x4e0
 lCqFmTEJQcDr7m8OrVuDeE67cfpftRDqCcDX7M1Cpc4pzHhzqrKAEsCQ0Gg2nseAEyGXVWtqbvw
 i7wr4I3ZsOD2rV/n9AtwbFIVrS1YcJyTYzfBFeMPt46skgl1CiI=
X-Received: by 2002:a17:903:1b2b:b0:234:cc7c:d2e2 with SMTP id
 d9443c01a7336-23fb3050848mr224991715ad.1.1753801061014; 
 Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ9hVBLh4j+kghAF/L46lgqX8VCMZ2DXnQbkvL0U172Ce+B6nS0S/3NES9fr+LT7g7KeWriw==
X-Received: by 2002:a17:903:1b2b:b0:234:cc7c:d2e2 with SMTP id
 d9443c01a7336-23fb3050848mr224990935ad.1.1753801060321; 
 Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f15be8545sm3688490a91.21.2025.07.29.07.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
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
Subject: [PATCH v2 2/7] drm/msm: Fix section names and sizes
Date: Tue, 29 Jul 2025 07:57:19 -0700
Message-ID: <20250729145729.10905-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xaI5QlH9Z4TSjGYrynL1Vul17Bwtt2n2
X-Proofpoint-ORIG-GUID: xaI5QlH9Z4TSjGYrynL1Vul17Bwtt2n2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX9QoY14Vy7QfT
 /v+ve4stL+GTMteq3muZ4ARWMeNwRc1XlexZ1gB/q/jpuxcgiJnG2ixSyxGV6ddvM0q+LKn3MUd
 tPH7ayfh8rY9u3PAPNYfIuHnxwl7xNDFfYLx0soOv1fG4LmtPGngQ1uDToqKieS50GrYs27VLvv
 xbcF8URCeCtI5QJTTOO7kzg7Idg5FJxO9+JLrZR6q2h5vaLyd4SLPbdomLR7btqgkhrOeicHtUc
 8+Tb2+OAHN6aZ++fwq/2blfOvPxrCNxaV/RnvJxUqb1bs0K3Unv6jsEkkMZHChnKLCFP5eIXnD/
 S70NjXueAz0ymNoQmodSP88GhtlG9n/Pc1B4/CcH4Ad01R3rbxdgjnLV5M91b8IJusde8p+saxc
 yyZeQGBim71X94pYLDQ+uf414SUSo/rt0TemnEdr+fMRFSSq9/G5w4qXhcc/e2pcnexPFQw2
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6888e166 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=BuD92i612R-MOt5tPB4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

The section names randomly appended _DATA or _ADDR in many cases, and/or
didn't match the reg names.  Fix them so crashdec can properly resolve
the section names back to reg names.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 24 ++++++------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 95d93ac6812a..1c18499b60bb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -419,47 +419,47 @@ static const struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
 static const struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
-		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
+		REG_A6XX_CP_SQE_STAT_DATA, 0x40, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
-		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x33, NULL },
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x40, NULL },
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
-		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x33, NULL },
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x40, NULL },
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x40, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
 };
 
 static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
-	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+	"CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
 static const struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
-	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
-		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
-	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
-		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2100, NULL },
+	{ "CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2200, NULL },
+	{ "CP_BV_MEM_POOL_DBG", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
+		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2200, NULL },
 };
 
 #define DEBUGBUS(_id, _count) { .id = _id, .name = #_id, .count = _count }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index e02cabb39f19..fc62820c0a9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1299,29 +1299,29 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x00200},
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
-	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
+	{ "CP_BV_ROQ_DBG", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
 		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
 		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x00040},
-	{ "CP_RESOURCE_TBL", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
+	{ "CP_RESOURCE_TABLE_DBG", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
 		REG_A7XX_CP_RESOURCE_TABLE_DBG_DATA, 0x04100},
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x00200},
-	{ "CP_LPAC_ROQ", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
+	{ "CP_LPAC_ROQ_DBG", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
 		REG_A7XX_CP_LPAC_ROQ_DBG_DATA, 0x00200},
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x08000},
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
 		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x00040},
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x00040},
 	{ "CP_AQE_ROQ_0", REG_A7XX_CP_AQE_ROQ_DBG_ADDR_0,
 		REG_A7XX_CP_AQE_ROQ_DBG_DATA_0, 0x00100},
-- 
2.50.1

