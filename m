Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADC809425
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 22:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F6010E997;
	Thu,  7 Dec 2023 21:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A86A10E990
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 21:30:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so1570313e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 13:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701984652; x=1702589452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQGHWLBzrx9BPfleT6WDMl5jTm9xe+f8bXRg9dAadVE=;
 b=R4/XsNmGYJHs0ry+td3qMgmqKdqxgFP+Ly2x+IIBcBCmuE/kZtHN4wt7SaIyM/VCBw
 kiU8xyjEKQProI0f15R2amwgDcLJhoeR97GkTnOc8QKf/iR/gkIRT5NmIWa1vXRjn3Wg
 YUWRbzsI/lMdF4e2BGNcGTZkiOZBXFt9Z1hBCyfJAoWr7lAY3MSIG0vTQnNsSU7isj8G
 IBcG6dp/TnXBozRQK/+cWQgRyuOP38sCUnphYCZNJ3uVlSQRlAS0oV/h8+eONYteNTp7
 h4/hFHNU5h9SDXg7mjHL8Ni2TLNmaEFVop4+0RC39JbmetcXFStJkXvKgCAjuwkAa9dS
 lThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701984652; x=1702589452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQGHWLBzrx9BPfleT6WDMl5jTm9xe+f8bXRg9dAadVE=;
 b=HbQRR1K+665lcDq3v9vb+Umr7+U1K8oRz6mqfihtskdRZVNw8a96ImkMufbsPs9S3H
 jMi02UJEZLCqXSu6s0gPNcIMISytPwbxVuUEeJ5isTcQrHn5tzXt0BO4/LaAZmclpsMv
 JnLBvODToWKf+A2MTUO1mtHZrcYpevhjxdEHmRvmfYZ50rxjFbKsXqx960PjXgQaK/cm
 vsQ3X7qdEE5p+lopKX/pZ7klhnT5vra0VlvLsAveMUf81uVE6u7le9egWluhzOKZiWY1
 5rE7DfjLE6tlOxIg0tfWtGqmcQfANbupEzu9mA6pA+QRxifFezDWnzZ60ckgnL2RhyiE
 ftng==
X-Gm-Message-State: AOJu0YxHW/Nne4rB/TDr175o5Rq8PQbiNZgKjfl8FFyLRXAwFbuRpCdF
 dUS9wpU/EBn+uBFa+hB5QZQxacFiB0o=
X-Google-Smtp-Source: AGHT+IGn0oaB+imPIHqXYuXRAbvf54puxJeIEv7LkzhS76xyg/rkia7NSH9gMW5q4meYk+rESAiM2A==
X-Received: by 2002:a05:6512:3a87:b0:50b:fd84:631e with SMTP id
 q7-20020a0565123a8700b0050bfd84631emr2166680lfu.57.1701984652210; 
 Thu, 07 Dec 2023 13:30:52 -0800 (PST)
Received: from lucy.. (cpc115984-dals23-2-0-cust371.20-2.cable.virginm.net.
 [82.25.1.116]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b0040b42df75fcsm788310wmo.39.2023.12.07.13.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:30:51 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Refactor UBWC config setting
Date: Thu,  7 Dec 2023 21:30:47 +0000
Message-Id: <20231207213048.1377147-2-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231207213048.1377147-1-cwabbott0@gmail.com>
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Split up calculating configuration parameters and programming them, so
that we can expose them to userspace.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  21 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 101 +++++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   9 +++
 3 files changed, 78 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index e5916c106796..c003f970189b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -684,7 +684,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
-	u32 regbit;
+	u32 hbb;
 	int ret;
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
@@ -820,18 +820,15 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
-		regbit = 2;
-	else
-		regbit = 1;
+	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
+	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
 
-	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, regbit << 7);
-	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, regbit << 1);
+	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
+	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
 
 	if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
 	    adreno_is_a540(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, regbit);
+		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, hbb);
 
 	/* Disable All flat shading optimization (ALLFLATOPTDIS) */
 	gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, (1 << 10));
@@ -1785,5 +1782,11 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
 
+	/* Set the highest bank bit */
+	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
+		adreno_gpu->ubwc_config.highest_bank_bit = 15;
+	else
+		adreno_gpu->ubwc_config.highest_bank_bit = 14;
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 723f9b97734d..c0bc924cd302 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1270,81 +1270,92 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }
 
