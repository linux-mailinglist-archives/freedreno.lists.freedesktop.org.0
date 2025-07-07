Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9FAFABAC
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DB10E417;
	Mon,  7 Jul 2025 06:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LqQRENv4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78210E419
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:19:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-74b54af901bso1601587b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869153; x=1752473953; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SLYcyDGUwVs1TCnZ4fAtjKxYxhC0Keb+hEw8chsCJnQ=;
 b=LqQRENv4+cydI05GjVL4PA8Kbo5MgY/Fr0GSxnOPSA3f5qpAU2suo3kioG59Qk0ju4
 SnmuttU1xobkDxkqbvOhvHNhkYLizXke7Po9UWCSE6JKVxi4HeFqpnykxMIgDircKeR0
 GcFJFTxR6yuHp/3RLtd4ZzTmgTuXhjBXXU7Dwuz/oq/8Ii/er2UVjTOnMxJMLGeeQyO5
 NgC4pmaumpk3qxDfUI6K2IrN7q1lNzH79ZLQIoGhV3RbR2Tff43IkAfmnw2/gIr5E8ma
 +LPVfQJQ4wfZFkWuc0Hd8IcQJf2leA3OGu1BGC3xONmNPUFgeAptjO6LsvstQWxumGGZ
 +fLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869153; x=1752473953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLYcyDGUwVs1TCnZ4fAtjKxYxhC0Keb+hEw8chsCJnQ=;
 b=S73OiQvX/JeJoHfVYTsRSPDtz1mdkydhrdM6jc2BQ5S93bJS48TUfabgO0S8+s204+
 i6DIwcHoHzFxo3WfvZqvhwcPsgtogXc0PeVo9X3F7xTnQyt7Wr+JZroUWHLoi2/CjtEB
 WBbTd1/z8pSjVEUX3j5s/iOOiYJoTMMxAQOWxHmZ/RNnU8W8bQ0wln2jT1o7+QFxzZxb
 TleARvnAYD536MyLveAZ6m8W8QQ+P8yqtLLMYlvpRwCOpF7Hm/NVerf2VesKGlMpuAD+
 wSaAsMdRbC8Bk1xpu904PD2WOxkkHRFmSNCb/ynYUcOStW5wi8LHPhPJofJLgqNRq0bg
 mrkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoN2xPyQreumptfQK/q983bwoCCdgSZiGgoGzjsGsKBeJJH8bH7UYRiy7P/RfnuCOyHT+rGF5FOmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsU84jDLJj9M/MamJSdz3HjWT9+7hcwWn8bL5T98IOk6VjiaJQ
 fjwLewdQXHyeyDAqi2Q27s7M9bHV4OuRaymdcWjnQIA/I7VobHuYxd3TU2L7+2ckPXE=
X-Gm-Gg: ASbGnctdBGM63IQvVuudUhX/EF8sUM/R30YBVarK0CEOMMrB/tkUhCINC4WHY/Pi0Pm
 Crz57MKVa7Y5sEfUrvDEQQdTfrV29EShmigiMnN5HdRYOr9msjqcR6jaUmsYkTaRBOyZaGigffZ
 wjA130oKgGFgn9obWMokdgJwDEX+bx+sfPX/rBHdOYYPEjC+gUBo1AOaKdcj84t9VqafbQLSZyy
 5TT6MuzpvCo7FZh2onzyCRTCRNylaiWJ5e6baHMLQ30/UUrBdERRN7YWlU2Z7FJPgHZixMsh/xn
 JjHuT1gW5ooJ/Twu0sXxW0f+4tC1G1JBtVPnlixKyF/G6t5vUJ+LPmRrz3OxTobruWReYg==
X-Google-Smtp-Source: AGHT+IFtcelwxhw3FHDRK7684pBDurkGqoprst0CYk6b0hnfJQOsi3R8cWrDWZPkY1XoZJAYaEnyfw==
X-Received: by 2002:a05:6a20:a113:b0:220:967d:c822 with SMTP id
 adf61e73a8af0-2271eccd34amr12034381637.3.1751869153219; 
 Sun, 06 Jul 2025 23:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:19:12 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:05 +0800
Subject: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=8448;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ap+2nA3vCpiUHkKg9Lzcj2185wHlDPqznO6jDAEkMDg=;
 b=WdjAtTQ/uEqcUgnvz4I9409D0A7XE7RG/DditYh1d3IOwvSIkG95L/eVetDcAR+JQKJXuYmPc
 7ftE8nLspCUA/w0l5/ZyutRuvx/QN7jdcRHqA3YXiMRzcKfFMhwZfQ8
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

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
+static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
+				      struct dpu_sw_pipe **single_pipe,
+				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
+				      int *stage_index)
+{
+	int stage_idx, pipe_idx, i, valid_pipe = 0;
+
+	for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
+		for (i = 0; i < PIPES_PER_STAGE; i++) {
+			pipe_idx = stage_idx * PIPES_PER_STAGE + i;
+			if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
+				valid_pipe++;
+				if (valid_pipe > 1)
+					return false;
+
+				*single_pipe = &pstate->pipe[pipe_idx];
+				*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
+				*stage_index = stage_idx;
+			}
+		}
+	}
+
+	return valid_pipe == 1;
+}
 
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
@@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  const struct msm_format *fmt,
 					  uint32_t max_linewidth)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *pipe, *prev_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
+	int stage_index, prev_stage_index;
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
+	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
+		return false;
+
+	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
+				       &prev_pipe_cfg, &prev_stage_index) ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
+	if (stage_index != prev_stage_index)
+		return false;
+
 	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
 	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
 		return false;
@@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	if (MSM_FORMAT_IS_UBWC(prev_fmt))
 		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
 
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	r_pipe->sspp = NULL;
-
 	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
 	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
 	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
@@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
+					      struct dpu_sw_pipe_cfg *pipe_cfg,
+					      struct drm_plane_state *plane_state,
+					      struct dpu_global_state *global_state,
+					      struct drm_crtc *crtc,
+					      struct dpu_rm_sspp_requirements *reqs)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_sw_pipe *r_pipe = pipe + 1;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
+
+	if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
+	}
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+	    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		goto stage_assinged;
+	}
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
+		if (!r_pipe->sspp)
+			return -ENODEV;
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	}
+
+stage_assinged:
+	return 0;
+}
+
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
@@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
-	int i;
+	int i, stage_id, ret;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	prev_adjacent_pstate = prev_adjacent_plane_state ?
 		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		if (!prev_adjacent_pstate ||
-		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
-						    dpu_kms->catalog->caps->max_linewidth)) {
-			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!pipe->sspp)
-				return -ENODEV;
-
-			r_pipe->sspp = NULL;
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
-	} else {
-		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!pipe->sspp)
-			return -ENODEV;
-
-		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-						      pipe->sspp,
-						      msm_framebuffer_format(plane_state->fb),
-						      dpu_kms->catalog->caps->max_linewidth)) {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
-				return -ENODEV;
-
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	if (prev_adjacent_pstate &&
+	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+					    dpu_kms->catalog->caps->max_linewidth)) {
+		goto assigned;
+	}
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
+	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
+		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
+		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
+		ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
+							 plane_state,
+							 global_state,
+							 crtc, &reqs);
+		if (ret)
+			return ret;
 	}
 
+assigned:
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.34.1

