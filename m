Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C68C121C
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 17:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCA910E276;
	Thu,  9 May 2024 15:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlvOFBRJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5277110E276
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 15:41:40 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so11830571fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2024 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715269298; x=1715874098; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=60C0NrLWh3mQZJWX6R2x91+C9pDjFcxDbObVrF8FXCk=;
 b=hlvOFBRJs2BiwjUbb5Mxhy/ACLkDYt2inWjZ+ZGVcr5AViPbDObeOx8lHlhB//G22l
 FXtOIcmnAxUe4Vlcvai/FKOz7ACqm9O/x01DA09xmlVRhrmQspnh9v6GQwha7SfHTCTU
 LsOm6ZHA0aX7AXAig5hgmqXDAD7VIB4VVVFcSPNJwrB/CRiiVVldfXAgdDlv169bEezk
 BJKQ+tce/kwbV2tT3vcSOgNi1INMcixIvfvDVMItbNqmJvhn5jfTJeE2/6rjXBBEfdK3
 NE/C2SWgN4Srk/ndFeNKtdgZGMkjCT6tTiVPIU1PlpCRGZlftCnFHN57zfSscihZ8Tx6
 uglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715269298; x=1715874098;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60C0NrLWh3mQZJWX6R2x91+C9pDjFcxDbObVrF8FXCk=;
 b=FNkvwyIcgqYaf9b7Hq/AquGv9XBh++BDpYjBqUF6//LLCgpLIJuIuhrghv8zrABQyH
 IEvjib5pGlUZpouBvlrss14wWaZFglNc4kwj0pgaBLhziqZWhIAa6X2VmlLu8dCDdMIJ
 KIBGdLhsgviJaPnIGBa1YJHFurdpBvW072Q2Jd0DulwZA0wl+hQyqenpqFriU6fd7++s
 Py+Xev490z1AkCfCf2DWqX24kbc2GY2c7J8sjNxMI+a/7ZmH3RTMB8W6SkycHDrNEiKa
 lmEFDV0vL8wodel4yrFwrXW+ueEMniGy10G6L7KhsmGbVP9vkxtJmiL6Ilqwbl5sox4x
 UCTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRtA1qqUC/1hrDLVBDIMw+jaEI77xqYbp7jOmKJlbKMccNXIU6w0LQLhYxB28iXRSr6qI4HZuL+nP3abyd/KS8bN9xpMHnr7DGOdxNLk4X
X-Gm-Message-State: AOJu0Ywngc0PTYjqvF85UJRt31NKS0aYog87ZLyqgzl+LJeWRHPRb6fc
 MmyGgMmkpRCpCjqsHTXqltGlf9ah4+kg3ptMSpqQOiH/McOPcNIL
X-Google-Smtp-Source: AGHT+IEJWRpyAa5AFHE96im8sOUhoqIb+ceKmf5JbUPShXGbd4D9iFgw3yrji/pxcIwRkAy8GQrAOQ==
X-Received: by 2002:a2e:8317:0:b0:2e1:18d:5b4f with SMTP id
 38308e7fff4ca-2e4476ad07fmr35697581fa.42.1715269298361; 
 Thu, 09 May 2024 08:41:38 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1b17sm29577555e9.12.2024.05.09.08.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 08:41:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 09 May 2024 16:41:33 +0100
Subject: [PATCH 1/2] drm/msm: Use a7xx family directly in gpu_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-a750-devcoredump-fixes-v1-1-60cc99e2147d@gmail.com>
References: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
In-Reply-To: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715269296; l=6824;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tA+6pkx+Ynhfs2J+gOdH/Qp/VvHds6NwR6jSCdCdBX8=;
 b=rSJYkjhFPTn9uTxy1sR6khmRbTfhjnMWYKFSowgBI5Qoj9Xvh00chIAOV6tgsXeeVEWdlrdYq
 wE7LP3cWftAAyzw7FRikECk04KF4zI6dUHBpRc7kSxN01Ltbp0l0fTT
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

