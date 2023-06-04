Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864327218A1
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 18:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06E710E166;
	Sun,  4 Jun 2023 16:28:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045C10E15F
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so4909354e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896085; x=1688488085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncMcuqiz5K+VD7+NeEZc9FWdbFab1s78yMgH7QNCERA=;
 b=i2grcnJHIIxQCMo7Ma7BBI1iIUfmV5sdwmqaYJlIYlCaR/xSqd6s8mCN0AVmGkzbtq
 Dv91d4qygyHQOvEYXOMWPkLundu0rREDwvs/Br8oHKVE4lxJwD2Q3kF0UQkNzLbvomYX
 5RADD+tH/CKn8ADV6BWfJy1uPCTZb2RSOtiOF6CwSVXGjOyyAjO53CM+wK70hmbcqT9P
 T2v31qnDFBRGbCN7T5UWQ2QBDU+hozUQBpqanjr9Vg8TExk/wMAK/Oyp56v1JlK3LzCi
 ysfVWn4Zzw3Nw/cGENJ2vqmq7K0ovc72KsLKa3nm2oMSi67xXiVu/e1m5ODU/u3S+fQl
 WETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896085; x=1688488085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncMcuqiz5K+VD7+NeEZc9FWdbFab1s78yMgH7QNCERA=;
 b=PmHVg1VAVDyscCbQvXzsmzsElFUqIR6TWfLpDaaxB7bktEZlqEn/IJD3FA+gHOzGke
 X1qeNgchvC/ubrxlcL2gxrSGbuOIZfXqT+hrtjl6O1hT6Vw1noNAvcm2xb6HU6OARJM9
 T9TzlUP6++A639E+AyqWOtRFRszXjHpPe2Ik6LVYDcGWYXQ1xMnsyNbkLNb1WHcoX0As
 EjAkJVUNuPEd+FU8M21UJY0pROw3oP2cRloPJby/kWSPoOf4vTdGdqhHyoAZB63IyfY8
 2LDIrt/QK02hWroPWW1WfFJYY0ANZPb54WIbsLuUEDQ5rAr8tsodlEllGtgxOhlx/oL2
 PacA==
X-Gm-Message-State: AC+VfDy3xQyxqDQ8B51Sw+wm6wXHL+ZwFMOqQWy78IsKig75sfSd0Gg0
 eGiUt27VTV1NM4n/od0aih2yLQ==
X-Google-Smtp-Source: ACHHUZ7MRE3aLYT891DPO54pmNMaDUNpNg1kZWq3tJWqxRIX1uQyaX51CtgLPLAYk4ZoTqVvhzxgHA==
X-Received: by 2002:ac2:5973:0:b0:4f3:b258:fee4 with SMTP id
 h19-20020ac25973000000b004f3b258fee4mr4326864lfp.59.1685896085252; 
 Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 19:27:57 +0300
Message-Id: <20230604162800.1048327-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/8] drm/msm/dpu: remove irq_idx argument from
 IRQ callbacks
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There is no point in passing the IRQ index to IRQ callbacks, no function
uses that. Drop it at last.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 16 +++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  2 +-
 8 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index b5b6e7031fb9..ba06312cbb16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -53,7 +53,7 @@ u32 dpu_core_irq_read(
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
 		int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2e1873d29c4b..701c5265c98d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -352,7 +352,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
 	u32 irq_status;
@@ -399,7 +399,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			func(phys_enc, irq);
+			func(phys_enc);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..f91661a69888 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -365,7 +365,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		int irq,
-		void (*func)(void *arg, int irq_idx),
+		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 4f8c9187f76d..33edc9200278 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -70,7 +70,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 				phys_enc->hw_pp->idx);
 }
 
-static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	unsigned long lock_flags;
@@ -97,7 +97,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("pp_done_irq");
 }
 
-static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
@@ -120,7 +120,7 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("rd_ptr_irq");
 }
 
-static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
@@ -133,7 +133,7 @@ static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("ctl_start_irq");
 }
 
-static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e26629e9e303..19ccef5fb4d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,7 +298,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	programmable_fetch_config(phys_enc, &timing_params);
 }
 
-static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_vblank_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_hw_ctl *hw_ctl;
@@ -335,7 +335,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	DPU_ATRACE_END("vblank_irq");
 }
 
-static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
+static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e9325cafb1a8..c30a5955725a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -345,7 +345,11 @@ static void dpu_encoder_phys_wb_setup(
 
 }
 
-static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
+/**
+ * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
+ * @arg:	Pointer to writeback encoder
+ */
+static void dpu_encoder_phys_wb_done_irq(void *arg)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -371,16 +375,6 @@ static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
 	wake_up_all(&phys_enc->pending_kickoff_wq);
 }
 
-/**
- * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
- * @arg:	Pointer to writeback encoder
- * @irq_idx:	interrupt index
- */
-static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
-{
-	_dpu_encoder_phys_wb_frame_done_helper(arg);
-}
-
 /**
  * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
  * @phys:	Pointer to physical encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..9eeeb046db15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -198,7 +198,7 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 	/*
 	 * Perform registered function callback
 	 */
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
+	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -471,7 +471,7 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg, int irq_idx),
+		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
 	unsigned long irq_flags;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1f2dabc54c22..06c7bedd5c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -62,7 +62,7 @@ struct dpu_hw_intr {
 	unsigned long irq_mask;
 
 	struct {
-		void (*cb)(void *arg, int irq_idx);
+		void (*cb)(void *arg);
 		void *arg;
 		atomic_t count;
 	} irq_tbl[];
-- 
2.39.2

