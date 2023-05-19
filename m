Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91616708DCC
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 04:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAFB10E5A2;
	Fri, 19 May 2023 02:30:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA3110E59F
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 02:30:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac82912a59so29810501fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463414; x=1687055414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRL3ED7rnRtKkU/Whzxt4K62gpSR8Bz4TaoCYNquEAU=;
 b=qEtbP7tky9pphoIqfnEKtd9EtqBNQV5glCeZe9slDMIbcX3x4Y/hT8Uru6cwSiNXSO
 y/msDL9cf7M1mNOPdyJ7vrAW9ZRMQ0YsEmdlMQpMyrfaPvV0ZO7b32N5dH+iDKN/jboo
 kD5eWCWXNhzb09AcWfzfah/KnC7Gagjy90xIWb3pAwhKhuN1qHtug3PJ1lzgFAGtrZxY
 p+RMwVsrAkzpyKH18iyP/mz+bknUBajdnWUrf9QZ1v6DmrW0IDNxTV3+3jKYuX2peBLj
 Ei33e8TIsslRJKldEtVa0w8A80J0e5OjqqqQAEBpxi7oumx/LQcqAYWzckRm5yqi+YvF
 IkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463414; x=1687055414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRL3ED7rnRtKkU/Whzxt4K62gpSR8Bz4TaoCYNquEAU=;
 b=M/sVa/zrL8HwnpHQ3ygIdHTr6hmepE5tp6b3k+L//Khh9PQDybXiBTtI2BueJK4KEJ
 EBunzro18/KCl6dtkmFvGtSrt2ALhUIdwtkaScGG5eNbcz2Jqmq8JxGXVoQdW5Pok7zn
 4bwmV4kALsPiO950yCSbupsfVSWXUvOLmun8JZx1I8pZFHFzwE5hRQE0itIU6aPaKy37
 wLZ+oqWER5kSXlztYXEPcxRIeHtP6uNrzkBc/YjiM2ri+ptczd6D2nvD6df9wiC4QKqE
 sBFmwipt/yOTqG0PnUR572OecagKbeGl2L9itzyGjiK0U58YjMVn07blgnGrPF8eKmlU
 AT4g==
X-Gm-Message-State: AC+VfDwhFgE/mCrlqctm5kfB/6bUmMopbC9Df2dyhDGctM5UbECRA2lJ
 cA9SUqrEP1RjYy0KHHAZCgHSzg==
X-Google-Smtp-Source: ACHHUZ6/qZMNE1FJT+MzJw8C0K9bE86fStWbDfNCPnwMXMaJBcda8Cqh0E8YHtPeQu00bCaRG1Jzmg==
X-Received: by 2002:a2e:a3c5:0:b0:2ae:e214:482f with SMTP id
 w5-20020a2ea3c5000000b002aee214482fmr103167lje.52.1684463414306; 
 Thu, 18 May 2023 19:30:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:30:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 05:30:10 +0300
Message-Id: <20230519023011.3837868-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
References: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: move writeback's atomic_check
 to dpu_writeback.c
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

dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
Move corresponding checks to drm_writeback_connector's implementation
and drop the dpu_encoder_phys_wb_atomic_check() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 4 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e14646c0501c..e73d5284eb2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -225,59 +225,6 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
- * @phys_enc:	Pointer to physical encoder
- * @crtc_state:	Pointer to CRTC atomic state
- * @conn_state:	Pointer to connector atomic state
- */
-static int dpu_encoder_phys_wb_atomic_check(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
-
-	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
-
-	if (!conn_state || !conn_state->connector) {
-		DPU_ERROR("invalid connector state\n");
-		return -EINVAL;
-	} else if (conn_state->connector->status !=
-			connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n",
-				conn_state->connector->status);
-		return -EINVAL;
-	}
-
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
-	fb = conn_state->writeback_job->fb;
-
-	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
-			fb->width, fb->height);
-
-	if (fb->width != mode->hdisplay) {
-		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
-				mode->hdisplay);
-		return -EINVAL;
-	} else if (fb->height != mode->vdisplay) {
-		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
-				  mode->vdisplay);
-		return -EINVAL;
-	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
-		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
-				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
@@ -652,7 +599,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->destroy = dpu_encoder_phys_wb_destroy;
-	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 10bd0fd4ff48..78b8e7fc1de8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -661,8 +661,8 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
-	rc = dpu_writeback_init(dev, encoder, wb_formats,
-			n_formats);
+	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats,
+				dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
 		drm_encoder_cleanup(encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 2a5a68366582..7f345a5c8be3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_framebuffer.h>
 
 #include "dpu_writeback.h"
 
@@ -24,6 +25,57 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 			dev->mode_config.max_height);
 }
 
+static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
+				    struct drm_atomic_state *state)
+{
+	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = conn_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *fb;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->mode;
+
+	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
+		  connector->base.id, mode->name, mode->hdisplay, mode->vdisplay);
+
+	if (!conn_state || !conn_state->connector) {
+		DPU_ERROR("invalid connector state\n");
+		return -EINVAL;
+	} else if (conn_state->connector->status != connector_status_connected) {
+		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
+		return -EINVAL;
+	}
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb = conn_state->writeback_job->fb;
+
+	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id, fb->width, fb->height);
+
+	if (fb->width != mode->hdisplay) {
+		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width, mode->hdisplay);
+		return -EINVAL;
+	} else if (fb->height != mode->vdisplay) {
+		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height, mode->vdisplay);
+		return -EINVAL;
+	} else if (fb->width > dpu_wb_conn->maxlinewidth) {
+		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
+			  fb->width, dpu_wb_conn->maxlinewidth);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -59,12 +111,13 @@ static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
 
 static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
 	.get_modes = dpu_wb_conn_get_modes,
+	.atomic_check = dpu_wb_conn_atomic_check,
 	.prepare_writeback_job = dpu_wb_conn_prepare_job,
 	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
 };
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats)
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth)
 {
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
@@ -73,6 +126,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 
+	dpu_wb_conn->maxlinewidth = maxlinewidth;
+
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
 	/* DPU initializes the encoder and sets it up completely for writeback
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 5a75ea916101..4b11cca8014c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -18,6 +18,7 @@
 struct dpu_wb_connector {
 	struct drm_writeback_connector base;
 	struct drm_encoder *wb_enc;
+	u32 maxlinewidth;
 };
 
 static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
@@ -26,6 +27,6 @@ static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_conne
 }
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats);
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth);
 
 #endif /*_DPU_WRITEBACK_H */
-- 
2.39.2

