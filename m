Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1969FDE5
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 22:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920DD10E416;
	Wed, 22 Feb 2023 21:47:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208B10E1EC
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id r27so9771520lfe.10
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=in63kkOlF7AtxceONSVC3/gRevpfU5tcwdwBpL/2KyM=;
 b=KeM5Jd9PP6sKET3tC+jVjGKIxkt9KdvLN5KPtG7FquRbFFmzwM797jZOUYXTAlxQ1E
 AbwP03ooktQuTemzqxedPeJvEoenpub7MMLvo8mWImW2Nb0oezowfCwiI8xHQN28v5p3
 6Q1OjIYirPMsTtgR5v2AmQoSomFpxBvqJnEM5u7IgI5G7ee+bG1xfJeTIsh9WybKrIM4
 dlBaVoIPgvRLnPA6VnmxbF4i5i6vIwY4FwG7VQ04NsRUmxTpSc12ELP5415qzFoCy2N4
 wTHF4VqT5Wm2ScAjY+VY0RTtmjw1NmIOF7W06aWhUd8EeO+/a09hnYfyFLC0U6HMYbu6
 Y0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=in63kkOlF7AtxceONSVC3/gRevpfU5tcwdwBpL/2KyM=;
 b=R5hwhGeC8jrafUjn64JEvdVptCrKlAe1VtZjfWYe2fboE9yz2Dhi5H7SyXfU/VNsNJ
 iQj/kwzDueA00VUd567fWA1Jps/Rja7R+2/5rvN4gsAA2DvU1wpozx8fEj3ZU65gBYXo
 hKjs5zcHGlNV8jeV2xQ+02dYMJ+F7gZmM3MyJYPlNJG0Xtybn3PP5vj9CsHtX2KrVVOn
 97AfUhhe637N2OVAX59X36OUUWTbAL3YKNwWNCQnML/7FUFBly5oieaF7HKLTjBzkb/x
 P4IansO9erIuwaiK+/pXCndOFBGHiTQBUwtCN8Qsp8HoFn08Y9mwbK7bZwZA5JvE42Im
 W1ug==
X-Gm-Message-State: AO0yUKVjrbCXrmnwn5xysRuDSv3bkFnjbEB8+W/t7gfsCpyBEs6miSgO
 mrqznXXopYgxd80/j4lfnI6Txg==
X-Google-Smtp-Source: AK7set/zwE4n33DuF1ijWw0Mn7XP5Waf6LKQEsQ6hwBwaQC+FVOvhsxGfJoTJp79xa9ArFb7ogqaFQ==
X-Received: by 2002:ac2:4e05:0:b0:4dd:9f03:1f7e with SMTP id
 e5-20020ac24e05000000b004dd9f031f7emr1083698lfr.22.1677102433234; 
 Wed, 22 Feb 2023 13:47:13 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 Feb 2023 22:47:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230222-konrad-longbois-next-v1-1-01021425781b@linaro.org>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=6142;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XjCTxbeQ2g0wp3MiyX1zJyPLmA7rilIPN/CTVTjyz6M=;
 b=NWCfHrmYdFscaF+ZYcQO7FL3I6ZLWXdqVlElXTGvme3D9qz6OouxYc83qnwpMTuc1El3Yz+FLhWB
 7FrMDyr3ALLVmn23zBM3AarmXDFJ4QvR3NuDoO98ZEbX4/9vjaRp
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 1/5] drm/msm/adreno: Use OPP for every GPU
 generation
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some older GPUs (namely a2xx with no opp tables at all and a320 with
downstream-remnants gpu pwrlevels) used not to have OPP tables. They
both however had just one frequency defined, making it extremely easy
to construct such an OPP table from within the driver if need be.

Do so and switch all clk_set_rate calls on core_clk to their OPP
counterparts.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 94 +++++++++++++++------------------
 drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
 3 files changed, 45 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ce6b76c45b6f..9b940c0f063f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -922,73 +922,50 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
 			ring->id);
 }
 
