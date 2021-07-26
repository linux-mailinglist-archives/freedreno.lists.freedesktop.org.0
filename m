Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE103D6A13
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 01:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9B36EA2C;
	Mon, 26 Jul 2021 23:15:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119A36EA26
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 23:15:42 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so10655133ott.9
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 16:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMU3dlNhHc2GMbUZbls+/71C5/GmwZOSbo7SVTlRAII=;
 b=SrG2N5ee7wquGKS/862qxUTzO2dKuqeTGjZPhO2vDmpyz9CVonrM3b0AeITcFeUF0R
 nxV4P7inceNPdw9ot1cdNIevGjAdU2t4ErvoBTzBb0ZioMgm8OteeqEbwHGte3Wyv07L
 tegS1YfM34a1398S69XYI5WSLkI1OKTVMA+2T9XlpqwvOqW/9to9tmh8VtLVCAvqf6g5
 qc8mU1gFCDARhCm/A2dHENlXeZBB2iSYhBu/3JUb79EJLjmoK5c3+ZsSErTXnpkYAYDW
 pdwnmOdg65hpHzev1PagDul17VbBEunNoJfq5El08Q39O5LyBgTDXiGXaCFbNySB7MM4
 o+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMU3dlNhHc2GMbUZbls+/71C5/GmwZOSbo7SVTlRAII=;
 b=GKb/c+gmEZNHFvZw5y8A/IXfzsHDcFtA8jVsXd3+Egfe117RW9B3ICJ/z19vS7iI/A
 VV58Nx1fkf/ngAMWJPi2GmHQu/xOalna1sVWo4feZwC9TtHVpSK+R5D/oQgGtfkYipX6
 NCIfTURW9O+IiWzqvm+zPjHplnpPBHa2gksfP2apRdDkBN1trdpPUAoJ12rzEDJk129N
 8sFiP2N3o+XKU1qE/XD5giQf4b30zBATRSinVhPEB7bvqLbYbU10KOyXaxXBQL1iI5bA
 yjrxaY39CTfzrFl+FWWMzxdsKSeD6BPGGKnnIuaRNQToRHr/vk+ZaE1WX2x48EFUWbEL
 c/1A==
X-Gm-Message-State: AOAM530Cz2RfAW+g01ugeodOs+pdUkikl8xlosLykl0BOHRKBs7AmrZr
 1fpfLt4V9Jgej55qsLl5OlvEUw==
X-Google-Smtp-Source: ABdhPJws9wE+8uZqQrov+1Rz2BhcJsfTiMLaHYXyp24fHfRn/SZMw1Hbn5X3FBjtd0yMFhvFlV6+qQ==
X-Received: by 2002:a9d:1911:: with SMTP id j17mr13055960ota.70.1627341341218; 
 Mon, 26 Jul 2021 16:15:41 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n7sm260844otf.45.2021.07.26.16.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:15:40 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Jul 2021 16:13:51 -0700
Message-Id: <20210726231351.655302-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

eDP panels might need some power sequencing and backlight management,
so make it possible to associate a drm_panel with a DP instance and
prepare and enable the panel accordingly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This solves my immediate problem on my 8cx laptops, of indirectly controlling
the backlight during DPMS. But my panel is powered when I boot it and as such I
get the hpd interrupt and I don't actually have to deal with a power on
sequence - so I'm posting this as an RFC, hoping to get some input on these
other aspects.

If this is acceptable I'd be happy to write up an accompanying DT binding
change that marks port 2 of the DP controller's of_graph as a reference to the
attached panel.

 drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 19 +++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 206bf7806f51..1db5a3f752d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
+#include <drm/drm_panel.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -252,6 +253,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
+	dp->dp_display.drm_panel = dp->parser->drm_panel;
+
 	rc = dp_aux_register(dp->aux, drm);
 	if (rc) {
 		DRM_ERROR("DRM DP AUX register failed\n");
@@ -867,8 +870,10 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_prepare(struct msm_dp *dp)
+static int dp_display_prepare(struct msm_dp *dp_display)
 {
+	drm_panel_prepare(dp_display->drm_panel);
+
 	return 0;
 }
 
@@ -886,6 +891,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 	if (!rc)
 		dp_display->power_on = true;
 
+	drm_panel_enable(dp_display->drm_panel);
+
 	return rc;
 }
 
@@ -915,6 +922,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	if (!dp_display->power_on)
 		return 0;
 
+	drm_panel_disable(dp_display->drm_panel);
+
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -939,8 +948,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_display_unprepare(struct msm_dp *dp)
+static int dp_display_unprepare(struct msm_dp *dp_display)
 {
+	drm_panel_unprepare(dp_display->drm_panel);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 8b47cdabb67e..ce337824c95d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,6 +15,7 @@ struct msm_dp {
 	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	struct drm_panel *drm_panel;
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index fc8a6452f641..e6a6e9007bfd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -6,6 +6,7 @@
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
 #include "dp_parser.h"
@@ -276,6 +277,20 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
+static int dp_parser_find_panel(struct dp_parser *parser)
+{
+	struct device_node *np = parser->pdev->dev.of_node;
+	int rc;
+
+	rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
+	if (rc == -ENODEV)
+		rc = 0;
+	else if (rc)
+		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
+
+	return rc;
+}
+
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
@@ -297,6 +312,10 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
+	rc = dp_parser_find_panel(parser);
+	if (rc)
+		return rc;
+
 	/* Map the corresponding regulator information according to
 	 * version. Currently, since we only have one supported platform,
 	 * mapping the regulator directly.
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3266b529c090..994ca9336acd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -122,6 +122,7 @@ struct dp_parser {
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
+	struct drm_panel *drm_panel;
 
 	int (*parse)(struct dp_parser *parser);
 };
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
