Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9FB4870D
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A687110E490;
	Mon,  8 Sep 2025 08:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEv3KPAF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6ED10E493
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LkdN3030177
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jik5lm7jrfO2g9HIoEsOASnx3tGiszLaeVJZjR2mw8E=; b=DEv3KPAF4jYzl9TU
 F7gZeHcPn+pzH5tOVcTUADcBQKQQucHHPel/0jtExplP4DkbN6vCX6vZFOR2sCrC
 CTmOGkQc5D4DI+5kkRVPVU7pIoh+ka86YTiW/QIMUgOjgisWnzvKctwNwF71JrWu
 zqi0Dod0fTM1hbIMR4P9JAt+U/0NYlFGxKM2oCrAfUCqmG2XReapedBXipMpGQQK
 ACzFkgSkdjzdrWYhRDUMUcRTNIqW4wL5S/v2nXVvq34jWi3aV2xlIH81vtlTSWR2
 jjEZy1RwG8VnsAZUacuGY59/CWgz8kLpSvUSDGV4vyvntY2MhSFLkOHDNTMwQ+Il
 N/d+Cw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfuqxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77429fb6ce4so2010554b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320108; x=1757924908;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jik5lm7jrfO2g9HIoEsOASnx3tGiszLaeVJZjR2mw8E=;
 b=DOjs+9U+UcU+xiu51M60+vvY4WxutRsC68fWHCc49RarI0xhVWQzG85OkJX+XaDHpg
 3htJx/KaVZRe1YT+JavH02TBfiWYoY/dNG8QUrVc2bwfojH4ALBCC29p5oWhtDoAa+SO
 4HP7mcmKm8aLHOC7+XC8T6pojVPNhjhcTfzqONh9nrkepm1aw8m/NMe4omzxoQdBie6N
 uUgAVs0HCJEdHRUyso2A/DWL+IDHo8paGUQl57VOwC3hGhC8QKtZolJ+qtbCv00GzPLU
 dVnd4t1rZddzNmBQKsCXvQZdrLWQ2TXj4a4jeZTIOV5+wI54SHqYoFHy6MNceE4n1uGO
 D0Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmosXRrVt1NA4/I0RBP7mM5fOQ6MAzp82kAhwzD6cuWZuhsi5yeKXQT9UK9gJHRw+a9fT0e0MEBdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoLF2uoNmd9gs3AWXCpl3GtTnkDa+GiDMcAgmn5F4rX9M0iSei
 NxsDu8/NQQQS19DphDDZxfAYQdtkNRnw5YzCpuLPAaqqWBhh5izZ6MmFyBSjQ/BYvJlZQa/jl1h
 YSZbKnnmHoyfe2yuH2IZq70dv8BFbOxCg509/KSX3mGCWZBznjgFYHOXfqu3pBcA7LToiXYw=
X-Gm-Gg: ASbGncuIFliwahKvaB4l9q6qWDX0Y9o2FDwVX7cmfuj1l80R+zRx+jP3xaPcSnKCQ1i
 H+rDF7N8E8DcATEJWarY24pMh8oVw74h3JE0lUOZU39eAYvyJdq4KZX6IhHVUs8hR+ShfXqJdmT
 cQXYDL9Ia8yasLh3T3Jc1GsnKG4wQZq9FWXYpGllHcrAembCK7EnQXtqVO+5eDT38fVOgoXepJm
 lKE6xzoQYcTt98eljCWc0D5Ig0b6vNAXYDAqWalsh4eF0qgUCewBFmThpCO3f6RC8WJRyeUpooU
 UdoeCsBX44fRy7T+YwLNH3mbQRNnXzgrw89ZJfwQaeP52WA2kS4lA1QtKI8slpa2
X-Received: by 2002:a05:6a20:734a:b0:248:7a71:c27 with SMTP id
 adf61e73a8af0-2534557977cmr9747297637.56.1757320107540; 
 Mon, 08 Sep 2025 01:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK0s3h6UQc9GbOttiGA/Ef59MbpUbZfhJMHqzyURWFXx3DH+69jMQWAsCyT/2LIEcFhnYiEg==
X-Received: by 2002:a05:6a20:734a:b0:248:7a71:c27 with SMTP id
 adf61e73a8af0-2534557977cmr9747267637.56.1757320107067; 
 Mon, 08 Sep 2025 01:28:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:08 +0530
