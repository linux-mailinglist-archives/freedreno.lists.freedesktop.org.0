Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7893765B
	for <lists+freedreno@lfdr.de>; Fri, 19 Jul 2024 12:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96510EB9F;
	Fri, 19 Jul 2024 10:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c1RmrVJu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7E010EB9D
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 10:03:52 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2eeef45d865so24111561fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383430; x=1721988230; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nauN0LUF6s5oCDx7BxqJdst/ffLcWF+2dEZ0vDL/Inw=;
 b=c1RmrVJuG4aj76nnBXa8Fm+64JPYClG4D9yZFaNsLfLR34FRGfaxFC/g9+14O11Jz4
 Ag276hHDDpzsODyYALM2E1gdvc9hfl3Wy0RjklsQMfF3S3MgbINlvQJuR6ATOCl+vn5q
 emEx7VfqnRvfpCPUWtMcsxqC2U/DRUSjuU1/qSFwv33FB5tk8H/bqAiWGjl01NeGgOsC
 xI3y6MTc1uKitmXd+0mf3JXaMLNucy1VoTDAT3RHfXIVHbxmJyhGhy0SOIyJiHP47kvE
 Y3Rol0RHfDq7DylbkE6YV7ihgHeSIKydjg7I/6tX8/+b8uMRrTeZGJSeMwKwM0BizI6J
 ZheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383430; x=1721988230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nauN0LUF6s5oCDx7BxqJdst/ffLcWF+2dEZ0vDL/Inw=;
 b=FEZm44kOeQP+rid6PnM0By8kEbokPHGU1VAqgboa9QGkl5CF+emT1zsVu5ilk63xRa
 c6cR6W/ibfSqcDlBFLdsnQ6DwNpXF0j9kvWYouj+Mu+5BW1fYZq4u3/hcUe0yGab04ts
 Jy17mtzkGX8GZ025vJTHlZqJDAMemogJRnJjqS91RR4o1TCA9ty00KsmT1GSbwyQcfjp
 uQeTt7s0rW1yAbRv6n/N40AzxTuhbqQBoupZhax5LLjRi3GMaurpyw5klyyrON9mW0T3
 +vlQyzoyQEZbxWW5SAHG+mrRdOcxGMn2GQwVTM/j8bEe+QSKAVY23KRLD+BbYnZ0Ga4c
 Lo2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpDfg9yNAJT3/BVx88bSc5OGeB0e6Ib7Q0JjIQrLNcFO8uHXKmzjLLHyLnohzDoNZKwW8JgUYKHxx9frYNGYtmiPymQ87N86+RPG+ncYyE
X-Gm-Message-State: AOJu0Yxcs71l0vssNjRkYpm2uTQi5PA/cZtD8cM2vJG/qpLkD0l33t98
 xW8hCN+jPlMus7EU8GclEGiK8bPNPoXYB+DTm8NeTTFgjqnb40JD1QAJ9ugrdYE=
X-Google-Smtp-Source: AGHT+IEe9HbLr10nAhJHotiJHTC1frkIzKcXeB0pExbTPdwM8B9FTG1lqNq7cQ8A4NbjjPwjfcbtfQ==
X-Received: by 2002:a2e:9b95:0:b0:2ee:d5c3:3217 with SMTP id
 38308e7fff4ca-2ef05d43aeemr35918621fa.47.1721383429921; 
 Fri, 19 Jul 2024 03:03:49 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:03:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:28 +0200
Subject: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=7380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IY5qNV2nX79fB2nRPkwck6ZxJ6ElFtG6EG/Rm+ZMVHc=;
 b=6y9Innit2xFlEH62+2TpCxA+gp2Eng3+iZZePtu05iML77armQgelT1KldFIXtFoeHJT+W37N
 zOn+eDjBzDCB017FBCU20RKRKSQIVObUUefXf7JVByfFeSbjNsm9PXB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

This was apparently almost never set on a6xx.. move the existing values
and fill out the remaining ones within the catalog.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 1ea535960f32..deee0b686962 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
@@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
@@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
@@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
@@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
@@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
@@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
+			.gmu_cgc_mode = 0x00020000,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7020100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7050001,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_256G,
 	}, {
@@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7090100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aaeb1161f90d..871452daa189 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
-	u32 val, clock_cntl_on, cgc_mode;
+	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
@@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa82;
 
 	if (adreno_is_a7xx(adreno_gpu)) {
-		cgc_mode = adreno_is_a740_family(adreno_gpu) ? 0x20222 : 0x20000;
-
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? cgc_mode : 0);
+			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
 			  state ? 0x10111 : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index bc37bd8c7f65..0fb7febf70e7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 };
 

-- 
2.45.2

