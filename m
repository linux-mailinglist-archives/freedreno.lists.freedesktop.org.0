Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D69790E6C
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6110E24F;
	Sun,  3 Sep 2023 21:42:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14F10E218
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ff09632194so1457225e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777314; x=1694382114; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rp5vM1gl9RU86RuI50kxi2LQD61SiuVQj5J5+OGEdj8=;
 b=AsLIfc9KlErEBs2iMPgpXR47uae5RVwfjG0IScPMHHU7OqG0wPh1Xk+f/66f6sHG/+
 e/L9R/l4wbr3dhD1XsIuleO6e8zd1iOJqBeGeA8BHaY/uM4np9HfX/ZlmVROAnEnPTXr
 puVnAzz7MBR5glR2jswhxaUhK/DHOqT9uDOEFF18y5ORQD+fKvN6UYSlLUOzFfJktf1R
 5nyrUN0qwkzLwbg4lhPKRsFvlzbze7CwcbtRh2+cEveZDz/lqldM1Aeey5hsR4HxbRyv
 Y6fw4ANHMVk8i8VYZcO178fIOpocHEMssaPh+ssWhc0Yo/zhMpvQTCcfHqQzNNIE9SDS
 dUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777314; x=1694382114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rp5vM1gl9RU86RuI50kxi2LQD61SiuVQj5J5+OGEdj8=;
 b=gHegspK4svwLy8QildTJwYMfla2goYGFgOPFxSEcJKrov5bzYXaDgyMewYfCvc1ofA
 ohD9tY7+KwcdNOeYw9IdQ/YIfXhseEYVNrzlqIN9AhJAkOszBfq+tSN28TEMRVLK3u22
 0F2LQPO2bRepfmB6DLfcyNnY11BwCOUP71Pfa8VnBspHvzkMQPuiYexbE1mxYg0vDhp3
 zhobPfM8GMijTRyreAycOgj7m9oOhE1dGh0UvD75yutOXP9X8aSR9nDS0GrOAyBO+N1F
 SxbKRu7Hmxxs8pyfAjmOhmsLKI7S3vOQ2ZeE1MR+Gh96D+GNXQN5tbXkw8Ba8qY8krne
 ksXA==
X-Gm-Message-State: AOJu0YyIIC4L+02PRkCI7branJzBiiwmdFoq1hk7k+tegnRQEwir5Mg8
 CSPyu9s72iLn6Vs0P6TTxEw2aw==
X-Google-Smtp-Source: AGHT+IGDQQbfVXjBOtsl8V14iEcrDkjhs9AHs4yCZXqJ/byBpZFqNkhX6ECkcKXY9MxCWwyt+uunZA==
X-Received: by 2002:a05:6512:711:b0:4fe:5860:7abf with SMTP id
 b17-20020a056512071100b004fe58607abfmr4579227lfs.13.1693777314266; 
 Sun, 03 Sep 2023 14:41:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  4 Sep 2023 00:41:42 +0300
Message-Id: <20230903214150.2877023-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 04/12] drm/bridge-connector: set the PATH
 property for the connector
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In order to properly identify connectors (in particular, DisplayPort
connectors wrapped into USB-C) allow bridge drivers to specify the value
to be used for connector's PATH property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 12 ++++++++++++
 include/drm/drm_bridge.h               |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index bf73960c2c2a..008d730e1c2f 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -331,6 +331,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	const char *path = NULL;
 	int connector_type;
 	int ret;
 
@@ -377,6 +378,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
 #endif
 
+		if (bridge->path)
+			path = bridge->path;
+
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
@@ -405,6 +409,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	if (path) {
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.path_property,
+					   0);
+
+		drm_connector_set_path_property(connector, path);
+	}
+
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c339fc85fd07..98e9d76474f4 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -753,6 +753,13 @@ struct drm_bridge {
 	 * before the peripheral.
 	 */
 	bool pre_enable_prev_first;
+	/**
+	 * @path: the 'path' of the bridge. For bridges at the end of this
+	 * chain this is used to set the 'PATH' property of the connector.
+	 * This string is not freed manually, so one either should use a static
+	 * string here or a devres-allocated one.
+	 */
+	const char *path;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
2.39.2

