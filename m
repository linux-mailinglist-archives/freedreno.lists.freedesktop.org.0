Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ADE289DFA
	for <lists+freedreno@lfdr.de>; Sat, 10 Oct 2020 05:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C666EE8A;
	Sat, 10 Oct 2020 03:36:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Sat, 10 Oct 2020 03:35:59 UTC
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FE86EE8A
 for <freedreno@lists.freedesktop.org>; Sat, 10 Oct 2020 03:35:59 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id A04B4482738;
 Sat, 10 Oct 2020 11:29:05 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bernard Zhao <bernard@vivo.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri,  9 Oct 2020 20:28:56 -0700
Message-Id: <20201010032858.4441-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHxpOT0sfHx0dGUlDVkpNS0lIS0tOT05DTUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OFE6DQw*Nz8eS0NDDhwNPUg2
 L08KCxFVSlVKTUtJSEtLTk9NSEtOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSU1ISDcG
X-HM-Tid: 0a75108e0b2d93bakuwsa04b4482738
Subject: [Freedreno] [PATCH] drm/msm/disp: add error value record in for
 circle`s error index
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

In function dpu_core_irq_enable & dpu_core_irq_disable, when
some index enable or disable failed, return value will be
covered by next success index. Upper call function will not
catch this error, this maybe does not meet the expectation.
This change is to make the code a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index f1bc6a1af7a7..e6da0469b743 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -123,8 +123,8 @@ int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
 
 	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_enable(dpu_kms, irq_idxs[i]);
-
+		if (_dpu_core_irq_enable(dpu_kms, irq_idxs[i]) != 0)
+			ret = -EINVAL;
 	return ret;
 }
 
@@ -178,8 +178,8 @@ int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
 
 	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_disable(dpu_kms, irq_idxs[i]);
-
+		if (_dpu_core_irq_disable(dpu_kms, irq_idxs[i]) != 0)
+			ret = -EINVAL;
 	return ret;
 }
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
