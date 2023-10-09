Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9517BE86F
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788DE10E0BA;
	Mon,  9 Oct 2023 17:40:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454C10E2A5
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:40:53 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so60207871fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696873252; x=1697478052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNCqTbw0TXx6mJa4XxFsJKPj+YzowxN9M1WKiAD3Akc=;
 b=Tlm5syGulRbFp8UwkqnhzAamrUIzoBIEwsw/yVFceqxHhL0hLCHQyjV+tWoxXjehzS
 iwL3SRtl3HJMiGy3dGqioVofHOO5rPaTq/FaIP9N/G87Rej3Sfn3cjDufQtGQ06nU5nf
 8oWw1S3vetj/zJmCcgAVRaW9NLALnghrilwNBxa6tCtcHABO1SSVCBmjE8WY9q9/5pwT
 nm+hhoRWKGobNEfqwKdBGnodOwQCLJ56d2L23BIGmfqgK6H68dKIccZa4+bj1+4Dzv0C
 kXlfvNGV2xSj2uz5nxQ2Lgkf4t4+m64PtjuERrcOdFJ2XV9t6ey39x/EP+ckLZ7rOvT9
 Vmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873252; x=1697478052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNCqTbw0TXx6mJa4XxFsJKPj+YzowxN9M1WKiAD3Akc=;
 b=LJxy+1pwNwV6y/kmhFZLUzknvIfcgYCkvRmMQIzAF5hnO+Dm7T7zGRA7qwSJBzDvp1
 16VdttmBjOfiB0K05W7yHtpcZHtRmNGDcjtD5F6I2gbUkBrSyYvgzbGW8aoPyeHgwZGL
 a9lRK9F8Q+1Hy99OEuPL28h/awDBDRkFF/jJZ5Uck6zg56M6c44mlcdAXxkJviKUG+Mc
 zB55hydVvds81yA/B0rAk2ZwxkORN2H+cDVCatqfIwKFF/guXgdCBQzPIvrHhI68M2pv
 ifCNtKL8lgTWnup18Nma7MZLOfz9icqp6T4hgYjlgDpdUsvMxEfoT/vRn/MIcKpE3Q9T
 Mq9Q==
X-Gm-Message-State: AOJu0YwZkU/1nFS4yCf6WgYAyIivwWqLFvrAMrhYLUHLVoj6wEkm9Kv2
 d3wVYZ8FM5OrHJNsiepPXunypQ==
X-Google-Smtp-Source: AGHT+IFd3zAbVawrOZoSBNYmDde/LniLsk39R7NLQiYJ3/SMoBEYMa27+sX2ewYfUYKTGZviaiHkJA==
X-Received: by 2002:a2e:7d15:0:b0:2bb:b01a:9226 with SMTP id
 y21-20020a2e7d15000000b002bbb01a9226mr13615060ljc.7.1696873252113; 
 Mon, 09 Oct 2023 10:40:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e3505000000b002bcbae4c21fsm2128988ljz.50.2023.10.09.10.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:40:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  9 Oct 2023 20:40:48 +0300
Message-Id: <20231009174048.2695981-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
References: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 3/3 RESEND] drm/bridge_connector: implement
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Simon Ser <contact@emersion.fr>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Janne Grunau <j@jannau.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 31 +++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 70582491d955..8239ad43aed5 100644
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
 	drm_kms_helper_connector_hotplug_event(connector);
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
@@ -191,6 +207,8 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 
+	fwnode_handle_put(connector->fwnode);
+
 	kfree(bridge_connector);
 }
 
@@ -216,6 +234,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -352,6 +371,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
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

