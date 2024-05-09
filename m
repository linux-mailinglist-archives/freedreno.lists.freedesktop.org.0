Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E878C121E
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 17:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750410E654;
	Thu,  9 May 2024 15:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cgKIAnpV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550DD10E30F
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 15:41:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso13307091fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2024 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715269299; x=1715874099; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
 b=cgKIAnpV4hJGisMCR9tYn5T/xdMKX+UZ3SV7s1KjlJQeD0AE/afX1v4JYcKnuzcK8t
 fYBmw2uZDOqT4EzHYsVOu6i+fY8QuRENRu72D4AN4zo4ySVXn7q6bgPnMeOVqW3bM9EV
 0OBRhfZHSzJu23twLnxvJ+vj/K4x8+b5AcqUVh+XJeHQPf9EXEaDq1jowe0Z7W4htu/y
 lglapMtttj9JPzZ8w0+kavSCfj3vUGCiyr2TibBQCiq9N8baAOY9tulGCsE7sVfgyjYP
 1fZTJ4lbpq3+mcnvycet1sas4fB+JzE7AfNbhNovCogFYviAIuEb/v6f/Yz8OI/XkEBY
 bQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715269299; x=1715874099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
 b=NQWEV6RH63ARdeHjnEksNrmgby9c8t82kF0MuEZcqcjngIOgs+DIQB0HB1CyOjEbU4
 X/7/T9DxzKw3CeFnyHYgGwCSV4qc1LNTD+WUvhngRdgV4n6o5XqzxWnOeFR6apcicBIR
 M7tiLLNHr+ypjPQPwzlkU6TmJwx4Wb+dzHuRuSuLzAwNggrawOkcwNsqaUOmYdEObGEa
 q3l52pzU4ZKJ23hfPXiRtxuluxkz5SohEp8Z6MgwAXMehBP8CJrX49FuCaew6eVKypB2
 r3gp9EGUHarOFn6dMbH7nj4tZvPewgHKuQQkjdD3PVD0YvE3eSvMh2cjeVG+VG7rJSHp
 uzWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVtPIjbioJwMR2Xw6SKFnjHhveBYDXIULaY67uPaD/3sVSBqtH8136C2VOTRrEyY8cqDvmA/cbLAm9VwCqbViSfwqqDR9WJZnYLpTGL1nG
X-Gm-Message-State: AOJu0YyQi2A+mSL+QQhG+EOjarPKWz4izmmwPBxdpcNhhtgi8q39TqTv
 vSCdsDacG+K5CUNzzu1wDXm8zoL3/e7Wr7q3C9jMNuzqCFn2Ue3X
X-Google-Smtp-Source: AGHT+IGW47YrANCiM7MAOv1YCC4wAKiyKqY/iX4tT8I3a2vjfykMHd5JV7q+HsYEiB/NPT6K68bqDQ==
X-Received: by 2002:a05:651c:11d3:b0:2e2:f2d:b8ad with SMTP id
 38308e7fff4ca-2e447084a8amr35217221fa.26.1715269299347; 
 Thu, 09 May 2024 08:41:39 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1b17sm29577555e9.12.2024.05.09.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 08:41:38 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 09 May 2024 16:41:34 +0100
Subject: [PATCH 2/2] drm/msm: Dump correct dbgahb clusters on a750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-a750-devcoredump-fixes-v1-2-60cc99e2147d@gmail.com>
References: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
In-Reply-To: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715269296; l=1299;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
 b=BKxi8bwquihpob2UmeuDEeaUfWIOAKCHgPIrTzz/DiJ4w779kGeQf/VyOcZzZ0xd9qyIt1H7j
 Y3w+RuiAezpBAIKcybt38M7n75/2t5DOEoVNJ1g+mM0TfEV2EuG1MUZ
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

This was missed thanks to the family mixup fixed in the previous commit.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c641ee7dec78..69f3b942ce9d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -665,10 +665,13 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
 	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		dbgahb_clusters = gen7_0_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
-	} else {
-		BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		dbgahb_clusters = gen7_2_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
+	} else {
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
+		dbgahb_clusters = gen7_9_0_sptp_clusters;
+		dbgahb_clusters_size = ARRAY_SIZE(gen7_9_0_sptp_clusters);
 	}
 
 	a6xx_state->dbgahb_clusters = state_kcalloc(a6xx_state,

-- 
2.31.1

