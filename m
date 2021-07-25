Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF93D4BAA
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B2D73049;
	Sun, 25 Jul 2021 04:26:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665DA737F8
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:26 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso5600305ota.13
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLIpHKwFlMuHXbvXnn7lcDZQY67Dtyth80Io278/rNM=;
 b=Y5Ai3brq2K5DR9ucCChonXVGTYduqDK3BdwGhM+jz9Ia7mWW/pfsXoLJlGBGub9YMj
 597wrEKirFSD62Uilrms59MVw4H1IEdmgSKKDlBEsnQy9tQssrIZ/E06F550Co+vWe43
 80trfKhcDXDxpZgCUfS2fJaIVmfDTrZafaByjJ5siMB2vTXDpehT77Pi6sKqeQuyBYZ3
 poLBWGeYRrHvYSp5qnGIaHDqLUUbjS/TRukyigXGtnaQo4VJ3Okp2Fxqja1y/KZptR+S
 Xtn2wPZI4D1aqfjk+7Gbpd4LdEw8j8eN/Calx78ZIw3U6yC7HwfviI/nHqC/pPTSifj4
 fhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLIpHKwFlMuHXbvXnn7lcDZQY67Dtyth80Io278/rNM=;
 b=gOrdvpCF7i/qzdzjzWj2NkwERa3JY1wSaRGrw6ShIFvnPTgFoNew/UfCl9Kbtmlw7s
 FxW0qLNAsuRFN354C25eu/QnJ/ZfnhBQSLjfrJ48A8zjZcfv3BMluyKAD5ViIVjxJFwy
 mbusYqxxGqKl05cl61pKsMo0M5pkq/9r2q8OkcDeWmWNf6X5qIop1VLV41DZPUmRTT55
 Rij6llARNkJFVH9LilYXi9LGcGSDcJhUUmwTYVSCahPaDisn18JWAVvZX8rWoW8p77eC
 wuOnA4BZDlYE2LiERc8pjfLCeHtPqGjXFmri7lfwrJk7mgJA/6kNDVkdppiejokVYLOr
 DyhQ==
X-Gm-Message-State: AOAM533Xxtg+uxGQHS4OvgJ0S5H+KHWgKses8aN7KDYgKO9SGse7ek6u
 UQa2fBLTFmpGdkRQj0reO1kvqw==
X-Google-Smtp-Source: ABdhPJyeN1G9YfFLpWScjFsEnbMYVbrcJYDddgLmpUj1BYLkBpR0btwUuyuvVdz0UhFCbA8QVx3HoA==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr8228160otb.257.1627187185599; 
 Sat, 24 Jul 2021 21:26:25 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Date: Sat, 24 Jul 2021 21:24:32 -0700
Message-Id: <20210725042436.3967173-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/5] drm/msm/dp: Modify prototype of encoder
 based API
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Functions in the DisplayPort code that relates to individual instances
(encoders) are passed both the struct msm_dp and the struct drm_encoder. But
in a situation where multiple DP instances would exist this means that
the caller need to resolve which struct msm_dp relates to the struct
drm_encoder at hand.

The information for doing this lookup is available inside the DP driver,
so update the API to take the struct msm_drm_private and the struct
drm_encoder and have the DP code figure out which struct msm_dp the
operation relates to.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++----
 drivers/gpu/drm/msm/dp/dp_display.c         | 38 +++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h               | 31 +++++++++--------
 3 files changed, 56 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c04b7cce43e..0d64ef0819af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1002,8 +1002,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
-		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
+		msm_dp_display_mode_set(priv, drm_enc, mode, adj_mode);
 
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
@@ -1184,9 +1184,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		ret = msm_dp_display_enable(priv->dp,
-						drm_enc);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		ret = msm_dp_display_enable(priv, drm_enc);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
 				ret);
@@ -1226,8 +1225,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_pre_disable(priv, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
 	}
 
@@ -1255,8 +1254,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_disable(priv, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8696b36d30e4..59ffd6c8f41f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1432,12 +1432,25 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
+static struct msm_dp *msm_dp_from_drm_encoder(struct msm_drm_private *priv,
+					      struct drm_encoder *encoder)
+{
+	if (priv->dp && priv->dp->encoder == encoder)
+		return priv->dp;
+
+	return NULL;
+}
+
+int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *encoder)
 {
 	int rc = 0;
 	struct dp_display_private *dp_display;
+	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
 	u32 state;
 
+	if (!dp)
+		return -EINVAL;
+
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	if (!dp_display->dp_mode.drm_mode.clock) {
 		DRM_ERROR("invalid params\n");
@@ -1489,9 +1502,13 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return rc;
 }
 
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+int msm_dp_display_pre_disable(struct msm_drm_private *priv, struct drm_encoder *encoder)
 {
 	struct dp_display_private *dp_display;
+	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
+
+	if (!dp)
+		return 0;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
@@ -1500,11 +1517,15 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return 0;
 }
 
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+int msm_dp_display_disable(struct msm_drm_private *priv, struct drm_encoder *encoder)
 {
 	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
+	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
+
+	if (!dp)
+		return 0;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
@@ -1531,11 +1552,16 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return rc;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+void msm_dp_display_mode_set(struct msm_drm_private *priv,
+			     struct drm_encoder *encoder,
+			     struct drm_display_mode *mode,
+			     struct drm_display_mode *adjusted_mode)
 {
 	struct dp_display_private *dp_display;
+	struct msm_dp *dp = msm_dp_from_drm_encoder(priv, encoder);
+
+	if (!dp)
+		return;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9bfd37855969..e9232032b266 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -388,12 +388,13 @@ int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
+int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *encoder);
+int msm_dp_display_disable(struct msm_drm_private *priv, struct drm_encoder *encoder);
+int msm_dp_display_pre_disable(struct msm_drm_private *priv, struct drm_encoder *encoder);
+void msm_dp_display_mode_set(struct msm_drm_private *priv,
+			     struct drm_encoder *encoder,
+			     struct drm_display_mode *mode,
+			     struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -413,25 +414,25 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 {
 	return -EINVAL;
 }
-static inline int msm_dp_display_enable(struct msm_dp *dp,
+static inline int msm_dp_display_enable(struct msm_drm_private *priv,
 					struct drm_encoder *encoder)
 {
 	return -EINVAL;
 }
-static inline int msm_dp_display_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
+static inline int msm_dp_display_disable(struct msm_drm_private *priv,
+					 struct drm_encoder *encoder)
 {
 	return -EINVAL;
 }
-static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
+static inline int msm_dp_display_pre_disable(struct msm_drm_private *priv,
+					     struct drm_encoder *encoder)
 {
 	return -EINVAL;
 }
-static inline void msm_dp_display_mode_set(struct msm_dp *dp,
-				struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+static inline void msm_dp_display_mode_set(struct msm_drm_private *priv,
+					   struct drm_encoder *encoder,
+					   struct drm_display_mode *mode,
+					   struct drm_display_mode *adjusted_mode)
 {
 }
 
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
