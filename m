Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343821C0E7
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660B6E1CF;
	Fri, 10 Jul 2020 23:48:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19516E1CF
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:48:41 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w34so5872802qte.1
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/YUPoYzKITfDRzsXGJatP7SfG3rVssKgCHkA7GTohk=;
 b=eYAwhWaJ6WDKsAeNjbE1T4jAoNeQvKsUZeTvCp8ns6BMvwS0hwrwZKV+6XOf+nNJti
 Lpe59v5ImqrCcINafcGaQ0bo218sU+ErcZZsRv1fCcRt2yLs3hZUdWeNO9mElRUU+Qrl
 O6y4dSr2BiS+GV89YTk3BhqWA7F53R3Br+wJQuEBGgm5DVGK1/01KEHYZP4UbAJmcPsN
 ud39xyg834rrFWidgseEH9yraqph8NO70ANmP/5V4KtoU479tFahKBRV8YOLStsVHSbm
 fuE9Mq6wECwz7f/Y/YwweIeSxFt0qs3JQw0uyj0FR8pFOouoEH98ZSliZkVtPOqkx3ai
 6ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/YUPoYzKITfDRzsXGJatP7SfG3rVssKgCHkA7GTohk=;
 b=eRqWiu152/IkiOMWh7TJvAFXxVctzs6V7pQjZHsZWHyCM9rDJXdq1cfagbzIdc9abm
 p+umtitXA8QtIUZU5F47nXvJ2ZcR5sirWQmYbnUD4LS4jntaLnbGo5zrX1B1+U7YR16G
 ptwwYciLY8wUlBQc07Wg9c6aMgtntvwqJr8pnk7DrvFA5Kruk+MGg0pHSruQWbF45x4C
 RU19JxhgXic0AfVikI83UVc+S8JCJMelmyCSrYbMCfbpLEMSRj2B3mkWK1dvuqJju2Sr
 jGn2lDTgRJdZOzGsU/E5+I1utAluoQufnliGuWPFrp46EfrtBFX1zaAzbUZ25M1eO5zb
 +ujA==
X-Gm-Message-State: AOAM532JQcUW5lxAIBmhgZhOQvqlTWVrxXMJscfClYXsXLqoI2PxGEL+
 MObUIYokVn7t8/ztgoMwePa1+1j0vd4=
X-Google-Smtp-Source: ABdhPJxhZjKQWe+OqU9wPzwkTAH61T7D/arAMYpcR4qQS1FLyaMhKAFet8ytZDC2n7ZqGkQxMFsXKg==
X-Received: by 2002:ac8:734b:: with SMTP id q11mr28185535qtp.176.1594424920735; 
 Fri, 10 Jul 2020 16:48:40 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id a185sm8937187qkg.3.2020.07.10.16.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:48:40 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jul 2020 19:46:55 -0400
Message-Id: <20200710234657.30944-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3] drm/msm: handle for EPROBE_DEFER for
 of_icc_get
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Check for errors instead of silently not using icc if the msm driver
probes before the interconnect driver.

Allow ENODATA for ocmem path, as it is optional and this error
is returned when "gfx-mem" path is provided but not "ocmem".

Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
init needs to be after msm_gpu_init for the error path to work.

v2: changed to not only check for EPROBE_DEFER
v3: move icc path init after msm_gpu_init to avoid deleting a WARN_ON

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 65 +++++++++++++++----------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..8ab75d7691bd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -895,7 +895,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
 	return 0;
 }
 
-static int adreno_get_pwrlevels(struct device *dev,
+static void adreno_get_pwrlevels(struct device *dev,
 		struct msm_gpu *gpu)
 {
 	unsigned long freq = ULONG_MAX;
@@ -930,24 +930,6 @@ static int adreno_get_pwrlevels(struct device *dev,
 	}
 
 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
-
-	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
-		/*
-		 * Keep compatbility with device trees that don't have an
-		 * interconnect-names property.
-		 */
-		gpu->icc_path = of_icc_get(dev, NULL);
-	}
-	if (IS_ERR(gpu->icc_path))
-		gpu->icc_path = NULL;
-
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	if (IS_ERR(gpu->ocmem_icc_path))
-		gpu->ocmem_icc_path = NULL;
-
-	return 0;
 }
 
 int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
@@ -993,9 +975,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
-	struct adreno_platform_config *config = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	int ret;
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -1007,15 +991,42 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
-	adreno_get_pwrlevels(&pdev->dev, gpu);
+	adreno_get_pwrlevels(dev, gpu);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev,
+	pm_runtime_set_autosuspend_delay(dev,
 		adreno_gpu->info->inactive_period);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
+	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
+	if (ret)
+		return ret;
+
+	/* Check for an interconnect path for the bus */
+	gpu->icc_path = of_icc_get(dev, "gfx-mem");
+	if (!gpu->icc_path) {
+		/*
+		 * Keep compatbility with device trees that don't have an
+		 * interconnect-names property.
+		 */
+		gpu->icc_path = of_icc_get(dev, NULL);
+	}
+	if (IS_ERR(gpu->icc_path)) {
+		ret = PTR_ERR(gpu->icc_path);
+		gpu->icc_path = NULL;
+		return ret;
+	}
+
+	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (IS_ERR(gpu->ocmem_icc_path)) {
+		ret = PTR_ERR(gpu->ocmem_icc_path);
+		gpu->ocmem_icc_path = NULL;
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			return ret;
+	}
+	return 0;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
@@ -1026,8 +1037,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
+	msm_gpu_cleanup(&adreno_gpu->base);
+
 	icc_put(gpu->icc_path);
 	icc_put(gpu->ocmem_icc_path);
-
-	msm_gpu_cleanup(&adreno_gpu->base);
 }
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
