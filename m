Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2E3C2BD4
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 01:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CD56EAA3;
	Fri,  9 Jul 2021 23:50:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3074F6EA97
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 23:50:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t17so26578441lfq.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+4Cu6PpzsSGmEoMmg7oFjwuZKsB+y3Zq1/8dnbS9Eg=;
 b=PUbb4ncjimj+tNRRMOspNNOZ9YfYYJHsvZjQOnWRU8cIpi1t0/N7rhq4+jlvM9Q8j5
 YR8st668gT+FywX6if4wMQJdDscB8NiNIuMQiPyhBfeYAIeeWfzp2uGraUoel5LZwzJR
 BGt1OxCdVLPEfwWxAbJMJSZjZkd+PwZjUqQiEyq8/01b1BineqLhbuclY9ybCnvL6Pdo
 73mVU0+TFn5WMQLUbFBalAl0fy1SrRyTAHGsbx5/xIvGWL7GUoFHlfx6E+/Ph6zh9ypx
 fej8lfyzYMT6J0o4zNgSm8xcrnkaHwEq9f+HWAAzUJBdjurpHxVFCTXx2RJPekl2tjFd
 ukwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+4Cu6PpzsSGmEoMmg7oFjwuZKsB+y3Zq1/8dnbS9Eg=;
 b=axXErIVAEgTS3aI28afhpuxlXWwnrZoGrnRC/Q+h8NcNb641onQg6xm7YqdDoqvcIN
 4YwPumZTOi107EeyJ+wROR2fk6DhaQk/GEwlFSNr63WRAJ3DRdfY0vNn0hAtaGRES8Zx
 WK8kEs5SiuL43ULlu5+xQvO3qZMrsfuIey5/fCtqTcbveaR0lCJJ+bRfdgPwMakLJduY
 fcdfjHujLikSF3Rd7QU/4q/d9AI3llFVM6QJTBAC3vR46Ks74eY8SZlWORR3KW97VyJc
 laIQpOmtl8P/PCVjbrGya0gEhYNXMuh+P8qDbQM5z5DeCGiZYxutL9VrXSDtYwlK2Mnf
 9LSA==
X-Gm-Message-State: AOAM530ompHytrkbQSFVU9FIaD1yP1ZE3+TESB8+sAnixqZ6R2dRVjMF
 0YjtInGCC9QxrZhKZ8AWUCRzaA==
X-Google-Smtp-Source: ABdhPJyzE7L/ZvomdPgm3qF9xfJHQ7gqUDx2T0taHPxdr/Ub7kDZ1PNFDFIF6C6x4KmpDubHemrO0Q==
X-Received: by 2002:a19:7dc2:: with SMTP id
 y185mr29817788lfc.249.1625874628528; 
 Fri, 09 Jul 2021 16:50:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:50:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 10 Jul 2021 02:50:20 +0300
Message-Id: <20210709235024.1077888-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/7] drm/msm/dpu: support setting up two
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
allows us to support not only "single DSI" and "bonded DSI" but also "two
independent DSI" configurations. In future this would also help adding
support for multiple DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 130 ++++++++++++++----------
 1 file changed, 79 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..e14eb8f94cd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -466,17 +466,16 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
-static int _dpu_kms_initialize_dsi(struct drm_device *dev,
-				    struct msm_drm_private *priv,
-				    struct dpu_kms *dpu_kms)
+static int _dpu_kms_initialize_dsi_encoder(struct drm_device *dev,
+					   struct msm_drm_private *priv,
+					   struct dpu_kms *dpu_kms,
+					   int dsi_id, int dsi_id1)
 {
+	struct msm_dsi *dsi = priv->dsi[dsi_id];
 	struct drm_encoder *encoder = NULL;
-	int i, rc = 0;
-
-	if (!(priv->dsi[0] || priv->dsi[1]))
-		return rc;
+	struct msm_display_info info;
+	int rc = 0;
 
-	/*TODO: Support two independent DSI connectors */
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
@@ -485,19 +484,74 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 	priv->encoders[priv->num_encoders++] = encoder;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (!priv->dsi[i])
-			continue;
+	rc = msm_dsi_modeset_init(dsi, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
+			  dsi_id, rc);
+		return rc;
+	}
+
+	memset(&info, 0, sizeof(info));
+	info.intf_type = encoder->encoder_type;
+	info.capabilities = msm_dsi_is_cmd_mode(dsi) ?
+		MSM_DISPLAY_CAP_CMD_MODE :
+		MSM_DISPLAY_CAP_VID_MODE;
+	info.h_tile_instance[info.num_of_h_tiles++] = dsi_id;
 
-		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
+	/* For the bonded DSI setup we have second DSI host */
+	if (dsi_id1 >= 0) {
+		struct msm_dsi *dsi1 = priv->dsi[dsi_id1];
+
+		rc = msm_dsi_modeset_init(dsi1, dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
-				i, rc);
-			break;
+				  dsi_id1, rc);
+			return rc;
 		}
+
+		info.h_tile_instance[info.num_of_h_tiles++] = dsi_id1;
 	}
 
-	return rc;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc) {
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int _dpu_kms_initialize_dsi(struct drm_device *dev,
+				    struct msm_drm_private *priv,
+				    struct dpu_kms *dpu_kms)
+{
+	int i, rc = 0;
+
+	if (!(priv->dsi[0] || priv->dsi[1]))
+		return rc;
+
+	/*
+	 * We support following confiurations:
+	 * - Single DSI host (dsi0 or dsi1)
+	 * - Two independent DSI hosts
+	 * - Bonded DSI0 and DSI1 hosts
+	 *
+	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
+	 */
+	if (priv->dsi[0] && priv->dsi[1] && msm_dsi_is_bonded_dsi(priv->dsi[0]))
+		return _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, 0, 1);
+
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		if (!priv->dsi[i])
+			continue;
+
+		rc = _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, i, -1);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
 }
 
 static int _dpu_kms_initialize_displayport(struct drm_device *dev,
@@ -505,6 +559,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int rc = 0;
 
 	if (!priv->dp)
@@ -516,6 +571,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
+	memset(&info, 0, sizeof(info));
 	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -524,6 +580,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	}
 
 	priv->encoders[priv->num_encoders++] = encoder;
+
+	info.num_of_h_tiles = 1;
+	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+	info.intf_type = encoder->encoder_type;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc)
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
 	return rc;
 }
 
@@ -726,41 +790,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
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
@@ -863,7 +892,6 @@ static const struct msm_kms_funcs kms_funcs = {
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
