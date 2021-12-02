Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87400466C77
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE496FC5E;
	Thu,  2 Dec 2021 22:28:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972E36FC61
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:57 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s137so1159006pgs.5
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXQku93D/rC4XyQwRyjDG+Hw8yXvhZdjZb839YbIyVI=;
 b=Iz/NjPjdEaZsBHJkEVtreK2U1LcF5Hqi38Sw8WurdATCOC6cL1aALbf5tKQ42nw/JP
 XLpn10TTzlDxcNpFgdRhit4cBTePM4p/PIDWzc95txSTNFZo0kjFKj1KkzQzYtvCtams
 AY/q6Vck3YO6Ilm0AFo2PgxxI49UeqhKkWzFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXQku93D/rC4XyQwRyjDG+Hw8yXvhZdjZb839YbIyVI=;
 b=PuAKFPcsKmxNaEoP+ronpIoM84vOjoap1JVcueYroy1/WHmML6tosAH5YiGCVma51u
 8wZxbCwWZWhlilDxoqOowr5L1fSbWzzx242h17MdWnzLFl78Yfm5KF+6tf0uJIeBYdKS
 oSP6RRlHqXKRkHZhDpVjY+mfGdjPCIeLGJngaagaZMx74EOCfqHQQRfmNFnBNUnAiU5e
 tkl/OaH2FiNjsTGi+NgSsNmuVTqpbw0UnYs7UN+AvM6V030cUp3xxM0mZPRuKv1cP3k9
 ++PIjkGbKQ6vistuWtzLEJjS3wqOaHeqwK7eRdJmJAp5TDwGasi2cr8d2O1FDrs0G/uB
 WSkA==
X-Gm-Message-State: AOAM531l+Yt/nfMPk0/rFrU6iqja3v3w4varukPHaRdWS8pRNO0Vmcue
 nD9BESwwi0vq8/KtWhjUghxGlQ==
X-Google-Smtp-Source: ABdhPJxVmEV2ZUl66ZDAbxGprGmuY7cFZIZJo7PYVlcaMs8O09k6dLAZng38yOdGkw+kn2oxif5+jA==
X-Received: by 2002:a63:531d:: with SMTP id h29mr1517646pgb.583.1638484076938; 
 Thu, 02 Dec 2021 14:27:56 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:56 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:23 -0800
Message-Id: <20211202222732.2453851-26-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 25/34] drm/vc4: Migrate to aggregate driver
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
Cc: Saravana Kannan <saravanak@google.com>, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..82a44ebf9121 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -212,8 +212,9 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
-static int vc4_drm_bind(struct device *dev)
+static int vc4_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -284,8 +285,9 @@ static int vc4_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void vc4_drm_unbind(struct device *dev)
+static void vc4_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -293,9 +295,13 @@ static void vc4_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops vc4_drm_ops = {
-	.bind = vc4_drm_bind,
-	.unbind = vc4_drm_unbind,
+static struct aggregate_driver vc4_aggregate_driver = {
+	.probe = vc4_drm_bind,
+	.remove = vc4_drm_unbind,
+	.driver = {
+		.name = "vc4_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 /*
@@ -326,12 +332,12 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
 	vc4_match_add_drivers(dev, &match,
 			      component_drivers, ARRAY_SIZE(component_drivers));
 
-	return component_master_add_with_match(dev, &vc4_drm_ops, match);
+	return component_aggregate_register(dev, &vc4_aggregate_driver, match);
 }
 
 static int vc4_platform_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &vc4_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &vc4_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

