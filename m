Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08550875B44
	for <lists+freedreno@lfdr.de>; Fri,  8 Mar 2024 00:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103D510F600;
	Thu,  7 Mar 2024 23:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gwk2h20u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28F10F600
 for <freedreno@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513382f40e9so1819547e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855824; x=1710460624; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ayfDGuEZEO1ZfQYO+0AykFZJxnVQjKjfpqW7Vdx2QQ=;
 b=gwk2h20ukTofHn7XCPKIw2tceRVwA6iBNQA7RQ/KPZH0jlLzeoYwqCpJ9Z9wmjQtc2
 pIlsouhXPwazsL/4rN6+R3J1Pdp5nLZAEmez5Mf4E/oaifwhi8sXBEZkH8rY1xsY8T1g
 ONp7czkbrw26yRg3+StPlB1AjDjUdJWGfneWbupk3lUU618w7TzW60jxomuUCDxoEqRl
 1Ot/nAhZdF5ShbptVySwCUwRYhuCULgQ1ZIErVH8B4y6f6QYsFZ3EKbboHBBVSeP+ufs
 lB4ziqr/IGrfoKQepIoBifHxERto/1YRizEzICWSMOyp4y4fschbEEUVbXDjFqKTOG/t
 GcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855824; x=1710460624;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ayfDGuEZEO1ZfQYO+0AykFZJxnVQjKjfpqW7Vdx2QQ=;
 b=bqSQl7OH81UDu7co84T8vdb7b5FgYkxjCQRjdeQ05OCEs0j0RUfpbmQffFF7x1P4JD
 TrDYhzlorLiVYaZh3kLUz8n7c/ZXNWtcMBZTptb4cM3lUvLOUSmPxzNdiU1izFIYhbiq
 DtNc3yh2Dei1FO3LnxUiWWb+EQw1OT5xdYYuHecsqQPNlg42h6KbEbtpMm0bXBlrWBL/
 mhE82PI8D9ZqGw7ObskmpYJuSwMKuXjAOE29yE3nFCSsk+0dx2Tv/gUfqkqEOGU6yd89
 +82sYkG5+N+g2QYr/zb+0Uw1YbsSBhJ0MTtEDh//jgIFDqKE052qjjziUUfcN6fXI2oz
 Qysw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWerKfbR4nu2PCyUcXqY+NLW3+PlbcjzuG8qXN0LZq7ZAmlWAoBkIzvfJIClo4Kq5EjVttbDxiL+pbKnFqalO12PMYQSlHab4zlGksRtUqz
X-Gm-Message-State: AOJu0YxlEBSVu7JNETuHiCArcUt33p2xxX4Jp+Ex6VHDBMYW3LH4mgoR
 +FqNyG5zfMHvSocJx6ih1MY2QQNdqWLCrnfi/AL4dHB1idvVoez7Hv3nE74HYlo=
X-Google-Smtp-Source: AGHT+IH2kQosbGZQ82H2J6neyNEH81RoEbRElVkt21vFS8NHxY1NWgIZxQ7OeyErKOM7z4rHO0C7aQ==
X-Received: by 2002:ac2:47ef:0:b0:513:28bc:cd0f with SMTP id
 b15-20020ac247ef000000b0051328bccd0fmr2377793lfp.27.1709855824449; 
 Thu, 07 Mar 2024 15:57:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:00 +0200
Subject: [PATCH RFC 1/6] drm/bridge: add setup_connector callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-1-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y1yNIKWYKop4uPXPLUnZdxDiseRQwHNWzmdOCItrwFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRNhMQfYajWwExGw9+woYoxcDvNbM6i1meDI
 SLAUtWy3OmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTQAKCRCLPIo+Aiko
 1W3zB/9UDY1bM4y8J3cTIY3/oV8UwEYqWEvYFmJyzBsFf6GzwU+tj6FEnRJabk/yUDRX+VVM2f2
 De/vcYY31UhhTF8vO50+y7dmAbbVVrx3g+E1+mdXJRSKSmp0rfQAncbyy79ChDA0qrrmXcAjml1
 t57dl/Fe7dxexIdX7fNIDsi2IjRyctg6k0YxREnPItglhyQ1nlIEq5lOAh5+P1O6uSGyt9vUhkC
 ZetdBzimHLfgIO/YJCrTiAcf/StrmlkxTgCdyMpTQ+rrOTEdn4rcUlA7drNS4CbM4QatRfNbGjN
 tnofB98OxEGfK10iklF8jfGO8yOucWFX2ycyt9bIC+2X497b
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

Add a callback to be called by the drivers when the drm_connector is
created at the end of the drm_bridge chain. This allows bridges to
perform additional setup, like setting up the HDMI connector properties.

Note, for now only drm_bridge_connector uses this callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge.c           | 38 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c |  8 +++++++
 include/drm/drm_bridge.h               | 15 ++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 521a71c61b16..375982a02bcf 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -580,6 +580,44 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
+/**
+ * drm_bridge_chain_setup_connector - call all bridges to perform additional setup
+ *                                    of the attached drm_connector
+ * @bridge: bridge control structure
+ * @connector: connector that is used at the end of the bridge chain
+ *
+ * Calls &drm_bridge_funcs.setup_connector for all the bridges in the encoder
+ * chain, starting from the first bridge to the last. If at least one bridge
+ * does not accept the connector the function returns the error code.
+ *
+ * Note: the bridge passed should be the one closest to the encoder.
+ *
+ * RETURNS:
+ * Zero on success, error code on failure
+ */
+int drm_bridge_chain_setup_connector(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	if (!bridge)
+		return 0;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (!bridge->funcs->setup_connector)
+			continue;
+
+		ret = bridge->funcs->setup_connector(bridge, connector);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_chain_setup_connector);
+
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..a0d0d2cc72c7 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -402,6 +402,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	ret = drm_bridge_chain_setup_connector(drm_bridge_chain_get_first_bridge(encoder),
+					       connector);
+	if (ret) {
+		drm_connector_cleanup(connector);
+		kfree(bridge_connector);
+		return ERR_PTR(ret);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3606e1a7f965..9806fce126f2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -84,6 +84,19 @@ struct drm_bridge_funcs {
 	 */
 	void (*detach)(struct drm_bridge *bridge);
 
+	/**
+	 * @setup_connector:
+	 *
+	 * Perform additional setup of the connector once it is created.
+	 *
+	 * The @setup_connector callback is optional.
+	 *
+	 * RETURNS:
+	 *
+	 * Zero on success, error code on failure.
+	 */
+	int (*setup_connector)(struct drm_bridge *bridge, struct drm_connector *connector);
+
 	/**
 	 * @mode_valid:
 	 *
@@ -877,6 +890,8 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
+int drm_bridge_chain_setup_connector(struct drm_bridge *bridge,
+				     struct drm_connector *connector);
 
 u32 *
 drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,

-- 
2.39.2

