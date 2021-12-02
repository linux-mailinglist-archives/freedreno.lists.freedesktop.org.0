Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD1466C48
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A556FC30;
	Thu,  2 Dec 2021 22:27:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51C06FBF0
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:41 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id l190so1142205pge.7
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pT87OQ3egRwLpYLDnQ//DolOVTqHrwpGRKkmvVo/d+g=;
 b=XTbi4aHkbtNGDS7j3bk/TaTjb/qaeMqit0a8uTadCumr1MKDxtoauG1mCIwIPKQ8XS
 Dn2yKv1Gx/uoxx2EBmq0nBjU+M+6KJuQG2sm6bL9kHKH2MRKkUrwpKsWZYlttmASv0oT
 t6BdBty57VcoUZiABSAuPxOAMQFZBsibnbQ/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pT87OQ3egRwLpYLDnQ//DolOVTqHrwpGRKkmvVo/d+g=;
 b=Y9g0tdmE/ydTvizxun51NhizSV5WAsOTb/LYbw2SjcsV+N2xXWHOM0auxOQ9qDCSic
 O37GWYTK2Uuy4/lmLyPHnigJ062+qFYVFY6DVPoYVDwCyRwdXSihRD0H7ksZjZOfJNTu
 lxkzm+rHKW2r31HHHu5W5RWK5y7e5k6snhkskGzz1jeeXUVJkcBvQ40rH2qF0LvPs1N5
 ooOssYYPg8GpTAsHwRZjcRmgzcPDrDb6OELrosozIkUd0jmSI36LnX/KcbUjWhHVyrVP
 9oCMHXCJGi572Hr1NIRsDY4+u8mPPZZELD9mTwi89M6bg4dp7WiZcNWdpjwGDLdel2R6
 uqdg==
X-Gm-Message-State: AOAM530dqOaZ9OJc3Re8FNrDTHWOyu81Oeka/x4t2vl+IMRn/pzQHTS4
 AZ6+ym8AImC98PFlXIeCsaIMNg==
X-Google-Smtp-Source: ABdhPJzOYaMldd9Pb2GkPUyu2nNVp6KEkzwLQ/LFvfUFYAYdtoCKXeDzVhnicKPYB7tDFx/fdclhpQ==
X-Received: by 2002:a63:1446:: with SMTP id 6mr1569849pgu.150.1638484061394;
 Thu, 02 Dec 2021 14:27:41 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:40 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:04 -0800
Message-Id: <20211202222732.2453851-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 06/34] drm/of: Add a drm_of_aggregate_probe()
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
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
index 37c34146eea8..008d6b7d2283 100644
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

