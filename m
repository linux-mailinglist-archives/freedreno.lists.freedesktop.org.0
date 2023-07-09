Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16974C0AF
	for <lists+freedreno@lfdr.de>; Sun,  9 Jul 2023 05:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C36110E118;
	Sun,  9 Jul 2023 03:42:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B38B10E184
 for <freedreno@lists.freedesktop.org>; Sun,  9 Jul 2023 03:42:17 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6f0508f54so50069971fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jul 2023 20:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688874135; x=1691466135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
 b=sA+8HlTiTqDJZTtDglpA8b4/AIm2/r4HbV6YLCKxy4KQMN8jSI+p4pcnMsQmlFDlwL
 gb480YD1MUfAmtPeArJsnVpyG1TMf77WpkYB+1vtSy87fG65qc9+Qc2AkvdrwVshBUiD
 C6clyCgZqZ6WVwZMNl5a72c+8OWdFOXDY4CkheRJmubwRkm/hSjSUBMZH2cP1GINzeD0
 UrcfAJ5ypGDcPx/ocD0RQlc/gaaP5CODXurjiIUPCy49JYsRWdvJQEtDrjTcximg2k5l
 TxkMGwr1Pr1+bGSfv7xlA4NUo3GzO3c82yM2+AMXGvI20IgPvrURux/HbBVS8206jcMx
 2ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688874135; x=1691466135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
 b=lx6vYvCGm3ZQo0vp55PRFhmmYtGeVrQES4+rPgywjO1onYeoWNzWRooXFYBQGPuVe2
 G3zsWLR3pOhJuPX0MzlIRJlaqntCMNpcznaY0dI9DN66XuYS1K9NLXwqMqYg8DOtNbAi
 9ediaA9jQumuuaehagCxyemAjnnvhRK9E/I6o3NGvGDI7ZSiezMyApQCHc80T64/W9Oh
 3dxYZ5jUmc4w2YZevNbQ4qql7gj5onl/t7zUk211aGEplQGMxDGrrCgMHLovse2y2kmF
 1LhfBluHyzTeTuMyjqI43pQOlgITH6i7ovMBTRm7jG7SRQNADWTnwYOVlNdnktYMper7
 S6dA==
X-Gm-Message-State: ABy/qLZoul37jHAGSmuwnX8X2rfz855VDMEVXVSq37rQF2F5HFMmqvyo
 CkMOZC5FndBnp3V9kfCJ0tS4uw==
X-Google-Smtp-Source: APBJJlFv0O8WZ+VPH1Ou8nrTgXdcBmf6HFZApHz5X21b8fVffVcQEGu1H6y+jckZ8DTwBaR4RSUfGQ==
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id
 q26-20020a2e969a000000b002b6dcdeb77fmr7174439lji.35.1688874134831; 
 Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2e9d4d000000b002b6d7682050sm1390289ljj.89.2023.07.08.20.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Sun,  9 Jul 2023 06:42:11 +0300
Message-Id: <20230709034211.4045004-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
References: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 3/3] drm/bridge_connector: implement
 oob_hotplug_event
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 84d8d310ef04..364f6e37fbdc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -5,6 +5,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_state_helper.h>
@@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+					    enum drm_connector_status status)
 {
-	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
@@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_hpd_cb(void *cb_data,
+					enum drm_connector_status status)
+{
+	drm_bridge_connector_handle_hpd(cb_data, status);
+}
+
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_handle_hpd(bridge_connector, status);
+}
+
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -216,6 +232,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -351,6 +368,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
+#ifdef CONFIG_OF
+		if (!drm_bridge_get_next_bridge(bridge) &&
+		    bridge->of_node)
+			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
+#endif
+
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
-- 
2.39.2

