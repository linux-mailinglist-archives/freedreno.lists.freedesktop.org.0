Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377943A1EC2
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 23:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E306EA83;
	Wed,  9 Jun 2021 21:17:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2EB6E406
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:29 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id v22so38933425lfa.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rv9fpiyiqOOY/tXW9LhOOLqFYwZli4MdbRidzCqIbeE=;
 b=eRohLnQNHkOYLlwDw5wuTwxDm1b1e044Zz0XTThF4Rwoh1zAcCd/53rCJD2Agg+b9j
 RHP6ScK4K/ceP1eY6aQFyYv9d4BiDAV2rQ2rpG4wAkZJDzCI2wDp9uG+OJxGXbe/hi+T
 eweK2w3Dyl1tVUPoWb2ozkIKdjE7U3Z0OoP/Ao5hkXWZOMFEF+AJsEFP6iaQU/xU5Edb
 6INapMnN8vKBXH5FxD9/yK+r20CCE73t9w+iPvyvTvwMMz0qJYxLOQPzRsr1dGza1k0c
 1/O8s7PE0YisYCWUD54WtE72JUiaIZTNUTfeZvvj1gkvTEB9wjd5AGbqCRCzdEwR2Pmr
 hS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rv9fpiyiqOOY/tXW9LhOOLqFYwZli4MdbRidzCqIbeE=;
 b=SDcByGgn5sleNA4D/Y/NeZ62Bfh8pw+hCpDh0DwBQJzWbdKrzTDIxgpr/UYP/My4/Z
 WfavinJW2M8JldyaY/B+Gl7DSl003L1uKZ4BsbONIAOQ2DnFffEAigEiiVY0AlVMcgHp
 oEvTgCNfQwCtHG5IfYmYQRrqokYgIJn2WaZ+m19GCmsWj279tuNLQpVsgb8XCDBvNCpP
 DhCjdshO1gqT/vyZpxxIJ4hUpKA8QSGvJ0MTUIEo+ObKfEb5J7sko4q6GmK48oG+cQek
 slQp55I2dEqI81SmvmeULRCgGvkUBLQ8mTTYcGgucKMUZMCrJKKvWTyNYMw1Y4zCO1CA
 mmJA==
X-Gm-Message-State: AOAM5326An8mLoWtv+ATxgmRVQ6cH8Rii91s74NsT0gfonPEgERZGx6w
 UkKClF8nqJ+3VAgdM5m4G264PA==
X-Google-Smtp-Source: ABdhPJxNfaDa0NszjRb3WODqkMbKQDw82MKYefOYCCzOQ3Uni5NpueX3DX/AQGm/bIzCWkfm8X7j4Q==
X-Received: by 2002:ac2:4c2c:: with SMTP id u12mr858266lfq.209.1623273447521; 
 Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 10 Jun 2021 00:17:19 +0300
Message-Id: <20210609211723.2565105-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 2/6] drm/msm/dpu: support setting up two
 independent DSI connectors
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move setting up encoders from set_encoder_mode to
_dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
allows us to support not only "single DSI" and "dual DSI" but also "two
independent DSI" configurations. In future this would also help adding
support for multiple DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 89 ++++++++++++-------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..b63e1c948ff2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -471,30 +471,55 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int i, rc = 0;
 
 	if (!(priv->dsi[0] || priv->dsi[1]))
 		return rc;
 
-	/*TODO: Support two independent DSI connectors */
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
-	if (IS_ERR(encoder)) {
-		DPU_ERROR("encoder init failed for dsi display\n");
-		return PTR_ERR(encoder);
-	}
-
-	priv->encoders[priv->num_encoders++] = encoder;
-
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
 			continue;
 
+		if (!encoder) {
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dsi display\n");
+				return PTR_ERR(encoder);
+			}
+
+			priv->encoders[priv->num_encoders++] = encoder;
+
+			memset(&info, 0, sizeof(info));
+			info.intf_type = encoder->encoder_type;
+			info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
+				MSM_DISPLAY_CAP_CMD_MODE :
+				MSM_DISPLAY_CAP_VID_MODE;
+		}
+
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+
+		if (!msm_dsi_is_dual_dsi(priv->dsi[i])) {
+			rc = dpu_encoder_setup(dev, encoder, &info);
+			if (rc)
+				DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+						encoder->base.id, rc);
+			encoder = NULL;
+		}
+	}
+
+	if (encoder) {
+		rc = dpu_encoder_setup(dev, encoder, &info);
+		if (rc)
+			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+					encoder->base.id, rc);
 	}
 
 	return rc;
@@ -505,6 +530,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int rc = 0;
 
 	if (!priv->dp)
@@ -516,6 +542,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
+	memset(&info, 0, sizeof(info));
 	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -524,6 +551,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	}
 
 	priv->encoders[priv->num_encoders++] = encoder;
+
+	info.num_of_h_tiles = 1;
+	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+	info.intf_type = encoder->encoder_type;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc)
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			encoder->base.id, rc);
 	return rc;
 }
 
@@ -726,41 +761,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	msm_kms_destroy(&dpu_kms->base);
 }
 
-static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode)
-{
-	struct msm_display_info info;
-	struct msm_drm_private *priv = encoder->dev->dev_private;
-	int i, rc = 0;
-
-	memset(&info, 0, sizeof(info));
-
-	info.intf_type = encoder->encoder_type;
-	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
-			MSM_DISPLAY_CAP_VID_MODE;
-
-	switch (info.intf_type) {
-	case DRM_MODE_ENCODER_DSI:
-		/* TODO: No support for DSI swap */
-		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-			if (priv->dsi[i]) {
-				info.h_tile_instance[info.num_of_h_tiles] = i;
-				info.num_of_h_tiles++;
-			}
-		}
-		break;
-	case DRM_MODE_ENCODER_TMDS:
-		info.num_of_h_tiles = 1;
-		break;
-	}
-
-	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			encoder->base.id, rc);
-}
-
 static irqreturn_t dpu_irq(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -863,7 +863,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.get_format      = dpu_get_msm_format,
 	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
-	.set_encoder_mode = _dpu_kms_set_encoder_mode,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
