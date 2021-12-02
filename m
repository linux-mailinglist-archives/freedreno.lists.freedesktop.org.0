Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE15466C79
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C526FC5F;
	Thu,  2 Dec 2021 22:28:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF726FBD0
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:55 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x5so1005327pfr.0
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
 b=DuUYdGjfuiZBR1ya+iPMu+Sdj6HN/HJ08JUma9wc/4Lv3gy0ePurYjL7t/73NeUuAq
 Q64+6CKAFwPkeFLGdygcG+gv17qHsi0b1+edKa4FKi2dyoZNvb992X0lgxv89pR3O67d
 czo3LRlHOcJy3IGu6WOnt1cvXkO5nl2UJqFRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
 b=c9Gw3EqtZfZ1wo5+iKc4O69a3WRsNvVNUhQ8f5bRpFDxoDP+IU/UkBVxzR5K94AyvF
 m2m1fflKtiBOf4lNofq6/gWABVaR6tgVwlMo9j02Ybxmb5KrY0KA2nguu9Wqi3MsLBIN
 LrYIJfrinqFJIVQlIJssodO5Mt5ts9+WhbNxk/OFANPcRHwnfjHpXOHItUNb+WJrshIh
 TqQE5mE+0RoGhLNPA8ePcXwY1ooyaSvHaGCvSvvv/gCXRiMweQPWaGD/EgGdP+NcnEAI
 Ib/acTIKxJvtFo8WmjHZ01Q4bk8I9SVyJIs5qFhNaNgET0sR79ip9Okw1Q4j9m5X4URh
 FJQg==
X-Gm-Message-State: AOAM530dV1Jg6MCErTzXMhLndZX8H5grhGjUezVrphMij34n98J97PTr
 neIRgXxQ/ULOb2/YpBiEJUMhGg==
X-Google-Smtp-Source: ABdhPJwyV6A1W8Nb048fK/AxET3ZKPbCUPvFdhVy84ThrAAhIMdBm6o5JXluuljHIlgP9I1HrnwIfA==
X-Received: by 2002:a63:66c7:: with SMTP id a190mr1546381pgc.463.1638484075311; 
 Thu, 02 Dec 2021 14:27:55 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:55 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:21 -0800
Message-Id: <20211202222732.2453851-24-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 23/34] drm/sun4i: Migrate to aggregate driver
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
Cc: Rob Clark <robdclark@gmail.com>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 54dd562e294c..700f5e32eaf7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -56,8 +56,9 @@ static const struct drm_driver sun4i_drv_driver = {
 	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
-static int sun4i_drv_bind(struct device *dev)
+static int sun4i_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct sun4i_drv *drv;
 	int ret;
@@ -125,8 +126,9 @@ static int sun4i_drv_bind(struct device *dev)
 	return ret;
 }
 
-static void sun4i_drv_unbind(struct device *dev)
+static void sun4i_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -140,9 +142,13 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops sun4i_drv_master_ops = {
-	.bind	= sun4i_drv_bind,
-	.unbind	= sun4i_drv_unbind,
+static struct aggregate_driver sun4i_aggregate_driver = {
+	.probe	= sun4i_drv_bind,
+	.remove	= sun4i_drv_unbind,
+	.driver = {
+		.name = "sun4i_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static bool sun4i_drv_node_is_connector(struct device_node *node)
@@ -398,16 +404,14 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 	}
 
 	if (count)
-		return component_master_add_with_match(&pdev->dev,
-						       &sun4i_drv_master_ops,
-						       match);
-	else
-		return 0;
+		return component_aggregate_register(&pdev->dev, &sun4i_aggregate_driver, match);
+
+	return 0;
 }
 
 static int sun4i_drv_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &sun4i_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

