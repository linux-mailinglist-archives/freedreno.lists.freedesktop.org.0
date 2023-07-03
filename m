Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C09745346
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA7F10E160;
	Mon,  3 Jul 2023 00:37:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CFE10E09B
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b69f216c73so56367501fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344670; x=1690936670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93jFhS1FMTLrnvHTPQNzVi4tMfuOvCP3+OwFQYB80dc=;
 b=oveRFf+qZKlMD8iIj2W2xDE//gM0strzsIrwXIcuiKSjbOhCrPjugoVnM4bgVODI6y
 AOWyPo4BjaWHMA+RXYs6D5EI7v+HNVbA2ZaLt8IAye1RL658prp6f+bnzKV+3N6tVJT7
 rlwIO5MrNwkG4REHrZB9jtxIm2OoCne4cKHqCyb4Jftv7c4drJq3tquSE8ZmgB3LNlOv
 8skseV8B3D1/0G1Y0UveONv90ABFm288BZ/migk06CejXcPi0hzz48l5O25GuZxJoBk5
 CmDzWfFM5oBbRGZDOzWa1X2VZmqPP8UR/u/pedidojVbLrKU7YnW6WmXhV5qJa0BkJDs
 kRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344670; x=1690936670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93jFhS1FMTLrnvHTPQNzVi4tMfuOvCP3+OwFQYB80dc=;
 b=HX33zNO48/tKrAY2cLM1a0NucPELXkLyiT75nM4sgHl0j7ep1IyfkfwRzNgNDbx8Ah
 3FBKHLyJYK44c/apoDEzne7sLPc4KICHNZulxdTT/xqN4ELuOPED56+JNQnAWmRAGhaO
 gWWFK08HRC5epWxFoPJAKGobz3wo4JuoUQkvHsnLP9uYvmbzPxQ/9Tm1aW/dITXVo6Gs
 LU1mOVUIT3Obh4q+qSy/Eao+kUPlSeEcJ5Rp+vkNQ6ipCZvvHo6PXdFV3jfUtRGhnKhB
 i4XbUq7nMsyvfcI5gYgvY5XfPSSFKfWkCuUKr9lQWRDYG5jKKiH/tI0DLRPt1Lm0i0Xi
 UMvg==
X-Gm-Message-State: ABy/qLbtzQNJhbORfwSns2IdYNULbIX9cOtcuracIy3Xh/EmNbpAL8P6
 nkwb14x0m5Y/HlX5UwuUhXvMNA==
X-Google-Smtp-Source: APBJJlHVGpUB4uRGxt5TWIBFwRBLsHdWhRj18cm7VkDHfJNM+HZXqTpUJMXOywHMSZhTRTttDpOQ2Q==
X-Received: by 2002:a2e:87c4:0:b0:2b6:de41:b72f with SMTP id
 v4-20020a2e87c4000000b002b6de41b72fmr2653817ljj.4.1688344670021; 
 Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:37:36 +0300
Message-Id: <20230703003745.34239-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 04/13] drm/msm/dp: switch to
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

Make MSM DP driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1267e3dbcb1a..7fa245629251 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct dp_display_private *dp_priv;
 	int ret;
 
@@ -1558,17 +1557,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
-	if (IS_ERR(dp_display->bridge)) {
-		ret = PTR_ERR(dp_display->bridge);
+	ret = dp_bridge_init(dp_display, dev, encoder);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
-		dp_display->bridge = NULL;
 		return ret;
 	}
 
-	priv->bridges[priv->num_bridges++] = dp_display->bridge;
-
 	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 785d76639497..284ff7df058a 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -272,7 +272,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 	.atomic_check = edp_bridge_atomic_check,
 };
 
-struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
 	int rc;
@@ -281,7 +281,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 
 	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
 	if (!dp_bridge)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	dp_bridge->dp_display = dp_display;
 
@@ -307,14 +307,18 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 			DRM_BRIDGE_OP_MODES;
 	}
 
-	drm_bridge_add(bridge);
+	rc = devm_drm_bridge_add(&dp_display->pdev->dev, bridge);
+	if (rc) {
+		DRM_ERROR("failed to add bridge, rc=%d\n", rc);
+
+		return rc;
+	}
 
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
-		drm_bridge_remove(bridge);
 
-		return ERR_PTR(rc);
+		return rc;
 	}
 
 	if (dp_display->next_bridge) {
@@ -323,12 +327,13 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
-			drm_bridge_remove(bridge);
-			return ERR_PTR(rc);
+			return rc;
 		}
 	}
 
-	return bridge;
+	dp_display->bridge = bridge;
+
+	return 0;
 }
 
 /* connector initialization */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index afe79b85e183..b3d684db2383 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -20,7 +20,7 @@ struct msm_dp_bridge {
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
-struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
 void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-- 
2.39.2