-static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
+static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
-	u32 rgb565_predicator = 0;
+	gpu->ubwc_config.rgb565_predicator = 0;
 	/* Unknown, introduced with A650 family */
-	u32 uavflagprd_inv = 0;
+	gpu->ubwc_config.uavflagprd_inv = 0;
 	/* Whether the minimum access length is 64 bits */
-	u32 min_acc_len = 0;
+	gpu->ubwc_config.min_acc_len = 0;
 	/* Entirely magic, per-GPU-gen value */
-	u32 ubwc_mode = 0;
+	gpu->ubwc_config.ubwc_mode = 0;
 	/*
 	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
-	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
-	 * write the lowest two bits of the remaining value as hbb_lo and the
-	 * one above it as hbb_hi to the hardware. This should ideally use DRAM
-	 * type detection.
+	 * This should ideally use DRAM type detection.
 	 */
-	u32 hbb_hi = 0;
-	u32 hbb_lo = 2;
-	/* Unknown, introduced with A640/680 */
-	u32 amsbc = 0;
+	gpu->ubwc_config.highest_bank_bit = 15;
 
-	if (adreno_is_a610(adreno_gpu)) {
-		/* HBB = 14 */
-		hbb_lo = 1;
-		min_acc_len = 1;
-		ubwc_mode = 1;
+	if (adreno_is_a610(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.min_acc_len = 1;
+		gpu->ubwc_config.ubwc_mode = 1;
 	}
 
 	/* a618 is using the hw default values */
-	if (adreno_is_a618(adreno_gpu))
+	if (adreno_is_a618(gpu))
 		return;
 
-	if (adreno_is_a619_holi(adreno_gpu))
-		hbb_lo = 0;
+	if (adreno_is_a619_holi(gpu))
+		gpu->ubwc_config.highest_bank_bit = 13;
 
-	if (adreno_is_a640_family(adreno_gpu))
-		amsbc = 1;
+	if (adreno_is_a640_family(gpu))
+		gpu->ubwc_config.amsbc = 1;
 
-	if (adreno_is_a650(adreno_gpu) ||
-	    adreno_is_a660(adreno_gpu) ||
-	    adreno_is_a690(adreno_gpu) ||
-	    adreno_is_a730(adreno_gpu) ||
-	    adreno_is_a740_family(adreno_gpu)) {
+	if (adreno_is_a650(gpu) ||
+	    adreno_is_a660(gpu) ||
+	    adreno_is_a690(gpu) ||
+	    adreno_is_a730(gpu) ||
+	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		hbb_lo = 3;
-		amsbc = 1;
-		rgb565_predicator = 1;
-		uavflagprd_inv = 2;
+		gpu->ubwc_config.highest_bank_bit = 16;
+		gpu->ubwc_config.amsbc = 1;
+		gpu->ubwc_config.rgb565_predicator = 1;
+		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
 
-	if (adreno_is_7c3(adreno_gpu)) {
-		hbb_lo = 1;
-		amsbc = 1;
-		rgb565_predicator = 1;
-		uavflagprd_inv = 2;
+	if (adreno_is_7c3(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.amsbc = 1;
+		gpu->ubwc_config.rgb565_predicator = 1;
+		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
+}
+
+static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	/*
+	 * We subtract 13 from the highest bank bit (13 is the minimum value
+	 * allowed by hw) and write the lowest two bits of the remaining value
+	 * as hbb_lo and the one above it as hbb_hi to the hardware.
+	 */
+	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
+	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	u32 hbb_hi = hbb >> 2;
+	u32 hbb_lo = hbb & 3;
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
-		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
-		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
+		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
+		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
-		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
-		  uavflagprd_inv << 4 | min_acc_len << 3 |
-		  hbb_lo << 1 | ubwc_mode);
+		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
+		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
 
 	if (adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
 			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
 
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
+		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
@@ -2911,5 +2922,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	a6xx_calc_ubwc_config(adreno_gpu);
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 80b3f6312116..bc14df96feb0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -165,6 +165,15 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	struct {
+		u32 rgb565_predicator;
+		u32 uavflagprd_inv;
+		u32 min_acc_len;
+		u32 ubwc_mode;
+		u32 highest_bank_bit;
+		u32 amsbc;
+	} ubwc_config;
+
 	/*
 	 * Register offsets are different between some GPUs.
 	 * GPU specific offsets will be exported by GPU specific
-- 
2.31.1

