Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96D56FABB
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 11:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13F18D241;
	Mon, 11 Jul 2022 09:21:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A628D23F
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:21:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t25so7678446lfg.7
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRAGEf8g4Cp1qxDJWr3cJJxLbQRvNOY2paQIn9JUATY=;
 b=wdkXQ3io2K4JvD3tDkBGEHr985JNhIDp70T5BxUdNK9RFoNqTZ7j4vYo9TyR2ueP6s
 cOgdiJ2HGjlSE50jUxHpypdAltHngm0LtyE48emYft4l9QniwCTg4cA3uYD9uFljmK2Q
 qur75rxcB8kiHBd0nQ6Hd2+DB4uP8jthW+2hsWomnVsVqSsZ2DKPl70+L5LLXycQlJsN
 P6oF6FnGveWtkA1uI5kUO2uF8EsnTWuJ4JnhMXjz5JvGoucOtWJUZiZXzttftaaxKMlq
 rde6fgM8CUNmX4Trj2ShJbFY6wVQH1To7w3ps04nvohkcQQDq9M4RZ0tweC6h5oafbgp
 N4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRAGEf8g4Cp1qxDJWr3cJJxLbQRvNOY2paQIn9JUATY=;
 b=AANy0tgBeHCPn7NGkRTI4I/7DHFc+Dx56kv96gCUA83pnMg7t7s8yICXk4+HN6fPib
 Ydsw9vpDZY0q4GXGtK7qO1BWggleF8oIomLREkj/XMjgta675hssNAKbzFlwqEKdr3Ra
 5ap0HYHWSu0Yed2YnNC7E73dY7O60VJP+B/2wG2sEPlI/vVzDvJekaRfcBrkfqQ2n+UJ
 lcrU/Ylg0LOC83iDlJ/JhbAFbojUecpBqTIVwEbXVVR1qGTnJ2hqw1ckMwJznOuysUhV
 ErHpmv0aUXG3omEC/B9KjTqP5lIcFCAoTmPvqphpCf0lFPf+ckeEgasKw7SVMd2EX2A9
 SS3A==
X-Gm-Message-State: AJIora8UADsJUcKX4oQZAcihMkYvdWWqWQ04yNVbZ4cvcwbJ7CJqSYh+
 gjVcRjvAmlagulCyScG1POFFRA==
X-Google-Smtp-Source: AGRyM1sKgnyIT3SuBfPwfGfXobeOpQtlPLenOngZ+ibe0Lkc7eUOAU014BuLedWTWT6TpP7AulsUpg==
X-Received: by 2002:a05:6512:6d4:b0:47f:74b4:4ec4 with SMTP id
 u20-20020a05651206d400b0047f74b44ec4mr10674049lff.654.1657531280183; 
 Mon, 11 Jul 2022 02:21:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c30-20020a05651200de00b00473c87152bcsm1434195lfp.127.2022.07.11.02.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:21:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Mon, 11 Jul 2022 12:21:17 +0300
Message-Id: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now as the driver does not depend on pdata->connector, add support for
attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b362a7bf4d97..369bf72717f6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -710,15 +705,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/*
+	 * Attach the next bridge.
+	 * We never want the next bridge to *also* create a connector.
+	 */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
-- 
2.35.1

