Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4A8BADEE
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 15:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A4B11218F;
	Fri,  3 May 2024 13:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VZxe+0gW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95D611218F
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 13:43:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so1991968f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714743800; x=1715348600; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A61biRqVJhTnScYcORs7EQzF8Fv421/of/urY8VoZKs=;
 b=VZxe+0gWx1lttJuuGbzSBagCCqs4lDht1p/8D922RuaF3H02iNwyvU1VJVvkAWSwCu
 PdMi924/ZhyDtFPtwkRalYQGpaWIwIaDe2KXRpQtBgatpjXhxD34JIYyWn5vG7SHgs3t
 unKzZ/xF7jYAJPi68OXAl6mOaiP1p/G7Jcm2z6fTnOscW6Fxb1p/x713NewqNfgIYSak
 ENSiXiwHsIxKQmIszCsDvaLNhyO4pZfyvHCSII+w1rkyW+vV37sMpZ+sa+8zojGOw6eF
 Iv/agHI+kpGO8/u7ho3ske/AJHwWD2JmQ6H3MwNLfpburvGqMAYeeMSCLM9TDvpkRTGI
 ZUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743800; x=1715348600;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A61biRqVJhTnScYcORs7EQzF8Fv421/of/urY8VoZKs=;
 b=EwRcB5AhMNULaKF4LKg3NW2xhPPlliYUBxgjBa0YayofIx++8eyIsUclSI2UjRNeps
 q7mLn+JTFnKjn4lJJevs+9xDhbA51jsOZjDV0Dbi1TZogusDV11mrET5UmKGGVa5u/nt
 vE1CVnLuqgtwNPtEBjAeh0MTUpmAaXCJ1A9Cv11+u4bTe1oNAt2lo7Bc+DqhVtEmZzBT
 LqaszrLx4Ar2kE44uypXKyBLNxILmZ1PHnI0f0AmUe3j5Q6AQ3fDwg2sJu2JanfJib2s
 5BK/VY3rCEzWI1QPiLf3jyiZa9flpIpc/zpHGO3P6WFoEGG6nxViBSjXlMMTq+4jBBIp
 pnyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW9hhdcpccZrU8flVE4W9omGkXdgukGbCpgCTOHc6ErkWY5SNGqubQ1jNxz4oZ6mdBRb5//PAENHp7FLySDwRYCs8aaiqNXaGBTt74mjsk
X-Gm-Message-State: AOJu0YxtQIWLvDOJ6Ajawypd5HUpgzISFQURSZQDik2KZiTiQgfPuKtM
 0QJREEztAFkot15uOVFjBLMuty5Dny/KOgc0I1qrKyY5YFu6SwyQPHmBgg==
X-Google-Smtp-Source: AGHT+IGeBs+/NaST6xGUoIqoV0OI2JKKgiJLp0/yciabgHI21S2gcM7i6idpB13zgcpw02hT2tYn1w==
X-Received: by 2002:a5d:55c9:0:b0:34c:77dd:b1b5 with SMTP id
 i9-20020a5d55c9000000b0034c77ddb1b5mr2154598wrw.15.1714743799832; 
 Fri, 03 May 2024 06:43:19 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:43:19 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:34 +0100
Subject: [PATCH 5/5] drm/msm: Add devcoredump support for a750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-5-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=6513;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/4c8RXHe1ZwfY3zxF3/XsbJWUAdPAwCtivQ4EVfABN8=;
 b=SUWbcnHWPBpkG17Ay17aBCjwtDqiMsXLO/etk5Ic+mDelpaLqOlmcJMJKN6gR0KkhLxV4GjwA
 T5ZHwZvTuM+AeYJG+1jhOrpolN2SPjJao+1lXSVnkGmDlxmwaxUfQLd
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

Add an a750 case to the various places where we choose a list of
registers.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 64 +++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index bb0592af41f3..77146d30bcaa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -13,9 +13,11 @@
  */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wunused-variable"
+#pragma GCC diagnostic ignored "-Wunused-const-variable"
 
 #include "adreno_gen7_0_0_snapshot.h"
 #include "adreno_gen7_2_0_snapshot.h"
+#include "adreno_gen7_9_0_snapshot.h"
 
 #pragma GCC diagnostic pop
 
