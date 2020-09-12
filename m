Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14045267C51
	for <lists+freedreno@lfdr.de>; Sat, 12 Sep 2020 22:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC806E372;
	Sat, 12 Sep 2020 20:49:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0036E065
 for <freedreno@lists.freedesktop.org>; Sat, 12 Sep 2020 20:49:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599943786; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=B+4bRrau1EWL//3GYkSdGRYTaZHZpPkbFgxEHGHZgp4=;
 b=gBTw5D2FfmvD1COyJ5RefuHa7UuVugpzp2Wt3wOXXO+lnjmZ5TDFpBeEGDVUV5Z0S96oW9Z0
 DJP8foHk8uMQOLEesP3i+jz+LZUuzO/BhTCTN3asnNjvJXcv41ws1Fzr9tw+rxqfHZYjJqcB
 JctWjxpO6lunrPJIWpzLXqous+4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f5d346932925f96e133e8c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 20:49:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EC535C433FE; Sat, 12 Sep 2020 20:49:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 583F3C433C6;
 Sat, 12 Sep 2020 20:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 583F3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Date: Sat, 12 Sep 2020 13:49:28 -0700
Message-Id: <20200912204932.21232-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912204932.21232-1-abhinavk@codeaurora.org>
References: <20200912204932.21232-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v6 1/5] drm/msm/dp: store dp_display in the
 driver data
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
Cc: vsujithk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, rohitkr@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Store the dp_display in the platform driver data instead of the
dp_display_private.

This is required to allow other sub-modules to reuse the platform
driver data.

Changes in v3: none
Changes in v4: none
Changes in v5: none
Changes in v6: rebase on top of latest patchset of dependency

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa92b6cd6e3e..0defab6e2478 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -181,11 +181,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	struct dp_display_private *dp;
 	struct drm_device *drm;
 	struct msm_drm_private *priv;
-	struct platform_device *pdev = to_platform_device(dev);
 
 	drm = dev_get_drvdata(master);
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
 		return -EINVAL;
@@ -220,11 +220,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
 	struct dp_display_private *dp;
-	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("Invalid DP driver data\n");
 		return;
@@ -359,7 +359,8 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		rc = -ENODEV;
@@ -383,7 +384,8 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 	int rc = 0;
 	struct dp_display_private *dp;
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -435,7 +437,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -EINVAL;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		return -ENODEV;
@@ -1070,12 +1073,14 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	platform_set_drvdata(pdev, dp);
-
 	mutex_init(&dp->event_mutex);
+
 	init_completion(&dp->resume_comp);
+
 	g_dp_display = &dp->dp_display;
 
+	platform_set_drvdata(pdev, g_dp_display);
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
@@ -1089,7 +1094,8 @@ static int dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_display_deinit_sub_modules(dp);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
