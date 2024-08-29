Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB596416F
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BA910E647;
	Thu, 29 Aug 2024 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a+jyHXHN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BA410E645
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:21:55 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-70f5cd2fa39so346905a34.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926915; x=1725531715; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gjSRyqv5jrIYe8oPavf5LS4RSFZl2p6GWK9ZKbwfHc8=;
 b=a+jyHXHNn46q0bF2/SXrBuihf+6Vz4dHeIB7sYSq2NDLilxvNb6M3wBaIW05OzM/Wk
 ty/msoGNSS5/OD71JwRWQGOA9fvFV8GdevcDfflrC80TMU2nw3mStU2efxCKzR2svHKr
 5CD4Uyoxym0sonwYnkul/qnUwVD69j8TIIdQHW/r3JLiTt0ffGmwKSgBaL8Cnxj0/0aC
 qAXs+KQXiY1FszpSu6DAd1b7BdCLXa8GkyWr58Dwcn3ThGUYGbSIKTzIQJ9QyQ36bZsM
 bIYmzf6YsDwAcRyToaJF/1fAyXU6UfiEkPuPwvfKq94q5WzxCRVqpOjscW4F8ZXvk96K
 Y4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926915; x=1725531715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjSRyqv5jrIYe8oPavf5LS4RSFZl2p6GWK9ZKbwfHc8=;
 b=s3MBpbg3KWUjK1P0nSj5mMcJAJgfkAmzoeTFYXZ9/sVccGphV87OTJHhCbEdtAZdCO
 AsE5aWq9jd4/gd9mDd8n2cImiDftx0biI4dWz6VX0c/dQIavpPk+v05s0Q6GaS7PzkS0
 o186dk2b3NJDNKgU5LbLmhUVJhiACfc0kAJ0AOOuHMe9MXfnaG8AMHhRh/l9YujLAM46
 ENn52ucZ4Tzg1VVp65cFQkNcjyJ3TSgFvV+ZXQM1lIw0TVSYGv6ClM3F9r+JhIpqeskc
 lw4GOrS6Dj0E+PJ56TBYlNnAqE3DYpIP1i/fO3OJqzMEclHD+lZVwZ7uqcP7WKXP18MO
 2zRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVkF6ZiEdXux3VnQY8laY2z91gLe20wmJrcSrBBjjD5bZY+wA1NvSI+EOCO55S8QaltSJwSIaGBBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB93m92NgPoCzZAQdt3Z1+HagZSDk+Z+FgAWOVhm9E/D7lZlMx
 JVm//9NGQ3iygaUnYW/qjooo8A1SJCqpE0PF+3ljTHUrgOm6GkOatclOM8Dz3bQ=
X-Google-Smtp-Source: AGHT+IE2sJ3gi89U+R396+pQnENMpP6DHjXJOwnchnVnRwY/yHsyKlwnhI9BSt207Nf8HMmhG8zfoA==
X-Received: by 2002:a05:6358:5290:b0:1a4:e0d7:8418 with SMTP id
 e5c5f4694b2df-1b603cb59camr263194455d.23.1724926914779; 
 Thu, 29 Aug 2024 03:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:21:54 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:49 +0800
Subject: [PATCH 20/21] drm/msm/dpu: support quad pipe in general operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=6316;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=I2ikWc1eRtSUuiI5dMozrl26pLTUFuNNmccuZxgTX/s=;
 b=g1ueGL+TskNovQN/ZmNbHnb4EnXyhtPQROMxAonDNcj33RLavysgr4YjvXEtoRtODVlZTDTOu
 ri0JLuEDoopAWdVl6yM+GqV8v0lMF2vxjXlmgS/oWdM+hPzHzfuBURB
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

Support quad pipe in general operations with unified method.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 87 +++++++++++++++++--------------
 1 file changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c38c1bedd40fb..c3ea97b4ce439 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
+	int i;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -632,12 +633,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
-				   fill_color, fmt);
-
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
-					   fill_color, fmt);
+	for (i = 0; i < PIPES_PER_STAGE; i++)
+		if (pstate->pipe[i].sspp)
+			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
+						   &pstate->pipe_cfg[i].dst_rect,
+						   fill_color, fmt);
 }
 
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
@@ -1279,8 +1279,11 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		dpu_plane_flush_csc(pdpu, &pstate->pipe);
-		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
+		int i;
+
+		for (i = 0; i < PIPES_PER_STAGE; i++)
+			if (pstate->pipe_cfg[i].visible)
+				dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
 	/* flag h/w flush complete */
@@ -1380,20 +1383,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct msm_format *fmt =
 		msm_framebuffer_format(fb);
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	struct dpu_hw_fmt_layout layout;
 	bool layout_valid = false;
-	int ret;
+	int ret, i;
 
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret)
@@ -1412,28 +1412,28 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
-	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
-				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
-
-	if (r_pipe->sspp) {
-		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
-					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (pstate->pipe_cfg[i].visible && pstate->pipe[i].sspp)
+			dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
+						   &pstate->pipe_cfg[i], fmt,
+						   drm_mode_vrefresh(&crtc->mode),
+						   layout_valid ? &layout : NULL);
 	}
 
 	if (pstate->needs_qos_remap)
 		pstate->needs_qos_remap = false;
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
-						    &crtc->mode, pipe_cfg);
-
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
-
-	if (r_pipe->sspp) {
-		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+	pstate->plane_fetch_bw = 0;
+	pstate->plane_clk = 0;
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (pipe_cfg->visible) {
+			pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
+								    &crtc->mode, pipe_cfg);
 
-		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+			pstate->plane_clk = max(pstate->plane_clk,
+						_dpu_plane_calc_clk(&crtc->mode, pipe_cfg));
+		}
 	}
 }
 
@@ -1441,17 +1441,21 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe *pipe;
+	int i;
 
-	trace_dpu_plane_disable(DRMID(plane), false,
-				pstate->pipe.multirect_mode);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		pipe = &pstate->pipe[i];
+		if (pipe->multirect_index == DPU_SSPP_RECT_1) {
+			trace_dpu_plane_disable(DRMID(plane), false,
+						pstate->pipe[i - 1].multirect_mode);
 
-	if (r_pipe->sspp) {
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
-		if (r_pipe->sspp->ops.setup_multirect)
-			r_pipe->sspp->ops.setup_multirect(r_pipe);
+			if (pipe->sspp && pipe->sspp->ops.setup_multirect)
+				pipe->sspp->ops.setup_multirect(pipe);
+		}
 	}
 
 	pstate->pending = true;
@@ -1607,14 +1611,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	int i;
 
 	if (!pdpu->is_rt_pipe)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
-	if (pstate->r_pipe.sspp)
-		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		if (!pstate->pipe_cfg[i].visible)
+			break;
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
+	}
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif

-- 
2.34.1

