Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CC3951CA
	for <lists+freedreno@lfdr.de>; Sun, 30 May 2021 17:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC476E122;
	Sun, 30 May 2021 15:57:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14F6E07F;
 Sun, 30 May 2021 15:57:22 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 30 May 2021 08:57:21 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 May 2021 08:57:20 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 30 May 2021 21:26:38 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id F22C921481; Sun, 30 May 2021 21:26:36 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Sun, 30 May 2021 21:26:09 +0530
Message-Id: <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
Subject: [Freedreno] [v5 2/5] drm/panel-simple: Support DP AUX backlight
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
Cc: robh@kernel.org, daniel.thompson@linaro.org, lyude@redhat.com,
 Rajeev Nandan <rajeevny@codeaurora.org>, mkrishn@codeaurora.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 dianders@chromium.org, a.hajda@samsung.com, robdclark@gmail.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If there is no backlight specified in the device tree and the panel
has access to the DP AUX channel then create a DP AUX backlight if
supported by the panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus;
allow using it for DDC) and the previous patch (2/5) of this series.

Changes in v4:
- New

Changes in v5:
- Address review comments and move backlight functions to drm_panel.c (Douglas)
- Create and register DP AUX backlight if there is no backlight specified in the
  device tree and panel has the DP AUX channel. (Douglas)
- The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.

[1] https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/

 drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b09be6e..047fad5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	if (err)
 		goto disable_pm_runtime;
 
+	if (!panel->base.backlight && panel->aux) {
+		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
+		if (err)
+			goto disable_pm_runtime;
+	}
+
 	drm_panel_add(&panel->base);
 
 	return 0;
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
