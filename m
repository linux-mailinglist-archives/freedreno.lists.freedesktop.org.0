Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7393765A
	for <lists+freedreno@lfdr.de>; Fri, 19 Jul 2024 12:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E69B10EB9B;
	Fri, 19 Jul 2024 10:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J+HLGSs8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790C10EB9B
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 10:03:50 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so23067651fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383429; x=1721988229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IJh3VNGyy8RGWW2vvPXR6WGBCCjUp2QIoReWGyMyfcM=;
 b=J+HLGSs8E5y1Py70+B5GfLItk7ILScDUpjq7BqMun1841Hfx1qb0eRkoWPxj/ZvHG8
 pGBfWTIgFRF8NFXVj6XEqSDVx8t++VFnlFHoXlGLaZSOJmn9Y17CMJ8fwj2gTvrfhQ2V
 URGEAZyfj+HMmtrLfUqZ+jsKvHFkhRozyUbGYUe++Avk385FLIApE+xN79a1+Ii0uP12
 5M4uf8qdCB4EoNJoEg1U/XeXcFvZvfDyhs/ZX1As+TDgNpri8rB7TpxUqfinSu2KbiAF
 MOS3k5NMGqPBkrHPA0tQkeBlW+usn9QPihNqdzxq0YEEvNsALh2cjlCdqWy6zcrtxZM4
 DYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383429; x=1721988229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJh3VNGyy8RGWW2vvPXR6WGBCCjUp2QIoReWGyMyfcM=;
 b=WQQnU2tX65CqEjZZVY7N/xdx7YFVGa9AboICLbn5cmw2oNZNDi7mCGw8JJB7YUdjpi
 4yvjsipdr8ZbH+n+ZD47hpiXwhkbQEz6YlLyEfV3o8uogyrgRZocpOJwC/uc4Wvsnq0F
 abmAtKGUvq0YC4C6ayaNeTRoxTq+RGfxY2tEDNSHUXDyyt8h0equ0VfWNIrE8+II94tF
 H82BO4DeK0f1LL59dmanY0lt8ej9bNAApttRtrw0x3zkvshuBQ7Xb2KZom/D9Q8At8Km
 ArQvm95KZ20rf+yxDuyoYiham24bqhxA3kYsSod7B4VycwsGPNgjPl+ZdONqW5nrzey9
 6i5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHAa9+Lzjdna3LU7Hy2tupQjTcBI3kPbHg8xRb5pfzN8yq5l6GKqcG/uSk1hkq7XdzIAn5Jq12YKp+4yUOeZsqnGODjpzyPKn01WOfBKjp
X-Gm-Message-State: AOJu0YwF5bIR5REjem7SYJf3cXHjnarku/4xuVZ9c84+bs/kQZWoMK2X
 tDHPxV+Squ2x5SjZ9Dwn1FkIU5BCofURlAWqupfQi2EUgGuw6yKHTmuptue71IY=
X-Google-Smtp-Source: AGHT+IEI4mSIktHc/EA72Qw0dnZWWNwMSf6JB1FUS42liMCMZPGuych/bPIq2q2xXi7Lt7f07RnFmA==
X-Received: by 2002:a2e:3014:0:b0:2ec:58e8:d795 with SMTP id
 38308e7fff4ca-2ef05c79ccamr31309941fa.13.1721383428440; 
 Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:27 +0200
Subject: [PATCH 2/5] drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-2-850ae5307cf4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=6473;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zkDn4XWgFIKZvenj/MtKpRKALI7nhyDW1jck50cKmuI=;
 b=37UU/h22A6Dt+jb/oX69TLlKGWj7cEdTh6E9zAtxmBueIpOCcAnce1pctoO8yBgO6D9yP5RE/
 0p2z+Fg4inDCdq+6j5OnVqikYdfGGvhztD9y8xmSH0pywBNX7c0aLwk
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

The if-else monster is so unmaintainable that one case is repeated
twice. Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 24 +++++-------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..1ea535960f32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -636,6 +636,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -667,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -689,6 +691,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -711,6 +714,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -733,6 +737,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -755,6 +760,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -782,6 +788,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -799,6 +806,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -821,6 +829,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -846,6 +855,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -864,6 +874,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -888,6 +899,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -905,6 +917,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
 	}
@@ -1165,6 +1178,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..aaeb1161f90d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -976,25 +976,11 @@ static int hw_init(struct msm_gpu *gpu)
 	} else if (!adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values,
-	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
-	*/
-	if (adreno_is_a702(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
-	else if (adreno_is_a690(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a619(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
-	else if (adreno_is_a610(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
-	else if (!adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
+
+	/* Set the default primFifo threshold values */
+	if (adreno_gpu->info->a6xx->prim_fifo_threshold)
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL,
+			  adreno_gpu->info->a6xx->prim_fifo_threshold);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e3e5c53ae8af..bc37bd8c7f65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 prim_fifo_threshold;
 };
 
 struct a6xx_gpu {

-- 
2.45.2

