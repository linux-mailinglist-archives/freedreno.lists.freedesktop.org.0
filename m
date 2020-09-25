Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D4278F67
	for <lists+freedreno@lfdr.de>; Fri, 25 Sep 2020 19:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8C16ED62;
	Fri, 25 Sep 2020 17:13:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9529B6E090;
 Fri, 25 Sep 2020 03:44:21 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 707EDE3898692EA7B039;
 Fri, 25 Sep 2020 11:44:18 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 25 Sep 2020 11:44:15 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dhar@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Fri, 25 Sep 2020 11:41:48 +0800
Message-ID: <1601005308-49706-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Sep 2020 17:13:14 +0000
Subject: [Freedreno] [PATCH] drm/msm: Add missing struct identifier
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

fix warnings reported by make W=1
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:195: warning: cannot
understand function prototype: 'const struct dpu_intr_reg
dpu_intr_set[] = '
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:252: warning: cannot
understand function prototype: 'const struct dpu_irq_type
dpu_irq_map[] = '

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index d84a84f..38482b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -190,7 +190,7 @@ struct dpu_irq_type {
 };
 
 /**
- * List of DPU interrupt registers
+ * struct dpu_intr_reg -  List of DPU interrupt registers
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
 	{
@@ -246,8 +246,9 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 };
 
 /**
- * IRQ mapping table - use for lookup an irq_idx in this table that have
- *                     a matching interface type and instance index.
+ * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
+ *			 table that have a matching interface type and
+ *			 instance index.
  */
 static const struct dpu_irq_type dpu_irq_map[] = {
 	/* BEGIN MAP_RANGE: 0-31, INTR */
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
