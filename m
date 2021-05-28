Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B63946C6
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 20:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D36E0B9;
	Fri, 28 May 2021 18:09:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226456E0B9
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 18:09:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622225388; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=r1zhZYhMoSYg6a1HMnFXMjdjXy3nkmF+hSZFTbu8j3k=;
 b=s/Tnqv5utFcp4iocufb3U8QS9bBmbHiOW+HnqudP4DcqZsKdS4Hqhi0O4N2IdAsjvgmhe55h
 bTY/QrR+6RBQa0+hHjASJi9scqxvmjIupiMGOl+0PWluq7tHNNLMbPD6+TxrX3tz4DCSEoC4
 bKvjhFsNNhyFV1Jzam17lAGqnf0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b131beea2aacd729441e3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 18:09:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DAAD7C4323A; Fri, 28 May 2021 18:09:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60A5FC433F1;
 Fri, 28 May 2021 18:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60A5FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Date: Fri, 28 May 2021 11:08:55 -0700
Message-Id: <1622225335-9875-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2] drm/msm/dp: power off DP phy bases on phy
 state at suspend
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Normal DP suspend operation contains two steps, display off followed
by dp suspend, to complete system wide suspending cycle if display is
up at that time. In this case, DP phy will be powered off at display
off. However there is an exception case that depending on the timing
of dongle plug in during system wide suspending, sometimes display off
procedure may be skipped and dp suspend was called directly. In this
case, dp phy is stay at powered on (phy->power_count = 1) so that at
next resume dp driver crash at main link clock enable due to phy is
not physically powered on.  This patch add phy_power_off() at
dp_ctrl_host_deinit() which is called by dp_pm_suspend() to power off
phy according to the state of is_phy_on flag.

Changes in V2:
-- stashed changes into dp_ctrl.c
-- add is_phy_on to monitor phy state

Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)

Sgned-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dbd8943..3924ac6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -77,6 +77,8 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	bool is_phy_on;
+
 	struct opp_table *opp_table;
 
 	struct completion idle_comp;
@@ -1336,6 +1338,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 
 	phy_configure(phy, &dp_io->phy_opts);
 	phy_power_on(phy);
+	ctrl->is_phy_on = true;
 
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
 	if (ret)
@@ -1414,6 +1417,11 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	phy = dp_io->phy;
 
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	if (ctrl->is_phy_on) {
+		phy_power_off(phy);
+		ctrl->is_phy_on = false;
+	}
+
 	phy_exit(phy);
 
 	DRM_DEBUG_DP("Host deinitialized successfully\n");
@@ -1457,6 +1465,8 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 		return ret;
 	}
 	phy_power_off(phy);
+	ctrl->is_phy_on = false;
+
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -1488,6 +1498,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	}
 
 	phy_power_off(phy);
+	ctrl->is_phy_on = false;
+
 	phy_exit(phy);
 
 	return 0;
@@ -1840,6 +1852,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	phy_power_off(phy);
+	ctrl->is_phy_on = false;
 
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
@@ -1894,6 +1907,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	}
 
 	phy_power_off(phy);
+	ctrl->is_phy_on = false;
+
 	phy_exit(phy);
 
 	DRM_DEBUG_DP("DP off done\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
