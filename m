Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957C671609
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890810E712;
	Wed, 18 Jan 2023 08:17:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224310E6EE
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mp20so34682248ejc.7
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpdbxTL1TsJx6ZvxMXDuiLUdcmbkfcCseR/ToR83G3E=;
 b=tp+GZPa1zP8xw8T5zoc1Y19d3dl6rRGGwlW4xjrPET+Yf/26aiJlvcQkApXKAYjq/e
 NG6qItEAedVaaFugJsi7o8QXvOR5GtBq8QOSKb//s/OVBWrfcAmIzhFS5Om38k6bRLaJ
 5SG+jT6LlpQMsVnX0eIg/iIhrTYN0zLp3PngErW8dg2yE7mm8PE2HkGL9Hd9x71HaSHP
 3wKT7FXy7t7zbM84wJ59dkuge1ObHIjnW5vp5+bGaRqayF0SsVJmZC4YjlPCUexAj1G6
 DAe/wJaIKUBEbPNNKJrXWJk61qaXZ+OfhY3vNEp5CX1uHpAlJbrnFfrc7N7lRdeVf7/G
 g2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpdbxTL1TsJx6ZvxMXDuiLUdcmbkfcCseR/ToR83G3E=;
 b=Xn9p3s5bbfCxLYFHAneaKAL1E6y51i864YscZuPU1KI7RsVfGiSkLm1GWg6TH1gGOg
 WHU2UcDgPNsl0PngzQ3eGmm2/3TEGtj4KcTBpyweWb5vrgDSM0FNKwpN/HDLx18ptStj
 TLlOczp+VEHWQrq/5m3xFInmxDm4JLg4nhVNw+VPLHgjdBIHCOoa7e/aqX4e5364HQsZ
 0AzvZtaaw9a6PzFqJB2dA/HfYCBtce/dz9ufyVVRAqDF8+jJ/eOjAhSGgUMGpm7kHMYn
 NXCmHtnwp4LyP016K++39TIVieeZNvvTNZ1htnJoFtFznCqGICVnQLkq9e248KlBGVZ9
 b08w==
X-Gm-Message-State: AFqh2kpXqk/8O3XlpzhlXkBqWO5aNawaaiHot69cDhtUR9A48FAXE25u
 hGBttA7G/9tJtEuPjMxt8IwlUQ==
X-Google-Smtp-Source: AMrXdXuucVAB6Mc41A9WbCBTnWWwywaSwMlrRjlBFANbvbNf9GRNLrYFFfdEncxeiQanLo3iYNpyww==
X-Received: by 2002:a17:907:a80b:b0:86f:220e:94af with SMTP id
 vo11-20020a170907a80b00b0086f220e94afmr15367395ejc.56.1674029834449; 
 Wed, 18 Jan 2023 00:17:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:58 +0200
Message-Id: <20230118081658.2198520-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 13/13] drm/bridge: lt9611: properly program the
 dual host mode
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

If the bridge is connected using both DSI ports, the driver should use
both of them all the time. Correct programming sequence to always use
dual-port mode if both dsi0 and dsi1 are connected.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 28 ++++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index c2cd36d926a0..276c77b273cd 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -118,7 +118,7 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 		{ 0x8306, 0x0a },
 	};
 
-	if (mode->hdisplay == 3840)
+	if (lt9611->dsi1_node)
 		reg_cfg[1].def = 0x03;
 
 	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
@@ -191,16 +191,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x832d, 0x38 },
 		{ 0x8331, 0x08 },
 	};
-	const struct reg_sequence reg_cfg2[] = {
-		{ 0x830b, 0x03 },
-		{ 0x830c, 0xd0 },
-		{ 0x8348, 0x03 },
-		{ 0x8349, 0xe0 },
-		{ 0x8324, 0x72 },
-		{ 0x8325, 0x00 },
-		{ 0x832a, 0x01 },
-		{ 0x834a, 0x10 },
-	};
 	u8 pol = 0x10;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -209,10 +199,18 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		pol |= 0x1;
 	regmap_write(lt9611->regmap, 0x831d, pol);
 
-	if (mode->hdisplay == 3840)
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
-	else
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (lt9611->dsi1_node) {
+		unsigned int hact = mode->hdisplay;
+
+		hact >>= 2;
+		hact += 0x50;
+		hact = min(hact, 0x3e0U);
+		regmap_write(lt9611->regmap, 0x830b, hact / 256);
+		regmap_write(lt9611->regmap, 0x830c, hact % 256);
+		regmap_write(lt9611->regmap, 0x8348, hact / 256);
+		regmap_write(lt9611->regmap, 0x8349, hact % 256);
+	}
 
 	regmap_write(lt9611->regmap, 0x8326, pcr_m);
 
-- 
2.39.0

