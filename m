Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3A466C6A
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DB66FC64;
	Thu,  2 Dec 2021 22:27:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C428B6FC3C
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:50 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g18so959279pfk.5
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NzGyKglvPau4q0v9u6dmIzAdp+hd1Eh9CZzdxQoEKjU=;
 b=OrPyVbGKZ7U8IUZdernU1rar5h9/SX+RfjhtxKW1SBnq0akyjbMmrj8pZ5yh4XMluT
 yyZKWAmOdgSVvoEWzYSKEX+zLWm3Svu6KXsz/t8GOWwOf17siT5fNb55Yz3SyCRdclRD
 s93qd3kPo6ikuDHKGmmZg42P93MjdCrJgmqho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NzGyKglvPau4q0v9u6dmIzAdp+hd1Eh9CZzdxQoEKjU=;
 b=Myrtp+OK002/dsbOnez5XsqFdF8fjEPgJtMgYCgN6CA7Qv5kecP7Ys7yJwfEkLep73
 jUMSEM4Psm8tiZS0WD2MGrL02sgsivrd0RAppLED09CAqxKs+GzO8/kYnD1T2jc6JvpA
 fUykdZ4mKoD8s+hLRR93L0Cwxuq9BDOTe7LZZX+ok3/gB8PHYYEcbsrkNu+9SpbCbHxb
 vNJKKQ+BgUls12Fwp9gFI7wt12Sw9IhisFuof5uy+SpAc/luo3ttcSoKEDbX7SF8F0UT
 P3HbGKeCLKcmoXBEpXNCU5Nq74UbJ3ISKnfsfbxaEEmuE7dSG389OQCSXzx6PMu7rjGc
 U+xg==
X-Gm-Message-State: AOAM533jxNHfEmLTfR9V4jrNxoGgYI3rs7Kgy2RT9EFQ2GWL2KGX7eSS
 vyGOOGIMf7Ruf9xADv29BtZIow==
X-Google-Smtp-Source: ABdhPJxYrLMKujDzui6/t9n9lv6aIe5V2uKYN4fTKOZtM3iFG3ytu1txjiTDSyyL2T/8Iot4LHONEg==
X-Received: by 2002:a63:5c05:: with SMTP id q5mr1536978pgb.599.1638484070333; 
 Thu, 02 Dec 2021 14:27:50 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:49 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:27:15 -0800
Message-Id: <20211202222732.2453851-18-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 17/34] drm/mcde: Migrate to aggregate driver
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
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
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
 drivers/gpu/drm/mcde/mcde_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5b5afc6aaf8e..1652f9e0601d 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -215,8 +215,9 @@ static const struct drm_driver mcde_drm_driver = {
 	DRM_GEM_CMA_DRIVER_OPS,
 };
 
-static int mcde_drm_bind(struct device *dev)
+static int mcde_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	int ret;
 
@@ -247,8 +248,9 @@ static int mcde_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void mcde_drm_unbind(struct device *dev)
+static void mcde_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -256,9 +258,13 @@ static void mcde_drm_unbind(struct device *dev)
 	component_unbind_all(drm->dev, drm);
 }
 
-static const struct component_master_ops mcde_drm_comp_ops = {
-	.bind = mcde_drm_bind,
-	.unbind = mcde_drm_unbind,
+static struct aggregate_driver mcde_drm_comp_driver = {
+	.probe = mcde_drm_bind,
+	.remove = mcde_drm_unbind,
+	.driver = {
+		.name = "mcde_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static struct platform_driver *const mcde_component_drivers[] = {
@@ -419,7 +425,7 @@ static int mcde_probe(struct platform_device *pdev)
 	 * Perform an invasive reset of the MCDE and all blocks by
 	 * cutting the power to the subsystem, then bring it back up
 	 * later when we enable the display as a result of
-	 * component_master_add_with_match().
+	 * component_aggregate_register().
 	 */
 	ret = regulator_disable(mcde->epod);
 	if (ret) {
@@ -429,8 +435,7 @@ static int mcde_probe(struct platform_device *pdev)
 	/* Wait 50 ms so we are sure we cut the power */
 	usleep_range(50000, 70000);
 
-	ret = component_master_add_with_match(&pdev->dev, &mcde_drm_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &mcde_drm_comp_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		/*
@@ -459,7 +464,7 @@ static int mcde_remove(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 	struct mcde *mcde = to_mcde(drm);
 
-	component_master_del(&pdev->dev, &mcde_drm_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &mcde_drm_comp_driver);
 	clk_disable_unprepare(mcde->mcde_clk);
 	regulator_disable(mcde->vana);
 	regulator_disable(mcde->epod);
-- 
https://chromeos.dev

