Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E549EBD5
	for <lists+freedreno@lfdr.de>; Thu, 27 Jan 2022 21:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1610E614;
	Thu, 27 Jan 2022 20:02:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A110E2D1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:29 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id k17so3765085plk.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g623/C18UKVOGP0jeG3P9XoZ0hRTRdI8bxCTdme+ZDc=;
 b=UjXyKQ27u9ktmyUhlabtrzpM184jAnjXIW63DCf85unRcMTX6v/Xs4Fw8lX6VtLkrG
 0i0Rpg4QPjonKcYKL/d7xYdgHlEeoHJrADQdyIWZWCeqxWps1f0ssg+phw6p/LB4XTD9
 1x4mXefiju1VsB+cP1wQ3Ej679uZCdIZ8uomc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g623/C18UKVOGP0jeG3P9XoZ0hRTRdI8bxCTdme+ZDc=;
 b=b5A93zjL46AmJJMuxYv2/WGdqyXis5FdgU72PwBFmuFP9JkE3SNHhhvPbTwZPT0Sch
 J6HPGR+kMV7T7EgpffCGKyy5Yw0AcN9u/TKdgQooFFRXdD0eGO2R7ze/lKKVL/ihKSMP
 Ba45KqayJKYUqcIsuNdCJOcgZOe/w2KCHkk3mhsy6xa1JfsJGVjaXrGXrUYXGESzh57a
 zieR0A8oERmTRbg85rBvNwwv7TCYLkAbDyDRUBlEJwQX5Di8h1OuiEtEeytEWkVe4LO/
 BRbNZCGyTIoWzhWd6VBtp6/AxU5CjcKxmPJDbkrRQHIt4Kvsry4knu+HKp+ZqxK28B/O
 KHUg==
X-Gm-Message-State: AOAM530hXaIEi6f3MyEDnAofWFR8SyjzW8Tu9C2mFrcbiuAUdrGZeK1Z
 FWmWe/2htkDpWTNdl2vqIgQI8A==
X-Google-Smtp-Source: ABdhPJyaGm/XG8xRvxwiAz5T8R45IbJcC1YnZiE695jmz59Zq5cjk/F0goVL7OumDWNu0N2Qqr17jg==
X-Received: by 2002:a17:902:b40b:: with SMTP id
 x11mr296131plr.75.1643313749462; 
 Thu, 27 Jan 2022 12:02:29 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:29 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 27 Jan 2022 12:01:32 -0800
Message-Id: <20220127200141.1295328-27-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 26/35] mei: Migrate to aggregate driver
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
Cc: Saravana Kannan <saravanak@google.com>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexander Usyskin <sanniu@gmail.com>,
 freedreno@lists.freedesktop.org, Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Alexander Usyskin <sanniu@gmail.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/misc/mei/hdcp/mei_hdcp.c | 22 +++++++++++++---------
 drivers/misc/mei/pxp/mei_pxp.c   | 22 +++++++++++++---------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index ec2a4fce8581..3c6e4e3bf212 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -732,8 +732,9 @@ static const struct i915_hdcp_component_ops mei_hdcp_ops = {
 	.close_hdcp_session = mei_hdcp_close_session,
 };
 
-static int mei_component_master_bind(struct device *dev)
+static int mei_hdcp_aggregate_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -749,8 +750,9 @@ static int mei_component_master_bind(struct device *dev)
 	return 0;
 }
 
-static void mei_component_master_unbind(struct device *dev)
+static void mei_hdcp_aggregate_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -759,9 +761,13 @@ static void mei_component_master_unbind(struct device *dev)
 	component_unbind_all(dev, comp_master);
 }
 
-static const struct component_master_ops mei_component_master_ops = {
-	.bind = mei_component_master_bind,
-	.unbind = mei_component_master_unbind,
+static struct aggregate_driver mei_aggregate_driver = {
+	.probe = mei_hdcp_aggregate_bind,
+	.remove = mei_hdcp_aggregate_unbind,
+	.driver = {
+		.name = "mei_hdcp_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -826,9 +832,7 @@ static int mei_hdcp_probe(struct mei_cl_device *cldev,
 	}
 
 	mei_cldev_set_drvdata(cldev, comp_master);
-	ret = component_master_add_with_match(&cldev->dev,
-					      &mei_component_master_ops,
-					      master_match);
+	ret = component_aggregate_register(&cldev->dev, &mei_aggregate_driver, master_match);
 	if (ret < 0) {
 		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
 		goto err_exit;
@@ -850,7 +854,7 @@ static void mei_hdcp_remove(struct mei_cl_device *cldev)
 						mei_cldev_get_drvdata(cldev);
 	int ret;
 
-	component_master_del(&cldev->dev, &mei_component_master_ops);
+	component_aggregate_unregister(&cldev->dev, &mei_aggregate_driver);
 	kfree(comp_master);
 	mei_cldev_set_drvdata(cldev, NULL);
 
diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index f7380d387bab..887e43e6ba5f 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -83,8 +83,9 @@ static const struct i915_pxp_component_ops mei_pxp_ops = {
 	.recv = mei_pxp_receive_message,
 };
 
-static int mei_component_master_bind(struct device *dev)
+static int mei_pxp_aggregate_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
 	int ret;
@@ -98,17 +99,22 @@ static int mei_component_master_bind(struct device *dev)
 	return 0;
 }
 
-static void mei_component_master_unbind(struct device *dev)
+static void mei_pxp_aggregate_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
 
 	component_unbind_all(dev, comp_master);
 }
 
-static const struct component_master_ops mei_component_master_ops = {
-	.bind = mei_component_master_bind,
-	.unbind = mei_component_master_unbind,
+static struct aggregate_driver mei_aggregate_driver = {
+	.probe = mei_pxp_aggregate_bind,
+	.remove = mei_pxp_aggregate_unbind,
+	.driver = {
+		.name = "mei_pxp_agg",
+		.owner = THIS_MODULE,
+	}
 };
 
 /**
@@ -173,9 +179,7 @@ static int mei_pxp_probe(struct mei_cl_device *cldev,
 	}
 
 	mei_cldev_set_drvdata(cldev, comp_master);
-	ret = component_master_add_with_match(&cldev->dev,
-					      &mei_component_master_ops,
-					      master_match);
+	ret = component_aggregate_register(&cldev->dev, &mei_aggregate_driver, master_match);
 	if (ret < 0) {
 		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
 		goto err_exit;
@@ -196,7 +200,7 @@ static void mei_pxp_remove(struct mei_cl_device *cldev)
 	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
 	int ret;
 
-	component_master_del(&cldev->dev, &mei_component_master_ops);
+	component_aggregate_unregister(&cldev->dev, &mei_aggregate_driver);
 	kfree(comp_master);
 	mei_cldev_set_drvdata(cldev, NULL);
 
-- 
https://chromeos.dev