@@ -384,21 +386,29 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	int debugbus_blocks_count, total_debugbus_blocks;
-	const u32 *debugbus_blocks;
+	int debugbus_blocks_count, gbif_debugbus_blocks_count, total_debugbus_blocks;
+	const u32 *debugbus_blocks, *gbif_debugbus_blocks;
 	int i;
 
 	if (adreno_is_a730(adreno_gpu)) {
 		debugbus_blocks = gen7_0_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_0_0_debugbus_blocks);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		debugbus_blocks = gen7_2_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_2_0_debugbus_blocks);
+		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		debugbus_blocks = gen7_9_0_debugbus_blocks;
+		debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_debugbus_blocks);
+		gbif_debugbus_blocks = gen7_9_0_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_gbif_debugbus_blocks);
 	}
 
-	total_debugbus_blocks = debugbus_blocks_count +
-		ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	total_debugbus_blocks = debugbus_blocks_count + gbif_debugbus_blocks_count;
 
 	a6xx_state->debugbus = state_kcalloc(a6xx_state, total_debugbus_blocks,
 			sizeof(*a6xx_state->debugbus));
@@ -410,9 +420,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				&a6xx_state->debugbus[i]);
 		}
 
-		for (i = 0; i < ARRAY_SIZE(a7xx_gbif_debugbus_blocks); i++) {
+		for (i = 0; i < gbif_debugbus_blocks_count; i++) {
 			a6xx_get_debugbus_block(gpu,
-				a6xx_state, &a7xx_debugbus_blocks[a7xx_gbif_debugbus_blocks[i]],
+				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
 	}
@@ -813,10 +823,13 @@ static void a7xx_get_clusters(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		clusters = gen7_0_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_0_0_clusters);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		clusters = gen7_2_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_2_0_clusters);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		clusters = gen7_9_0_clusters;
+		clusters_size = ARRAY_SIZE(gen7_9_0_clusters);
 	}
 
 	a6xx_state->clusters = state_kcalloc(a6xx_state,
@@ -948,10 +961,13 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		shader_blocks = gen7_0_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_0_0_shader_blocks);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		shader_blocks = gen7_2_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_2_0_shader_blocks);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		shader_blocks = gen7_9_0_shader_blocks;
+		num_shader_blocks = ARRAY_SIZE(gen7_9_0_shader_blocks);
 	}
 
 	a6xx_state->shaders = state_kcalloc(a6xx_state,
@@ -1337,10 +1353,13 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		reglist = gen7_0_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		reglist = gen7_2_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		reglist = gen7_9_0_reg_list;
+		pre_crashdumper_regs = gen7_9_0_pre_crashdumper_gpu_registers;
 	}
 
 	count = A7XX_PRE_CRASHDUMPER_SIZE + A7XX_POST_CRASHDUMPER_SIZE;
@@ -1388,7 +1407,8 @@ static void a7xx_get_post_crashdumper_registers(struct msm_gpu *gpu,
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const u32 *regs;
 
-	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
+	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu) ||
+		 adreno_is_a750(adreno_gpu)));
 	regs = gen7_0_0_post_crashdumper_registers;
 
 	a7xx_get_ahb_gpu_registers(gpu,
@@ -1491,10 +1511,18 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_indexed_registers *indexed_regs;
 	int i, indexed_count, mempool_count;
 
-	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
-	indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
+	if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)) {
+		indexed_regs = a7xx_indexed_reglist;
+		indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		indexed_regs = gen7_9_0_cp_indexed_reg_list;
+		indexed_count = ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list);
+	}
+
 	mempool_count = ARRAY_SIZE(a7xx_cp_bv_mempool_indexed);
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state,
@@ -1507,7 +1535,7 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* First read the common regs */
 	for (i = 0; i < indexed_count; i++)
-		a6xx_get_indexed_regs(gpu, a6xx_state, &a7xx_indexed_reglist[i],
+		a6xx_get_indexed_regs(gpu, a6xx_state, &indexed_regs[i],
 			&a6xx_state->indexed_regs[i]);
 
 	gpu_rmw(gpu, REG_A6XX_CP_CHICKEN_DBG, 0, BIT(2));

-- 
2.31.1

