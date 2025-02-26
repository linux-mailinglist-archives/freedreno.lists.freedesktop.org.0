Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C76A45F3D
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 13:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9410010E8E0;
	Wed, 26 Feb 2025 12:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="atEeSfEj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77510E8EE
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 12:33:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fc33aef343so13458871a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 04:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573230; x=1741178030; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=77s7vz+/WLZt970t45pLBthxCe7Wu9JvkeWBAau9QSc=;
 b=atEeSfEju45EywRiGgKplTN40GW8OU3L8ZI62fUGb9X6m+XZksD2TABAk5yRsqWDgc
 iOZ6eH+GQprYH3bYzMEZvRSTCdm3XFHNAMEfSK1djG2tM39k2XIgNPtExZIVsxW0fzfF
 Hn3+4ngObWollg+4ETmKjpkfE2+S56zvauwAi8ZuugDxo63oBqwEcObnh/2HNCdUfOor
 JgkfktN9+9s7gjcNqyADr/CoMkBLoY2OXhS2JyHyiviv3K8uD1tUaKnQdQzF1ddlKd7O
 Evfgl7b8kTN+OJFhKEoh0SQ0nO+H8psdP16s1V5PjhLpo44JtPdWLAYaRIJUqHh0t9Kz
 tTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573230; x=1741178030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77s7vz+/WLZt970t45pLBthxCe7Wu9JvkeWBAau9QSc=;
 b=dQVfDXh+tvYpjAXoRbPf0LZtm4DYFHhslkNYqu8wHNe4kKKyzE4klyFY9n8mCC/Icc
 o7BBz6kwZi3i3KEVBbxc1S242O8Svjj4KrvSh03iZaE+nPPkZpMcZNXKwSH559pFhcCi
 Cs60f8yzo342HyCHnf145w7rkweG1Vrr+k0ynHEHtiwREvXWtWcD/B2gCrSrP0NyvzhJ
 ORs5OpQAaaK1AOfTcK5IPvLgJlQNrnxSBSvF6a3VfVLeCJJgCvESKK0cz6E9ij7BQCqj
 M+wj29ozBbEGgVN11sEORVuEnhxZbFFlzFq9n3iE/mgSl0i5a5s7m73AV3aj410zTY3D
 QuVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu43R6/QtnIXGrOJ+EMiwXaApZEu2k3mWgJc5wwic7fHpo9aH+3AUJTjaf5VLxLS2nw+wnPbHKT9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYKeuDDY54P/6rQrLkwJPTlHPmr+tyeRpQSm7Rq0pzK3NTYwhb
 vsC4SG0Q74dyPiEICR04gJo1/GwGWNBG/E/VthBUZjqgBZxoDX9iseihsHTWe48=
X-Gm-Gg: ASbGncvpESpNx70Ktv7d5xLN29zh0TVPJt1m0aEbkv9nX3qdE6gnGwsU/MX1jieZn0z
 ZVu/NIjZVq1V4qF8IQL327VYnS/Jwl4u8UPLCpRgOIyAsXWF3JLpgJNCaaJu/iDC14lEzpzdJyt
 96yTSpo7SLJXK3w6UH2V37iABpfnQ1/SWzMkYVkh3pgJGcYG5L4AZaYbYhiLN0b9Ohpzicbve3L
 CjHeZi2vP3XRHuv0NFTcQKqCCaxD0osqkGY8A5dzzllimYNbL+L3+LE1spRQSfAXqYTjFf7wJ1F
 P26K3AlU+wbSpuIrgK7r3iM=
X-Google-Smtp-Source: AGHT+IFk1ci1BbhibkAaGpcpOooMiica9MJmrmewXuln4wGcX2YKJyZHDBq8S1eU9D/v3NSe43dWxQ==
X-Received: by 2002:a17:90b:2248:b0:2fa:2124:8782 with SMTP id
 98e67ed59e1d1-2fe7e39f185mr5102979a91.25.1740573230422; 
 Wed, 26 Feb 2025 04:33:50 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:33:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:31:02 +0800
Subject: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=5677;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lK2zpnkmypG1djckaz9FnmdKtFocUQgptRIASed/8K8=;
 b=sLmMuO4uTpYyuLd3gJ4Uf3176DFQh9EgWwwxnHE2P9ga3bdgBTFZZppD/U1It7javItMNfU0s
 eIMRdQLCFx5BPu7TfvKxhKsmTCGCn8afs0FT2n7S1U/fCwabSyPdbWC
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++-----------
 3 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f954cd8c6aed3a222723 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * @state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca42546fbc421609f72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			struct dpu_sw_pipe *r_pipe;
+			struct dpu_sw_pipe_cfg *r_pipe_cfg;
+
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			/* use solo SSPP for the 2nd pipe in pipe pair */
+			if (i % PIPES_PER_STAGE != 0)
+				goto use_solo_sspp;
+
+			/*
+			 * Check multi-rect opportunity for the 2nd pipe in the
+			 * pair. SSPP multi-rect mode cross mixer pairs is not
+			 * supported.
+			 */
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+				continue;
+			}
+use_solo_sspp:
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+					pipe->sspp->idx - SSPP_NONE, i);
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1

