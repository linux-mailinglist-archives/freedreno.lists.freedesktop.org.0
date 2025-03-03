Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8B1A4C499
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271D510E467;
	Mon,  3 Mar 2025 15:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i0yujU7G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6497010E467
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 15:16:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2239f8646f6so29318045ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014973; x=1741619773; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jeiKOAhssO22mG+syoBELGAqYmpudt1t/PGbu5skEvc=;
 b=i0yujU7GBgNR0Yo7xGZzku4P4k3vBsrQNc5TBF84WjkKdrPnDL2zBFHC/QAzc5NZtW
 sLnyO//c495ffNgJHEt/+ZX+uK9vy415iOEZRDTYgwWsc5EQb7qA1jtuBdJVVAEzQofK
 7xg6+GrHVvRhbOREB/fubpDUlzrwkagTN9qZnOvIi2DtLjQm7ULxfCXG5VnIIC8cQb9o
 RSFBEXKHMx7Hs6pfBM1liKwvaPdr/e1PFelZu7/7eohsIR1MtO9yugEm1VFfCQr4KAX1
 +2+jEYyYJqbXhRx7q0ZqdMjnq1sWVfyhqiFqHWqF8gPGW2/yXOUt/ajkq5qpGjxMmJX6
 m9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014973; x=1741619773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jeiKOAhssO22mG+syoBELGAqYmpudt1t/PGbu5skEvc=;
 b=aqC9HfBNVQuqZBGM/D/qpaQB9+WmQM+76q32WRonNfY4Fp3dfN6nq5EoZVusoqGf6k
 ln7mMaE4eni0WlPmaEQhj8WWghoerS0X1aQ18t8S9OV269y2vvCsJ46GV9R8S7zU83i+
 m3EQuQtl1rsI6HhIT10h170DVBV1I79eiZ2QuIqw9xr00XfWi5smobLurbdD7dc7G9R9
 JpwngC6SVnuFD1I/fHAqmf6dEJ5/2Hk1KUlHYFnxeyhAZcIN1N08HStyyQFr9LWTDGRL
 7d1yf/F8dmqrMVfCHil9S39GbCW/O5nwzf7acltiJ2j71SQ2belWykBDpyOhAGGcX2Tl
 80Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUArFjoF6cHLsUiwJgwUMu4uJLRBjOQI9855VpZ0/uU7ta9ycx9hI9bl+iFn1E6ppfnTehU09nLn7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu7YnFrxUvOo+MZmiIhEjDwK2/kZ5Il4Qhoq4tBluNKlbzYho7
 gsit5nEHfDozGH2ksbv1jT8g8sOtJfgPyNOVc5FPYTSBSzS8vxAs5UgTs5MqREA=
X-Gm-Gg: ASbGnctbYQx+jDWSL6NFkszTkKpepvtB9HFV/BAOIDYOASI75bG+E0YHJqZQ29hRz8Q
 xgTWrorNwCQw84xEptD2n4l8gIi7Wfid9es/53P/bxU+LnfoFGH42KDEXDpx6+rXCqa5cOz+QR7
 kvx/vR5RuaanNp46ZlUc+ieIqQZ8c/GfIUo/9+KDkQctkFLzFuS9lvZRC1z32BwMx3IvJj0RTZZ
 TMnnL6XJJoRapQMa7tNJt/ZWsNyPGtOeJZJepY4wRJxE5R3V+w4TR20sr+oJDxVGf4xHRJPcEKd
 wY/ynAPZkrKXxW5nA1cGhGqe8w75bYG5Ts65B7igbA==
X-Google-Smtp-Source: AGHT+IH5vZiJbKOJSXP5L2myFgEt0PYILkd+ohhQaEBUZOw54AxUXPlrBE8hgjH2MJ/U71KQ//b5DQ==
X-Received: by 2002:a05:6a00:2348:b0:736:34ca:dee2 with SMTP id
 d2e1a72fcca58-73634cae088mr13842365b3a.4.1741014972660; 
 Mon, 03 Mar 2025 07:16:12 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:16:12 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:41 +0800
Subject: [PATCH v8 12/15] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-12-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=4567;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=JEWlAQKLoU0arL2fXui4XtAd0zqAMT6RO2YjjIM9g8k=;
 b=AxvNzZOHRxRqfSUYcGuJVLNcnZkltBBp9yJw59rQsvtUUvXlXZJbkA75caXwJFHPVQGmPeykn
 kO8hGewUF+ACdwFfmNV0Co0DyjUalCblP9T8hcaRRKJO0cHTsg2nfKG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration
in the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799132db71c9712046d359e3535d90..6fbe42e8988edac7e7917ae8de180aefdaf443e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -392,7 +392,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_stage,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -426,7 +426,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_stage; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_stage;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +463,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+
+				lms_in_stage = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   lms_in_stage,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +513,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +526,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +545,12 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 

-- 
2.34.1

