Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F486466C56
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704216FC35;
	Thu,  2 Dec 2021 22:27:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8266FBE7
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so889675pjb.5
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
 b=TYTXsCnVyVTMggbeBEtilnBT75yzpjt35jbDKimuVcwhwcfmhkMUt0O/B8rQUSvzVj
 kwqQbp0iz9i7spvQquprrlXz+cCMKl886MW5eEdqmhfabJFDvTz0TDar0r/FXI9Ps3yH
 Shju2GWwcGqS3zvrpgS+tWBipo/I9FiU9cxPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
 b=4zg1qjBA1al/4NI82kNrw+mmfZLQDz+XInDyljeDuWFUUxX9SBUr+cKWP+Hto9ClLs
 MKSykXkF2NFSE+INNxbZtdMZMtnWvo4zyNDSU7HL6tGQaoDapv4+2oQuUmwDR46lwYmq
 Bds2OTm71XT+Too6f1gNJBmUyA7pnrjPWb6whdfxxv+zz8uUNAtQrRLgrETdduk2Ms8R
 Mn50y9ZSY6PUjKyXSrfCFN+UWG7U57toSnuOk22CW2XJRoRFUtP/X3nzOKIQXmLkcKkA
 eu0KGQWe14AvhcpmMoP84uv3MZnx3XXoTd9+DnYCauk2IfaheRPbqeudqyrqHtzZCcgh
 V88Q==
X-Gm-Message-State: AOAM533ybaAHhd/BybPxyEnO3IanPgyItmGxM8moppynNlPoA3sQcS3g
 /9jmyfxtM4sGyM6PYSWqKp91yQ==
X-Google-Smtp-Source: ABdhPJyNC53JvGfTRvEHLfMmhZGaR3cy2dCdn1n96q59Rc7U/59GKl5q24SheXagRu3oedysUHBoYQ==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr18420870plh.54.1638484065458; 
 Thu, 02 Dec 2021 14:27:45 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:45 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:09 -0800
Message-Id: <20211202222732.2453851-12-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 11/34] drm/armada: Migrate to aggregate driver
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
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/armada/armada_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..b3559363ea43 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -60,8 +60,9 @@ static const struct drm_mode_config_funcs armada_drm_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static int armada_drm_bind(struct device *dev)
+static int armada_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct armada_private *priv;
 	struct resource *mem = NULL;
 	int ret, n;
@@ -159,8 +160,9 @@ static int armada_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void armada_drm_unbind(struct device *dev)
+static void armada_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct armada_private *priv = drm_to_armada_dev(drm);
 
@@ -202,9 +204,13 @@ static void armada_add_endpoints(struct device *dev,
 	}
 }
 
-static const struct component_master_ops armada_master_ops = {
-	.bind = armada_drm_bind,
-	.unbind = armada_drm_unbind,
+static struct aggregate_driver armada_aggregate_driver = {
+	.probe = armada_drm_bind,
+	.remove = armada_drm_unbind,
+	.driver = {
+		.name = "armada_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int armada_drm_probe(struct platform_device *pdev)
@@ -213,7 +219,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = drm_of_component_probe(dev, compare_dev_name, &armada_master_ops);
+	ret = drm_of_aggregate_probe(dev, compare_dev_name, &armada_aggregate_driver);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -240,13 +246,12 @@ static int armada_drm_probe(struct platform_device *pdev)
 		}
 	}
 
-	return component_master_add_with_match(&pdev->dev, &armada_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &armada_aggregate_driver, match);
 }
 
 static int armada_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &armada_master_ops);
+	component_aggregate_unregister(&pdev->dev, &armada_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

