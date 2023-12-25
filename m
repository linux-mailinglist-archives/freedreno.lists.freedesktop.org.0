Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66081E0C0
	for <lists+freedreno@lfdr.de>; Mon, 25 Dec 2023 14:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20110E16A;
	Mon, 25 Dec 2023 13:08:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3610E143
 for <freedreno@lists.freedesktop.org>; Mon, 25 Dec 2023 13:08:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ccb923c4d2so10993441fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Dec 2023 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703509736; x=1704114536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wdgz1+t5YCnrEcWLjIsy3oWNBSIWeXfBbzRE00500l4=;
 b=DQ/MIEE3TYZahsuvCeWa/+T7Uxg7ggJm1Bo5sAh0w6DSaD0vqfbBGp9R/rLK53aYT/
 JRQtj8zhXjfgmP8cBDLB6219fRLm+TOcUmi7bX058jJnqGtTE7NQR/GY6H1e0hwKAwVD
 fZRE2hRH4tfjJNgiJDdibSJQrWtLenVoUt7+hdLFJ4S6JdFKsMh7zzNnt8KYytV9OvDk
 b9d1XIin2GqhrbXSUIQUe+hoxDp3GEd/VaN0xSXsfseCTW18mAbH3d7mAyZFfuRE5lzN
 GVZbsX6QPwl0r/oYhHE0ckgI+L5pkeK2lagPkALFzuJm8/q8sFWgSRhsvrFxLuVhAxOB
 Y3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703509736; x=1704114536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wdgz1+t5YCnrEcWLjIsy3oWNBSIWeXfBbzRE00500l4=;
 b=eZYh6ua+GVxA0TvxfxVNpOqtT43MVtYsHxU/Z9emz9ivYYGpc9Okvd+0arNIjIpJBH
 pPCbzPBT2RyJglNptQXZ+C8f0uRoBM+uxqFqxDpVhx+ubv3pudpI8jnSHEzmBGp8ITtt
 A/u3zeDXAVJ+FytcX87vIGSxV/k3YhZ2OVJyESFF72gJwm0iValscmWLnufP0CsyPsWH
 /zFy3mgZ8DXYTE2pgTw7hw2NUfvx08JkDW8rH6MPGgOfd9T15Zi1vprfq7puM84Oddjy
 Lx4xDb/pu2/bv4JhNUhoxf76W9LqTiV+bzPRxgei2hG9W+a2snPxXCX3mA4uRE4moQ33
 lkWA==
X-Gm-Message-State: AOJu0YwRm+S7SLTmQKQndLw8CE9oT2+KI/cLZe0UTxyq/g6WTv2al3yQ
 Hrkb1RWOKWdK/gcZY22Y9c5/hC97jMo/MA==
X-Google-Smtp-Source: AGHT+IF6fQIfjVPSMNSrxAx/2fVaGStySyB0Mr97mmN3yDPbMtyhpst4b1RRl9bgf/wumnYAHRjSgQ==
X-Received: by 2002:a05:651c:119a:b0:2cc:7147:c8d8 with SMTP id
 w26-20020a05651c119a00b002cc7147c8d8mr1244872ljo.65.1703509736268; 
 Mon, 25 Dec 2023 05:08:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 05:08:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 2/5] drm/msm/dpu: split
 _dpu_encoder_resource_control_helper()
Date: Mon, 25 Dec 2023 15:08:50 +0200
Message-Id: <20231225130853.3659424-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Follow the _dpu_encoder_irq_control() change and split the
_dpu_encoder_resource_control_helper() into enable and disable parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 12 ++++--
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5ab32ace7707..7b79fa3a79a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -754,8 +754,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -765,28 +764,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
-	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
+	trace_dpu_enc_rc_enable(DRMID(drm_enc));
 
 	if (!dpu_enc->cur_master) {
 		DPU_ERROR("encoder master not set\n");
 		return;
 	}
 
-	if (enable) {
-		/* enable DPU core clks */
-		pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	/* enable DPU core clks */
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-		/* enable all the irq */
-		_dpu_encoder_irq_enable(drm_enc);
+	/* enable all the irq */
+	_dpu_encoder_irq_enable(drm_enc);
+}
 
-	} else {
-		/* disable all the irq */
-		_dpu_encoder_irq_disable(drm_enc);
+static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_encoder_virt *dpu_enc;
 
-		/* disable DPU core clks */
-		pm_runtime_put_sync(&dpu_kms->pdev->dev);
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	priv = drm_enc->dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	trace_dpu_enc_rc_disable(DRMID(drm_enc));
+
+	if (!dpu_enc->cur_master) {
+		DPU_ERROR("encoder master not set\n");
+		return;
 	}
 
+	/* disable all the irq */
+	_dpu_encoder_irq_disable(drm_enc);
+
+	/* disable DPU core clks */
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
 static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
@@ -844,7 +857,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -939,7 +952,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -974,7 +987,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode)
 			_dpu_encoder_irq_disable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 95ce7647ff76..bd92fb2979aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -273,6 +273,14 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_runtime_resume,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_enable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_disable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
 
 TRACE_EVENT(dpu_enc_enable,
 	TP_PROTO(uint32_t drm_id, int hdisplay, int vdisplay),
@@ -342,10 +350,6 @@ DECLARE_EVENT_CLASS(dpu_enc_id_enable_template,
 	TP_printk("id=%u, enable=%s",
 		  __entry->drm_id, __entry->enable ? "true" : "false")
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_rc_helper,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
-- 
2.39.2

