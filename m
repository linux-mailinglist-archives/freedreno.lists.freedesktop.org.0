Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0255C68A1CF
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303910E882;
	Fri,  3 Feb 2023 18:22:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C32810E878
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eq11so6011740edb.6
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/zgJBFQ3n5ymIQNyKVQC4rciawdTcsEI035OK5ZnhE=;
 b=W2yQSLry2DmjZ35dFNsx0WO6FlHOCUNUMAmDTok03iqMjWdMWh4YFPUwFD8q4cX6Gk
 i+kRePNtq7PBn5y/MIGplgaFY0VSxkKw9pzZWWcYb1+CiNyxjHosoH5DNLcU/Lr6dIlX
 6mWoqu+fER3DYap3LJa6ZB+/ndpiMyp+M3rgeFxrprbDCsusy8EVJ2SZiZJZM87JaDmg
 p0tW9FUPA+2VARtOGYCHoZ3HfNCeWffRyxa7Go9gZ/UtxoSK6Le+qGFGh4uJX4PiYblu
 RDVg8HPRNipwATCJ6HrLCv1G1YPWxbb5E1H+VTxPvF0adZyEJo9vWYjFuxhXFnn3a70T
 Posw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/zgJBFQ3n5ymIQNyKVQC4rciawdTcsEI035OK5ZnhE=;
 b=U9G8G/F04ztF+Az2sXLGCojM6t28JydIakKttVVAW590p7gCeBj7GYzCf00WWUHwj1
 D+5pxueAp4W6AdH7fXPDT9kAG5F73JZFY7yz0MmRdcVcHzyTHM6rczPozFzlhyIpwh7u
 uDbCdIzNQ0bAjF3MexYtmaauvKr5VIOWlV68Pg1IZFocBLd8jNyhM+ZP1D2sYHicXx/o
 xmx/s+EIOkZSyDrjDvBfS7GaGctrjPwgNFvrfeZ4q11X/RL9bFDBQLiK739ZVtRoQ3J9
 U5+pI+fSSxPNfV4pchQYJP3dAGE7bgRxfIdXLE9KT0esAaAdViSmMKb12JrHPCB1KrwU
 NiWw==
X-Gm-Message-State: AO0yUKWvaLtQEoqb/qgJ629cZqM+7KGHxX40fWLRUTR0hXIIPm/d6rgd
 GDpT8GC8uUQKHXX9FJ6RXkZytw==
X-Google-Smtp-Source: AK7set9uA4qEWEuORyhj0lwMJNlgQ+d39EauPLMmAnbIsASlBzjd7nRuC/LUdAt2li7q2A6K+PNGXQ==
X-Received: by 2002:a05:6402:2742:b0:4a2:3371:cb82 with SMTP id
 z2-20020a056402274200b004a23371cb82mr15111920edd.18.1675448519126; 
 Fri, 03 Feb 2023 10:21:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:27 +0200
Message-Id: <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
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

Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
separate function dpu_plane_sspp_update_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
 1 file changed, 63 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0986e740b978..f94e132733f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
- * @crtc:		Pointer to drm crtc
  * @pipe_cfg:		Pointer to pipe configuration
+ * @frame_rate:		CRTC's frame rate
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
-		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct dpu_hw_sspp_cfg *pipe_cfg,
+		int frame_rate)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
-	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
+	ot_params.frame_rate = frame_rate;
 	ot_params.vbif_idx = VBIF_RT;
 	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
@@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1102,35 +1083,25 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
 	pdpu->is_error = error;
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
+				       struct dpu_sw_pipe *pipe,
+				       struct dpu_hw_sspp_cfg *pipe_cfg,
+				       const struct dpu_format *fmt,
+				       int frame_rate,
+				       struct dpu_hw_fmt_layout *layout)
 {
 	uint32_t src_flags;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
-	bool is_rt_pipe;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
 
-	_dpu_plane_set_scanout(plane, pstate, fb);
-
-	pstate->pending = true;
-
-	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
-	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
-	pdpu->is_rt_pipe = is_rt_pipe;
+	if (layout && pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
+	}
 
 	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1183,22 +1154,64 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
 
-	if (pstate->needs_qos_remap) {
-		pstate->needs_qos_remap = false;
+	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-	}
+}
+
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct drm_plane_state *state = plane->state;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_framebuffer *fb = state->fb;
+	bool is_rt_pipe;
+	const struct dpu_format *fmt =
+		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
+
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	struct dpu_hw_fmt_layout layout;
+	bool layout_valid = false;
+	int ret;
+
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
+	if (ret)
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+	else
+		layout_valid = true;
+
+	pstate->pending = true;
+
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
+	pdpu->is_rt_pipe = is_rt_pipe;
+
+	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+			crtc->base.id, DRM_RECT_ARG(&state->dst),
+			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+
+	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
+				   drm_mode_vrefresh(&crtc->mode),
+				   layout_valid ? &layout: NULL);
+
+	if (pstate->needs_qos_remap)
+		pstate->needs_qos_remap = false;
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
 
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.39.1

