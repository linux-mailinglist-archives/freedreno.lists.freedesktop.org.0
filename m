Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFFAA3D7F5
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4222110E946;
	Thu, 20 Feb 2025 11:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s256S6oQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4C910E944
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5461a485aa2so780290e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050102; x=1740654902; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z8FeS/va+zHK5sGx9TRcjS6J+iyejHe2ih+fYa/2Q5k=;
 b=s256S6oQ4Y47vnBhg9KGXjzAz9cpETxH/cKT5W5lokaep6dyEwoydYHszS5BoVC182
 v0aDh37KzUw0oyFgp7qS+v4cf7rnCWFhpFbnslYchTBo4VnhwAmL//a/l2/94+fcjP6n
 KHZJ/iZky0Glht5yM44YlLqw6QYLgqh5E7XAnng2OJo4U5G46dRuFtWSEaE6h0MTe0b3
 +RrSq+c5l6ueZ0Px+lRPYLEGM1eu7Pj0k3dKTppH8yo/yimrXz/R9uuXtv8eFaDdFdAG
 ed2s+3QrTo9ZFkbXDtdJsaTUEI0cP686V36EEpJZh9Z/1WiWJoJnewmq+J7Fe2qXQ9ce
 dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050102; x=1740654902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8FeS/va+zHK5sGx9TRcjS6J+iyejHe2ih+fYa/2Q5k=;
 b=O2PxH7PIbdnPovxNh0sbFsYmYCa1nZfLF+SVeWQESs+Gaabnc4p0IlUKMuziFT9eyL
 G2fqldGzTNO9CEWASj9bVp3PtnUAow4QwFBlVB5E7NHQzl0UfozNhuH7w4UEKrkCuzku
 Cwweku7TJE4t0Bu+3D2g3ztPOUXYGq7R+7X5F8livLgRyznd2sua5IyA6gGn2jzgJtn4
 8yjiq7wgyyiaxmWUHN+/kq0JjoOptwwIzLeQhAhDhfj39lGv+0+JjStGLQ/vQzrGqrGB
 qgDs08fMflWcVUfLsmYJqUeX6staPHqqNow7x130MIDpK8HoJJbYhaJiGYYnxOpmdKUo
 1eag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3AvFpdf9CNviNrqxcN3sz0C+sdx57llRq7Urymj+X74UupQaC1IOfqjm3d4hVN2Jq9rpmb+1aBD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtVXjWszlFqsCmIfJBnCrH0Wy17NmIXYjfyklsMKndqhWH4E/3
 S1lQSmGqLRYAua+lJctkaHPTIqB+cuUWZqhuEW8tjShOez1hRyn0UT9B9//gmcY=
X-Gm-Gg: ASbGncuV1rEuV4L7Y85ez3dmanfOlFrMJxWU6yiN4fCIcFb08LN/WPHW6vBwRW8lPKG
 /nlUVqVvpIYq0BKcqJA22N/eZEMBCsbXXf1fScM7Of1eY9D0iINGD2I9YOlaf1n/yVJEkG2FzWK
 I1fUjAwfAEW1aIrkd6B43+bfl0MUYkl+8gdKZuex8b24gldHAvZ6SHTyV3PngecxC5xjkZ/nyXB
 54Tr7a/DmJikblJ4aSnZkaMxY7XRiCA2wZ0TdyxjHdWZKwvThlRL0VhmQYcW9bEL5hb/UcakYUR
 PoPN9nL0Cazuwu8lGQtHbZM=
X-Google-Smtp-Source: AGHT+IFU9ElSwjjqQx8XjrVFfwUEEeETjZJP2gCbsJDlUGmgPawhSl7mzS0K/iqHALGezyTI0ARFpA==
X-Received: by 2002:a05:6512:3b06:b0:545:1bd:a0df with SMTP id
 2adb3069b0e04-5462eef45cemr3252158e87.23.1740050102303; 
 Thu, 20 Feb 2025 03:15:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:45 +0200
Subject: [PATCH v2 3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-3-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nznA3A8GlMjZ03UpAd+EaFdRwVMW2jSUcP5sfO1ICTE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rRbr96yN51JnJO6N0m78cEm276ifFyrQ2E
 SShQlIaEjCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1QfDB/9LTU1jklbNgPinoHoSuaCNIbTox61Mp/VXVFwjcGnGIgku+sEd8/SG5lglE//EmBGWt6A
 g+GYO1DSoxgyIDBhioiPRbqPWZ8AmLX62snw6MX24URO9S2wZbECNtWPpvkIKXZwExfe4h8mQQA
 PokpkU5Y420PU0CHcE0rm8N91K0OU3Dz861Tta1thWxOxytytW8WWbxHDv/Yxf8pjAvGbw4brzd
 Urh6HMf9xwocvdRIcaEM8Nkb2VDVEtw94oFGAQ0oNyukOO5jFRs/BlCs1foGhvnJoKGvtsWs27O
 WlUpo1/27GKOfKGo+GWMovy3tyjklSjmA8aiZGvTklHcDUWv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The LVDS/LCDC controller uses pixel clock coming from the multimedia
controller (mmcc) rather than using the PLL directly. Stop using LVDS
PLL directly and register it as a clock provider. Use lcdc_clk as a
pixel clock for the LCDC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
+int mpd4_lvds_pll_init(struct drm_device *dev);
 
 #endif /* __MDP4_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
 	/* TODO: do we need different pll in other cases? */
-	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
+	ret = mpd4_lvds_pll_init(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
+		return ERR_PTR(ret);
+	}
+
+	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
 		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index ab8c0c187fb2cd05e26f5019244af15f1b2470c8..cbd154c72e44c848fa65fe01d848879b9f6735fb 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -133,29 +133,21 @@ static struct clk_init_data pll_init = {
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
+int mpd4_lvds_pll_init(struct drm_device *dev)
 {
 	struct mdp4_lvds_pll *lvds_pll;
-	struct clk *clk;
 	int ret;
 
 	lvds_pll = devm_kzalloc(dev->dev, sizeof(*lvds_pll), GFP_KERNEL);
-	if (!lvds_pll) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!lvds_pll)
+		return -ENOMEM;
 
 	lvds_pll->dev = dev;
 
 	lvds_pll->pll_hw.init = &pll_init;
-	clk = devm_clk_register(dev->dev, &lvds_pll->pll_hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto fail;
-	}
+	ret = devm_clk_hw_register(dev->dev, &lvds_pll->pll_hw);
+	if (ret)
+		return ret;
 
-	return clk;
-
-fail:
-	return ERR_PTR(ret);
+	return devm_of_clk_add_hw_provider(dev->dev, of_clk_hw_simple_get, &lvds_pll->pll_hw);
 }

-- 
2.39.5

