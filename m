Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068124246D9
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA886EE28;
	Wed,  6 Oct 2021 19:38:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6D6EE2B
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:31 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id np13so3001150pjb.4
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
 b=BYGV2YJoDO3XYhcc2ImhdpJbxGgocl9uyQLt3U1WbZvj0WL1FshJVPAYJb1NRelDJX
 xSs8FKrvBjdPyW8re4vl4F7WY1oqMfj+MzapTE21WGwzZRESm3Pj2S10sX9mNELTef+/
 tz9fcvBz3MaIYvACyA/0R/zTO0Xrz9+s4yWuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
 b=0I0o+yugYIa7pM9pf1ooutq+V6jxEgSgo5CcMPGL0HJFnejfxdGOSsrnKFD6iKLgqy
 lkZiTD11pgqvPn9wKbk50CDzuhLU/wdNPCZ6tTOMY4zPDDrBsdeSNOv+ek/AoDUFPKxp
 nRvQmCb+NRdoNcRcynP9NzWb1dYovoP7/vzQdhMHPdnpmAbRTKNS0NcwkP4Bc9d4Hbbk
 7O1hAW8a3vtyWvLZP8OjbwpomQm+n76/A+ZXouxL+0h98GKp3ucebNsYEJjeg80sBCdc
 yrRgvKFOk3uJPdh1HIj6wvFiYHuWK4cvCK8V8v+1UvoHwO4W0tGyqjzjvanX/HMX2/bO
 iqmw==
X-Gm-Message-State: AOAM530w3kGFny600lE91juiAK9zl7ve+pXI6pRseBOBaeDw5QPtTXsY
 buGBZqv9h1ru2UdYYOis7LrSww==
X-Google-Smtp-Source: ABdhPJzmaWGAcSqzevd1G0esgXTcACMs0ekVu6jIQ64fXf44o8eRUL2dBeO9lQ2MaAbCFARLQI3HAg==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id
 bi7-20020a170902bf0700b00138e32d9f2emr12466282plb.59.1633549106864; 
 Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:37:48 -0700
Message-Id: <20211006193819.2654854-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 03/34] component: Move struct
 aggregate_device out to header file
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

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 15 ---------------
 include/linux/component.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index d99e99cabb99..f49b48695c8f 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,21 +62,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device *parent;
-	struct device dev;
-	struct component_match *match;
-	struct aggregate_driver *adrv;
-
-	int id;
-};
-
-static inline struct aggregate_device *to_aggregate_device(struct device *d)
-{
-	return container_of(d, struct aggregate_device, dev);
-}
-
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index 95d1b23ede8a..e99cf8e910f0 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -5,6 +5,8 @@
 #include <linux/stddef.h>
 #include <linux/device.h>
 
+struct component_match;
+
 /**
  * struct component_ops - callbacks for component drivers
  *
@@ -39,8 +41,6 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
-
 /**
  * struct component_master_ops - callback for the aggregate driver
  *
@@ -80,7 +80,20 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device *parent;
+	struct device dev;
+	struct component_match *match;
+	struct aggregate_driver *adrv;
+
+	int id;
+};
+
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
 
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
-- 
https://chromeos.dev

