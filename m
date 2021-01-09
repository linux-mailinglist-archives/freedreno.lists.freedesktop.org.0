Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43F2F019B
	for <lists+freedreno@lfdr.de>; Sat,  9 Jan 2021 17:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6747B6E8D0;
	Sat,  9 Jan 2021 16:32:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA586E84B
 for <freedreno@lists.freedesktop.org>; Sat,  9 Jan 2021 13:44:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C6AD53EF1C;
 Sat,  9 Jan 2021 14:37:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Date: Sat,  9 Jan 2021 14:37:35 +0100
Message-Id: <20210109133736.143469-9-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 16:31:58 +0000
Subject: [Freedreno] [PATCH 8/9] drm/msm/dpu: Add a function to retrieve the
 current CTL status
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a function that returns whether the requested CTL is active or not:
this will be used in a later commit to fix command mode panel issues.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 758c355b4fd8..626fd41379fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -82,6 +82,11 @@ static inline void dpu_hw_ctl_trigger_start(struct dpu_hw_ctl *ctx)
 	DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
 }
 
+static inline bool dpu_hw_ctl_is_started(struct dpu_hw_ctl *ctx)
+{
+	return !!(DPU_REG_READ(&ctx->hw, CTL_START) & BIT(0));
+}
+
 static inline void dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
 {
 	trace_dpu_hw_ctl_trigger_prepare(ctx->pending_flush_mask,
@@ -550,6 +555,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
 	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
 	ops->trigger_start = dpu_hw_ctl_trigger_start;
+	ops->is_started = dpu_hw_ctl_is_started;
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ec579b470a80..c376b5ae7803 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -59,6 +59,13 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*trigger_start)(struct dpu_hw_ctl *ctx);
 
+	/**
+	 * check if the ctl is started
+	 * @ctx       : ctl path ctx pointer
+	 * @Return: true if started, false if stopped
+	 */
+	bool (*is_started)(struct dpu_hw_ctl *ctx);
+
 	/**
 	 * kickoff prepare is in progress hw operation for sw
 	 * controlled interfaces: DSI cmd mode and WB interface
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