-/* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
-static int adreno_get_legacy_pwrlevels(struct device *dev)
-{
-	struct device_node *child, *node;
-	int ret;
-
-	node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
-	if (!node) {
-		DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
-		return -ENXIO;
-	}
-
-	for_each_child_of_node(node, child) {
-		unsigned int val;
-
-		ret = of_property_read_u32(child, "qcom,gpu-freq", &val);
-		if (ret)
-			continue;
-
-		/*
-		 * Skip the intentionally bogus clock value found at the bottom
-		 * of most legacy frequency tables
-		 */
-		if (val != 27000000)
-			dev_pm_opp_add(dev, val, 0);
-	}
-
-	of_node_put(node);
-
-	return 0;
-}
-
-static void adreno_get_pwrlevels(struct device *dev,
+static int adreno_get_pwrlevels(struct device *dev,
 		struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	unsigned long freq = ULONG_MAX;
 	struct dev_pm_opp *opp;
 	int ret;
 
 	gpu->fast_rate = 0;
 
-	/* You down with OPP? */
-	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
-		ret = adreno_get_legacy_pwrlevels(dev);
-	else {
-		ret = devm_pm_opp_of_add_table(dev);
-		if (ret)
-			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
-	}
-
-	if (!ret) {
+	/* devm_pm_opp_of_add_table may error out but will still create an OPP table */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret == -ENODEV) {
+		/* Special cases for ancient hw with ancient DT bindings */
+		if (adreno_is_a2xx(adreno_gpu)) {
+			dev_warn(dev, "Unable to find the OPP table. Falling back to 200 MHz.\n");
+			dev_pm_opp_add(dev, 200000000, 0);
+			gpu->fast_rate = 200000000;
+		} else if (adreno_is_a320(adreno_gpu)) {
+			dev_warn(dev, "Unable to find the OPP table. Falling back to 450 MHz.\n");
+			dev_pm_opp_add(dev, 450000000, 0);
+			gpu->fast_rate = 450000000;
+		} else {
+			DRM_DEV_ERROR(dev, "Unable to find the OPP table\n");
+			return -ENODEV;
+		}
+	} else if (ret) {
+		DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
+		return ret;
+	} else {
 		/* Find the fastest defined rate */
 		opp = dev_pm_opp_find_freq_floor(dev, &freq);
-		if (!IS_ERR(opp)) {
+
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+		else {
 			gpu->fast_rate = freq;
 			dev_pm_opp_put(opp);
 		}
 	}
 
-	if (!gpu->fast_rate) {
-		dev_warn(dev,
-			"Could not find a clock rate. Using a reasonable default\n");
-		/* Pick a suitably safe clock speed for any target */
-		gpu->fast_rate = 200000000;
-	}
-
 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
+
+	return 0;
 }
 
 int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
@@ -1046,6 +1023,17 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_rev *rev = &config->rev;
 	const char *gpu_name;
 	u32 speedbin;
+	int ret;
+
+	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
+	if (IS_ERR(devm_clk_get(dev, "core"))) {
+		/*
+		 * If "core" is absent, go for the legacy clock name.
+		 * If we got this far in probing, it's a given one of them exists.
+		 */
+		devm_pm_opp_set_clkname(dev, "core_clk");
+	} else
+		devm_pm_opp_set_clkname(dev, "core");
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -1070,7 +1058,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
-	adreno_get_pwrlevels(dev, gpu);
+	ret = adreno_get_pwrlevels(dev, gpu);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_autosuspend_delay(dev,
 		adreno_gpu->info->inactive_period);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 380249500325..cdcb00df3f25 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -59,7 +59,7 @@ static int disable_pwrrail(struct msm_gpu *gpu)
 static int enable_clk(struct msm_gpu *gpu)
 {
 	if (gpu->core_clk && gpu->fast_rate)
-		clk_set_rate(gpu->core_clk, gpu->fast_rate);
+		dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
 
 	/* Set the RBBM timer rate to 19.2Mhz */
 	if (gpu->rbbmtimer_clk)
@@ -78,7 +78,7 @@ static int disable_clk(struct msm_gpu *gpu)
 	 * will be rounded down to zero anyway so it all works out.
 	 */
 	if (gpu->core_clk)
-		clk_set_rate(gpu->core_clk, 27000000);
+		dev_pm_opp_set_rate(&gpu->pdev->dev, 27000000);
 
 	if (gpu->rbbmtimer_clk)
 		clk_set_rate(gpu->rbbmtimer_clk, 0);
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index e27dbf12b5e8..ea70c1c32d94 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
 		mutex_unlock(&df->lock);
 	} else {
-		clk_set_rate(gpu->core_clk, *freq);
+		dev_pm_opp_set_rate(dev, *freq);
 	}
 
 	dev_pm_opp_put(opp);

-- 
2.39.2

