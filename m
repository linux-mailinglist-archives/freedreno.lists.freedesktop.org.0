Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E434347C10
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50576EC8E;
	Wed, 24 Mar 2021 15:19:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477D06EC87
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a198so32535896lfd.7
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
 b=Tc25TD5+7Gwo1HO4vQj/3EiBeyJcsnhH7fA3aeCN5TNcqbP/oVU4HMDFXqOtqwP+P2
 Zdq93VMu2vCBVadNX3nvEKyzRcDkbHi5u2/7Avu8aDQtVOtDidA95usU5UlmTP+MJ/R6
 sVguu0bJ75WatTP8XaB3NJPDsLzgw/cpxzjobzcFr8p3kaQeKo57bqtNmE82PfYjpSy1
 ALGNzNRoBz1hiCw566AJcCM/S2N5vCB83Fk0QWPJT3VWfBIoZiTqvExohdsc93hFEM+I
 m2YFbOjtRW6ndpLOdLmt8Zb49bk/7dz3sjQR81yB/rfa3Un0WCyMj02Fn14szlge6Tfv
 vP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
 b=jch/3P5oPPh/lL0o46evAK616FRNu7WSJdcQD/WcZPnwaHVm/AMocbXjpRxNUaPSPy
 LiOL8aOVBLh0iAcVkbgVZS6FB+Wf+0277MexsXwmjDhdgLRR/UoDB7iPS8hKyew/ZOe1
 f018ix6aUvLj+Atgif4d1WHJ7uSZazHUOc8xyobfIp3Dy/8qf01uT+lwjmcU3bH8l1ZS
 1/fePhtxdN3hYTRsI7KrJAFhxwkjxANLBc6CvIN7sK3I6Cg17IihL0zKc/79ExkzfpvP
 K0L5MnvZ6UhwcIb+GQyxPdSRtoYC/RV3Xsunc5XmemlgSxpYfes8y7Auopftf+bFk3LM
 AJ6Q==
X-Gm-Message-State: AOAM533MBAp5KspHLJpFFmUptwjSg+hmjIHy9PB/zGvhVm/NVo+PUSE2
 AFdpu+k02G4qm8Qqch7Xb1W+cg==
X-Google-Smtp-Source: ABdhPJwkT+pO34l6OqgP6jbUkA2UjX0bT6Qiqht5D9qWgnV/qsJJoLaKaul/Sz5nGrQya5lfmFU+tQ==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr2232448lfe.486.1616599168652; 
 Wed, 24 Mar 2021 08:19:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 24 Mar 2021 18:18:34 +0300
Message-Id: <20210324151846.2774204-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 16/28] drm/msm/dsi: use
 devm_of_clk_add_hw_provider
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4a8577a08f57..74a4e2daade8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
