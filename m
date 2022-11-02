Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75A616B9E
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E627C10E548;
	Wed,  2 Nov 2022 18:07:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB75A10E53A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:12 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c25so12511885ljr.8
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=t2RcjNYTLDH6G78x+NZ2p6zgnvooU9KdaYMHPzhTzG+QrfQ9aus4ImJHAmAeQtvgGh
 qKC2LALtusMvGxhmfQCMZqSOg4uRh2afE1d8a9y3EzNX+sZ6qwfvU/gxdHcQOSL4nJuY
 sMBzc+0iGcfX22fJxRcyg5GwONyU6kK7+OphLJ7BTpQSmnzMdP0dm8HNvCNQfhGsRhQP
 qaxCANSNkBZoZJOuWVqS60H3l5Zf/u5KNeWowbLH7AXmPuMy77FbGdi55E8QW/0sbDQi
 q9jyNG94WoEJEbKCHTNhZc8I9wTY4Ih8XQr87XS/hx3F6LyDLcR/vNOAu1bEsL/832oX
 3L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=puh6mxmhZpk9A+rcXvZmvKKJSU470mCfyCtqb7oXcAi2rIto7DVRc3T3b+PzH/WglK
 SYkvD/2W43OSx5CJWhb27IGXs+3F0LiGARWAsruyIR6gEqHAmiJQI099sdy5M511UIeD
 Ui/w0QdiyHIM6oDu26u11f3nMK1F26IXHRrsBaxawNwNkvMtI5ZjOoNs7LYvikqghQGe
 mMOLjIm0SoNk713dtEVKNGZQ0Mo0dnaDhUYlBJJ+v2CcoKiKd8bYiU8HdshN0sOXUpoI
 hH2Rv1eRLv7chfzoyxpaj6mcbBHufQ0KTcU3PQGRrsiI+3VAfCkFoqnVtH2Hm1U9l9O1
 bgrw==
X-Gm-Message-State: ACrzQf31RQGnhtVx4GrvnZN+kWCDUMhq8crmNz7AvYDhegcMRyP8Bbho
 UbrYPFaz+zCPkcWYc5fuM6eJ/g==
X-Google-Smtp-Source: AMsMyM4OqI2jkXW6iTpHuMDg1nyD49qN0z0iiKU9ce9bf5kWHoJd0Kfpkz+Hb68JXqo3KUiQHQ9igg==
X-Received: by 2002:a2e:1f09:0:b0:277:d94:93af with SMTP id
 f9-20020a2e1f09000000b002770d9493afmr9944985ljf.454.1667412430761; 
 Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Date: Wed,  2 Nov 2022 21:07:04 +0300
Message-Id: <20221102180705.459294-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 6/7] drm/omap: stop using
 drm_bridge_connector_en/disable_hpd()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 41 ------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..699ed814e021 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -545,44 +545,6 @@ static void omap_modeset_fini(struct drm_device *ddev)
 	drm_mode_config_cleanup(ddev);
 }
 
-/*
- * Enable the HPD in external components if supported
- */
-static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_enable_hpd(connector);
-	}
-}
-
-/*
- * Disable the HPD in external components if supported
- */
-static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_disable_hpd(connector);
-	}
-}
-
 /*
  * drm ioctl funcs
  */
@@ -782,7 +744,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_init(ddev);
 
 	drm_kms_helper_poll_init(ddev);
-	omap_modeset_enable_external_hpd(ddev);
 
 	/*
 	 * Register the DRM device with the core and the connectors with
@@ -795,7 +756,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	return 0;
 
 err_cleanup_helpers:
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
@@ -822,7 +782,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_dev_unregister(ddev);
 
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
-- 
2.35.1

