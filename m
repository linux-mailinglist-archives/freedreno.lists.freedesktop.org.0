Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF477BE8E6
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8430510E29B;
	Mon,  9 Oct 2023 18:10:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812CE10E297
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso5758487e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875042; x=1697479842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhoq4A6nHUJ0zF6JqJTYHaFcA0Hv6qfy7RZdzUgcU3s=;
 b=Zt0aDPtZ/c822YZROSeYwwIg2GR7cAZ10ut4+a5OjQgiMPdpoF+mh4OWTfRgmAthub
 2lCU1pssgstK9qqHiWZpRUa9iyAm4G0Dga1WPjTu7/O6qdLkrF1/NSM/zz0TQsyCKBAK
 dxxUzMD7/QTPm+VPoFI/0XNH06p6uEzW78vla/pN2Bbg+yW/0f2cPvEu5NmfzovCJZ28
 2yiIVuSb5r2qlOoFQ+8z2GNltwc1ggVEndur+AR1YjlNNMNue+HWhFaz8jXqoM+8hqrp
 Okz1n+sp/97Ers+3f6H5cbjbL3M9zAWZN3nU9KexFZt1xhm+r0EBxpB9rr4CgWg/silO
 f8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875042; x=1697479842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhoq4A6nHUJ0zF6JqJTYHaFcA0Hv6qfy7RZdzUgcU3s=;
 b=ufY2an3ZP/ami29Y8NmPJf/5DRlQXgY2o4Do8c8e0KP/u70I7rjATVNsK9m5pmeLg+
 25H1XXByyXIL1DAA7i8WTmeH9WiUuQASpOxSVJY7Dt8ahIwZEyxw5K/m6Ox31BwWDupc
 lmEs0+jh/UHZyE9y0N6mSYK82YdpseKuiV2ylOyEqMhvzn5VWtSwuk3Hnv/VUMfpM7VN
 C5B6BSn5TRyaV4IX+x57tceCi5rm5nsHOYD1DMskr38EvTBTkYtqh/QNiP89qFWpbidb
 pWMgMhZ9BqKK4SW8eUO7844FlElykIfR6EfZKgTyqpE9roUF5GkAan9pwc7FbeRUrVzk
 uwLg==
X-Gm-Message-State: AOJu0Yx3VK1vTFojSA/0gx2vLryb93ynP80BI4r3chj2wRoi3lCBr63f
 l7RMgLOUtIew7MUpa1LruLK+dQ==
X-Google-Smtp-Source: AGHT+IFgBxG8t5T/2IknHktWTchqFxzXq6gqgVoSNlOHSWDrSKIymWczVDmlLc+i1uSTJMn+TgHDNQ==
X-Received: by 2002:a05:6512:5ce:b0:501:c996:1996 with SMTP id
 o14-20020a05651205ce00b00501c9961996mr11491384lfo.67.1696875042613; 
 Mon, 09 Oct 2023 11:10:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:28 +0300
Message-Id: <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/13] drm/msm/dsi: switch to
 devm_drm_bridge_add()
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

Make MSM DSI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
 3 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d45e43024802..47f327e68471 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	msm_dsi->dev = dev;
 
 	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to modeset init host: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
@@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 
 	msm_dsi->encoder = encoder;
 
-	msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
-	if (IS_ERR(msm_dsi->bridge)) {
-		ret = PTR_ERR(msm_dsi->bridge);
+	ret = msm_dsi_manager_bridge_init(msm_dsi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		msm_dsi->bridge = NULL;
-		goto fail;
+		return ret;
 	}
 
 	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
-	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
-
 	return 0;
-fail:
-	/* bridge/connector are normally destroyed by drm: */
-	if (msm_dsi->bridge) {
-		msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
-		msm_dsi->bridge = NULL;
-	}
-
-	return ret;
 }
 
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index d21867da78b8..a01c326774a6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -56,8 +56,7 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
 int msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 28b8012a21f2..17aa19bb6510 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -466,9 +466,8 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 {
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_bridge *bridge = NULL;
 	struct dsi_bridge *dsi_bridge;
 	struct drm_encoder *encoder;
@@ -476,31 +475,27 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
-	if (!dsi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!dsi_bridge)
+		return -ENOMEM;
 
-	dsi_bridge->id = id;
+	dsi_bridge->id = msm_dsi->id;
 
 	encoder = msm_dsi->encoder;
 
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	msm_dsi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_dsi_manager_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
 
 int msm_dsi_manager_ext_bridge_init(u8 id)
@@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
 	return 0;
 }
 
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-{
-	drm_bridge_remove(bridge);
-}
-
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-- 
2.39.2