With a7xx, we need to import a new header for each new generation and
switch to a different list of registers, instead of making
backwards-compatible changes. Using the helpers inadvertently made a750
use the a740 list of registers, instead use the family directly to fix
this.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 77146d30bcaa..c641ee7dec78 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -390,18 +390,18 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 	const u32 *debugbus_blocks, *gbif_debugbus_blocks;
 	int i;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		debugbus_blocks = gen7_0_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_0_0_debugbus_blocks);
 		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
 		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
-	} else if (adreno_is_a740_family(adreno_gpu)) {
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		debugbus_blocks = gen7_2_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_2_0_debugbus_blocks);
 		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
 		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
 	} else {
-		BUG_ON(!adreno_is_a750(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
 		debugbus_blocks = gen7_9_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_debugbus_blocks);
 		gbif_debugbus_blocks = gen7_9_0_gbif_debugbus_blocks;
@@ -511,7 +511,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 		const struct a6xx_debugbus_block *cx_debugbus_blocks;
 
 		if (adreno_is_a7xx(adreno_gpu)) {
-			BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
+			BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
 			cx_debugbus_blocks = a7xx_cx_debugbus_blocks;
 			nr_cx_debugbus_blocks = ARRAY_SIZE(a7xx_cx_debugbus_blocks);
 		} else {
@@ -662,11 +662,11 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
 	const struct gen7_sptp_cluster_registers *dbgahb_clusters;
 	unsigned dbgahb_clusters_size;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		dbgahb_clusters = gen7_0_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
 	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
 		dbgahb_clusters = gen7_2_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
 	}
@@ -820,14 +820,14 @@ static void a7xx_get_clusters(struct msm_gpu *gpu,
 	const struct gen7_cluster_registers *clusters;
 	unsigned clusters_size;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		clusters = gen7_0_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_0_0_clusters);
-	} else if (adreno_is_a740_family(adreno_gpu)) {
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		clusters = gen7_2_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_2_0_clusters);
 	} else {
-		BUG_ON(!adreno_is_a750(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
 		clusters = gen7_9_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_9_0_clusters);
 	}
@@ -895,7 +895,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
 	if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
 		return;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 3);
 	}
 
@@ -925,7 +925,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
 		datasize);
 
 out:
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 0);
 	}
 }
@@ -958,14 +958,14 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
 	unsigned num_shader_blocks;
 	int i;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		shader_blocks = gen7_0_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_0_0_shader_blocks);
-	} else if (adreno_is_a740_family(adreno_gpu)) {
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		shader_blocks = gen7_2_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_2_0_shader_blocks);
 	} else {
-		BUG_ON(!adreno_is_a750(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
 		shader_blocks = gen7_9_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_9_0_shader_blocks);
 	}
@@ -1350,14 +1350,14 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
 	const u32 *pre_crashdumper_regs;
 	const struct gen7_reg_list *reglist;
 
-	if (adreno_is_a730(adreno_gpu)) {
+	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		reglist = gen7_0_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
-	} else if (adreno_is_a740_family(adreno_gpu)) {
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		reglist = gen7_2_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
 	} else {
-		BUG_ON(!adreno_is_a750(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
 		reglist = gen7_9_0_reg_list;
 		pre_crashdumper_regs = gen7_9_0_pre_crashdumper_gpu_registers;
 	}
@@ -1407,8 +1407,7 @@ static void a7xx_get_post_crashdumper_registers(struct msm_gpu *gpu,
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const u32 *regs;
 
-	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu) ||
-		 adreno_is_a750(adreno_gpu)));
+	BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
 	regs = gen7_0_0_post_crashdumper_registers;
 
 	a7xx_get_ahb_gpu_registers(gpu,
@@ -1514,11 +1513,11 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 	const struct a6xx_indexed_registers *indexed_regs;
 	int i, indexed_count, mempool_count;
 
-	if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)) {
+	if (adreno_gpu->info->family <= ADRENO_7XX_GEN2) {
 		indexed_regs = a7xx_indexed_reglist;
 		indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
 	} else {
-		BUG_ON(!adreno_is_a750(adreno_gpu));
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
 		indexed_regs = gen7_9_0_cp_indexed_reg_list;
 		indexed_count = ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list);
 	}

-- 
2.31.1

