Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F89137D2
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 07:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFB210E0FE;
	Sun, 23 Jun 2024 05:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ggHM4XLu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0282710E11F
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 05:27:40 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so1757791e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719120459; x=1719725259; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=ggHM4XLuQ2v/ZNWlLTCph3Qre6Lz/6HUdvQBFk19otzx6GzyEcaF9qNd2xT82GuXMo
 qYrsyGL02U9wX2zcM+IomVxxomZMuQY5stX1VUxjlTax3BwmMCmgm4+G/mSSUEXSM0Cz
 Ep9mb51lvmMCMoOMMpBTmMK4CjoTfGPI3EUa/0UVnQOqjtIEBxsTAsfP7Rf30RdYSDYc
 6Or3X1NFY3s7NSmSvCRpfuOSG1zWo7xoGp9ih0sK09Iqxgwpjkasz2HpJT8JQ0f/DMHl
 zQu9TjE2hLPm+IA08L/zS13snEHHJZi4e4JCBbrBZVVTIAWglHQI8036UaIog+q+cp29
 j+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719120459; x=1719725259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=wJN4i9n3yR1nHAwEq24EGcs0iSL+O1lrC3GNAZlDaAIZQxHvSCLUJ3S2HohxKgwPgZ
 FTg4BdQfUE6aAfqTNlstE6E+4NQ/mUfdBfnkBmN9Fef6k8fb4CrDfSGM/9aGIFfRVj9+
 BGN34cBJh/RaqKasjMAaGdYmMOtAUmCeHL9S9MnoqhEUuJmu0/PVxl1MqVkqacJc7HCT
 nYQ38MbYo1bJXXAAbIkWJ1RtBo62N4gWDm14T3aKTFf2AqJsyI9KUpaMSsXzXjkRca+P
 kkdsifzoo4eCTmSGJ9MRXXvQVJjtWwymaJoAhzNREibLPUCFG+8+NaxswRAuz9g0Wc2O
 pOBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXcP1dLC5goaA+i9nIGwFZOBDT5CGXDFunjPwFeqHYyQx+vPLS5taaMpXVB0IjCHWD6r5KVNhrgm7hUcqJ8fFCRfpry4vNN8rg4M+WU4Eh
X-Gm-Message-State: AOJu0Yzfuk66C9mYV39kpHgfZcZxV6AoUIQN65cJCmOsCAE+R+uKslzS
 FA2qt98feyGFabQ5LtWnwzscaEVLEoCKSY2yeFFbdFeQtO2imHeg9DRTxMG3MI4=
X-Google-Smtp-Source: AGHT+IEh3cEKgwmWN7Xjb33SsB2Mw1G3UHsxvvT4AgsvTgo5EF38OoJysYd94FJUutnhVeKw50wUGA==
X-Received: by 2002:a05:6512:2f7:b0:52b:bd97:ffdc with SMTP id
 2adb3069b0e04-52ce1860d7amr679447e87.59.1719120458797; 
 Sat, 22 Jun 2024 22:27:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6432006sm657651e87.194.2024.06.22.22.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:27:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 08:27:35 +0300
Subject: [PATCH 1/2] drm/bridge-connector: reset the HDMI connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-1-41e9894dcdec@linaro.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3yTmp3Sv/j769E4v8X1gSQqZKrDdcZgB/xdp5LC/6x4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7JJMusAAdEN+AnZxFOh3PswmMdpQtfwDoBEi
 0OMtMZlYnSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZneySQAKCRCLPIo+Aiko
 1SBIB/9kkrr9cGKI5GGyC0AFUWz8jtlel5Ot/rOLHZyDcjlO3lNTOBi7jvjUYIkvWHiGsnGmImu
 PsXaqdIHMgyLNyXZh9GWdkyz06esMHIGHbyje9hn9Pu+35BAD2iAQcBrECfznmZcCAYNF8KybeL
 D5OCrR8Pn3bMwbJPYz/jEVhvU8I3KQCfNJa3T7EOZ5Q+Iu9Bx0TArMfsDjSa2EkykNQaI77Uh0r
 r9GzDd9Ldzbe917ZrzZYKOaB40xw7wge9ewvv2afjSI8PjCSO0LjAxJQ7vwkKmaVDQx+lhY31fl
 iwIlaJN9cRrF0IxxYKeGaceKslzS6GaKAlArLdAJQlWGWIln
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if there is a
the drm_bridge_connector has bridge_hdmi.

Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
call this function from HDMI bridges, there is is no function that
corresponds to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
 drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
 include/drm/display/drm_hdmi_state_helper.h     |  3 ---
 include/drm/drm_atomic_state_helper.h           |  2 ++
 5 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2dab3ad8ce64..67f39857b0b4 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,27 +8,6 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-/**
- * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
- * @connector: DRM connector
- * @new_conn_state: connector state to reset
- *
- * Initializes all HDMI resources from a @drm_connector_state without
- * actually allocating it. This is useful for HDMI drivers, in
- * combination with __drm_atomic_helper_connector_reset() or
- * drm_atomic_helper_connector_reset().
- */
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state)
-{
-	unsigned int max_bpc = connector->max_bpc;
-
-	new_conn_state->max_bpc = max_bpc;
-	new_conn_state->max_requested_bpc = max_bpc;
-	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
-}
-EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
-
 static const struct drm_display_mode *
 connector_state_get_mode(const struct drm_connector_state *conn_state)
 {
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..1518ada81b45 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -478,6 +478,27 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ * @new_conn_state: connector state to reset
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state)
+{
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_conn_state->max_bpc = max_bpc;
+	new_conn_state->max_requested_bpc = max_bpc;
+	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
 /**
  * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0869b663f17e..7ebb35438459 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 285f366cf716..454319b40f17 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,9 +8,6 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state);
-
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb2658..adf300e6b4eb 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -71,6 +71,8 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);

-- 
2.39.2

