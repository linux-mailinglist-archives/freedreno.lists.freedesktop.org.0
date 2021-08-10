Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EF3E7C3E
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 17:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BF6898BE;
	Tue, 10 Aug 2021 15:30:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBBA898BE
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 15:29:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628609406; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HgKakaRiW9LgKPRH3JPzKe8BzZrBQ8j/TWIYvdkiy94=;
 b=vcvXe8nscWU4zxMUjLHt3Zhb822vhmbyDijR2/7mboI9Pgv0XTMd7hwxsDJAnnysfmEnQ2lQ
 6dowd3+Lzmxo2OEgGeBZo1+yNP92Si82W/GAtubT2CRzjlBFBh/7YbeYmxEbX+IR+JLgORGB
 ilKReESZm+v6LAxqTvn6fQLLTSc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61129b5a91487ad520207548 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 15:29:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 538ABC433F1; Tue, 10 Aug 2021 15:29:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C5ABC433F1;
 Tue, 10 Aug 2021 15:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C5ABC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Aug 2021 08:29:22 -0700
Message-Id: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2] drm/msm/dp: add drm debug logs to
 dp_pm_resume/suspend
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

Changes in V2:
-- correct Fixes text
-- drop commit text

Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8a85613..870b926 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1284,6 +1284,9 @@ static int dp_pm_resume(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
+	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
@@ -1315,6 +1318,10 @@ static int dp_pm_resume(struct device *dev)
 	else
 		dp->dp_display.is_connected = false;
 
+	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
+			dp->link->sink_count, dp->dp_display.is_connected,
+			dp->core_initialized, dp_display->power_on);
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1330,6 +1337,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
+	DRM_DEBUG_DP("Before, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	if (dp->core_initialized == true) {
 		/* mainlink enabled */
 		if (dp_power_clk_status(dp->power, DP_CTRL_PM))
@@ -1343,6 +1353,9 @@ static int dp_pm_suspend(struct device *dev)
 	/* host_init will be called at pm_resume */
 	dp->core_initialized = false;
 
+	DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
+			dp->core_initialized, dp_display->power_on);
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

