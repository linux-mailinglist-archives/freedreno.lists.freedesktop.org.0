Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0286613F2
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 08:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE310E1F5;
	Sun,  8 Jan 2023 07:26:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E210E1E9
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m6so8286170lfj.11
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=R2WINXEkAmqc1F+yT6f+c4Nfkv1d8jkC9Ma/KTvMQZauhWNfaMLsOKVE+pHlUeoc4f
 5C+d7kFjYlblzzjqqihOM3obvTaB7aTTSUSVTgbN7/lZsw8keQTvsF1OolTzdjNY6f/Y
 DZyf3cJ5b1U2UICzTE54FuTgWjbdzEpUfoGfsqz9/5ufnij3BmdycQ1l0vvxgIfTIk0V
 Yhr227dRtX+ilBRE9kKsHoauaJgLbocm4UfvosgyC/f8I6xqQQcLzOcyCYAxSIzV2Lmw
 G0k89rxP63Rl2EjCJ5Dg2HCVLL8zM9xeA8YnjAj/h9pPZDzk6ZQERTuikQcA66ZqSJLb
 LIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
 b=Sq53Wy8JhDXIYbeDvx6Eq9lMDelpQR45kUojXnm2jTH9xec3KVjnIRbbxdmmymk/Gc
 ujNplusaMoYTfOm+6EA6onSItTqoogaBbmcmqjHrufAS1WLUS+gcznEsE/7QTlIB/6jq
 Eo5hKs/ywpt4zMY7utHCcCLr/N4j/O/l+opVE0KUrIY27ckaTgGlMP/1U+/qm/jylntO
 O536MWsORn1aF/zTGc9xRPe7TbDtNKFxpUKtINWp4ggpFtFk70TwHU4DPCk3sHQ2WvUI
 IRS+gzGBpNtriaWzaowzSQ9QApf9Er3P+tYMOFEgZ9/ADQ1PoIq/CjzxLjINMUpbohvb
 a38w==
X-Gm-Message-State: AFqh2kq4Zs9yhmrXrWEmWvLjcCmQEdIpiX7QHPncER7KhckhJvYEmBwW
 qFhUJVFCYaT0rIOvzbdaAJuycQ==
X-Google-Smtp-Source: AMrXdXtgGtsm2oDkn0j02HpZsV2wpEeIudu6QlL4kgQ2P9mZz0VJz1PqJhAaJhl+6guXztCXuxnYUQ==
X-Received: by 2002:a05:6512:104e:b0:4cb:43db:30fe with SMTP id
 c14-20020a056512104e00b004cb43db30femr5838626lfb.11.1673162758734; 
 Sat, 07 Jan 2023 23:25:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 09:25:46 +0200
Message-Id: <20230108072555.2905260-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 03/12] drm/bridge: lt9611: fix polarity
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

