Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBC6EAF06
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 18:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944310EE7D;
	Fri, 21 Apr 2023 16:28:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C42110EE7A
 for <freedreno@lists.freedesktop.org>; Fri, 21 Apr 2023 16:28:01 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54f8af6dfa9so27829247b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Apr 2023 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682094480; x=1684686480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKO1I2nyCroJ5CwepD9IlxcHZJ24Ly0m35i9l8S4MQs=;
 b=g3RnDFLE3IRBLOW7Omv+IL4sEVPhjSZaDkVIesz/E8/m//3gDrLMsuSwVNhLbJ9X2p
 xlUPMYzjV5CN7EdNPKebyh5SpA7LDmzcz4TRXrn7Qv0SU2mgm2I8zcGGb3T7BL0luon/
 WT7XaMP2oPdqlFOaFXLh+87xE6nLWbIARE3n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094480; x=1684686480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKO1I2nyCroJ5CwepD9IlxcHZJ24Ly0m35i9l8S4MQs=;
 b=eE1fsWsj7CaRx4CwGWn8QFTnJzwm4nkxudNLE36uYI4qIL/R65OoVqJWWPLdYAMh4D
 8b3+EoTXUn4FOk874AIHGQfMl4t0k0kv+Swe4a13WMxC7chfDFHEnRyNazsDU1LJlcKp
 okty66PAC/9xNjRRSjldslD0nNzYvuMO04/PrzjgRhZ4+D2WPay1hUnz5UgRVIL0xjuy
 qsC6khLf60rirQOpHCfw35kIYrYhVjYQz9qOTwBuZho4CB9hoGruYKIFLGxd2+15YLGW
 hblDn5eFCSK3SjZEW5HTEGygJ4UAhoug8oNaLW6sfmB3PLa24jUxLNAJhvHZniO/iRh9
 ohQw==
X-Gm-Message-State: AAQBX9fSeWjx8vnRiFMrQSdXuB0t/ikUiVoMKEdzDftegIBDM21tplD/
 wG3C8zkx7OlxxmQNXi0KPzgYGgadIBMFvWW1hpo=
X-Google-Smtp-Source: AKy350bWZ//HXXTogoYM52hKsklw5A+76WgTKpW7vs/w2gfk4xuaOgmgfr2EAMS8SOswZdedlP3CeA==
X-Received: by 2002:a81:5f85:0:b0:544:57ba:a32e with SMTP id
 t127-20020a815f85000000b0054457baa32emr2458316ywb.9.1682094478553; 
 Fri, 21 Apr 2023 09:27:58 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 m4-20020a258004000000b00b8c31377e1bsm995731ybk.54.2023.04.21.09.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:27:58 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Apr 2023 12:27:49 -0400
Message-ID: <20230421162749.360777-4-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230421162749.360777-1-markyacoub@google.com>
References: <20230421162749.360777-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] dp_hdcp: Get the hdcp key from the
 connector prop
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
Cc: Mark Yacoub <markyacoub@chromium.org>, seanpaul@chromium.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[Why]
To support protected content, the driver requires a key.
Currently, it's being injected from debugfs, which is not super useful
to run a user space in the wild.

[How]
When the key is needed, fetch the "Content Protection Property" on the
connector and get the key blob. Verify that the size is valid and use
it.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_hdcp.c | 66 +++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
index 191340971f943..4321d245b36c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_hdcp.c
+++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
@@ -117,19 +117,61 @@ static bool dp_hdcp_are_keys_valid(struct drm_connector *connector,
 	return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
 }
 
+static bool dp_hdcp_get_key_from_connector(struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct drm_property_blob *key_blob;
+	u8 *raw_key;
+	int ret;
+	struct dp_hdcp *hdcp;
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop =
+		dev->mode_config.content_protection_key_property;
+
+	if (!prop)
+		return false;
+
+	key_blob = connector->state->content_protection_key;
+	if (!key_blob)
+		return false;
+
+	raw_key = key_blob->data;
+
+	if (key_blob->length !=
+	    DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN) {
+		drm_dbg_atomic(
+			dev,
+			"[CONNECTOR:%d:%s] Content Protection Key is a blob that we don't expect.\n",
+			connector->base.id, connector->name);
+		return false;
+	}
+
+	hdcp = dp_display_bridge_to_hdcp(bridge);
+	ret = dp_hdcp_ingest_key(hdcp, key_blob->data, key_blob->length);
+	if (ret)
+		return false;
+
+	return true;
+}
+
 static int dp_hdcp_load_keys(struct drm_connector *connector, void *driver_data)
 {
 	struct drm_bridge *bridge = (struct drm_bridge *)driver_data;
 	struct dp_hdcp *hdcp = dp_display_bridge_to_hdcp(bridge);
 	int i, ret = 0;
+	bool is_hdcp_key_valid;
 
 	mutex_lock(&hdcp->key_lock);
+	is_hdcp_key_valid = hdcp->key.valid;
+	mutex_unlock(&hdcp->key_lock);
 
-	if (!hdcp->key.valid) {
-		ret = -ENOENT;
-		goto out;
+	if (!is_hdcp_key_valid &&
+	    !dp_hdcp_get_key_from_connector(connector, bridge)) {
+		return -ENOENT;
 	}
 
+	mutex_lock(&hdcp->key_lock);
+
 	dp_catalog_hdcp_write_aksv(hdcp->catalog, hdcp->key.ksv.words);
 
 
@@ -139,7 +181,6 @@ static int dp_hdcp_load_keys(struct drm_connector *connector, void *driver_data)
 	}
 	dp_catalog_hdcp_post_write_key(hdcp->catalog);
 
-out:
 	mutex_unlock(&hdcp->key_lock);
 	return ret;
 }
@@ -346,6 +387,8 @@ int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
 		   struct drm_bridge *bridge, struct dp_catalog *catalog)
 {
 	struct drm_hdcp_helper_data *helper_data;
+	struct drm_device *dev;
+	struct drm_property *prop;
 
 	/* HDCP is not configured for this device */
 	if (!hdcp->parser->io.dp_controller.hdcp_key.base)
@@ -357,7 +400,20 @@ int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector,
 		return PTR_ERR(helper_data);
 
 	helper_data->driver_data = bridge;
-	hdcp->dev = connector->dev;
+
+	dev = connector->dev;
+	prop = dev->mode_config.content_protection_key_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					   "Content Protection Key", 0);
+	}
+	if (!prop)
+		return -1;
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_MODE_HDCP_CONTENT_TYPE0);
+	dev->mode_config.content_protection_key_property = prop;
+
+	hdcp->dev = dev;
 	hdcp->connector = connector;
 	hdcp->helper_data = helper_data;
 	hdcp->catalog = catalog;
-- 
2.40.0.634.g4ca3ef3211-goog

