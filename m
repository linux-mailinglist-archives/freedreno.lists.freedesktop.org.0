Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6627BD709
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 11:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0102810E259;
	Mon,  9 Oct 2023 09:29:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DF10E254
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 09:29:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-503056c8195so5501598e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696843765; x=1697448565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ft8rzeFfb+3Zy/RVc4524NJ3uIXFMLtpNTcOuyG46Y=;
 b=UHO6H+5F7xNOUBbOAGVpnHTMDFI6RE768Zqxm3Q/rjsvTeqOTJfw9Hbmdkp2zdncjr
 ONWwj5lWhTtj5OGkJSVNZ9by0wnA6u+zI3zLaFk1vLPIB2N8haek3S2caH4JY3cppBrU
 33CDRSPH3JA14qWgNovc0E0PO2LZZrUtENfU1FSAH79HRFVIE2i0Tg1DgTdV9BGOYmd0
 0lufTB3SSjmIYOfeLtpJDi7YXIiLp5CmBYFrUL/nSnXomgOQWITS4C2q8EdTlYufwhgG
 6zcip1QxM7XJADxZlqC+SsBsxMaBr5moUIW5O86Y7OU6L5cK+oFuQirkHiq+Cl+21/RC
 6WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696843765; x=1697448565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ft8rzeFfb+3Zy/RVc4524NJ3uIXFMLtpNTcOuyG46Y=;
 b=b95L47flYWLgLQQCaeWku6R9xe+zBlvjZD6tgRFtVrYIM6AnTtRDvEL6UKEpN25Y/t
 cDJ3fnfY/K1eY8VgH2eVSxJHTfJlAQgsC5zvpKcnWVNCe6cBmWbdnTgHmuha/but3n84
 HtsQqRPQ6D5jeEbputhOT2QI/lOr0tJrj0WicOacmd+smj3ItA6WxK4ZZ+A+JeWQWmH5
 O4OGaUp+TUi4L+PPWOOcRRH1pxaH3NRZfHHkBpB5WPUYEt7rqYYboc0nixSMWisZQrCf
 CJ/neZpvSK5d9fTZf48yzKfWfFd844kovA7CDNWDsm3mkxn51ao0CSF4KNu4RLnpU25j
 K/2w==
X-Gm-Message-State: AOJu0YzIZ6BnV1uD5GfbneVViqqKWJiAdHKDeoClQVjz43NZXWB5K3MW
 YdrhPhpTQAZEvn62mCtYDHjUzQ==
X-Google-Smtp-Source: AGHT+IE7WPTOf1bnyWz4aVrT9CULFFmLQuJdpxXr+CL8+LIIBWtl4V7TvzdA9XT+E7C5rdUqCL/DRQ==
X-Received: by 2002:a05:6512:308a:b0:502:e651:129b with SMTP id
 z10-20020a056512308a00b00502e651129bmr14703016lfd.19.1696843765485; 
 Mon, 09 Oct 2023 02:29:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a195518000000b004ff9ab6463fsm1377495lfe.87.2023.10.09.02.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 12:29:21 +0300
Message-Id: <20231009092922.2590891-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
References: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/dpu: split
 _dpu_encoder_resource_control_helper()
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
index 46f4abe54cbd..30c457541645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -769,8 +769,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -780,28 +779,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
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
@@ -859,7 +872,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -954,7 +967,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -989,7 +1002,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
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

