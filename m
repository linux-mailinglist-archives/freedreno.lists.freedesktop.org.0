Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD696715F7
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BD810E6CD;
	Wed, 18 Jan 2023 08:17:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235D510E6AF
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id az20so62188371ejc.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBfCqrDR4MpJFEnebR6McOavUtbCVSzMNuhuevH6nB0=;
 b=CIGRp+wi2KsKMXXI/Fr+WhpcoI96+VtHe0oNYw438BSi2i9PPSRrZpzg4pztss+1PS
 KLtjg7S4NJzirTkchGwnCVwN/eSaZU+aP5h4kIfNufZ1fLCgXjIOb35hwkjyHIcFZiMr
 t4Qh3dD4vxUusLQbjyqEf2p7udMf1ZgSwHuqjngaTuy/BMRGuPK2kEvTfr4NOZ4vJvte
 V8uOU9KArSDi0tK9cvyIkP45ZqlCZeOlRVLUrEo9ShaDDKB5m3BxSuK08jkTqHzkRu8H
 85s7AOzJ8Y9fuINuBgThauZJw5rcGG/99DB/44OAJOGChkxVLm0AjPcHmwrccKqRHg7c
 Sprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBfCqrDR4MpJFEnebR6McOavUtbCVSzMNuhuevH6nB0=;
 b=GEmghGjfv9euv5MG/9WWQckvT27McDERv9xRCkPgnlp6XHHqHf5RQWn5Qz2Ojt5sQY
 v/ARgF9d7S4bM3wvsSxkj8z67G1VJj7j16+f1CEBOBDn8QtWLjfCwWkJD8QgRycu3uXy
 NgZvTGehgMK9Nruv4EmmNEkmyTia1uRCZhXeFqJMBxhPjBz5T+Zyrh7EvdekbGS2OJv6
 mrspMeR5DrvL5pYZG7D0xmS9tMCMIKuDwY0CsvWe1nxjqvNpk56F3wAz9ZgYpuBhIsRS
 4qzvO5kDGxlacUOGSPevhdOkJCi6IiInKJyVAhoeeyoiLncZAWd/+Fr1hRyJdk7y5U1K
 HvPQ==
X-Gm-Message-State: AFqh2krrpOlPZGFXQqChhBK0EKOj9U65jRPT/xmT11t5cKNOd2dUCYu3
 UZEicdrzbXwYLNxHaFnVDSRRBg==
X-Google-Smtp-Source: AMrXdXujXPrQ+U3YPkv1Up45oc0vaV+q3Os8LYgZ1Fvx09I8JVuo7j5nIjHce/ZSu1JaB5xDm0OR6Q==
X-Received: by 2002:a17:906:d8a8:b0:84b:b481:6188 with SMTP id
 qc8-20020a170906d8a800b0084bb4816188mr2050170ejb.64.1674029823456; 
 Wed, 18 Jan 2023 00:17:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:48 +0200
Message-Id: <20230118081658.2198520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 03/13] drm/bridge: lt9611: fix polarity
 programming
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

Fix programming of hsync and vsync polarities

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 58f39b279217..deb503ca956a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 
 		/* stage 2 */
 		{ 0x834a, 0x40 },
-		{ 0x831d, 0x10 },
 
 		/* MK limit */
 		{ 0x832d, 0x38 },
@@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x8325, 0x00 },
 		{ 0x832a, 0x01 },
 		{ 0x834a, 0x10 },
-		{ 0x831d, 0x10 },
-		{ 0x8326, 0x37 },
 	};
+	u8 pol = 0x10;
 
-	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		pol |= 0x2;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		pol |= 0x1;
+	regmap_write(lt9611->regmap, 0x831d, pol);
+
+	if (mode->hdisplay == 3840)
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+	else
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	switch (mode->hdisplay) {
 	case 640:
@@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	case 3840:
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	}
 
-- 
2.39.0

