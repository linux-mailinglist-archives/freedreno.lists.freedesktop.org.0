Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25A66170D
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A310E20C;
	Sun,  8 Jan 2023 16:57:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4710E1FA
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:08 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f34so9500999lfv.10
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wA5AiX0NaM0jBANyKexsBLsA+hCFuPZNSNXMRY2+crg=;
 b=LOQ/BphYVdNvhnf/egBtgsBkeBq/iyUPPVmRYm/nO1Z2O/dLMm6P9a10dVL2LYVnhl
 ZJaYQRLfGZl/djnZfUvvq/IVtjk6wRfCAj1YyhM/95zVXPyEgzEnKUTme9I+SMhOZ9VN
 tqYXXkxjX/u2nBvR//SmiqFTaryGDHf3YJQTeg9FD4gShpUC1sMDNWs0Z21DtX0mthOm
 9TscPQaDvJVIComZkNhN1l6r+58zIS6bs3Lgcr54urTVgsypGbicAoC+XXHkmXKmZPQS
 0E/A4XmlBfPj4mMpIWhCrToNJ2cIJ3pOHxidxshz4NcgPlb6yfJkRMkeoBGOk7P/4Ygr
 h1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wA5AiX0NaM0jBANyKexsBLsA+hCFuPZNSNXMRY2+crg=;
 b=toYGKIRlP1EDZbzeZK1sjHd+2muYmk+ijC3GYsUwa4UczT0jAigMtt6aQPlOeF1a/b
 aGAAKZW2EGrd8/bjhoMywPOYBz85R7H29ZskqKuWG7i0J+X50rFjpppxjbDLCW+sS7JC
 jWoasptytKX6cyYJOHF1kX8FAoVtMWj+FPG/ffMRg74LsH//mds6VuxRhrPEI5ZQS7XA
 LubIVx562n31JSfX3rLl57KABEt3ZAMolTaaJ/oCmZMFUy1mbvE4QC7QRtw7cyPS7pyv
 Ndos5937lC9CrC+d8tbOiLr+Xgeoo8HViVCyg7J/EJ7IS/SfFv9LxuqsX02zMEifQpQI
 JXWA==
X-Gm-Message-State: AFqh2kqC0d5U4qNpJ3MxD/bItD765o5xFRNAdRT1lMU3oJv1t++aiiuN
 y9kM2cCOsX5z/VSFVfUxYcrZzg==
X-Google-Smtp-Source: AMrXdXsBQvfRM2B1bpbJSaSfpXHViTtgbN+E0OM0dXWVg6QUFNkCB/niTh1efMBo9JZvIOLeeegg2g==
X-Received: by 2002:a05:6512:1111:b0:4cc:7e0e:8d5c with SMTP id
 l17-20020a056512111100b004cc7e0e8d5cmr772906lfg.37.1673197026860; 
 Sun, 08 Jan 2023 08:57:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:55 +0200
Message-Id: <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 12/13] drm/bridge: lt9611: stop filtering
 modes via the table
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 82af1f954cc6..df9f015aa3a0 100644
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
@@ -832,12 +799,12 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
 						     const struct drm_display_mode *mode)
 {
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (!lt9611_mode)
-		return MODE_BAD;
-	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+	if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 	else
 		return MODE_OK;
-- 
2.39.0

