Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A475149EB98
	for <lists+freedreno@lfdr.de>; Thu, 27 Jan 2022 21:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD10410E24A;
	Thu, 27 Jan 2022 20:02:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D910E29C
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:04 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c3so3698132pls.5
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfnjF41HCOKigUHHElQ1GWXWlBxR3YM46STsN/SgFFM=;
 b=en86y2AOvAbg2KTFCVhSEXO0TVrdu/a0fKOWve2IDJGmOj4mSxrtVbnmRB71KDWpGx
 VEIgrT5qyGLia2WBCKyjZHkR9ucg+9WsVSjZ7iZAUPaUm+Rx5mLoumInbyK36EQolOF+
 t095Yti2absn0BK8arUaVtgk6mouD51F/h+Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfnjF41HCOKigUHHElQ1GWXWlBxR3YM46STsN/SgFFM=;
 b=Ee0Rby60E1GUe8zFNrdhFhJe0Hy0JJzz9G2yWO++APoNJ1sZsq25xdNbDL+boGT1F7
 1c33nM4khr6UHnXS+MEjigPsn8ZdE+UXJ71DCZ2ikmN57w0cKxvBQ6XQ/fsGPmQ2YdaJ
 JnIPreGBGnQnBh1CthaI6ur0a6t8Pp9NK10aIS3tVjPEBPZ7d9Y0/w1yx+sMU1X/tGuC
 tOWCdLr/11VaKh6anrsr5mOnUrqXv5JyVbjoefyOQXn7N7RE1FdN0Hy/QOIt2AcILVHI
 9FxBwXUNcQ9wpVcdAdqPjsmxnhs3J1UZvyxE5rT5lkiH6vuuCwF763VPQgYAVuqZ3l1Z
 1qvg==
X-Gm-Message-State: AOAM533F/RDRKJ9igw2lTNX5sl4iS8JLVA1+3YiKSE6L8FSfwG8+l0Fm
 IQCDVlJ93tAVDo8dppWuvNrdBg==
X-Google-Smtp-Source: ABdhPJxcmmgspiZnHqRE8o1xWmcD3EypXwnytICOWnAqTR5UOd3FVpRwkmHOZpNcjLcOVKt7R7lLrQ==
X-Received: by 2002:a17:902:7ec1:: with SMTP id
 p1mr4547318plb.159.1643313723638; 
 Thu, 27 Jan 2022 12:02:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:03 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 27 Jan 2022 12:01:13 -0800
Message-Id: <20220127200141.1295328-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 07/35] drm/komeda: Migrate to aggregate driver
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..5fa868cf9825 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -25,8 +25,9 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
 	return mdrv ? mdrv->mdev : NULL;
 }
 
-static void komeda_unbind(struct device *dev)
+static void komeda_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
 	if (!mdrv)
@@ -45,8 +46,9 @@ static void komeda_unbind(struct device *dev)
 	devm_kfree(dev, mdrv);
 }
 
-static int komeda_bind(struct device *dev)
+static int komeda_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct komeda_drv *mdrv;
 	int err;
 
@@ -87,9 +89,13 @@ static int komeda_bind(struct device *dev)
 	return err;
 }
 
-static const struct component_master_ops komeda_master_ops = {
-	.bind	= komeda_bind,
-	.unbind	= komeda_unbind,
+static struct aggregate_driver komeda_aggregate_driver = {
+	.probe	= komeda_bind,
+	.remove	= komeda_unbind,
+	.driver = {
+		.name  = "komeda_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -129,12 +135,12 @@ static int komeda_platform_probe(struct platform_device *pdev)
 		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 1);
 	}
 
-	return component_master_add_with_match(dev, &komeda_master_ops, match);
+	return component_aggregate_register(dev, &komeda_aggregate_driver, match);
 }
 
 static int komeda_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &komeda_master_ops);
+	component_aggregate_unregister(&pdev->dev, &komeda_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

