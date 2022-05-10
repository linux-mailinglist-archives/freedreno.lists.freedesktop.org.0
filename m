Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE2522548
	for <lists+freedreno@lfdr.de>; Tue, 10 May 2022 22:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3450410E900;
	Tue, 10 May 2022 20:14:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA7510F1B9
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 20:14:03 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d25so96680pfo.10
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUzehr5/WVjL8qU2Hhmc4z1UOFK/igoFfwz7SYv3SuU=;
 b=FK/uP2sqm4PA+iTuTOw9AHlnxLeLvs/2DmFJjZLlevCJ0Os/8Ujbb3/YC/pvOZsdOy
 EGV440Vp4/1/E6YECIBaKnkqtGYVEHdAKOM5nB8H5VCLOQxC/guqkvRpnPOucq1azu5G
 H3sTB/LkQLnn/UUjLSL3LzZCHo8Z82aa5CLxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUzehr5/WVjL8qU2Hhmc4z1UOFK/igoFfwz7SYv3SuU=;
 b=ZmtD/yJ2Yt0v3CnQsMbiodivK/a+Es+uUwzg7Oi6F5ciHQG78WKOphalRDRMal2vjg
 KBBarMJz0QCmLHBFjvlHO1mMy3FB5iYlXFoBmNLaArRRz8cjFUW56/PE02rkxAblBO6s
 5u5SdSPUmZCgBIPnS/BbFuMx4XZ4+Q9O8iCZ2M5jNwdqMYJWTLWbq61a2uBr4lRxq7iX
 1u1ImJxZf/LE3Edr4yU5WVYbZcM7zOONIsyuoa4ti7fFQgbnlzezanXf79migx4/1oZ0
 fa15+eAC95YORMCaSAAckFje2iPlDjST7Yx+uKl2TLVBb/Y+on5HZvByCpagsSDUuCdf
 Yvug==
X-Gm-Message-State: AOAM532HGUTR7SJhHIe9iQBezFwQ/ykn5mhWh8oOmRSJTKkVlWQvONhJ
 rtfzLgos/8zSZYHTHgaMFNRkqQ==
X-Google-Smtp-Source: ABdhPJw1DnT71ONYuAfGck1I9ifq2RpS3pd461/n3OJS5+buAJwc493OLPwnPeGsVXsyy6glR2bqxA==
X-Received: by 2002:a62:1d09:0:b0:50d:fa91:a4c5 with SMTP id
 d9-20020a621d09000000b0050dfa91a4c5mr22174472pfd.25.1652213642912; 
 Tue, 10 May 2022 13:14:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902704800b0015e8d4eb247sm26605plt.145.2022.05.10.13.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 13:14:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Tue, 10 May 2022 13:13:33 -0700
Message-Id: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
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
Cc: quic_sbillaka@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 quic_khsieh@quicinc.com, robdclark@gmail.com, tzimmermann@suse.de,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The drm_helper_probe_single_connector_modes() is a bit long. Let's
break a chunk off to update and validate modes. This helps avoid one
goto and also will allow us to more easily call the helper a second
time in a future patch without adding looping or another goto.

This change is intended to be a no-op change--just code movement.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v2:
- Two underscores for __drm_helper_update_and_validate().
- Return err and use WARN_ON instead of returning a bool.

 drivers/gpu/drm/drm_probe_helper.c | 107 ++++++++++++++++-------------
 1 file changed, 61 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..ff3dd9a5da70 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -354,6 +354,61 @@ drm_helper_probe_detect(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
+static int __drm_helper_update_and_validate(struct drm_connector *connector,
+					    uint32_t maxX, uint32_t maxY,
+					    struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode;
+	int mode_flags = 0;
+	int ret;
+
+	drm_connector_list_update(connector);
+
+	if (connector->interlace_allowed)
+		mode_flags |= DRM_MODE_FLAG_INTERLACE;
+	if (connector->doublescan_allowed)
+		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
+	if (connector->stereo_allowed)
+		mode_flags |= DRM_MODE_FLAG_3D_MASK;
+
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_driver(dev, mode);
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_size(mode, maxX, maxY);
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_flag(mode, mode_flags);
+		if (mode->status != MODE_OK)
+			continue;
+
+		ret = drm_mode_validate_pipeline(mode, connector, ctx,
+						 &mode->status);
+		if (ret) {
+			drm_dbg_kms(dev,
+				    "drm_mode_validate_pipeline failed: %d\n",
+				    ret);
+
+			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK))
+				mode->status = MODE_ERROR;
+			else
+				return -EDEADLK;
+		}
+
+		if (mode->status != MODE_OK)
+			continue;
+		mode->status = drm_mode_validate_ycbcr420(mode, connector);
+	}
+
+	return 0;
+}
+
 /**
  * drm_helper_probe_single_connector_modes - get complete set of display modes
  * @connector: connector to probe
@@ -421,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	const struct drm_connector_helper_funcs *connector_funcs =
 		connector->helper_private;
 	int count = 0, ret;
-	int mode_flags = 0;
 	bool verbose_prune = true;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
@@ -519,52 +573,13 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			   connector->status == connector_status_unknown))
 		count = drm_add_modes_noedid(connector, 1024, 768);
 	count += drm_helper_probe_add_cmdline_mode(connector);
-	if (count == 0)
-		goto prune;
-
-	drm_connector_list_update(connector);
-
-	if (connector->interlace_allowed)
-		mode_flags |= DRM_MODE_FLAG_INTERLACE;
-	if (connector->doublescan_allowed)
-		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
-	if (connector->stereo_allowed)
-		mode_flags |= DRM_MODE_FLAG_3D_MASK;
-
-	list_for_each_entry(mode, &connector->modes, head) {
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_driver(dev, mode);
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_size(mode, maxX, maxY);
-		if (mode->status != MODE_OK)
-			continue;
-
-		mode->status = drm_mode_validate_flag(mode, mode_flags);
-		if (mode->status != MODE_OK)
-			continue;
-
-		ret = drm_mode_validate_pipeline(mode, connector, &ctx,
-						 &mode->status);
-		if (ret) {
-			drm_dbg_kms(dev,
-				    "drm_mode_validate_pipeline failed: %d\n",
-				    ret);
-
-			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK)) {
-				mode->status = MODE_ERROR;
-			} else {
-				drm_modeset_backoff(&ctx);
-				goto retry;
-			}
+	if (count != 0) {
+		ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&ctx);
+			goto retry;
 		}
-
-		if (mode->status != MODE_OK)
-			continue;
-		mode->status = drm_mode_validate_ycbcr420(mode, connector);
+		WARN_ON(ret);
 	}
 
 prune:
-- 
2.36.0.550.gb090851708-goog

