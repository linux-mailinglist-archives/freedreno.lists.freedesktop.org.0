Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D21F685D
	for <lists+freedreno@lfdr.de>; Thu, 11 Jun 2020 14:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87606E159;
	Thu, 11 Jun 2020 12:55:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E9D6E159;
 Thu, 11 Jun 2020 12:55:47 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jun 2020 18:25:43 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jun 2020 18:25:18 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 1D39A488D; Thu, 11 Jun 2020 18:25:17 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Thu, 11 Jun 2020 18:25:15 +0530
Message-Id: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [v1] drm/msm/dpu: request for display color blocks
 based on hw catalog entry
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
Cc: linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 dianders@chromium.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 john.stultz@linaro.org, hoegsberg@chromium.org, mka@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Kalyan Thota <kalyan_t@codeaurora.org>

Request for color processing blocks only if they are
available in the display hw catalog and they are
sufficient in number for the selection.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..9f8de77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -521,7 +521,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode)
 {
-	struct msm_display_topology topology;
+	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -537,7 +537,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * Adding color blocks only to primary interface
+	 * Adding color blocks only to primary interface if available in
+	 * sufficient number
 	 */
 	if (intf_count == 2)
 		topology.num_lm = 2;
@@ -546,8 +547,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
-		topology.num_dspp = topology.num_lm;
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+		if (dpu_kms->catalog->dspp &&
+			(dpu_kms->catalog->dspp_count >= topology.num_lm))
+			topology.num_dspp = topology.num_lm;
+	}
 
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
-- 
1.9.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
