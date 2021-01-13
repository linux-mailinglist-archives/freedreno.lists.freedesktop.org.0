Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CF2F52EA
	for <lists+freedreno@lfdr.de>; Wed, 13 Jan 2021 20:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33876E88E;
	Wed, 13 Jan 2021 19:01:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4F06E88E
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 19:01:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610564469; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=H/F+eMth7wTl1iBqHVMWoEIqEIvizNY75XJRvuMWzFQ=;
 b=uDByCE6mdFSQl0xKEglrm3/sw+X+epdLm/UDMqfQi4051xmS71grEeem1J9N4dzTV/IoCbhv
 zHhXk0A+H2SJmrzmVU/dACfecXDs1dt9gimP2GHDZKfQU6/yATfzLXyl1m7GotbuJlv9rhWZ
 tnGjJPFrY//b649sDzjC7asY/EY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fff43554dcca12475e7bc79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 19:00:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 03A54C43464; Wed, 13 Jan 2021 19:00:37 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A099FC433CA;
 Wed, 13 Jan 2021 19:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A099FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Date: Wed, 13 Jan 2021 10:59:59 -0800
Message-Id: <1610564400-29788-2-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dp: return fail when both link
 lane and rate are 0 at dpcd read
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some dongle set both link lane and rate to 0 during dpcd receiver
capability read if there is no monitor attache to this dongle.
Therefore return fail to prevent driver from trying to populate
monitor further.

Changes in V2:
-- split this patch into two. Move postpone irq_handle into next patch
-- add Fixes tag

Fixes: 78f94fbb6122 ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97dca3e..d1780bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -167,12 +167,18 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
 	rc = dp_panel_read_dpcd(dp_panel);
+	if (rc) {
+		DRM_ERROR("read dpcd failed %d\n", rc);
+		return rc;
+	}
+
 	bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
-	if (rc || !is_link_rate_valid(bw_code) ||
+	if (!is_link_rate_valid(bw_code) ||
 			!is_lane_count_valid(dp_panel->link_info.num_lanes) ||
 			(bw_code > dp_panel->max_bw_code)) {
-		DRM_ERROR("read dpcd failed %d\n", rc);
-		return rc;
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", dp_panel->link_info.rate,
+				dp_panel->link_info.num_lanes);
+		return -EINVAL;
 	}
 
 	if (dp_panel->dfp_present) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
