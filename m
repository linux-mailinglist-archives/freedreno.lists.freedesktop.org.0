Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51A74532B
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1E10E064;
	Mon,  3 Jul 2023 00:31:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7A710E031
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:30:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso2690981e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344256; x=1690936256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLtmYKXatBp2JCqPhIqTtQESCJxKhNtCmzZEzwR81PI=;
 b=swYEdP8/nQUe60TJcYcUqkGuAG1mwwHPmqfYu6+zefsh7LbnB7qgxByy6ezufhoZ1h
 TVBiho+FQJOpT3HGYOVNFZKP10UJQMQv4RO3XTM3SBMH98Oo5AKMHx3JBsWkhxN1M3bE
 zm7VO1T0GAPqWRXjmatRS9nCp8ZiELsi2YQJrv2j3oECDC7/VH4VH4+IuUdO7CI7fzfL
 rvJ+WpG4oFFLh0WdzKroyRFiuIdjNJUVuce0Dmij7GMMkugoLi+l588ljHwwORBznfUT
 Z5mMLVN3cfgSz34M+W9+g6cNhBravdhtVklmtPNeR8ah9IkkzIK78UPdvBB08pDzlxBJ
 LtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344256; x=1690936256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLtmYKXatBp2JCqPhIqTtQESCJxKhNtCmzZEzwR81PI=;
 b=UxDH/Q0Fv+UKCbP7LMaQddkxNhzqTDkKHIrt7n7jqjEBJjm/FFVV395eXtp6maoyaN
 UuN6PJ8LpzUJ7VgtWV9Ji/AJzhy9geKdUIJl6J9C4UddECFsdtbI9taOX4X0qysDt/69
 jYr2BzJeofvW0DWWuvsMXm6I7epF3lUrt9+5Hce0TLiJl9T4v4Gzt8kIL67sQJJ8X6eE
 lkTGOaX22OedVJZAsSiku6pVrQ/XgdCCfS7cK6SnRQI4UEaRLzysJ9OVVPdjTl2vc2b5
 cJqaFYzJvqfGu+OeYTVun+/G2XQ8PSX4UUEvqnsZQiFnHpUSXcOM+qnHHrct7Hc10wtd
 rGyw==
X-Gm-Message-State: ABy/qLaow/VAmoks4e3JaQ6xtMuDPZ7/m8qKqKMFZRec+GHp4WunC31Q
 QbrXjFO90wcnsjHGPoCIgzPrHQ==
X-Google-Smtp-Source: APBJJlGZsdM5obN1s7mSCqj5ptP+8LGqa06rYZnzhw+EsTNlUXzL0/YB8S0qoOnwsNHGJh5NgYne3w==
X-Received: by 2002:ac2:5b5c:0:b0:4fb:8ff2:f2d7 with SMTP id
 i28-20020ac25b5c000000b004fb8ff2f2d7mr5044699lfp.45.1688344256334; 
 Sun, 02 Jul 2023 17:30:56 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 n2-20020ac24902000000b004fbb1bc1ae0sm558842lfi.163.2023.07.02.17.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:30:50 +0300
Message-Id: <20230703003051.33361-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
References: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/4] drm/msm/mdp4: move resource allocation
 to the _probe function
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
 1 file changed, 51 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index e57a1e5f9da0..a3f1da3382e8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -135,8 +135,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 		pm_runtime_disable(dev);
 
 	mdp_kms_destroy(&mdp4_kms->base);
-
-	kfree(mdp4_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
@@ -380,57 +378,27 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp4_kms *mdp4_kms;
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	int irq, ret;
+	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
 
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
-	if (!mdp4_kms) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
-		return -ENOMEM;
-	}
-
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		goto fail;
 	}
 
-	priv->kms = &mdp4_kms->base.base;
 	kms = priv->kms;
 
 	mdp4_kms->dev = dev;
 
-	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
-	if (IS_ERR(mdp4_kms->mmio)) {
-		ret = PTR_ERR(mdp4_kms->mmio);
-		goto fail;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
-		goto fail;
-	}
-
-	kms->irq = irq;
-
-	/* NOTE: driver for this regulator still missing upstream.. use
-	 * _get_exclusive() and ignore the error if it does not exist
-	 * (and hope that the bootloader left it on for us)
-	 */
-	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
-	if (IS_ERR(mdp4_kms->vdd))
-		mdp4_kms->vdd = NULL;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
@@ -439,24 +407,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 		}
 	}
 
-	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
-	if (IS_ERR(mdp4_kms->clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
-		ret = PTR_ERR(mdp4_kms->clk);
-		goto fail;
-	}
-
-	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
-	if (IS_ERR(mdp4_kms->pclk))
-		mdp4_kms->pclk = NULL;
-
-	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
-	if (IS_ERR(mdp4_kms->axi_clk)) {
-		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
-		ret = PTR_ERR(mdp4_kms->axi_clk);
-		goto fail;
-	}
-
 	clk_set_rate(mdp4_kms->clk, max_clk);
 
 	read_mdp_hw_revision(mdp4_kms, &major, &minor);
@@ -471,10 +421,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_kms->rev = minor;
 
 	if (mdp4_kms->rev >= 2) {
-		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
-		if (IS_ERR(mdp4_kms->lut_clk)) {
+		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
-			ret = PTR_ERR(mdp4_kms->lut_clk);
+			ret = -ENODEV;
 			goto fail;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
@@ -558,7 +507,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct mdp4_kms *mdp4_kms;
+	int irq;
+
+	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
+	if (!mdp4_kms)
+		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
+
+	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
+	if (IS_ERR(mdp4_kms->mmio))
+		return PTR_ERR(mdp4_kms->mmio);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	mdp4_kms->base.base.irq = irq;
+
+	/* NOTE: driver for this regulator still missing upstream.. use
+	 * _get_exclusive() and ignore the error if it does not exist
+	 * (and hope that the bootloader left it on for us)
+	 */
+	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
+	if (IS_ERR(mdp4_kms->vdd))
+		mdp4_kms->vdd = NULL;
+
+	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
+	if (IS_ERR(mdp4_kms->clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
+
+	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
+	if (IS_ERR(mdp4_kms->pclk))
+		mdp4_kms->pclk = NULL;
+
+	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
+	if (IS_ERR(mdp4_kms->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
+
+	/*
+	 * This is required for revn >= 2. Handle errors here and let the kms
+	 * init bail out if the clock is not provided.
+	 */
+	mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
+	if (IS_ERR(mdp4_kms->lut_clk))
+		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
+
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
-- 
2.39.2

