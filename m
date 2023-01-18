Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA3671605
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37510E6EC;
	Wed, 18 Jan 2023 08:17:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A210E6D2
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qx13so22902287ejb.13
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iRO5zobwnMAf5ot44I6NAriyBvIWuLFOAUC1y5raCw=;
 b=HZ0zSZ3Z3w4RqLmp+bGcbuFXjMe+ULnoxR1lS71MHJONksERVhgeDH1V424TBBQWJF
 sQrGFe0DLBnnYuhLmPxAo+GROVgb0S9tFhLcTXOouTg3njsGzcf2mWRuRPreIPLy/8Nj
 hWr09acxJ9mTKpapcibGa6z4zblnnRuKg98zCLAKKIfCJriHQg2oYSUW/R3vD9XY5VKE
 RfaI3bDMRWkSI6JJ98y+mW8fooeVdRIKWJajxqG0tPBpeBSB7roANvEEqCcBuFwmx2Ho
 lEI8qEMRNEVdw9E9pggGWKt04Pa0pbu+QJysjebW62sKM/cEcbuxIwHcjbvHJRs8pXNP
 FI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iRO5zobwnMAf5ot44I6NAriyBvIWuLFOAUC1y5raCw=;
 b=g3hZjH7v5leaBzUWa9e7QNIWsiF9QBNiaER7OiGQMu32eebKzGKZAWi97CFjceo/bU
 8vxbR50h+d6S+1pNh7brGsWvWk9VaVOAfqgtbsTPRy2P91LEQzRzFZ37QaZQ28Fw92NX
 Q87LYo78Ob7Yj40K6tCKr1C3MzVJUeMgyCyu+Fxo5oj1mPh6FZPHk462v6i/N95wbEJ7
 g8vTbH7ptPIc8QTd/qVlm3Sxaz2yLH1jXAvNld2bC5L3pzv7OtydwEgHr9Xe/Pq/LL9b
 Jm3fHPNJ8ywtom7HGJWdC2iiq5Kh+RCwGxakv/n1zwPx64iZPN5zxAYC90YmPZVJ+DCO
 pU/Q==
X-Gm-Message-State: AFqh2krYJ1gg5CUGceeaN9Trpau6S4ANdohkQAVxSjXlSU0gVqRX7f/o
 MdwjylQyEGCjmBbYq+4J1loobA==
X-Google-Smtp-Source: AMrXdXscwnGp+t9+zLyWaTX06jajtPcXPCxyKDwib+i96HA+T/G9V6Wzq4cxmFXTV7bNN/guIvW9iQ==
X-Received: by 2002:a17:907:2c66:b0:7c4:f752:e959 with SMTP id
 ib6-20020a1709072c6600b007c4f752e959mr6847828ejc.33.1674029833247; 
 Wed, 18 Jan 2023 00:17:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:57 +0200
Message-Id: <20230118081658.2198520-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/13] drm/bridge: lt9611: stop filtering modes
 via the table
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The lt9611 bridge can support different modes, it makes no sense to list
them in the table. Drop the table and check the number of interfaces
using the fixed value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 49 ++++++-------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 82af1f954cc6..c2cd36d926a0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
 	.num_ranges = ARRAY_SIZE(lt9611_ranges),
 };
 
-struct lt9611_mode {
-	u16 hdisplay;
-	u16 vdisplay;
-	u8 vrefresh;
-	u8 lanes;
-	u8 intfs;
-};
-
-static struct lt9611_mode lt9611_modes[] = {
-	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
-	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
-	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
-	{ 1920, 1080, 24, 3, 1 },
-	{ 720, 480, 60, 4, 1 },
-	{ 720, 576, 50, 2, 1 },
-	{ 640, 480, 60, 2, 1 },
-};
-
 static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9611, bridge);
@@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
 	return 0;
 }
 
-static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
-		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
-		    lt9611_modes[i].vdisplay == mode->vdisplay &&
-		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
-			return &lt9611_modes[i];
-		}
-	}
-
-	return NULL;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
@@ -832,12 +799,20 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
 						     const struct drm_display_mode *mode)
 {
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (!lt9611_mode)
-		return MODE_BAD;
-	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+	if (mode->hdisplay > 3840)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > 2160)
+		return MODE_BAD_VVALUE;
+
+	if (mode->hdisplay == 3840 &&
+	    mode->vdisplay == 2160 &&
+	    drm_mode_vrefresh(mode) > 30)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 	else
 		return MODE_OK;
-- 
2.39.0

