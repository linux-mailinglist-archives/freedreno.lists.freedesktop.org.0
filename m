Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29936616F2
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFB10E1F0;
	Sun,  8 Jan 2023 16:57:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB1210E05F
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu8so9541107lfb.4
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
 b=FadltuIVXiXfLKLbIFGk9qMxWJZd0pgdWhDhnMGr7WCcONmtQ0mXvacTSch1FYMboU
 Kw7aYSYw3CaucKf0i0sK3OEpvgExGpbWDM5jWw9ZG93jxIhuMV3M9EniQmnOSJt6nRgj
 0sb7Wx80CAqv1SkZrhRqYC0ed4+9TimMNahppUpsuXdwPTkZaVUBXthTjrQA/1me5WD/
 wR7MQWlEQ310OKHGa7JQe9dWRt0WIp5Ygk90v6b/c87H/NYltoGbK9l5JdGedebei++u
 bTzGof767qoaQEEB5CleBxssgeqrK3ZYfG9UdmCb36jx5cHAmDxCcDLvfQMSzwffzjGr
 DpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
 b=LWJdzfC9QIyN9qauF/wGmcay4h1k+6+8dHwIVMS6BgUP5MnZQwGl3N8qeqzMIz91sQ
 voM9PRLX3RQvII2Nx7OaHy8X5805Vg+V64dDt0qGtuOJ+It5cJtSAdsL9RQ++2E9cgQD
 8agf9ce9MjYHSFnoA5SxasIZ0fuljpF10ZYw2OJj6cpcj9/FfWOMcVq1AN79siFqy7zM
 VwkgjumEKgMTpBdPb1SBG7DRkN62tZ0ynaExEeBu2Kd0epgqiYhWJZbsIhifFsqg2Ncj
 U3ICra+Zm8B8TMk0R/EFmVO2mcRciIYDzy4KzMGLDfpNr9350UxSXirw89KTqTR6+RBH
 1Xmw==
X-Gm-Message-State: AFqh2kp3TMnS4QZr2cpx4iZb3J3qg8kHkl2P2dG1UNpPTyC6R4LPKGdl
 v1P6xwxfhe9pNjcKJureTbF5YQ==
X-Google-Smtp-Source: AMrXdXu1iHxeu2ExX/A+b5b1uN5KzYXpvD2t4qxsiZYqDufquyjI+BUz/2egXzyca03hmYTvGJ3e+g==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e64c:aec6 with SMTP id
 k3-20020a05651210c300b004b6e64caec6mr21265840lfg.63.1673197019293; 
 Sun, 08 Jan 2023 08:56:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:56:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:45 +0200
Message-Id: <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/13] drm/bridge: lt9611: fix HPD
 reenablement
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

The driver will reset the bridge in the atomic_pre_enable(). However
this will also drop the HPD interrupt state. Instead of resetting the
bridge, properly wake it up. This fixes the HPD interrupt delivery after
the disable/enable cycle.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2714184cc53f..58f39b279217 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	static const struct reg_sequence reg_cfg[] = {
+		{ 0x8102, 0x12 },
+		{ 0x8123, 0x40 },
+		{ 0x8130, 0xea },
+		{ 0x8011, 0xfa },
+	};
 
 	if (!lt9611->sleep)
 		return;
 
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
+	regmap_multi_reg_write(lt9611->regmap,
+			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
-- 
2.39.0