Subject: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=5434;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=o8U4myRzv/oBOMXsCQ8UnooabLPG2l0zGBz0QEYwwUU=;
 b=5WvX3qPB1JBfrK4m/n5Oi07gGBgzXFQq4WiUCb2i+06Ili4j3p6IOaOvmQRFlNNzHk1ysrj+6
 Q2hOqkE72stD6v9PwYT9Ny/idRE8aoaugRuRT/6XNW9hlPs3ZQlaEUY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: g3_l1aIiECQ70iToMv2Om9IVs_IaOL-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX97iVnT5j/IUD
 CfdkH2aMZoOQSN0QaluBQnx1qMxIkvQL1BsgJWyzpwSiAYcaz3oxLQ9fg5RCXr11APE4IpCu/tj
 RgHWXonoKC+GsgEgaLwXSqBbs/vHqwb774rO1HMsq3WDGJB7X8tF3+Gzmkz68nsCqOr04+LnF0f
 1SJbF3UUM4iFViXqABStqDMOW+h06HBgrS8ObcoI1Kby5Tb4o4Bs9opFfJgMV4zQflgoIGNpPjU
 i3RT1r79H/Wa0I8K/M504yMJy+aBhjivw9z0jgXPLx5fpCMdn+AiO+TyhRv8hOH4L++SqyUPq/X
 zxPBCKaiBDxXyZX8YaMGIervR/rydMFx64YX9eRTIrpBSzc0t7KHM6JZvAV6u1xh1W9x5wDc+ea
 27cp727b
X-Proofpoint-GUID: g3_l1aIiECQ70iToMv2Om9IVs_IaOL-z
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be93ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4fggu-2iGV-6hGlykgMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Add the IFPC restore register list and enable IFPC support on Adreno
X1-85 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b27f08a5b1eeb08dced 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
 
+/* Applicable for X185, A750 */
+static const u32 a750_ifpc_reglist_regs[] = {
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_SP_NC_MODE_CNTL,
+	REG_A6XX_CP_DBG_ECO_CNTL,
+	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_PROTECT(0),
+	REG_A6XX_CP_PROTECT(1),
+	REG_A6XX_CP_PROTECT(2),
+	REG_A6XX_CP_PROTECT(3),
+	REG_A6XX_CP_PROTECT(4),
+	REG_A6XX_CP_PROTECT(5),
+	REG_A6XX_CP_PROTECT(6),
+	REG_A6XX_CP_PROTECT(7),
+	REG_A6XX_CP_PROTECT(8),
+	REG_A6XX_CP_PROTECT(9),
+	REG_A6XX_CP_PROTECT(10),
+	REG_A6XX_CP_PROTECT(11),
+	REG_A6XX_CP_PROTECT(12),
+	REG_A6XX_CP_PROTECT(13),
+	REG_A6XX_CP_PROTECT(14),
+	REG_A6XX_CP_PROTECT(15),
+	REG_A6XX_CP_PROTECT(16),
+	REG_A6XX_CP_PROTECT(17),
+	REG_A6XX_CP_PROTECT(18),
+	REG_A6XX_CP_PROTECT(19),
+	REG_A6XX_CP_PROTECT(20),
+	REG_A6XX_CP_PROTECT(21),
+	REG_A6XX_CP_PROTECT(22),
+	REG_A6XX_CP_PROTECT(23),
+	REG_A6XX_CP_PROTECT(24),
+	REG_A6XX_CP_PROTECT(25),
+	REG_A6XX_CP_PROTECT(26),
+	REG_A6XX_CP_PROTECT(27),
+	REG_A6XX_CP_PROTECT(28),
+	REG_A6XX_CP_PROTECT(29),
+	REG_A6XX_CP_PROTECT(30),
+	REG_A6XX_CP_PROTECT(31),
+	REG_A6XX_CP_PROTECT(32),
+	REG_A6XX_CP_PROTECT(33),
+	REG_A6XX_CP_PROTECT(34),
+	REG_A6XX_CP_PROTECT(35),
+	REG_A6XX_CP_PROTECT(36),
+	REG_A6XX_CP_PROTECT(37),
+	REG_A6XX_CP_PROTECT(38),
+	REG_A6XX_CP_PROTECT(39),
+	REG_A6XX_CP_PROTECT(40),
+	REG_A6XX_CP_PROTECT(41),
+	REG_A6XX_CP_PROTECT(42),
+	REG_A6XX_CP_PROTECT(43),
+	REG_A6XX_CP_PROTECT(44),
+	REG_A6XX_CP_PROTECT(45),
+	REG_A6XX_CP_PROTECT(46),
+	REG_A6XX_CP_PROTECT(47),
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 		},
@@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
 			.bcms = (const struct a6xx_bcm[]) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172efdd7255165f3c04a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	u32 *dest = (u32 *)&lock->regs[0];
 	int i;
 
-	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
-
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
-	lock->ifpc_list_len = 0;
-	lock->preemption_list_len = reglist->count;
+
+	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
+	lock->ifpc_list_len = reglist->count;
 
 	/*
 	 * For each entry in each of the lists, write the offset and the current
@@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 		*dest++ = gpu_read(gpu, reglist->regs[i]);
 	}
 
+	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
+	lock->preemption_list_len = reglist->count;
+
+	for (i = 0; i < reglist->count; i++) {
+		*dest++ = reglist->regs[i];
+		*dest++ = gpu_read(gpu, reglist->regs[i]);
+	}
+
 	/*
 	 * The overall register list is composed of
 	 * 1. Static IFPC-only registers
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4269ae7783ed3578e40e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -45,6 +45,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
+	const struct adreno_reglist_list *ifpc_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;

-- 
2.50.1

