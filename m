Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D251721DE
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2020 16:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077506E913;
	Thu, 27 Feb 2020 15:11:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1B6EC47;
 Thu, 27 Feb 2020 08:38:55 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Feb 2020 14:08:53 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 27 Feb 2020 14:08:34 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id AF85B2210; Thu, 27 Feb 2020 14:08:33 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Thu, 27 Feb 2020 14:08:31 +0530
Message-Id: <1582792711-26935-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582792711-26935-1-git-send-email-mkrishn@codeaurora.org>
References: <1582792711-26935-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Thu, 27 Feb 2020 15:11:39 +0000
Subject: [Freedreno] [v2 2/2] drm/msm/dpu: fix reservation cleanup during
 modeset
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Missing return statement will cause the reservations to
get released prematurely, thus messing up the allocation
for any next successive datapath reservation.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
	- Change in commit message
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 136e4d0..0052212 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1084,6 +1084,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->mode_set_complete = true;
 
+	return;
+
 error:
 	dpu_rm_release(&dpu_kms->rm, drm_enc);
 }
-- 
1.9.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
