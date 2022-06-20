Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95298552669
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 23:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A2E10F3AE;
	Mon, 20 Jun 2022 21:31:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B532B10F3C3
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 21:31:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c2so19264020lfk.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0A7Tldf1GC2gwlpbAQomv1Bp+9HeSjzZPOOkTnoz/Ng=;
 b=Bz2VonNk+v3S+fbvzRx/LZFjkdwjYWiBNnHubGlIWiD/mYPE4tvJ4Xpzp7ByhTX38k
 sqFYOIKviDRSYmNXh0oL385z9mULZ3qDVhx1MKBNXgPRmgUQEPMc0kzPjumaJa4wt7yE
 1YN2sdkSeRmPG2wWB5kMTcJmWjKwRge0T77jmK3tiJt+d7R+i2pvUk8qBfh+dSlNnsVu
 Gu0AP898ftDRI2RPtIZ6Eu282M+vQOCeCjEPOdxzmLh84TA7XzoXXRWwEGmJCVxWptnH
 MIcHOndHIfdiGFFGkHMfEef/4Yu3fJzEOb2McCPQkMzg0/LVMMe/hUGaQJ8DYUCqxhMO
 4gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0A7Tldf1GC2gwlpbAQomv1Bp+9HeSjzZPOOkTnoz/Ng=;
 b=v52YHSwoFoHkWo3tjYiT6H0KAZwTdV7pIpmTRPebNnTquh4HXDCLt/gJ+cTWYpTUwv
 qaK0UTet2vhhy77tJPkLkMJum8kPo/KXxb/MBLB21YfCo46fV1tkNOtUcg/Q3N+g90GT
 1AWKz5F1hlxiJMdJulrwPq0/CRMzmgFU5xz73oGclI3/M2HPtPDJK1ZR2JHBUP1VbyLA
 y130FApcgmS4ANrqFOL8I+NF8/FiROOe+7feWHl5qmFolCPrHs/We7ki40i7zA50C3Cl
 4p/dTHXnbZf5X08JgwJPYg+3tD3wU2idGyfgP9kjmtBD1eMkoIZeAxOwnaxnu/za3uou
 ZE5A==
X-Gm-Message-State: AJIora95W7JGwxJVjzmzOnqIRvp2yHaoBANYFlna7qSVe9rpnBVEHEPi
 VBZCDLG2v9RUTyXoIJC+E5Ne7A==
X-Google-Smtp-Source: AGRyM1tQedvPN3nXzU9NleuW6BWBubNtLxpPWhre0INShfJGUrYZa1tAcgHsRpuwAFhalBCRGjivUg==
X-Received: by 2002:a05:6512:22cf:b0:47f:7b38:73e7 with SMTP id
 g15-20020a05651222cf00b0047f7b3873e7mr689716lfu.523.1655760660744; 
 Mon, 20 Jun 2022 14:31:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:31:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Jun 2022 00:30:54 +0300
Message-Id: <20220620213054.1872954-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 4/4] drm/msm/mdp5: move resource allocation
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 97 +++++++++++-------------
 1 file changed, 45 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index daf5b5ca7233..015388f262f4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -556,17 +556,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct mdp5_cfg *config;
 	struct msm_kms *kms;
 	struct msm_gem_address_space *aspace;
-	int irq, i, ret;
+	int i, ret;
 	struct device *iommu_dev;
 
-	ret = mdp5_init(to_platform_device(dev->dev), dev);
-
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
 	if (!kms)
 		return -ENOMEM;
 
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+
+	ret = mdp5_init(to_platform_device(dev->dev), dev);
+
 	pdev = mdp5_kms->pdev;
 
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
@@ -575,15 +576,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
-	kms->irq = irq;
-
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
 
 	/* make sure things are off before attaching iommu (bootloader could
@@ -804,51 +796,17 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_cfg *config;
 	u32 major, minor;
 	int ret;
 
-	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
-	if (!mdp5_kms) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	spin_lock_init(&mdp5_kms->resource_lock);
-
 	mdp5_kms->dev = dev;
-	mdp5_kms->pdev = pdev;
 
 	ret = mdp5_global_obj_init(mdp5_kms);
 	if (ret)
 		goto fail;
 
-	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
-	if (IS_ERR(mdp5_kms->mmio)) {
-		ret = PTR_ERR(mdp5_kms->mmio);
-		goto fail;
-	}
-
-	/* mandatory clocks: */
-	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
-	if (ret)
-		goto fail;
-
-	/* optional clocks: */
-	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
-	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
-	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
-
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
@@ -906,9 +864,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
 	return 0;
 fail:
 	if (mdp5_kms)
@@ -951,15 +906,53 @@ static int mdp5_setup_interconnect(struct platform_device *pdev)
 
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct mdp5_kms *mdp5_kms;
+	int ret, irq;
 
 	DBG("");
 
+	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
+	if (!mdp5_kms)
+		return -ENOMEM;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
+	mdp5_kms->pdev = pdev;
+
+	spin_lock_init(&mdp5_kms->resource_lock);
+
+	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(mdp5_kms->mmio))
+		return PTR_ERR(mdp5_kms->mmio);
+
+	/* mandatory clocks: */
+	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
+	if (ret)
+		return ret;
+
+	/* optional clocks: */
+	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
+
+	mdp5_kms->base.base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
-- 
2.35.1

