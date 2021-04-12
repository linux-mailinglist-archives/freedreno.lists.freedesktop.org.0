Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF235B7A0
	for <lists+freedreno@lfdr.de>; Mon, 12 Apr 2021 02:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D0689FCE;
	Mon, 12 Apr 2021 00:10:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93C789FC5
 for <freedreno@lists.freedesktop.org>; Mon, 12 Apr 2021 00:10:00 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n8so18569573lfh.1
 for <freedreno@lists.freedesktop.org>; Sun, 11 Apr 2021 17:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8QbNP1RBmcdaj/DpJzyvoSd4xk2B3m0lm5h+jBxVxQ=;
 b=fzyiZDWvLxVbDBEdU0s1nZkCWTfeqcfn9CqYqT/T8Zn6VoPCeVX4UsHfkyZjwkp2Ma
 xEkolh1DgVCVvj+/HtkChpSDub+p8y7dzIiQE9BvYEv9XFu4JrJzsSjZRWx7R2i8Bh3J
 7tRx06h+isNYk9ooTb5Xg9Zy5I/xIFKHtklaHHcrlLbjPRwHe2j6SXBtla7s9ZiQebMD
 DHTLLsn1UWNA1fcWTPS9aEWHnlXtX8YhpUNWC96w50lXgt53SxPDttyxRbiWkh1PgCU+
 h3tgnGmoJfU2TjkBEUVldbYL0ZlNsRf/Q3Rmk9U1oaYBqml4RV4vVSrGd+926EwtA9kO
 87KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8QbNP1RBmcdaj/DpJzyvoSd4xk2B3m0lm5h+jBxVxQ=;
 b=FmCp7AUFLnbno7zcYgkiWfSjBr21C0GW0ABM74h/wPHlk1g6FPzCvLSimPc84lsUB/
 smzlO1rV05RJ/3Vg4CEC8N9Wu/wSBLNrufUN2T+Noo/5sPLMC90GlHpoj/khckENZ9qI
 dLON/fOPlzB++uu4d+WrKSDmOKj8bSkXSxXP/GibCIA9MpJrWKzPyVV1ieYbXHK9d7TC
 Zf072ZJ8vhHBDgjeBgOzAP/OmhaBR2LFn7Ffw/du26D5T9KwrdpWt05HZmd3ea46PLc+
 2Xa3m+paQ/PwVzhADFhC2vHvAfBE677W7xn+/DF5RBQ9RY84kvS+2HyRBOzu968lYXiH
 GC/g==
X-Gm-Message-State: AOAM533sXirREd0GDmhxqnHpGzkFsOf03mIKaekF1UM13l8U3DWFkvA6
 5ACGBtwckZqYrZAUyIV9EEyJFw==
X-Google-Smtp-Source: ABdhPJx8/tOBrJ/Zlb6Xyf7a9EVqDaxewI7P8gwUzKdM4yD9TNOGh7Lk6ItnXl1eLPMM7ympIkUvSg==
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr17304963lff.326.1618186199210; 
 Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s22sm2307212ljd.28.2021.04.11.17.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:09:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Mon, 12 Apr 2021 03:09:53 +0300
Message-Id: <20210412000954.2049141-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
References: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: hw_intr: always call
 dpu_hw_intr_clear_intr_status_nolock
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Always call dpu_hw_intr_clear_intr_status_nolock() from the
dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
(which call clears the interrupts anyway) and enforces clearing the hw
interrupt status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
 3 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 54b34746a587..fd11a2aeab6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
-
-	/*
-	 * Clear pending interrupt status in HW.
-	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
-	 *       spinlock, so it is safe to clear any interrupt status here.
-	 */
-	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
-			dpu_kms->hw_intr,
-			irq_idx);
 }
 
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index cf9bfd45aa59..8bd22e060437 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -1362,6 +1362,22 @@ static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
 	return -EINVAL;
 }
 
+static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
+		int irq_idx)
+{
+	int reg_idx;
+
+	if (!intr)
+		return;
+
+	reg_idx = dpu_irq_map[irq_idx].reg_idx;
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			dpu_irq_map[irq_idx].irq_mask);
+
+	/* ensure register writes go through */
+	wmb();
+}
+
 static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		void (*cbfunc)(void *, int),
 		void *arg)
@@ -1430,9 +1446,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				 */
 				if (cbfunc)
 					cbfunc(arg, irq_idx);
-				else
-					intr->ops.clear_intr_status_nolock(
-							intr, irq_idx);
+
+				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
 
 				/*
 				 * When callback finish, clear the irq_status
@@ -1597,23 +1612,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 		int irq_idx, bool clear)
 {
@@ -1655,7 +1653,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 5a1c304ba93f..5bade5637ecc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -142,15 +142,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * clear_intr_status_nolock() - clears the HW interrupts without lock
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 */
-	void (*clear_intr_status_nolock)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
 	/**
 	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
 	 *                        based on given lookup IRQ index.
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
