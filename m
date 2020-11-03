Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763482A45B3
	for <lists+freedreno@lfdr.de>; Tue,  3 Nov 2020 13:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7116EC88;
	Tue,  3 Nov 2020 12:58:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FB36EC88
 for <freedreno@lists.freedesktop.org>; Tue,  3 Nov 2020 12:58:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604408299; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=l5vV2ZlXF8y6CRsqUNbo4YItI4HCWM0SIqYCxVDjxsk=;
 b=e5xC0h9/RfrKcZrXuM9yclZ9LAQoRaBfng1oDAPWLzYbf9jMkcKMIsgAN1oIumfc2fY+5fps
 NH7Wi1HxA7BLkAgsU8+VRS7xfY2/iDlO3+uvwiOy8OadzrdGhRgBb0rjaAK/AprRHaO0aSEQ
 u//7ENNrk5N0TkiXnJ+cXbbyO8Y=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa153eb978460d05b44b46d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 12:58:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 118BCC433C6; Tue,  3 Nov 2020 01:10:33 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7CC9C433C6;
 Tue,  3 Nov 2020 01:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7CC9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Date: Mon,  2 Nov 2020 17:10:23 -0800
Message-Id: <20201103011023.21365-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2] drm/msm/dp: do not notify audio subsystem if
 sink doesn't support audio
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

For sinks that do not support audio, there is no need to notify
audio subsystem of the connection event.

This will make sure that audio routes only to the primary display
when connected to such sinks.

changes in v2:
  - Added fixes tag
  - Removed nested if condition and removed usage of global pointer

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2f72817ca24f..3f59ba8fcde5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -549,7 +549,14 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
-	if (dp_display->plugged_cb && dp_display->codec_dev)
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display,
+			struct dp_display_private, dp_display);
+
+	/* notify audio subsystem only if sink supports audio */
+	if (dp_display->plugged_cb && dp_display->codec_dev &&
+			dp->audio_supported)
 		dp_display->plugged_cb(dp_display->codec_dev, plugged);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
