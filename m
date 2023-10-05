Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8207BAE9B
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 00:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6FD10E499;
	Thu,  5 Oct 2023 22:07:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E741F10E499
 for <freedreno@lists.freedesktop.org>; Thu,  5 Oct 2023 22:07:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so3239223e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Oct 2023 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696543620; x=1697148420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+eiNNMbRuHcjPQp0/LssXGygCRwjOZULScFReylZuVg=;
 b=tVjlfKfnc5GjRNoCPmBE8TZBMtiwLjEx1bHXF2lLpJbh3Z6hSMyA6E8QosGm/SoF1j
 HMVnGkH269mk4Mb5OYhlx8glk/vKGPEGTwnek7CW4ivmWKuhniAIqbPcPZ0Azrv/AGDq
 JojS3wFkbqQmww3YYDo0MlMCykB8dohpDW7ocSnxEZfo23FY+vEnVY6TCAJRZ2u3OSbZ
 OwZneM/gAH9vTm/rK0j3hdvBYg32WY5tC/LXe3IvuSb1oGz04vImHR/G276NhEWYesno
 PaCGBZVK6IZVwDZ97GjDOyN34CVieeiMcAx1vnj1iqjGoRd85wlWkPzyPd2/xtuBL5Wm
 4SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696543620; x=1697148420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eiNNMbRuHcjPQp0/LssXGygCRwjOZULScFReylZuVg=;
 b=mKGd8dn7DdjQbFizUNk8/ulfqPEV8mJQzbBM6SdXj6S4RfXkH8FssySpTFPi0pxRPB
 BiZdqBP4S/SnWqLvJyjLyJr/A7znZXYpG+dYPyrfEf7qZoHcrJDoVkGjGAeDZyz+GDxW
 HkrZnxjR9/Z8nm0llUBsLzHkE9Lyn08/O8jsuTM7XteEdsQ/nRGHqbPuN7bjWEdVt8M1
 ZROvgGoc9/lnFZthuD6S4bp07EX1cZBO9idZUoA8hIBjDm/HHgBcaRwyZbqGjoc9WAtD
 k9rDzErs5zJRDNI6/K3RJg7avEboPSMWm73toaa2Zo0cln3HeVP1CSE52aailM6iQ9N7
 VH7A==
X-Gm-Message-State: AOJu0YxsKqJsjB6mHEndSWVMnM/Q+Q+Angqrjoagw6FMQKPALx04q6T3
 FPwl7meMqAgcGVSG7/53KDBmEQ==
X-Google-Smtp-Source: AGHT+IEZUdjUBSuoD1ZodWD5BwKmd7jJQHLpsoHzmeIaA3g3wSQtr1yU3BpFkBIquzhqWT7H1MW8pw==
X-Received: by 2002:ac2:5b10:0:b0:4fe:8ba8:1a8b with SMTP id
 v16-20020ac25b10000000b004fe8ba81a8bmr3145577lfn.7.1696543620058; 
 Thu, 05 Oct 2023 15:07:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm20863lff.143.2023.10.05.15.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 15:06:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 01:06:59 +0300
Message-Id: <20231005220659.2404199-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/dpu: remove CRTC frame event
 callback registration
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

The frame event callback is always set to dpu_crtc_frame_event_cb() (or
to NULL) and the data is always either the CRTC itself or NULL
(correpondingly). Thus drop the event callback registration, call the
dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
assigned using dpu_encoder_assign_crtc().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This patch was previously posted as a part of the [1]

Changes since v1:
- Rebased on top of linux-next

[1] https://patchwork.freedesktop.org/series/112353/

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
 5 files changed, 21 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8ce7586e2ddf..dec5417b69d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -669,18 +669,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 	DPU_ATRACE_END("crtc_frame_event");
 }
 
