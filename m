Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F81D2B27DC
	for <lists+freedreno@lfdr.de>; Fri, 13 Nov 2020 23:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1A6E874;
	Fri, 13 Nov 2020 22:08:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213F26E874
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 22:08:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605305313; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FpTgLx/uDoxiChUUk0f+rQsxadQ/qzSzohmcaXSx1x4=;
 b=Zjg8aYO7HrtK/h0rPHY0ZWYvkw1fn81+tDNeUvH7XEpWmqPdout+a3cuL4cH3kgrWpf2awpK
 54244+nYtwhCzn4S171y+rmt+V18DcGXNnWZqoCXTlpDSVV36pspHzdIqYARlP+bFeL6p1p6
 i52wTqFYcF34LlF/+h4trBx0S7E=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5faf03e0309342b914ab673d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 22:08:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 295B9C43391; Fri, 13 Nov 2020 22:08:32 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 80319C433C9;
 Fri, 13 Nov 2020 22:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80319C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Date: Fri, 13 Nov 2020 14:08:03 -0800
Message-Id: <20201113220803.15033-4-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113220803.15033-1-khsieh@codeaurora.org>
References: <20201113220803.15033-1-khsieh@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/dp: promote irq_hpd handle to
 handle link training correctly
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some dongles require link training done at irq_hpd request instead
of plugin request. This patch promote irq_hpd handler to handle link
training and setup hpd_state correctly.

Changes in V2:
--  fix Fixes tag text

Fixes: fdaf9a5e3c15 ("drm/msm/dp: fixes wrong connection state caused by failure of link training")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0c0573ad34e6..27e7e27b8b90 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -449,10 +449,9 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 	sink_request = dp->link->sink_request;
 
 	if (sink_request & DS_PORT_STATUS_CHANGED) {
-		dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		if (dp_display_is_sink_count_zero(dp)) {
 			DRM_DEBUG_DP("sink count is zero, nothing to do\n");
-			return 0;
+			return -ENOTCONN;
 		}
 
 		return dp_display_process_hpd_high(dp);
@@ -469,7 +468,9 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 static int dp_display_usbpd_attention_cb(struct device *dev)
 {
 	int rc = 0;
+	u32 sink_request;
 	struct dp_display_private *dp;
+	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -483,10 +484,26 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
+	hpd = dp->usbpd;
+
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
-	if (!rc)
-		dp_display_handle_irq_hpd(dp);
+	if (!rc) {
+		sink_request = dp->link->sink_request;
+		if (sink_request & DS_PORT_STATUS_CHANGED) {
+			/* same as unplugged */
+			hpd->hpd_high = 0;
+			dp->hpd_state = ST_DISCONNECT_PENDING;
+			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+		}
+
+		rc = dp_display_handle_irq_hpd(dp);
+
+		if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
+			hpd->hpd_high = 1;
+			dp->hpd_state = ST_CONNECT_PENDING;
+		}
+	}
 
 	return rc;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
