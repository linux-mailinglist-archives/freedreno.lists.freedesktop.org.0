Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185132A2AFE
	for <lists+freedreno@lfdr.de>; Mon,  2 Nov 2020 13:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE06E4F3;
	Mon,  2 Nov 2020 12:50:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC896E4EC
 for <freedreno@lists.freedesktop.org>; Mon,  2 Nov 2020 12:50:38 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [58.213.83.156])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 0842F482F28;
 Mon,  2 Nov 2020 20:50:36 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, Bernard Zhao <bernard@vivo.com>,
 Zheng Bin <zhengbin13@huawei.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon,  2 Nov 2020 04:50:28 -0800
Message-Id: <20201102125030.6209-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHUMaTxoZSR1OQxlNVkpNS09ISUpPSE1IS09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6Egw4PT8qCRoCFyE*NCID
 NjUKFEpVSlVKTUtPSElKT0hNTUNNVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlOQ1VJ
 SkhVQ0hVSk5NWVdZCAFZQUlKS0M3Bg++
X-HM-Tid: 0a758902623c93bakuws0842f482f28
Subject: [Freedreno] [PATCH] drm/msm: delete conversion from bool value to
 bool return
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Delete the conversion from bool value to bool function return.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 8493d68ad841..411222f4cd6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -37,7 +37,7 @@
 
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 {
-	return (phys_enc->split_role != ENC_ROLE_SLAVE) ? true : false;
+	return (phys_enc->split_role != ENC_ROLE_SLAVE);
 }
 
 static bool dpu_encoder_phys_cmd_mode_fixup(
-- 
2.29.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
