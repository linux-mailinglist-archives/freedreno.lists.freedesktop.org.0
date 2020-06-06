Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB71F04DA
	for <lists+freedreno@lfdr.de>; Sat,  6 Jun 2020 06:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F74D6E956;
	Sat,  6 Jun 2020 04:26:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37FC6E98E
 for <freedreno@lists.freedesktop.org>; Sat,  6 Jun 2020 04:26:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591417595; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZPCFFf6bcMj1rJArjTaPaS+HAOchavd1ebOOmbgSpus=;
 b=aZUaV2jn65W5sktdZ6P1M8Iss73AzVNzmdzZ/7S02sFQ+yPjn/EMXGZT+zoMdX/nbGBwXXWB
 V9GtpHbN+udrSTfLE/4T5gUNeKTQxw6+fzXSCt2FDtdc0lygm/7POsz74TllYUDbrG7ywkvn
 +Jd+JJhniZJDa9ypK7O+p5pRFbU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5edb1aeb8c9c416a823484d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 06 Jun 2020 04:26:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 299DBC433AF; Sat,  6 Jun 2020 04:26:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81465C433CA;
 Sat,  6 Jun 2020 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81465C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Sat,  6 Jun 2020 09:55:48 +0530
Message-Id: <1591417551-38051-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH v3 3/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 scale DDR
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
Cc: robdclark@gmail.com, saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, sibis@codeaurora.org,
 viresh.kumar@linaro.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patches replaces the previously used static DDR vote and uses
dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
GPU frequency. Also since the icc path voting is handled completely
in the opp driver, remove the icc_path handle and its usage in the
drm driver.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 23 ++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  8 --------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 --
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2d8124b..1dd8fc5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)

 	gmu->freq = gmu->gpu_freqs[perf_index];

-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 }

 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
@@ -715,6 +711,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }

+static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
+{
+	struct dev_pm_opp *gpu_opp;
+	unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
+
+	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
+	if (IS_ERR_OR_NULL(gpu_opp))
+		return;
+
+	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
+	dev_pm_opp_put(gpu_opp);
+}
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -739,7 +748,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	}

 	/* Set the bus quota to a reasonable value for boot */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
+	a6xx_gmu_set_initial_bw(gpu, gmu);

 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
@@ -907,7 +916,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);

 	/* Remove the bus vote */
-	icc_set_bw(gpu->icc_path, 0, 0);
+	dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);

 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2d13694..718c705 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -913,11 +913,6 @@ static int adreno_get_pwrlevels(struct device *dev,

 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);

-	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, NULL);
-	if (IS_ERR(gpu->icc_path))
-		gpu->icc_path = NULL;
-
 	return 0;
 }

@@ -958,13 +953,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,

 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 {
-	struct msm_gpu *gpu = &adreno_gpu->base;
 	unsigned int i;

 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);

-	icc_put(gpu->icc_path);
-
 	msm_gpu_cleanup(&adreno_gpu->base);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index cf0dc6d..c7d74a9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -112,8 +112,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;

-	struct icc_path *icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
--
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
