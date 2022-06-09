Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9C545245
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 18:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59F411B6D5;
	Thu,  9 Jun 2022 16:48:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D2D11AE33
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 16:48:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id q18so20662881pln.12
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NSFLxHjX9pMycxKTM0KPFzZkP3WCJJ9nmb7apyQmhsQ=;
 b=L9eqPxjo/s/7fHwfFGMbsBWQ0r4+2bLKP+yeCfbkKQFpCNIK73nLIVBds6YluS/aRV
 WDH/GL7GsI1GIZ3Zw1/u1q/Rt4z2wduSmgAxDjdsWz+sezBtnyB5cQJCNM3Zp+yyaBiY
 ioSqRYXiW8YT/sOBewXvgN1qeEqOKwpyBo3AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NSFLxHjX9pMycxKTM0KPFzZkP3WCJJ9nmb7apyQmhsQ=;
 b=zyBy5pM1Zuuu/YE5mqEmhZYNTITIVO2YFjN7thpCPj7EQbtRGpiQUXKkaw78oaAbTb
 SNuDI/rLIBYN4uaj94YuZXfnDIIDVWUVY/85y5bgBHEdTXZyhyXMjmHrDS0vi7/xNEvm
 MD3HrZSNxgZPY7nICcm7OdST1kjHmi3BxMwG+69uikmFuRNQxmIRz3ptgEO8M7XXrjgf
 lvgmYkfS9KIo7qdMiLz1R9atPgmSKlona5YffzPkzPRD3asR8ECDVcvUB/a+KLJP8AJe
 4p7v7DkXLEBViUY9IQdhTqvQ7xH+P9ikRChC6Ye5ogOACoMQH8NmJRF6DAPyuMhTJt9U
 ToGw==
X-Gm-Message-State: AOAM532JtO4eoE3vCsDHTdQRLjsQIkXyqU4IaoFQDcdtL/FgcWvzDiwu
 2HQ2fijXEE2awtYWquuSQbeqqw==
X-Google-Smtp-Source: ABdhPJweBYZvB7rCaFGKITUI8g6+sEQrirdQnN0496EWTmLSjLsKTQewq3DsxEwg+BCZuWtIhPT+dw==
X-Received: by 2002:a17:902:8345:b0:167:879c:abe8 with SMTP id
 z5-20020a170902834500b00167879cabe8mr18738687pln.7.1654793283762; 
 Thu, 09 Jun 2022 09:48:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4732:8bcf:1bc2:ec84])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b00167838b82e0sm8131607pli.205.2022.06.09.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:48:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Date: Thu,  9 Jun 2022 09:47:35 -0700
Message-Id: <20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: Grab the GPU runtime in a6xx
 routines, not the GMU one
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
Cc: linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Yangtao Li <tiny.windzz@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From testing on sc7180-trogdor devices, reading the GMU registers
needs the GMU clocks to be enabled. Those clocks get turned on in
a6xx_gmu_resume(). Confusingly enough, that function is called as a
result of the runtime_pm of the GPU "struct device", not the GMU
"struct device".

Let's grab a reference to the correct device. Incidentally, this makes
us match the a5xx routine more closely.

This is easily shown to fix crashes that happen if we change the GPU's
pm_runtime usage to not use autosuspend. It's also believed to fix
some long tail GPU crashes even with autosuspend.

NOTE: the crashes I've seen were fixed by _only_ fixing
a6xx_gpu_busy(). However, I believe that the same arguments should be
made to a6xx_gmu_set_freq() so I've fixed that case too. To make that
fix clean, we've moved the pm runtime grabbing into the GPU file.

As a bonus fix with this change, we change the pm_runtime get
functions to check for <= 0 instead of ==. This handles the case where
pm_runtime is disabled.

Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Move the set_freq runtime pm grab to the GPU file.
- Use <= for the pm_runtime test, not ==.

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  9 ---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9f76f5b15759..2410815e77b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -125,17 +125,9 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 
 	trace_msm_gmu_freq_change(gmu->freq, perf_index);
 
-	/*
-	 * This can get called from devfreq while the hardware is idle. Don't
-	 * bring up the power if it isn't already active
-	 */
-	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
-		return;
-
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, perf_index);
 		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
-		pm_runtime_put(gmu->dev);
 		return;
 	}
 
@@ -159,7 +151,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
-	pm_runtime_put(gmu->dev);
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 42ed9a3c4905..54efd9b76ea6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 	*out_sample_rate = 19200000;
 
 	/* Only read the gpu busy if the hardware is already active */
-	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
 		return 0;
 
 	busy_cycles = gmu_read64(&a6xx_gpu->gmu,
@@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
 
 
-	pm_runtime_put(a6xx_gpu->gmu.dev);
+	pm_runtime_put(&gpu->pdev->dev);
 
 	return busy_cycles;
 }
@@ -1677,9 +1677,18 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	/*
+	 * This can get called from devfreq while the hardware is idle. Don't
+	 * bring up the power if it isn't already active
+	 */
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
+		return;
+
 	mutex_lock(&a6xx_gpu->gmu.lock);
 	a6xx_gmu_set_freq(gpu, opp);
 	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	pm_runtime_put(&gpu->pdev->dev);
 }
 
 static struct msm_gem_address_space *
-- 
2.36.1.255.ge46751e96f-goog

