Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F193B35CBA5
	for <lists+freedreno@lfdr.de>; Mon, 12 Apr 2021 18:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7272989DC1;
	Mon, 12 Apr 2021 16:26:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464689DC1;
 Mon, 12 Apr 2021 16:26:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85C80613B6;
 Mon, 12 Apr 2021 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244766;
 bh=6o24duZ6hXoAbegvgGj0veBvO8I3e5q3d3Bt1Mer7BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gF98hRjVZKdYeeDt32hqZ/6ZbsOPcDf4KSeGuB3LzHjYu0l+Sy2eoz349aVG+HukN
 0Nm2xyptgRQ/oCh0i9ZTcOOjPBLYDsNN6T3Ad5UG4jghfOv8hnN9VnEws0wQqXODUG
 r8x8dkGb+HlVt8nPCdwPyBtNr09EluLLSkdjCUriyqMMnU3C1fvz/NU4ZdYXNzYxMB
 zNM6PhKYHXVYoOemYjSPrUqoNZdYpQVF0MBkZg4CrX2G+rqyTvc4KXrFz2xTyR1FS6
 8vpSE+LV1egt9jS1UtEshn6HrxBYlHdVucqUqaogjGqNBTQxtvYB7c3umymGHsITot
 kZubAzbP3v8gA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 12 Apr 2021 12:25:35 -0400
Message-Id: <20210412162553.315227-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162553.315227-1-sashal@kernel.org>
References: <20210412162553.315227-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Freedreno] [PATCH AUTOSEL 4.19 10/28] drm/msm: Fix a5xx/a6xx
 timestamps
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 9fbd3088351b92e8c2cef6e37a39decb12a8d5bb ]

They were reading a counter that was configured to ALWAYS_COUNT (ie.
cycles that the GPU is doing something) rather than ALWAYS_ON.  This
isn't the thing that userspace is looking for.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>
Message-Id: <20210325012358.1759770-2-robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 776bbe9775e9..ba513018534e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1194,8 +1194,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A5XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
+		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c629f742a1d1..c280fdc44939 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -713,8 +713,8 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	*value = gpu_read64(gpu, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
+		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	return 0;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
