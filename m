Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5D4ECFA2
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 00:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA610E666;
	Wed, 30 Mar 2022 22:30:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A5A10E8EF
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k21so38293715lfe.4
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqfEw4UqTCnx51jjs0rgqmjBtEaHi5KxWmkQyvq+0UI=;
 b=Fp8vb9sL3gbHXRVVg0GfGLJTnC7lAtdsgh9yjYXvnLHd+tuE91nd379l3kyO0ZWHp5
 ArGtPZ+7vAg2p9biYCYKIQWh1yl8hBhMqE9QDagljgveD5jR+xb27HFuUkWpKryCWdgM
 OXfSW/QYnfK2uU4bSPWDGh9ZBCsce+3qZGY/XngQFrj78Kq6nr85JGqSEYiZ6rGaBaNc
 memhjQIYTOBTqgYK9q0tSaaRYWSaWP9m4feks8HQb8WrMu5C6dx9OLnNX3/LxY+3YBva
 tpjQp6Ix3cDO4hY0A/4huk2ExHm7TgMtMfXL7dO7yIdtsOfBAHvbXNNLYzkymjjeobRl
 I0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqfEw4UqTCnx51jjs0rgqmjBtEaHi5KxWmkQyvq+0UI=;
 b=PBMj0329F1MIjnvyGyBL3kj0AmLYPK8AMyiMj/ECexBHzd8JdDunG2T+Lhyr6zMgd8
 JgUV71gmeY4HOwuw/cxlf3PUQ21TvSOhYPKbXlQM0hCXboshqFi1yVrlfi9XP3V7NsZX
 g7fhtV0PhkJ/qjlZ4oEFHyGTQc1U9RnyjCjnqrsUELZddBZsS+5GXh3oNCI0aZMQppWi
 25DsJThKkMG4sNbJI6ywb/Jf52LPWQK7G3h6aogmL2WRM7ryl9ZqSY2GbAb47NfBL75A
 GojXOjpNGhsoUaLyNJTW8aBhEr6dQ8dDu5olLs8xqW8PbpHKIA0eHNiIcMcNnmwt3Lww
 W5ag==
X-Gm-Message-State: AOAM531hVyWsZamdJTOL6LsOHaqyRCgut4OSMMAycsRa5bU0cVOCTeCt
 7YYhj6TEc4anEWIrYBZgTUYANA==
X-Google-Smtp-Source: ABdhPJxCu2GlcJuX2nxX8bCqtGn2nIFNzbSm/5H2yFUYt8PEWzpIkA0t76lNSNR7FWc/DDx0UeG7Pg==
X-Received: by 2002:a05:6512:3c9a:b0:44a:27db:632b with SMTP id
 h26-20020a0565123c9a00b0044a27db632bmr8325427lfv.625.1648679411397; 
 Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Thu, 31 Mar 2022 01:30:06 +0300
Message-Id: <20220330223008.649274-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/4] drm/msm/dp: simplify
 dp_connector_get_modes()
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since dp_panel_get_modes() handling for dp_mode was removed,
dp_display_get_modes also doesn't change the passed dp_mode, drop the
unused dp_mode variable being allocated unused and then freed.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 29 +----------------------------
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3dd790083cf7..93cdc4ebcf43 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -999,11 +999,9 @@ int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 	return MODE_OK;
 }
 
-int dp_display_get_modes(struct msm_dp *dp,
-				struct dp_display_mode *dp_mode)
+int dp_display_get_modes(struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
-	int ret = 0;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
@@ -1012,11 +1010,8 @@ int dp_display_get_modes(struct msm_dp *dp,
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	ret = dp_panel_get_modes(dp_display->panel,
+	return dp_panel_get_modes(dp_display->panel,
 		dp->connector);
-	if (dp_mode->drm_mode.clock)
-		dp->max_pclk_khz = dp_mode->drm_mode.clock;
-	return ret;
 }
 
 bool dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7af2b186d2d9..6efb5c853c89 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,8 +33,7 @@ struct msm_dp {
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
-int dp_display_get_modes(struct msm_dp *dp_display,
-		struct dp_display_mode *dp_mode);
+int dp_display_get_modes(struct msm_dp *dp_display);
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..af5f1b001192 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -55,49 +55,22 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 {
 	int rc = 0;
 	struct msm_dp *dp;
-	struct dp_display_mode *dp_mode = NULL;
-	struct drm_display_mode *m, drm_mode;
 
 	if (!connector)
 		return 0;
 
 	dp = to_dp_connector(connector)->dp_display;
 
-	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
-	if (!dp_mode)
-		return 0;
-
 	/* pluggable case assumes EDID is read when HPD */
 	if (dp->is_connected) {
-		/*
-		 *The get_modes() function might return one mode that is stored
-		 * in dp_mode when compliance test is in progress. If not, the
-		 * return value is equal to the total number of modes supported
-		 * by the sink
-		 */
-		rc = dp_display_get_modes(dp, dp_mode);
+		rc = dp_display_get_modes(dp);
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-			kfree(dp_mode);
 			return rc;
 		}
-		if (dp_mode->drm_mode.clock) { /* valid DP mode */
-			memset(&drm_mode, 0x0, sizeof(drm_mode));
-			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
-			m = drm_mode_duplicate(connector->dev, &drm_mode);
-			if (!m) {
-				DRM_ERROR("failed to add mode %ux%u\n",
-				       drm_mode.hdisplay,
-				       drm_mode.vdisplay);
-				kfree(dp_mode);
-				return 0;
-			}
-			drm_mode_probed_add(connector, m);
-		}
 	} else {
 		DRM_DEBUG_DP("No sink connected\n");
 	}
-	kfree(dp_mode);
 	return rc;
 }
 
-- 
2.35.1

