Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2032F3A8
	for <lists+freedreno@lfdr.de>; Fri,  5 Mar 2021 20:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5315C6EC26;
	Fri,  5 Mar 2021 19:17:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2A56EC24
 for <freedreno@lists.freedesktop.org>; Fri,  5 Mar 2021 19:17:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614971857; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tQsjUdisHqup2rm/CiOsVWOKMCAiCZyMziboVUEMsXo=;
 b=aSSh0fjBGghs3vKeD62ArfxZ5r7cFHnm9fO3gUIAfmsf+RTY/MRnraJCdOHC7075lv5XXa8P
 568WCObamy8JsV9tzzy+kTOcRR5v8dG43ZfImIrmB+uTjnxr6XWVUcErXmUNTDOElvyIkOKQ
 9rojMiZ1ielOtinxrcJOpiBnHeQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 604283c860050cf4d0cfcb58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 19:17:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84925C433ED; Fri,  5 Mar 2021 19:17:28 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 84D5DC433C6;
 Fri,  5 Mar 2021 19:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84D5DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Date: Fri,  5 Mar 2021 11:17:17 -0800
Message-Id: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH 1/3] drm/msm/dp: Fix indentation kbot warnings
 in DP driver
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
 dan.carpenter@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix a couple of indentation warnings reported by
kbot across MSM DP driver:

New smatch warnings:
drivers/gpu/drm/msm/dp/dp_debug.c:229 dp_test_data_show()
warn: inconsistent indenting

drivers/gpu/drm/msm/dp/dp_power.c:203 dp_power_clk_enable()
warn: inconsistent indenting

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_power.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 84670bc..6c6998f 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -226,7 +226,7 @@ static int dp_test_data_show(struct seq_file *m, void *data)
 					debug->link->test_video.test_h_width);
 			seq_printf(m, "vdisplay: %d\n",
 					debug->link->test_video.test_v_height);
-					seq_printf(m, "bpc: %u\n",
+			seq_printf(m, "bpc: %u\n",
 					dp_link_bit_depth_to_bpc(bpc));
 		} else
 			seq_puts(m, "0");
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 9c4ea00..3961ba4 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -269,7 +269,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
 			enable ? "enable" : "disable",
 			dp_parser_pm_name(pm_type), rc);
-			return rc;
+		return rc;
 	}
 
 	if (pm_type == DP_CORE_PM)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
