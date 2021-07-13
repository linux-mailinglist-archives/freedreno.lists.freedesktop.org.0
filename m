Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8063C75DB
	for <lists+freedreno@lfdr.de>; Tue, 13 Jul 2021 19:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9726E107;
	Tue, 13 Jul 2021 17:43:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DC989DB9
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jul 2021 17:14:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626196457; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5ILuZ7SWoWEhdwMo5jhwP5i1sCLD6tJKUIb5xpgE1DU=;
 b=pTZFUT+K+R/3F2ePAN0iz9jhzPutyV1hXcD4jJ08ZpOeEIOf40W3UIQvBAhqHwqZbgfC8MwC
 o8sckVvw0QY88MBgtLQLHUD8rA5gNprx7r7ex6aF5XUbdHrkhzKxZYVbClaikRg3OexpsDyP
 6Stx6CHPgTJW6f04tY0dd82Z/2c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60edc9d301dd9a9431ac2f7e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 17:13:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B0DCC433F1; Tue, 13 Jul 2021 17:13:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hu-gracan-sd.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gracan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AD5CC433F1;
 Tue, 13 Jul 2021 17:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AD5CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=gracan@codeaurora.org
From: Grace An <gracan@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Date: Tue, 13 Jul 2021 10:13:41 -0700
Message-Id: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 13 Jul 2021 17:43:45 +0000
Subject: [Freedreno] [RFC] drm: return int error code from mode_fixup
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
Cc: Grace An <gracan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 pdhaval@codeaurora.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
-EDEADLK errors for all the ww_mutex. This results in
drm_atomic_get_private_obj_state randomly returning -EDEADLK.
However, the mode_fixup functions do not propagate these error
codes and return false, causing the atomic commit to fail with
-EINVAL instead of retrying.

Change encoder, crtc, and bridge mode_fixup functions to return
an int instead of a boolean to indicate success or failure. If
any of these functions fail, the mode_fixup function now returns
the provided integer error code instead of -EINVAL.

This change needs modifications across drivers, but before submitting
the entire change, we want to get feedback on this RFC.

Signed-off-by: Grace An <gracan@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 8 ++++----
 drivers/gpu/drm/drm_bridge.c             | 4 ++--
 include/drm/drm_bridge.h                 | 2 +-
 include/drm/drm_modeset_helper_vtables.h | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f2b3e28..d75f09a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -457,10 +457,10 @@ mode_fixup(struct drm_atomic_state *state)
 		} else if (funcs && funcs->mode_fixup) {
 			ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
 						&new_crtc_state->adjusted_mode);
-			if (!ret) {
+			if (ret) {
 				DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
 						 encoder->base.id, encoder->name);
-				return -EINVAL;
+				return ret;
 			}
 		}
 	}
@@ -481,10 +481,10 @@ mode_fixup(struct drm_atomic_state *state)
 
 		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
-		if (!ret) {
+		if (ret) {
 			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
 					 crtc->base.id, crtc->name);
-			return -EINVAL;
+			return ret;
 		}
 	}
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0eff..3ad16b5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -736,9 +736,9 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 		if (ret)
 			return ret;
 	} else if (bridge->funcs->mode_fixup) {
-		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
+		if (bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
-			return -EINVAL;
+			return ret;
 	}
 
 	return 0;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa..5d02dfc 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -153,7 +153,7 @@ struct drm_bridge_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_bridge *bridge,
+	int (*mode_fixup)(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 	/**
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f3a4b47..e305c97 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -184,7 +184,7 @@ struct drm_crtc_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_crtc *crtc,
+	int (*mode_fixup)(struct drm_crtc *crtc,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
@@ -599,7 +599,7 @@ struct drm_encoder_helper_funcs {
 	 * True if an acceptable configuration is possible, false if the modeset
 	 * operation should be rejected.
 	 */
-	bool (*mode_fixup)(struct drm_encoder *encoder,
+	int (*mode_fixup)(struct drm_encoder *encoder,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
