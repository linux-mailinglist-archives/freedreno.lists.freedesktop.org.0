Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D726C4D5
	for <lists+freedreno@lfdr.de>; Wed, 16 Sep 2020 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15216EA60;
	Wed, 16 Sep 2020 16:03:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E266E379;
 Wed, 16 Sep 2020 08:54:09 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 802145808EA40AEE348A;
 Wed, 16 Sep 2020 16:54:05 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 16:54:00 +0800
From: Luo Jiaxing <luojiaxing@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Wed, 16 Sep 2020 16:51:38 +0800
Message-ID: <1600246298-16120-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 16 Sep 2020 16:03:24 +0000
Subject: [Freedreno] [PATCH] drm/msm/dpu: remove unused variables new_cnt
 and old_cnt in dpu_encoder_phys_vid_vblank_irq()
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
Cc: robdclark@chromium.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 yaohongbo@huawei.com, linux-kernel@vger.kernel.org, bernard@vivo.com,
 robdclark@gmail.com, daniel@ffwll.ch, kalyan_t@codeaurora.org,
 ddavenport@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We found two unused variables new_cnt and old_cnt when build kernel with
W=1.

So delete it.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b5a4905..377ce8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,7 +298,6 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	struct dpu_hw_ctl *hw_ctl;
 	unsigned long lock_flags;
 	u32 flush_register = 0;
-	int new_cnt = -1, old_cnt = -1;
 
 	hw_ctl = phys_enc->hw_ctl;
 
@@ -308,7 +307,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
 				phys_enc);
 
-	old_cnt  = atomic_read(&phys_enc->pending_kickoff_cnt);
+	atomic_read(&phys_enc->pending_kickoff_cnt);
 
 	/*
 	 * only decrement the pending flush count if we've actually flushed
@@ -320,8 +319,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 		flush_register = hw_ctl->ops.get_flush_register(hw_ctl);
 
 	if (!(flush_register & hw_ctl->ops.get_pending_flush(hw_ctl)))
-		new_cnt = atomic_add_unless(&phys_enc->pending_kickoff_cnt,
-				-1, 0);
+		atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
 	/* Signal any waiting atomic commit thread */
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
