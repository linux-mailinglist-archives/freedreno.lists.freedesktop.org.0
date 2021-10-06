Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB74246E1
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4016EE2F;
	Wed,  6 Oct 2021 19:38:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3D36EE2D
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:32 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s75so3401005pgs.5
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZ50+nY6iKl4XzIgEo27g77S25bE2oAR00ZvAHfRl/s=;
 b=VAuNWWpXvcDIC0EtmclApgGs3mUgw132HiRjwqx6qFpK7airfdQxAgppizP53solsC
 sbfIgh3sZ8h1i4NGIbFxB7GpyHzj25lS+98cfdXkHV4mEv1BdzftynD+NrGP0EHv1v4W
 MvKJy3mJ1XO818T/sKGM0Xd/N6A9Jk7VquK7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZ50+nY6iKl4XzIgEo27g77S25bE2oAR00ZvAHfRl/s=;
 b=B39vZS4a63XSgvr3kA2qFe/DGBWsCH7rg1dmoB8XbWVQ94wc9QmrC6KIl6WF/yGqHx
 V4jlPr0s3YPw7BBHlI7n4NQtV0HfxCZRsqyJ5sqyE1aLuUtNJ1miieesin7SNMzwJzFA
 v8wQ9L/ilii2v/P5pM28X0TTMy5RzNXA0tOuRShZXK/g2ye6LskdtADKbq6u45xm52p2
 rAJ6YvLpvX9OtoJXNtJfTdVKYijuxHHIY5tdMf1lzfIP9C2zzMWVclis1bCMLXyGwFQ9
 8FNFqXr83vZM8qAPmq2Ef7RSegs41kw3AG4yrSPCdWdrWUMQRfvLDx8uYSoFKeScH+O/
 vMcg==
X-Gm-Message-State: AOAM532Vfo9DQjX5qgD528R3K+iJemclWAGBXxbJY/p7FNTf5Irkyz2V
 xr0KwT0/sNocTne4spXIlg/wRw==
X-Google-Smtp-Source: ABdhPJxlVpTQwUTtDgr6C3JCHEPtvD3GPaVWT3EFo7FG/d0w7JfLy1mAQ6Kb40DgOcgVvm3myI73kQ==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr468986pgf.228.1633549112200; 
 Wed, 06 Oct 2021 12:38:32 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:37:53 -0700
Message-Id: <20211006193819.2654854-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/34] drm/arm/hdlcd: Migrate to aggregate
 driver
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..8f3e5924042a 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -270,8 +270,9 @@ static const struct drm_driver hdlcd_driver = {
 	.minor = 0,
 };
 
-static int hdlcd_drm_bind(struct device *dev)
+static int hdlcd_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
@@ -344,8 +345,9 @@ static int hdlcd_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void hdlcd_drm_unbind(struct device *dev)
+static void hdlcd_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 
@@ -367,9 +369,13 @@ static void hdlcd_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops hdlcd_master_ops = {
-	.bind		= hdlcd_drm_bind,
-	.unbind		= hdlcd_drm_unbind,
+static struct aggregate_driver hdlcd_aggregate_driver = {
+	.probe		= hdlcd_drm_bind,
+	.remove		= hdlcd_drm_unbind,
+	.driver		= {
+		.name 	= "hdlcd_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int compare_dev(struct device *dev, void *data)
@@ -390,13 +396,12 @@ static int hdlcd_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
 	of_node_put(port);
 
-	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &hdlcd_aggregate_driver, match);
 }
 
 static int hdlcd_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &hdlcd_master_ops);
+	component_aggregate_unregister(&pdev->dev, &hdlcd_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

