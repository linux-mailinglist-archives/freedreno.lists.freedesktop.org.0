Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539F362955
	for <lists+freedreno@lfdr.de>; Fri, 16 Apr 2021 22:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABBA88F58;
	Fri, 16 Apr 2021 20:28:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238788427
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 20:28:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618604894; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Z5idBwlQhEZLRZOuOyizkreWC2NX+mI+QplQa1hscsI=;
 b=ObXoZpcHyO1MJ+BN/4KDjbZM4l1vMEmKlgWJLOVAZWxBfuNGUziCTo8I+IVz7rQf2RnAbx8r
 JuRS18rLzYfQyJkLyGEAxRPVhzcYhY0pAE5HQnpzzLfkiwKiXV5+ZOgl2nKzc11hlSzoPUPQ
 O1TkFkiOKjK46jm9IXMOU2NXHm0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6079f35c2cc44d3aea4c9a68 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:28:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 518ECC43464; Fri, 16 Apr 2021 20:28:12 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6AB3C433C6;
 Fri, 16 Apr 2021 20:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6AB3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Date: Fri, 16 Apr 2021 13:27:57 -0700
Message-Id: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH 1/2] drm/msm/dp: service only one irq_hpd if
 there are multiple irq_hpd pending
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, khsieh@codeaurora.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some dongle may generate more than one irq_hpd events in a short period of
time. This patch will treat those irq_hpd events as single one and service
only one irq_hpd event.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..0a7d383 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -707,6 +707,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	/* only handle first irq_hpd in case of multiple irs_hpd pending */
+	dp_del_event(dp, EV_IRQ_HPD_INT);
+
 	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
@@ -1300,6 +1303,9 @@ static int dp_pm_suspend(struct device *dev)
 	/* host_init will be called at pm_resume */
 	dp->core_initialized = false;
 
+	/* system suspended, delete pending irq_hdps */
+	dp_del_event(dp, EV_IRQ_HPD_INT);
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
+	/* link is down, delete pending irq_hdps */
+	dp_del_event(dp_display, EV_IRQ_HPD_INT);
+
 	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
