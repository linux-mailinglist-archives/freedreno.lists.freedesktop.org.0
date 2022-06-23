Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB2556F64
	for <lists+freedreno@lfdr.de>; Thu, 23 Jun 2022 02:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413201135EF;
	Thu, 23 Jun 2022 00:25:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B421135F5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 00:25:45 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id n12so10609364pfq.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 17:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6qSawmSOE0g+G17lDgx8kU+lzdqvSemPlHNSvMb5tk=;
 b=XnyGlbS4vaapAKkhYTqyVkESDe7A7zE3gMtloSytSjGCJjuxi7PKhdvHfq6P4jhwCH
 d4G7oo1AUOHBClCaK2fUkM2s3/1vjeBgoRK20vMDuV05YCxkgXVOFp5tvDu2afEs5CPo
 2P/vjlTxTEkviTte3/Rq38O86AVdmxyNqwXhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6qSawmSOE0g+G17lDgx8kU+lzdqvSemPlHNSvMb5tk=;
 b=j/qFtByXlu7bX5eMY1F8SXbgf9UVt7naqws4xPWEuFPgN7xw7fFjrPYvklP02atOMK
 AY/qtysDrjAvLuHiB+nUaZCKVDNo8TlI8ACMQPfHJ7mnf/2aj6FDds1/pohLEPXoSlZ9
 b/VNcBtH0K0YwTzANe3yJ3b4/Q78IGii7Y+WeMiEGTGqjdfHuf3y4vFs3NcTmomQ6cD2
 I5ooQ+JZBPCFLHY97nmDIwv77eiHfom8lI/0IXIhqSWrzevR1koHpmG3PPA3a/Dm3fLY
 MgQIC85iJ8+mXvNKMYyPNYZgatl7672wREoQlte+LiUvioiAHXjY7gYh+J4dtHWiLo6R
 p/qg==
X-Gm-Message-State: AJIora8OoL+5qaxlHD7vSDJmCR7w+YaImtKbcfcaZzB533CMFi/IWK1T
 IhTAD7h0ktH1PgaPt/CqLnSfog==
X-Google-Smtp-Source: AGRyM1sgkJVP/5fHJ7JoP3ZxYX7bmkjH/csMdww5Is6SN+y0K2vNw3Jg0vNS/CskM7SJcGXx3NttBA==
X-Received: by 2002:a63:6205:0:b0:40d:2af5:3c8a with SMTP id
 w5-20020a636205000000b0040d2af53c8amr4774656pgb.437.1655943945267; 
 Wed, 22 Jun 2022 17:25:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f28c:6f86:743c:1c04])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903024100b00163fbb1eec5sm13332705plh.229.2022.06.22.17.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 17:25:44 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Jun 2022 17:25:39 -0700
Message-Id: <20220623002540.871994-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220623002540.871994-1-swboyd@chromium.org>
References: <20220623002540.871994-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/dp: Remove pixel_rate from
 struct dp_ctrl
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This struct member is stored to in the function that calls the function
which uses it. That's possible with a function argument instead of
storing to a struct member. Pass the pixel_rate as an argument instead
to simplify the code. Note that dp_ctrl_link_maintenance() was storing
the pixel_rate but never using it so we just remove the assignment from
there.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

dp_ctrl_on_link() almost doesn't even use the pixel_clk either. It just
prints the value. I kept it around because maybe it is useful? But if
not, then we can remove even more code.

 drivers/gpu/drm/msm/dp/dp_ctrl.c | 60 ++++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h |  1 -
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index bd445e683cfc..feb26d4d6e97 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1357,25 +1357,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
-	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
-		ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
-
-	return ret;
-}
-
-static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
-{
-	int ret = 0;
-
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
-					ctrl->dp_ctrl.pixel_rate * 1000);
-
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
-	if (ret)
-		DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);
-
-	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
-			ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "link rate=%d\n", ctrl->link->link_params.rate);
 
 	return ret;
 }
@@ -1517,8 +1499,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-
 	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
 	if (ret)
 		goto end;
@@ -1588,14 +1568,16 @@ static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
 {
 	int ret;
 	struct dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
 
-	ret = dp_ctrl_enable_stream_clocks(ctrl);
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
 	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
 		return ret;
 	}
 
@@ -1704,11 +1686,12 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
 	struct dp_ctrl_private *ctrl;
-	u32 rate = 0;
+	u32 rate;
 	int link_train_max_retries = 5;
 	u32 const phy_cts_pixel_clk_khz = 148500;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned int training_step;
+	unsigned long pixel_rate;
 
 	if (!dp_ctrl)
 		return -EINVAL;
@@ -1716,25 +1699,24 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	rate = ctrl->panel->link_info.rate;
+	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
 				"using phy test link parameters\n");
-		if (!ctrl->panel->dp_mode.drm_mode.clock)
-			ctrl->dp_ctrl.pixel_rate = phy_cts_pixel_clk_khz;
+		if (!pixel_rate)
+			pixel_rate = phy_cts_pixel_clk_khz;
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			ctrl->panel->link_info.num_lanes;
-		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 	}
 
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
-		ctrl->dp_ctrl.pixel_rate);
-
+		pixel_rate);
 
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
@@ -1836,6 +1818,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
 	unsigned long pixel_rate_orig;
 
 	if (!dp_ctrl)
@@ -1843,15 +1826,14 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
 
-	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
 	if (dp_ctrl->wide_bus_en)
-		ctrl->dp_ctrl.pixel_rate >>= 1;
+		pixel_rate >>= 1;
 
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
 		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
+		ctrl->link->link_params.num_lanes, pixel_rate);
 
 	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
 		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
@@ -1861,9 +1843,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 		}
 	}
 
-	ret = dp_ctrl_enable_stream_clocks(ctrl);
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
 	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
 		goto end;
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b563e2e3bfe5..9f29734af81c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,7 +16,6 @@
 struct dp_ctrl {
 	bool orientation;
 	atomic_t aborted;
-	u32 pixel_rate;
 	bool wide_bus_en;
 };
 
-- 
https://chromeos.dev

