Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B56466C6D
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFDD6FC3B;
	Thu,  2 Dec 2021 22:27:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DC06FC3A
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:46 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so3634180pjc.4
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
 b=edVjBt2zUt8d3ir9bHAny/D3iecuGEgCqLqHfB5LmxlqM/yeay/mFqvVssTz8pJmS1
 jIweoBkWZO8bpd1W6q5ofzuSBydx3x8o279iLi58XYs+aUU3Ru8bhRqzS309BXG95AOM
 pii45rKsVjczgp4/CPME0N90C+u8Xq5jwOJ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
 b=sKHL61fYpC/J5IKO6iEs2S/C/hEAXYle6GdlK/USEgX+TXJwgtchLP4kxqqAhmSAay
 iEXlAiERgEeFgP91U+u2PfVdMJ3UMZFBI3YaMMJuXAFtJan1Mx065v3XLqru///6izMX
 BYO38VJkKRYxlCttXP74TGSJjS90ILmYcj5t+3W4kzyr8lMthgyEtskCtp61DEDf1r+Q
 rmdzWPdXVIK/tLtBld8hmplLVK1G7eLLJp6ke1OHY7+KLrVh2L9elCAoabOs8EofjRsI
 C8PwgacnxJzWe7wHsTjdMPuXBDHMHNkLoqsu1wys530LTVdI95aktLCmJ+Bx5rGq4mf0
 0VPQ==
X-Gm-Message-State: AOAM533li0Wz8I2Lo0L1LnmNrv/gQ9NHc7VUQ5iYA2wEg/dUGOcqmxHC
 1+9FtA0RzCK4a5AWB7QK9BofFg==
X-Google-Smtp-Source: ABdhPJwr+y/130Jtap14aGacCeh6jp3d9XXNKHQZYwirxPlGzgQbGLR2z4IOOYuR0xMawVt16u+bLg==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id
 q16-20020a170902789000b00143c4f759e6mr18430277pll.87.1638484066222; 
 Thu, 02 Dec 2021 14:27:46 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:45 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:10 -0800
Message-Id: <20211202222732.2453851-13-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 12/34] drm/etnaviv: Migrate to aggregate
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
Cc: Rob Clark <robdclark@gmail.com>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, freedreno@lists.freedesktop.org,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7dcc6392792d..95d1e518ff13 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,8 +494,9 @@ static const struct drm_driver etnaviv_drm_driver = {
 /*
  * Platform driver:
  */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
 	int ret;
@@ -552,8 +553,9 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
@@ -569,9 +571,13 @@ static void etnaviv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
-	.bind = etnaviv_bind,
-	.unbind = etnaviv_unbind,
+static struct aggregate_driver etnaviv_aggregate_driver = {
+	.probe = etnaviv_bind,
+	.remove = etnaviv_unbind,
+	.driver = {
+		.name = "etnaviv_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -609,12 +615,12 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, compare_str, names[i]);
 	}
 
-	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
+	return component_aggregate_register(dev, &etnaviv_aggregate_driver, match);
 }
 
 static int etnaviv_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &etnaviv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &etnaviv_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

