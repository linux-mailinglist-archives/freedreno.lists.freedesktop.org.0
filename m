Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC44A4726D
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 03:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25110E2FE;
	Thu, 27 Feb 2025 02:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M1HgS3hI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F310EA0F
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:23 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso4552851fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623121; x=1741227921; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xjMPSn3p+kKVaFgGwZAw2jpHs3L/eAAFrrWZof4s+cw=;
 b=M1HgS3hIlPufEgwQvFJxZgRLtDMM9QSfs0z0mejYOG2oGsumTdvHbX7mxjKM8j65C+
 u7IuJaY2v/RnERRcFq6U/i5JP/2i8EHDHOGuEU22dDeFlTqlw8vzIVFatvD7A6aU3oKk
 yIo8wxB78qjNFQqwZ27GNOFmDNFjk2pxUV529XQchEuiDrPN6oFt/2psq01ju4HbZH+7
 jIHE0vKoxg1cPxWD2E1qMI3cVx72ev7IqXNFTgZElVKuZ0kin62+S5fbiGSn1ciQgCb3
 RejDLWhl1jh37jWkAQKDcW2XjdGjo+R1UcJi5Anmc+BJrzsNXj6uCJ0jXYcdE3rW6XNL
 tzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623121; x=1741227921;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjMPSn3p+kKVaFgGwZAw2jpHs3L/eAAFrrWZof4s+cw=;
 b=ZiSfxCo5pqF8dH7WKPNCT78H2WTsuo2PeMvCxKp1kYBksWRlJGfRPGXmgNBs6Xofwt
 ZQArkQvDizYiEvC9+yZvrTXSohJOIm1kFXYFvLJifmAJYiiFVLY/YKLcIbrzqRNwly76
 3SyABgZqe9F6crQoZHHzciolO7Hng+40ZXjXfd+HyBlJxIdq5sMaXsfjbTQbIKZVuHyr
 OqfWrNatzl5p+H63Kd2NWXTcIN/x8bbaIqYXF081elz/8Es6fnIn+502/+Z5rZZVQVSp
 /DRrEIsTsX1y9tif49/sJ4j1n1Xeq7xU46v3v+5xUNG+Xc/xGg3PaQIb8hQdlU6qGMVi
 tlqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0dtCPJbsGldTVUxtYLMPK9+DNfvjDJ7d/xTOQC+ExEr3vfh1BrdASZRQxXcquk39Nm03Ztn8UJrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY6t2TemvaPmZ+vpODIayTeQwEDveWm25MFn/BajJDqV0G+Aa6
 HggVih76OeF3/GlTk9hLQCflWaWLaYMIUx+2EpxCTPGNCQ5AI9mwTsmdu9h9GQY=
X-Gm-Gg: ASbGncseog1TC421xaB41hvn+aKuYiOaHNtHutwTE9A9vq/J4FxKK3Ol65pc7cPeB+h
 uaj5Wrb0aKV/QhZa7WDcGqdICE05fAhhLgZxl077LZMIhpwS+PJCALdfZs8nJgD6fuma0F8qegT
 f+qzpIY4IeCRGl/tDSZmr97Q07TyTtFbpcPWF4MJFtVZIcqZWfAB0oIKBdwG5fauPD2zKCQGfPY
 FehKGBr5tRl9IBYxL86PIT1rkeg6r2BozZaGxV5D3Qi+Njj4C5LYioomE+SZCWFOd7CJ1EjHoSb
 Y+pXxsBWoBgOeOJlrf5KzBnjnFT+nmQy2A==
X-Google-Smtp-Source: AGHT+IH77YDGb3SZATx2bSqI54qqDb0dQOMQtl3AYNP1lYyp8xUbecwSvBjawn7myFKJmWOKcAzSAA==
X-Received: by 2002:a05:6512:3c9c:b0:545:c23:9a9f with SMTP id
 2adb3069b0e04-5483926338bmr11394006e87.44.1740623121569; 
 Wed, 26 Feb 2025 18:25:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:11 +0200
Subject: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
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
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=27+bBwIzCM8lHu2v6Fir13MzMlLQU6chggcqKIoU0MI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80Gt/5nSvJtT/vlFx8Una3vhVbTV9fge9Jhj
 jIZmIOXNPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1Zw0B/0X9T9NpQIFhPxEgci4pkI3GQTWUb6qpGsk+NLJ+A1v4NgpUypKdVr6srLGtwcdZp9i23h
 SfSAwiTWE/idrluzIasJ4sQsQ9f47F5gCpWRexmttiwyxpVcqLDGLcRYAsf3cQ/EgRAX0zV5cvO
 Kgy5Vk21qsHpeb8IAuDgsMg4Zb+DZUhYt1Eo+Pl2rOGmXdG28FirbFGS30IwPlvlRiCHaMjZwpu
 4VBIGuT0UUjf+YG2UL7uIKH56gpgkMQC07+VlNui77Q07EOWZ+bQOX1o5TMu0qctVaLs6M5DcpS
 zWMcqMFEDrW91UvPDrvkDkmXXnsV/QgCWDnIsVV/BSEJP6Gy
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

