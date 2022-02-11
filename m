Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E5D4B30DB
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 23:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED710EBAA;
	Fri, 11 Feb 2022 22:40:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BED10EBA9
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z19so19163336lfq.13
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MuToI+AtPTkDW3n8E622FciNL++kHbqA2jvYbU4GMc=;
 b=Is77PA2GuHi1v0TsAP/eKKC0RAIj1Gu2uqklot7h9Qg5jFPP6/JiQwb3etMeiVCNHS
 TMNh23Z0bOzBjwkvLfB2eHC5P/zGH69inkDyaFilqwuyvWpMKEagZtvwrAvhcg5KVE8l
 nqIW6EvQJbXsl0H8oGuwBUsy1QABBkb8sVlciPZTirkV9+iNgGxlrp4dZtst2JE9gN6Y
 1/ENQwJmUrg+b9sHbZWTbdoJ1o6D5PpkOwFsihWbXp43+m1lEcwYTe5IZ3PwBfQaDqVK
 vFMlGafAvc8Njf36SB1Rvjqu+HEc6fK8pVS5Dl1JbBOCwCbiiu0j4siBdD2avLDewRLH
 InIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MuToI+AtPTkDW3n8E622FciNL++kHbqA2jvYbU4GMc=;
 b=0v5NGX8cdd9lkTHsHWmjrsTPqxPmz5yDxzVeU8VcMu1CNjyUsB3oon9/HnVDzhCn0D
 HxnD09MEnyyHFim2Ml8XAp0oZL/J0F+8BxzcZZGVC7mgREERCdavIa31DAwgtaztK7wm
 oIUhRClb4yUrVR5a6ZRvWHH2rJlQXqq9dz99UAef2eTqUo8gXH3BFirQmS0Wq53AFlD6
 RliFWoLCvAXGW3kujh61SmrO8QlJIJiWspC3F26AjsnahfnLJ5WXYMAsmL4awACNhf/X
 iON4+2fuGwWF0t+iAMrDqJ56VapV9loK/DHrzRikS7EplTrGu0sgwbeZ3ub0dKBMACjl
 a02w==
X-Gm-Message-State: AOAM5318IsgdsiNQT3XZn8Ud1lwq3wMKhudjAaJhm0bStIssuiqTjucK
 lIvIL0syDznThazdW96FYCkg+A==
X-Google-Smtp-Source: ABdhPJx2W+09oTWn5ekIlv65NXgZdgkKiQsc5AtA+Bj3byku10MuWwhxeINzJ3H9sda6/avRM6U+aQ==
X-Received: by 2002:a05:6512:3186:: with SMTP id
 i6mr2700451lfe.47.1644619209016; 
 Fri, 11 Feb 2022 14:40:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Sat, 12 Feb 2022 01:40:03 +0300
Message-Id: <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 2/5] drm/msm/dp: support attaching
 bridges to the DP encoder
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently DP driver will allocate panel bridge for eDP panels. This
supports only the following topology:

- eDP encoder ⇒ eDP panel (wrapped using panel-bridge)

Simplify this code to just check if there is any next bridge in the
chain (be it a panel bridge or regular bridge). Rename panel_bridge
field to next_bridge accordingly.

This allows one to use e.g. one of the following display topologies:

- eDP encoder ⇒ ptn3460 ⇒ fixed LVDS panel
- eDP encoder ⇒ ptn3460 ⇒ LVDS connector with EDID lines for panel autodetect
- eDP encoder ⇒ ptn3460 ⇒ THC63LVD1024 ⇒ DPI panel.
- eDP encoder ⇒ LT8912 ⇒ DSI panel

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_parser.c  | 31 +++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 44d42c76c2a3..45f9a912ecc5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -266,7 +266,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
+	dp->dp_display.next_bridge = dp->parser->next_bridge;
 
 	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e3adcd578a90..7af2b186d2d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,7 +16,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 26ef41a4c1b6..80f59cf99089 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -236,9 +236,9 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
-	if (dp_display->panel_bridge) {
+	if (dp_display->next_bridge) {
 		rc = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, bridge,
+					dp_display->next_bridge, bridge,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index a7acc23f742b..901d7967370f 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -265,23 +265,16 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_find_panel(struct dp_parser *parser)
+static int dp_parser_find_next_bridge(struct dp_parser *parser)
 {
 	struct device *dev = &parser->pdev->dev;
-	struct drm_panel *panel;
-	int rc;
+	struct drm_bridge *bridge;
 
-	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (rc) {
-		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
-		return rc;
-	}
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(parser->panel_bridge)) {
-		DRM_ERROR("failed to create panel bridge\n");
-		return PTR_ERR(parser->panel_bridge);
-	}
+	parser->next_bridge = bridge;
 
 	return 0;
 }
@@ -307,10 +300,18 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 	if (rc)
 		return rc;
 
+	/*
+	 * Currently we support external bridges only for eDP connectors.
+	 *
+	 * No external bridges are expected for the DisplayPort connector,
+	 * it is physically present in a form of a DP or USB-C connector.
+	 */
 	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
-		rc = dp_parser_find_panel(parser);
-		if (rc)
+		rc = dp_parser_find_next_bridge(parser);
+		if (rc) {
+			DRM_ERROR("DP: failed to find next bridge\n");
 			return rc;
+		}
 	}
 
 	/* Map the corresponding regulator information according to
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3172da089421..4cec851e38d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -123,7 +123,7 @@ struct dp_parser {
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 
 	int (*parse)(struct dp_parser *parser, int connector_type);
 };
-- 
2.34.1

