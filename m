Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76884246CD
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AFF6EE2A;
	Wed,  6 Oct 2021 19:38:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2616EE28
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:28 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id v11so3388158pgb.8
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Qz3MqVp4L66d3gQlwKw4vRvuaWChiqClLaMXKhYzGc=;
 b=l4e1FMOrywcfzM+upqvR//TWdKNKEaPy2i+GExt4kB7CT9ZY2TkuT5R4wwZ5N10r8Q
 aXzQLDrjqssJf2bGYdtCJIcX4ikGRYk0jYS1fW5nk405pe73/dlXecwp8sAQ+8z4mSR5
 50almrqWAFn3KuNz8JwxteMdmdJjR/x6sLB8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Qz3MqVp4L66d3gQlwKw4vRvuaWChiqClLaMXKhYzGc=;
 b=qGRrrSpdL2z7FqEpX025CRiy7ceODpGsu0m6QN74LbpqLzsHy8GgGgij5C4pLauSXo
 SPeQnyYgct2IJ9pVZdFdgFZ0KYYtzG8SOa64jDnW36uQSGJE9Z4PXMbv1qTFZScniyxA
 yQIsdzAof0W+C0evoutLQ4nY4Ux+hOr5ymhP2gX5BqVznJH8hJMWGUEjeTENm2gQaU74
 lGi2dLbRYL/YwOzw+/FSL7a7+lVZMgbORUJgsImrW3vNxYqCMCOdo5FvrEeEUoiEjY74
 H5sGe/+OCNkO5KWMXctMRyDR9Uva7qVtlarJfLx+vsLRWscvixhdbRnDO4GulTuidLNp
 eI2w==
X-Gm-Message-State: AOAM5330rex+FUzVw3M1TAtjsYk8JbW8r64Ib9Nbd1DhfjziK9gPufs2
 2B9C0aoLflqjjKGAsueY64VCHQ==
X-Google-Smtp-Source: ABdhPJz5eIxLoJaDCMkqk1dt9OZ5QOr8U4KJ9NKU93qoARaZKheLDyxaukIcyTx+GjZYTxVFRdWgPA==
X-Received: by 2002:a63:cf44:: with SMTP id b4mr440896pgj.215.1633549107965;
 Wed, 06 Oct 2021 12:38:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:27 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:37:49 -0700
Message-Id: <20211006193819.2654854-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/34] drm/msm: Migrate to aggregate driver
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

The device lists are poorly ordered when the component device code is
used. This is because component_master_add_with_match() returns 0
regardless of component devices calling component_add() first. It can
really only fail if an allocation fails, in which case everything is
going bad and we're out of memory. The driver that registers the
aggregate driver, can succeed at probe and put the attached device on
the DPM lists before any of the component devices are probed and put on
the lists.

Within the component device framework this usually isn't that bad
because the real driver work is done at bind time via
component{,master}_ops::bind(). It becomes a problem when the driver
core, or host driver, wants to operate on the component device outside
of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
driver core doesn't understand the relationship between the host device
and the component devices and could possibly try to operate on component
devices when they're already removed from the system or shut down.

Normally, device links or probe defer would reorder the lists and put
devices that depend on other devices in the lists at the correct
location, but with component devices this doesn't happen because this
information isn't expressed anywhere. Drivers simply succeed at
registering their component or the aggregate driver with the component
framework and wait for their bind() callback to be called once the other
components are ready. In summary, the drivers that make up the aggregate
driver can probe in any order.

This ordering problem becomes fairly obvious when shutting down the
device with a DSI controller connected to a DSI bridge that is
controlled via i2c. In this case, the msm display driver wants to tear
down the display pipeline on shutdown via msm_pdev_shutdown() by calling
drm_atomic_helper_shutdown(), and it can't do that unless the whole
display chain is still probed and active in the system. When a display
bridge is on i2c, the i2c device for the bridge will be created whenever
the i2c controller probes, which could be before or after the msm
display driver probes. If the i2c controller probes after the display
driver, then the i2c controller will be shutdown before the display
controller during system wide shutdown and thus i2c transactions will
stop working before the display pipeline is shut down. This means we'll
have the display bridge trying to access an i2c bus that's shut down
because drm_atomic_helper_shutdown() is trying to disable the bridge
after the bridge is off.

The solution is to make the aggregate driver into a real struct driver
that is bound to a device when the other component devices have all
probed. Now that the component driver code is a proper bus, we can
simply register an aggregate driver with that bus via
component_aggregate_register() and then attach the shutdown hook to that
driver to be sure that the shutdown for the display pipeline is called
before any of the component device driver shutdown hooks are called.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 46 +++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc185e54d..efbcae6e585f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1324,19 +1324,35 @@ static int add_gpu_components(struct device *dev,
 	return 0;
 }
 
-static int msm_drm_bind(struct device *dev)
+static int msm_drm_bind(struct aggregate_device *adev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(adev->parent, &msm_driver);
 }
 
-static void msm_drm_unbind(struct device *dev)
+static void msm_drm_unbind(struct aggregate_device *adev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(adev->parent);
+}
+
+static void msm_drm_shutdown(struct aggregate_device *adev)
+{
+	struct drm_device *drm = platform_get_drvdata(to_platform_device(adev->parent));
+	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return;
+
+	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops msm_drm_ops = {
-	.bind = msm_drm_bind,
-	.unbind = msm_drm_unbind,
+static struct aggregate_driver msm_drm_aggregate_driver = {
+	.probe = msm_drm_bind,
+	.remove = msm_drm_unbind,
+	.shutdown = msm_drm_shutdown,
+	.driver = {
+		.name	= "msm_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 /*
@@ -1365,7 +1381,7 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	ret = component_aggregate_register(&pdev->dev, &msm_drm_aggregate_driver, match);
 	if (ret)
 		goto fail;
 
@@ -1378,23 +1394,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &msm_drm_aggregate_driver);
 	of_platform_depopulate(&pdev->dev);
 
 	return 0;
 }
 
-static void msm_pdev_shutdown(struct platform_device *pdev)
-{
-	struct drm_device *drm = platform_get_drvdata(pdev);
-	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
-
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
-}
-
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
@@ -1410,7 +1415,6 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_pdev_shutdown,
 	.driver     = {
 		.name   = "msm",
 		.of_match_table = dt_match,
-- 
https://chromeos.dev

