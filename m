Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7027DE9C
	for <lists+freedreno@lfdr.de>; Wed, 30 Sep 2020 04:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370256E4CD;
	Wed, 30 Sep 2020 02:54:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4756E4CD;
 Wed, 30 Sep 2020 02:54:06 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A392B49A23CF5EED838F;
 Wed, 30 Sep 2020 10:54:00 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 10:53:51 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jeffrey.l.hugo@gmail.com>, <sam@ravnborg.org>,
 <rnayak@codeaurora.org>, <zhengbin13@huawei.com>, <harigovi@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Date: Wed, 30 Sep 2020 10:51:20 +0800
Message-ID: <1601434280-22229-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH] drm/msm/dsi: Replace spin_lock_irqsave by
 spin_lock in hard IRQ
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It is redundant to do irqsave and irqrestore in hardIRQ context.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c..b2fb5c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1555,15 +1555,14 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
 {
 	struct msm_dsi_host *msm_host = ptr;
 	u32 isr;
-	unsigned long flags;
 
 	if (!msm_host->ctrl_base)
 		return IRQ_HANDLED;
 
-	spin_lock_irqsave(&msm_host->intr_lock, flags);
+	spin_lock(&msm_host->intr_lock);
 	isr = dsi_read(msm_host, REG_DSI_INTR_CTRL);
 	dsi_write(msm_host, REG_DSI_INTR_CTRL, isr);
-	spin_unlock_irqrestore(&msm_host->intr_lock, flags);
+	spin_unlock(&msm_host->intr_lock);
 
 	DBG("isr=0x%x, id=%d", isr, msm_host->id);
 
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
