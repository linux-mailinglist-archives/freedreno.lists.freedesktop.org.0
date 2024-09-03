Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96379691D0
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 05:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7DF10E3CE;
	Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wz4QU0RK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54EE10E3BD
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 03:22:58 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f3f0a31ab2so55104311fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 20:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333777; x=1725938577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FEeo10BRWPxe0eGwbZzKhWDPMOBcNt8ddVJ+z2RIuvo=;
 b=Wz4QU0RKHjLVwEoIXqDgXiun6goVq4Rfzw77K8dVhOBiK47j/QS3ZOQESsjHEyI7Bl
 7w5B2IAEf9Um9z615FX4BAYtn0a0GjMTVkgYjJritZM9kAEaqtcCV5fD1qjAGaYPbBy7
 mnoPp5vILovhQN7LCyAClzXKt7t6xlAVHfjb0g630PD8BDoC59RuiZpW5S0a8Zn5KJfI
 PAbapEtSGdVO3Cv1URhwD65mu1+QBanM28l0KQ3KMEJCWP0jKJ2WQZQzcfjfMmgBiuuR
 7XJVK6MhAM/05hFdDXtQ1NDnpvjaUw+uIXkr5DSnw3F3zQgF5W/RaXv5BCFU0Ro4/48v
 fN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333777; x=1725938577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEeo10BRWPxe0eGwbZzKhWDPMOBcNt8ddVJ+z2RIuvo=;
 b=GGaeCJDpfkwwLJDaYseGGdhpFUaNEyLGLGlWgmd2VV7NrA856YYmAJghL0vpOA7re4
 w8q57nrbDRiHRE0Z38G6D33gXbfrQZ69vELWOMXIv8EvfEHnEwX1L6ilsFE3G4H3+2lH
 TtBdOR/ubP2n8o9eGJ68z8fa3XR5JnIneVumnaAiTrs6Mdm2Pv/8siwQ21iL/hf4xADv
 MMZ8UbfA5O74kH3GgHXDiFEoa8MsNSgwmXgKYeUvfBuSfBJFFt11SUC28KWSwLL9ZAjP
 9Solb3HEKcIRlJQNt1fuRP0iWtxVFdsY2iIrL/CiBPSeDA4tdKIE3EesxaJHUAdrS6nl
 Lx4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOeb3PsQBroKtys8kEIU4a9FrXrE0FAn/myUcu2E2UfHf+N2N5Rq9WPcLrsYy5JpkrIgV0O2RZcCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+WbymwI0f+Pf/JkkQQhJSStWRlw+u7NAWg9jV1cK8bazUSrWR
 /T4lUbOdIl/OcmhFIGauz3GKYgKiM+6pFPvACTH9tIHj4OHKidtGvrW/xIZXjDY=
X-Google-Smtp-Source: AGHT+IGXj0Ycp6Qxb6XPj05g2bVPLU/ugFin4/hG5m/GbsQNUGZJ3yr87dUxf+keCpynMg8xGFEw3Q==
X-Received: by 2002:a05:651c:211f:b0:2ef:2016:2637 with SMTP id
 38308e7fff4ca-2f610220cccmr116756151fa.0.1725333775771; 
 Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:46 +0300
Subject: [PATCH v6 03/15] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-3-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pmjRO8yJThNX7l3z3gVUhe1TCXTyBOLqoZGUg4MJPFA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELev1LF4GTrHwQWUvET4afCIWSGRpfCbEmI
 cTdtY7Dt8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1dmrB/9PgPcJPUTqwgXdNCCuBaC4ZqEIQTyeXB0DyaSSP1DtibF19sOhD1AUfIXeYBLqT+ScxRn
 togfAlcziaBjNbHFbhzmoB3AHNohSvaU6OX9UNrKe56JGc8V6sx9cfiGxyX6zspd7qQcDuP9Jgr
 R7ubXFT4m/apLrrxNT7go6sI4XSzT0L7iVNcMiAxuQmuZUsz1XaB9W9o3x0N0aRL6F5/FVQ3D6s
 yI1tfTVOuqCMo0o5cDuAtnbqQkIcDp2CHfg7L60Ug4JJACLHix2FzvTMTt02Zbp2DjDSbfFwa0Y
 J6NBC9Sdj9y7/rwaXxm36F/Gicj3q5q9RIoRhCtsXv9tVc6C
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
overflowing LM requirements. Rename the function accordingly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e81feb0d67f3..db6c57900781 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		r->y2 = adj_mode->vdisplay;
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
+
+		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+			return -E2BIG;
 	}
+
+	return 0;
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
@@ -803,7 +809,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
+	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
@@ -1189,8 +1195,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2