-/*
- * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
- * registers this API to encoder for all frame event callbacks like
- * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
- * from different context - IRQ, user thread, commit_thread, etc. Each event
- * should be carefully reviewed and should be processed in proper task context
- * to avoid schedulin delay or properly manage the irq context's bottom half
- * processing.
- */
-static void dpu_crtc_frame_event_cb(void *data, u32 event)
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 {
-	struct drm_crtc *crtc = (struct drm_crtc *)data;
 	struct dpu_crtc *dpu_crtc;
 	struct msm_drm_private *priv;
 	struct dpu_crtc_frame_event *fevent;
@@ -1102,9 +1092,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
 	cstate->num_mixers = 0;
 
@@ -1143,8 +1130,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			request_bandwidth = true;
-		dpu_encoder_register_frame_event_callback(encoder,
-				dpu_crtc_frame_event_cb, (void *)crtc);
 	}
 
 	if (request_bandwidth)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b1626a..3aa536d95721 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -300,4 +300,18 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
 }
 
+/**
+ * dpu_crtc_frame_event_cb - crtc frame event callback API
+ * @crtc: Pointer to crtc
+ * @event: Event to process
+ *
+ * CRTC module registers this API to encoder for all frame event callbacks like
+ * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
+ * from different context - IRQ, user thread, commit_thread, etc. Each event
+ * should be carefully reviewed and should be processed in proper task context
+ * to avoid schedulin delay or properly manage the irq context's bottom half
+ * processing.
+ */
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..709fffa4dfa7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -148,8 +148,6 @@ enum dpu_enc_rc_states {
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
  *				busy processing current command.
  *				Bit0 = phys_encs[0] etc.
- * @crtc_frame_event_cb:	callback handler for frame event
- * @crtc_frame_event_cb_data:	callback handler private data
  * @frame_done_timeout_ms:	frame done timeout in ms
  * @frame_done_timer:		watchdog timer for frame done event
  * @disp_info:			local copy of msm_display_info struct
@@ -187,8 +185,6 @@ struct dpu_encoder_virt {
 	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
-	void (*crtc_frame_event_cb)(void *, u32 event);
-	void *crtc_frame_event_cb_data;
 
 	atomic_t frame_done_timeout_ms;
 	struct timer_list frame_done_timer;
@@ -1377,28 +1373,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 	}
 }
 
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
-		void (*frame_event_cb)(void *, u32 event),
-		void *frame_event_cb_data)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
-	bool enable;
-
-	enable = frame_event_cb ? true : false;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
-
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	dpu_enc->crtc_frame_event_cb = frame_event_cb;
-	dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
-}
-
 void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event)
@@ -1438,15 +1412,12 @@ void dpu_encoder_frame_done_callback(
 			dpu_encoder_resource_control(drm_enc,
 					DPU_ENC_RC_EVENT_FRAME_DONE);
 
-			if (dpu_enc->crtc_frame_event_cb)
-				dpu_enc->crtc_frame_event_cb(
-					dpu_enc->crtc_frame_event_cb_data,
-					event);
+			if (dpu_enc->crtc)
+				dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 		}
 	} else {
-		if (dpu_enc->crtc_frame_event_cb)
-			dpu_enc->crtc_frame_event_cb(
-				dpu_enc->crtc_frame_event_cb_data, event);
+		if (dpu_enc->crtc)
+			dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 	}
 }
 
@@ -2318,7 +2289,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 		return;
 	}
 
-	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
+	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
 		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
 			      DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
 		return;
@@ -2331,7 +2302,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
-	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
+	dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4c05fd5e9ed1..dfa8edeca925 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -55,16 +55,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
 					struct drm_crtc *crtc, bool enable);
 
-/**
- * dpu_encoder_register_frame_event_callback - provide callback to encoder that
- *	will be called after the request is complete, or other events.
- * @encoder:	encoder pointer
- * @cb:		callback pointer, provide NULL to deregister
- * @data:	user data provided to callback
- */
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
-		void (*cb)(void *, u32), void *data);
-
 /**
  * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
  *	path (i.e. ctl flush and start) at next appropriate time.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index c74b9be25e68..dc097e109fd2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -346,10 +346,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
-- 
2.39.2

