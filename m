Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF07BE8ED
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD07F10E2A9;
	Mon,  9 Oct 2023 18:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994910E29F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:46 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503f39d3236so5736027e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875045; x=1697479845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6/ggZZmOOvUZ/jHV96y3poAAIRXv6qRJqOXl/4SuAQc=;
 b=MZKj3LeaIOX2IocRR9qf9WWNqX7WaeB/AAo71Ad4eW0clRRYb/S0NBSmCR8QsDzntA
 bStsYpNJN2ahKmhfjOqgKKwHJflFT/DbqQ/e22uQloWRDwwHbun+2NSUCxO7nIGwa29O
 vqvDcfEj/spZHrmMqL70NIVTknTDcVINzXxCHzZxfigNqWl8MKQ05uMw7qWi8JTHquY0
 2JK78qQG3Gy2G2xeGMXTCapOXtvP/vStSO0NWq8NdlQ0Di8MYxpoSHvLca9+SYeyoPVk
 bc0inlmnhLI1jqAzRIi5JmjCCy+GhhSNzhdD6KjObhRwIvmiwErCTAbO4xaFD1n50uta
 S0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875045; x=1697479845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6/ggZZmOOvUZ/jHV96y3poAAIRXv6qRJqOXl/4SuAQc=;
 b=OmISC8DwqhOfe7KOPeyP1yf25HV0FIRwJEVFrlE1sO3LwyJ/kE+Iv0K/ItdhxjDQ+u
 0EoQQE8LD+QPuwfS918iDAJmNecC+F2UwrgI9kgG+taIPToqXVVtsQJVqgpOsCMxfKoN
 Y4s/zeeMzUBK796vdLREQPNZtsqL0Wbp30MstcbHouKlauvMf7Hei5yKIrXGD0/2VOSB
 QZ63iGqCJUy0ImK5mTB8w/bZc1BvYxmS8ljj53S//dRLsayPCJepKNQA5YrIyzQ/uPq2
 fLyKIwzWQp00ouZlF+HmVx0rjokD9Ek09VdiL+YUxx5ZSGnd3npffcKhuFfecsMu1BOY
 g6Dg==
X-Gm-Message-State: AOJu0YxvlTYFVxjvaLfrKzOaeYltVXYAQWY/FQo5a1ijOjWUbOAnF8V9
 2mEOEZSLZXO1j+3FnOwkqGun2Q==
X-Google-Smtp-Source: AGHT+IEkZphNwAOKp9JtA7qMk7prsRuhaPwpf+e6gDGlK1W+jDqKLj+YRJsuImLEuWVeqkYOfEBCIg==
X-Received: by 2002:a05:6512:3b9a:b0:503:18c5:6833 with SMTP id
 g26-20020a0565123b9a00b0050318c56833mr17676101lfv.61.1696875044954; 
 Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:31 +0300
Message-Id: <20231009181040.2743847-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/13] drm/msm/dp: switch to
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

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 172daa5ad004..e329e03e068d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1530,7 +1530,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct dp_display_private *dp_priv;
 	int ret;
 
@@ -1548,17 +1547,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
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

