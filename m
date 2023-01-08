Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D916616E7
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7F10E07D;
	Sun,  8 Jan 2023 16:57:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425410E05F
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g13so9529671lfv.7
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=JwRMK+/DJJm+4Kr83NfHDU4UDfp/HcTiQIs3kBx+7G+CvWdP6us0FNw9fTPb9ReDIg
 8awMwlvRZZ1AGLUjxDZMKl/VJpG68NJcOqaLfSJR0kWiEkmLKPbdQv7lyO/DyXFp94+0
 CSoJ5oEW8tDY2oyL5Jo1rVsk0l37Uv6jcD9REB4+JEAhQFDBPqfHUpt2QJ1dqJypO3tC
 t7Cx4ZTHugFWdfQVaXUx7dMhL9crxFuhtTYXmY1qI855oKspqREyUv3WcMT+WKa+ZEAW
 TWoKubgWS36r+6wgvqc5kxkkwtw/UOXcsDdRHmUVUpQDZj1BgKXU7LUV+B72V5gRq3Ql
 EUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=JNhrDT//AmNWg3QuiSusvYSqtsyr31tJTIK5VfqvL2z46H4u2o/oc90FxUCR+/Nc5D
 gKa/NqbTMxnFBvpW7O25FBw12T+kofWFX/NavCCllCErJxYWgCq4P7Kyt8a7ezN4hcH4
 qlt/RqN5lMP2Q8M1DukWX01vVy65L7KQxhzUlNof0fv7tU/jy/3IYRavk+4f5L3inhbP
 Iw0vT2SFZjmwFu+FjiQ9hw0dC/WR6z6SKAgH988W8PgrI3m+YjA7nzEZOLis8l03RHs1
 na0LLcCXTIjR8PBlWQjY1uGtUswEY2qIjyqNSJJgtA9UtwPih/EYiAdZvLWCtsQlRlsf
 qWdg==
X-Gm-Message-State: AFqh2koSCSu7ESsinzhRc4A77+U8e7pPTf+/RiR5jYCNG7XYiTB1DEuD
 cGXvqoJMAFhiaLju723hw9AM7Q==
X-Google-Smtp-Source: AMrXdXs0EGrOEFr2U+1r7ljGQqrNVBcmIDEWIzTZTSYAS/56AUf8+K6vD6iRgRYzkUiMxRMVaZd8YQ==
X-Received: by 2002:a05:6512:3c89:b0:4b6:fddc:1fcd with SMTP id
 h9-20020a0565123c8900b004b6fddc1fcdmr22972112lfv.23.1673197020000; 
 Sun, 08 Jan 2023 08:57:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:56:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:46 +0200
Message-Id: <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 03/13] drm/bridge: lt9611: fix polarity
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

