Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130051E6C2
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1D9112C37;
	Sat,  7 May 2022 11:59:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27655112C1E
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 11:59:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p26so3268179lfh.10
 for <freedreno@lists.freedesktop.org>; Sat, 07 May 2022 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MowefnyIGZxnMcPuUrsLXOSCQKi37lK3t/BRSCM4EA=;
 b=A61vaHFBgsQmmbQs4gOdi7JdkWVtQNtt82nWofMMOLnJH3SNaiJS9cvMP29lyZiLif
 b5J/elylHuWlf+cvS/wj78qq0vNEgGLd7BXDEZvZYac0MjfoQizlA5CgtLh7LreazPGV
 Fo40dF/gMBU1wRZl6jkuzZwBuD48sJChsLs6rUPu3pHbtW5ir1kvrlIc3zP9p620gYFd
 97IVE3N+r4vDD/FR+K+tuuu7h2j3w9J1pZ5OPQSuh/IAMspGt58raE92stO2UEx3KrFc
 MyZb7RFTVcwXvrjvPGRja+Zgfgr7OZJoQYwLUyPxbImXhjUrw3TB45BuHs4s8Oe62lmO
 q+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MowefnyIGZxnMcPuUrsLXOSCQKi37lK3t/BRSCM4EA=;
 b=19f6NkCD1AGWcXnna19mwVAsAeYJW6msrB2tytBfLlNdxqJQskSuqmnegCxb/Szwc3
 dlfbf4FAX3I53z1qxJyg3iZ7w63FKIRlDKzNUPZaSDVYgg0r/I0q6BDz0Lm7gIxtrqT0
 /Hnev2Kgog8xhXsSTwdJY8HgTn0cWa7zbFcK28sEmHiIn91DVQ9cwQdVDOUs5TBjFTTi
 6ZhNiLGsJfK7eWVcrDdk+Xg3ejl+Q8WaPvJNJsM5Nl6rxpC0E5Far7DY0suMyd3O/cVM
 PjbfctduUrYrWfAtZnrG1ZmzcddW8q/PQHnqRqWI2UZwVWVYzcKyHkrDk//qie0znE42
 I/mw==
X-Gm-Message-State: AOAM5301dWfauVvq6W91KkFes8DoFtXbIszT+e0XHOjSD/4tZYNy1QqJ
 1zwM/+/OV6mky9YiMRukSPs0NQ==
X-Google-Smtp-Source: ABdhPJxOw2jcsM8BmcDkmnT/Cxrh8cZmpCheQfZpXgV67aUMNnEP8+bTob/MbaI7lQcLiG92feN0kg==
X-Received: by 2002:a05:6512:344c:b0:472:15c:97da with SMTP id
 j12-20020a056512344c00b00472015c97damr5971142lfr.539.1651924786460; 
 Sat, 07 May 2022 04:59:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
 by smtp.gmail.com with ESMTPSA id
 f3-20020ac251a3000000b0047255d211b5sm1083738lfk.228.2022.05.07.04.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 04:59:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 14:59:42 +0300
Message-Id: <20220507115942.1705872-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
References: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: drop enum msm_display_caps
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

After the commit c46f0d69039c ("drm/msm: remove unused hotplug and edid
macros from msm_drv.h") the msm_display_caps enum contains two bits
describing whether the encoder should work in video or command mode.
Drop the enum and replace capabilities field in struct msm_display_info
with boolean is_cmd_mode field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 31 +++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 +---
 drivers/gpu/drm/msm/msm_drv.h               | 10 -------
 4 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 07de0c0506d3..ce299b1e40a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -636,7 +636,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 
 	if (hw_mdptop->ops.setup_vsync_source &&
-			disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
+			disp_info->is_cmd_mode) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
@@ -720,8 +720,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	priv = drm_enc->dev->dev_private;
-	is_vid_mode = dpu_enc->disp_info.capabilities &
-						MSM_DISPLAY_CAP_VID_MODE;
+	is_vid_mode = !dpu_enc->disp_info.is_cmd_mode;
 
 	/*
 	 * when idle_pc is not supported, process only KICKOFF, STOP and MODESET
@@ -1604,7 +1603,7 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
 
 		/* update only for command mode primary ctl */
 		if ((phys == dpu_enc->cur_master) &&
-		   (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE)
+		    disp_info->is_cmd_mode
 		    && ctl->ops.trigger_pending)
 			ctl->ops.trigger_pending(ctl);
 	}
@@ -2141,20 +2140,19 @@ static int dpu_encoder_virt_add_phys_encs(
 		return -EINVAL;
 	}
 
-	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
-		enc = dpu_encoder_phys_vid_init(params);
+
+	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
+		enc = dpu_encoder_phys_wb_init(params);
 
 		if (IS_ERR(enc)) {
-			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
+			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
 				PTR_ERR(enc));
 			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
-	}
-
-	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
+	} else if (disp_info->is_cmd_mode) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
 		if (IS_ERR(enc)) {
@@ -2165,14 +2163,12 @@ static int dpu_encoder_virt_add_phys_encs(
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
-	}
-
-	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
-		enc = dpu_encoder_phys_wb_init(params);
+	} else {
+		enc = dpu_encoder_phys_vid_init(params);
 
 		if (IS_ERR(enc)) {
-			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
-					PTR_ERR(enc));
+			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
+				PTR_ERR(enc));
 			return PTR_ERR(enc);
 		}
 
@@ -2232,8 +2228,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
 
-	if ((disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) ||
-	    (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE))
+	if (disp_info->intf_type != DRM_MODE_ENCODER_VIRTUAL)
 		dpu_enc->idle_pc_supported =
 				dpu_kms->catalog->caps->has_idle_pc;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 781d41c91994..861870ac8ae7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -21,19 +21,19 @@
 /**
  * struct msm_display_info - defines display properties
  * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
+ * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
  * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
  *				 used instead of panel TE in cmd mode panels
  * @dsc:		DSC configuration data for DSC-enabled displays
  */
 struct msm_display_info {
 	int intf_type;
-	uint32_t capabilities;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_cmd_mode;
 	bool is_te_using_watchdog_timer;
 	struct msm_display_dsc_config *dsc;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f89dcb903869..7a40cfa9b09e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -584,9 +584,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		}
 
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
-			MSM_DISPLAY_CAP_CMD_MODE :
-			MSM_DISPLAY_CAP_VID_MODE;
+		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
 		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
 
@@ -639,7 +637,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
-		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
 		info.intf_type = encoder->encoder_type;
 		rc = dpu_encoder_setup(dev, encoder, &info);
 		if (rc) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2ba57c575e13..eb23377b6e57 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -61,16 +61,6 @@ enum msm_dp_controller {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
-/**
- * enum msm_display_caps - features/capabilities supported by displays
- * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported
- * @MSM_DISPLAY_CAP_CMD_MODE:           Command mode supported
- */
-enum msm_display_caps {
-	MSM_DISPLAY_CAP_VID_MODE	= BIT(0),
-	MSM_DISPLAY_CAP_CMD_MODE	= BIT(1),
-};
-
 /**
  * enum msm_event_wait - type of HW events to wait for
  * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
-- 
2.35.1

