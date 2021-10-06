Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFEF42471E
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960526EE20;
	Wed,  6 Oct 2021 19:38:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1747289C48
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id j15so2369053plh.7
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f0lZGXHwPviChh1qGaLbcibaQ5KdksPeQeI4kBQa+kk=;
 b=TWus5/+6G/7YPt/GYoLcEu98qL5WELx1WPPHt5rZgDYPi4TbXobioa/gZGAS2oFH2d
 CggOtJzqHj0w6B0PZ7xsOVu8wltF24F6za7fdU5ieL6CQKheeChKFXLcIWyeHcY9g1IZ
 F9kMdlqVsqS+TSe+pEn2ZiG+iUNaQ5zApt9tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f0lZGXHwPviChh1qGaLbcibaQ5KdksPeQeI4kBQa+kk=;
 b=J7hEDQ3ayIKd9ly8Z5lnf8uH0RMut2zo6nf4T99HFzjjCW5KcHf/iPp2KTgtcXNyo+
 LnZWlyiOzEiC+nwozb6+LOyDHwPfVVhrz2U9wkUr29ottDuAiKKy5sdF3BH1oMkTSo37
 CelFejx01+YxN2fXV3UboDzo5nB+4/p1AbolmijTAsI251hDELwNUOfvRbSSBiOFyQYB
 JyroRov+Z383yX8FGmYeMPYvlh84a+IDupiSwLGoGjOvhixAU1jqOgHpPgzOsg4nfqR9
 +Sq0G9HKqOBQ59dj/NCuSL400jk22J25NYonBAio1R1+W+LSKbWrggWRvpxoesxBOtRi
 Z9cg==
X-Gm-Message-State: AOAM532rXIxmmincJA4JmrkTPLo6nFTqtwCoS+l8yh/+Y+DwOoUaw3UN
 u7Kvofx6mecpH/vMoru1BqKA6A==
X-Google-Smtp-Source: ABdhPJw37huVc8Sl+jtSnZOt9wzTLpKJ426qHi4wEQ0jLRRR2Whgp9Qug67BtUn2e1soscFp4V2jhA==
X-Received: by 2002:a17:90b:2503:: with SMTP id
 ns3mr643045pjb.206.1633549132258; 
 Wed, 06 Oct 2021 12:38:52 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:52 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:38:10 -0700
Message-Id: <20211006193819.2654854-26-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 25/34] drm/zte: Migrate to aggregate driver
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

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/zte/zx_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index 064056503ebb..b46f677ea51d 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -45,8 +45,9 @@ static const struct drm_driver zx_drm_driver = {
 	.minor = 0,
 };
 
-static int zx_drm_bind(struct device *dev)
+static int zx_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	int ret;
 
@@ -97,8 +98,9 @@ static int zx_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void zx_drm_unbind(struct device *dev)
+static void zx_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -110,9 +112,13 @@ static void zx_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops zx_drm_master_ops = {
-	.bind = zx_drm_bind,
-	.unbind = zx_drm_unbind,
+static struct aggregate_driver zx_aggregate_driver = {
+	.probe = zx_drm_bind,
+	.remove = zx_drm_unbind,
+	.driver = {
+		.name = "zx_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -135,12 +141,12 @@ static int zx_drm_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(parent, child)
 		component_match_add(dev, &match, compare_of, child);
 
-	return component_master_add_with_match(dev, &zx_drm_master_ops, match);
+	return component_aggregate_register(dev, &zx_aggregate_driver, match);
 }
 
 static int zx_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &zx_drm_master_ops);
+	component_aggregate_unregister(&pdev->dev, &zx_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

