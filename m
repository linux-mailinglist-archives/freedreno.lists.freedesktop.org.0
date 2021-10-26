Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA043A88F
	for <lists+freedreno@lfdr.de>; Tue, 26 Oct 2021 02:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5526E199;
	Tue, 26 Oct 2021 00:00:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9356E18F
 for <freedreno@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:52 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 83so6058835pgc.8
 for <freedreno@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txgUq4z88WnnvzWzs6FXSEEPpZuqTbA+AthU6UWidQU=;
 b=A9uYcNC3Y2SU5Menz6F1KUEbpXNwN+ud/4zeGvxXq2DS/2o+S7j2n3UCd54VrkmHXF
 XqOH8ZN1RGNjIq1ab1TKFRoPuzucoAv8DAm0BTCfb+kArLqN3+wU2rLBg3w1evkDD2CY
 RE5RL05zWPiNBeirxolfz7HVdHkmm3pdI5rwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txgUq4z88WnnvzWzs6FXSEEPpZuqTbA+AthU6UWidQU=;
 b=QITs7YaeLWy7ymW1Y0aXFicmsCBiKcss9+hB1xMvVvp6xN+qNJkpoN5/aXj+0WUXxo
 K5QzDkz6dE7dbkTv62ZK5kuvhqdCpU5rBjlm7zJczryhcJHmNNK58UtPT0DOEDQVyLqy
 TmKMC+vFiNgnLx/poEL2SVGfwpvWyOSxOliVbBDhsmQiWIg3VFsrJsDKO52+L+gIgSkG
 V9zhZYNO9LjzAunSbaK+7vh2lH4+Qg7kHzrqYbv8wGP0QmXZRhjMtF9rr3UuMD3Ez3UD
 JKYLu9btQLycNZselthv8px64tYPvBXuGeTTtxv8jjt9hmdmdQHgICKAR2HM/jh37zrj
 7dJg==
X-Gm-Message-State: AOAM532XIWT0epN3XBhFWkpYIAu//I0qoYyb4VDoUtHICr3ofBbMIy7T
 waTbdYKit4AUwuO8dANXMYMBtQ==
X-Google-Smtp-Source: ABdhPJwesE/iCtpjo1NQiY2gwciS3HejroivNqF/suvA3LY/9h2IIEXf61dq55sEfuu+M5Dn+BpYlg==
X-Received: by 2002:a62:188c:0:b0:44d:6660:212b with SMTP id
 134-20020a62188c000000b0044d6660212bmr21989004pfy.8.1635206451988; 
 Mon, 25 Oct 2021 17:00:51 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:51 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Oct 2021 17:00:16 -0700
Message-Id: <20211026000044.885195-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 06/34] drm/of: Add a drm_of_aggregate_probe()
 API
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

Similar to drm_of_component_probe() but using the new API that registers
a driver instead of an ops struct. This allows us to migrate the users
of drm_of_component_probe() to the new way of doing things.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 85 +++++++++++++++++++++++++++++++---------
 include/drm/drm_of.h     | 12 ++++++
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 997b8827fed2..dc4b507c809d 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -99,30 +99,18 @@ void drm_of_component_match_add(struct device *master,
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
 
-/**
- * drm_of_component_probe - Generic probe function for a component based master
- * @dev: master device containing the OF node
- * @compare_of: compare function used for matching components
- * @m_ops: component master ops to be used
- *
- * Parse the platform device OF node and bind all the components associated
- * with the master. Interface ports are added before the encoders in order to
- * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_component_probe(struct device *dev,
+static int _drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops)
+			   struct component_match **matchptr)
 {
 	struct device_node *ep, *port, *remote;
-	struct component_match *match = NULL;
 	int i;
 
 	if (!dev->of_node)
 		return -EINVAL;
 
+	*matchptr = NULL;
+
 	/*
 	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
 	 * called from encoder's .bind callbacks works as expected
@@ -133,7 +121,7 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   port);
 
 		of_node_put(port);
@@ -144,7 +132,7 @@ int drm_of_component_probe(struct device *dev,
 		return -ENODEV;
 	}
 
-	if (!match) {
+	if (!*matchptr) {
 		dev_err(dev, "no available port\n");
 		return -ENODEV;
 	}
@@ -174,17 +162,76 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   remote);
 			of_node_put(remote);
 		}
 		of_node_put(port);
 	}
 
+	return 0;
+}
+
+/**
+ * drm_of_component_probe - Generic probe function for a component based master
+ * @dev: master device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @m_ops: component master ops to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the master. Interface ports are added before the encoders in order to
+ * satisfy their .bind requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Deprecated: Use drm_of_aggregate_probe() instead.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_component_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   const struct component_master_ops *m_ops)
+{
+
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
 	return component_master_add_with_match(dev, m_ops, match);
 }
 EXPORT_SYMBOL(drm_of_component_probe);
 
+
+/**
+ * drm_of_aggregate_probe - Generic probe function for a component based aggregate host
+ * @dev: device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @adrv: aggregate driver to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the aggregate device. Interface ports are added before the encoders in
+ * order to satisfy their .bind_component requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv)
+{
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
+	return component_aggregate_register(dev, adrv, match);
+}
+EXPORT_SYMBOL(drm_of_aggregate_probe);
+
 /*
  * drm_of_encoder_active_endpoint - return the active encoder endpoint
  * @node: device tree node containing encoder input ports
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b9b093add92e..9d35a141f888 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -7,6 +7,7 @@
 #include <drm/drm_bridge.h>
 #endif
 
+struct aggregate_driver;
 struct component_master_ops;
 struct component_match;
 struct device;
@@ -40,6 +41,9 @@ void drm_of_component_match_add(struct device *master,
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
+int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv);
 int drm_of_encoder_active_endpoint(struct device_node *node,
 				   struct drm_encoder *encoder,
 				   struct of_endpoint *endpoint);
@@ -78,6 +82,14 @@ drm_of_component_probe(struct device *dev,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_aggregate_probe(struct device *dev,
+		       int (*compare_of)(struct device *, void *),
+		       struct aggregate_driver *adrv)
+{
+	return -EINVAL;
+}
+
 static inline int drm_of_encoder_active_endpoint(struct device_node *node,
 						 struct drm_encoder *encoder,
 						 struct of_endpoint *endpoint)
-- 
https://chromeos.dev

