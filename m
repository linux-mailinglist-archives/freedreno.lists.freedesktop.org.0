Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91030329523
	for <lists+freedreno@lfdr.de>; Tue,  2 Mar 2021 00:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B62E6E8AD;
	Mon,  1 Mar 2021 23:26:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFA86E8A2
 for <freedreno@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b1so17534539lfb.7
 for <freedreno@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAiLNEaAzcPuqvlTiRJz3t8GX2kF4dWHJhKN7UtiXiU=;
 b=rz3Ya1spM4psQUG9LFIvNyBfuMpl9QQGRdz7zhWnzdziJrs4wq0mhiotMOMD9nlGL0
 ZgvbkFcQJT+rP0KJgbQStAWgATJ72//e6i84hhrSl6hvAOpzxe6OuWIrq25xHNPFqqsZ
 5FWC1HLg+hyUpfkYnMJymrhIpT5tTR0lPxMgeflYisDx2gGDO08QqR0Z6SzTXe8Y63mo
 Faw+WZt/HGv8r1/TEwl4mB6hubxTM4yJL4gSVitbNjiwudLMg/09uJsGyNEujNe8eo95
 J2K1mkIN7RDtCQYV/EnOA3XgM4BKyC+RCcPiwZb72nsY9wtHt3DPSre0/xJiWW5rS5Ye
 ZXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAiLNEaAzcPuqvlTiRJz3t8GX2kF4dWHJhKN7UtiXiU=;
 b=cbDtJUWStcb8MhEfzGoHEdgS0OLMqjDlj+zZi0a77S8BlHkFgJLpmEnJ/s7K6zjmuA
 feuKaQMZVZpypaA1P+8ycJ/Zapkp12h+Oozm44g3YNHY07ZD6TVUchYLXxtq8o6pWq+n
 6ich89uN0ROmTYAOsX/+xP8yftOjBzbBeCYZ5E+PSL+Uc4D6YusUAyfi2TSWEScIRtaT
 e0GbmacNw/a7xkAHR6Z7L3CmgIdgnvj+UnCpCP8jk7yMxMhv7qOs4jkxjTRbAGptuQjG
 5GL3ElzRQukDc9MZWCudUfLZ9DMRCLlOH51zXabKOxT7yWu1YXrEdJWqjPXX8ChypZXJ
 9Pew==
X-Gm-Message-State: AOAM532fR2ortUC+LGyvhDYSdGQl6Zn2G0Cd/SrLc4zW43nv1L2O109h
 PqFWJGQz/6GU4Kf065/jyiCQIw==
X-Google-Smtp-Source: ABdhPJyDz/biJ/9718dOb/JLJ7cffuer/wHwmXiNks3WMdtv9ogPRL4nw+L+myhqUTMbfIPWFMFKBw==
X-Received: by 2002:a05:6512:3226:: with SMTP id
 f6mr10303868lfe.171.1614641179566; 
 Mon, 01 Mar 2021 15:26:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Tue,  2 Mar 2021 02:24:58 +0300
Message-Id: <20210301232506.3057401-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 15/24] drm/msm/dsi: limit vco_delay to 28nm PHY
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Only 28nm PHY requires sleeping during the VCO rate setting procedure.
Rewrite sleeping for 28nm and drop vco_delay from the rest of PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 10 ++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  3 ---
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 81ca0cf2a3ad..7533db8955a5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -768,8 +767,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index c531ddf26521..023727623847 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -122,8 +122,6 @@ struct dsi_pll_14nm {
 	void __iomem *phy_cmn_mmio;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct dsi_pll_input in;
 	struct dsi_pll_output out;
 
@@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_14nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_14nm->vco_delay = 1;
-
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fa96bfc21fdb..e77b21f0d3bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -69,8 +69,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -209,8 +207,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -576,7 +576,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
 
@@ -616,7 +615,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1000;
 
 	pll->cfg = phy->cfg;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c6f0aca66fa9..d3fea4a2b498 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -793,8 +792,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
