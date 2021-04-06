Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB60354C76
	for <lists+freedreno@lfdr.de>; Tue,  6 Apr 2021 08:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9857B89F69;
	Tue,  6 Apr 2021 06:02:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9944089F69;
 Tue,  6 Apr 2021 06:02:04 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:04 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 23:02:03 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:41 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 710EA21B38; Tue,  6 Apr 2021 11:31:40 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Date: Tue,  6 Apr 2021 11:31:34 +0530
Message-Id: <1617688895-26275-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
References: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
Subject: [Freedreno] [PATCH v1 2/3] drm/msm/disp/dpu1: add vsync and
 underrun irqs for INTF_5
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, robdclark@gmail.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

INTF_5 is used by EDP panel in SC7280 target. Add vsync
and underrun irqs needed by INTF_5 to dpu irq map.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 72cdaf8..a37928b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -69,10 +69,12 @@
 #define DPU_INTR_INTF_1_UNDERRUN BIT(26)
 #define DPU_INTR_INTF_2_UNDERRUN BIT(28)
 #define DPU_INTR_INTF_3_UNDERRUN BIT(30)
+#define DPU_INTR_INTF_5_UNDERRUN BIT(22)
 #define DPU_INTR_INTF_0_VSYNC BIT(25)
 #define DPU_INTR_INTF_1_VSYNC BIT(27)
 #define DPU_INTR_INTF_2_VSYNC BIT(29)
 #define DPU_INTR_INTF_3_VSYNC BIT(31)
+#define DPU_INTR_INTF_5_VSYNC BIT(23)
 
 /**
  * Pingpong Secondary interrupt status bit definitions
@@ -308,7 +310,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
-	/* irq_idx:32-63 */
+	/* irq_idx:32-33 */
+	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
+	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
+	/* irq_idx:34-63 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
