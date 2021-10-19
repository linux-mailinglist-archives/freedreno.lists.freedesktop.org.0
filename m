Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A083432D35
	for <lists+freedreno@lfdr.de>; Tue, 19 Oct 2021 07:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DFE6E102;
	Tue, 19 Oct 2021 05:30:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82B6E0D9;
 Tue, 19 Oct 2021 05:30:54 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:53 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Oct 2021 22:30:52 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 19 Oct 2021 11:00:42 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 125DB2224F; Tue, 19 Oct 2021 11:00:41 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, kalyan_t@codeaurora.org,
 robdclark@gmail.com, swboyd@chromium.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Tue, 19 Oct 2021 11:00:28 +0530
Message-Id: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2] drm/msm: use compatible lists to find mdp
 node
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

In the current implementation, substring comparison
using device node name is used to find mdp node
during driver probe. Use compatible string list instead
of node name to get mdp node from the parent mdss node.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
   - Use compatible lists instead of duplicate string
     check (Stephen Boyd)
---
 drivers/gpu/drm/msm/msm_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc18..451d667 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1241,9 +1241,13 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int compare_name_mdp(struct device *dev, void *data)
+static int find_mdp_node(struct device *dev, void *data)
 {
-	return (strstr(dev_name(dev), "mdp") != NULL);
+	if (!dev->driver)
+		return 0;
+
+	return (of_match_node(dev->driver->of_match_table,
+				dev->of_node) != NULL);
 }
 
 static int add_display_components(struct platform_device *pdev,
@@ -1268,7 +1272,7 @@ static int add_display_components(struct platform_device *pdev,
 			return ret;
 		}
 
-		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
 			of_platform_depopulate(dev);
-- 
2.7.4

