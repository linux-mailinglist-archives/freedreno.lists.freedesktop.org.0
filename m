Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0241DBB4
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 16:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7F6EB9D;
	Thu, 30 Sep 2021 14:00:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855EA6EB9D
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i4so25962362lfv.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zsw9Gqm1JQ5sF8fzCWSX2aef9tGvz/OVRD8ZXgdkieU=;
 b=Cr0O1GmSOqO0ytecdZ9/9OJ5tMl5Yob/A6daOXBtb3CH6MA2tIBeZT6hhlJHf8Z1pq
 79fMgJFXEcTSA8EFoXYMNLCwAYl1qJd8UE+OKPKEj0KizBP/BGezfKk6JXHeKLkeeKkH
 MkAkHBrDgUMVZ4FJE/XX05I8Q6JvXHqaBuZ2GXMo+OZ6oLMNvF+OOZcO7ojbfAOMfUqs
 XWSaWwfYWHLcSPW86f1ZzEHCJoL8GNc3AZ+PoiS6oyeuwYunyQNVnvYFJ//6N7rdVCuG
 u9w5i7poLQ/IHYW0jiN6G7qWTZzQPiDpWL/kP9NB1V4M6C0aR0dA3sYELkJ0cPpecdBm
 yvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zsw9Gqm1JQ5sF8fzCWSX2aef9tGvz/OVRD8ZXgdkieU=;
 b=R9bpPCqnaCmlKNnyib6ALZIoMfvRc6z5nokQGk/WEp91rMaCn4AzlB2Kwq/vDwp+Fq
 yVxLuNkWsTVn2F37/eaA974Rs0s/GQOVOcRRf9m1JBFLGpE1h3c7l4B75XI8Qkr7fzzQ
 NK7Mucld3pTFfkhh8S14AkYEp1azZ8Vq4UPyAGnWPTRbjejMvPFCbRZ5pvSfNa7nkis3
 bkju2Cj8ay0KHBgRhiUbh/ldTTykBDESzXGNibEhnRWO1TbojxceyZ2pS0iqiir3Dm5B
 7OPQ2OOa7JiuaS4gufNMehzt7tNeMJ78U7i1DEFzLEP0XSwGaNtg9hU8tE+AQeC0c+7b
 w0kg==
X-Gm-Message-State: AOAM531nkTe3BF8Dk6tWvEF4zo7zehXYY/Mi2X8S/GKcZdOFv65vfGOq
 LmRg75thmF+wmWUndxm/6va7Fw==
X-Google-Smtp-Source: ABdhPJwxXv2P1OKGTZIQJUsgess3BJHoMDrUX0cYEyYjvD4rzcchA8zhPgy5vLRF/7XEq0Kzo1jwBA==
X-Received: by 2002:ac2:5f51:: with SMTP id 17mr6034019lfz.675.1633010424662; 
 Thu, 30 Sep 2021 07:00:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu, 30 Sep 2021 16:59:56 +0300
Message-Id: <20210930140002.308628-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 05/11] drm/msm/dpu: move dpu_hw_pipe_cfg out of
 struct dpu_plane
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

struct dpu_hw_pipe_cfg represents an interim state during atomic
update/color fill, so move it out of struct dpu_plane.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 104 ++++++++++++----------
 1 file changed, 57 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ef3737642b0c..5288b5b824f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -104,7 +104,6 @@ struct dpu_plane {
 	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
-	struct dpu_hw_pipe_cfg pipe_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -143,14 +142,15 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
  * @plane: Pointer to drm plane.
  * @fb:   Pointer to framebuffer associated with the given plane
+ * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
-	struct drm_framebuffer *fb)
+	struct drm_framebuffer *fb,
+	struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	const struct dpu_format *fmt = NULL;
@@ -167,9 +167,9 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 
 	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
 
-	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_width = drm_rect_width(&pipe_cfg->src_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
@@ -200,12 +200,12 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
  * @plane: Pointer to drm plane.
+ * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
@@ -213,9 +213,9 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
 	pstate = to_dpu_plane_state(plane->state);
 	mode = &plane->state->crtc->mode;
 
-	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
-	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	src_height = drm_rect_height(&pipe_cfg->src_rect);
+	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
+	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
 	pstate->plane_clk =
@@ -252,14 +252,17 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
 	list_for_each_entry(tmp, &pdpu->mplane_list, mplane_list) {
+		u32 tmp_width;
+
 		if (!tmp->base.state->visible)
 			continue;
+		tmp_width = drm_rect_width(&tmp->base.state->src) >> 16;
 		DPU_DEBUG("plane%d/%d src_width:%d/%d\n",
 				pdpu->base.base.id, tmp->base.base.id,
 				src_width,
-				drm_rect_width(&tmp->pipe_cfg.src_rect));
+				tmp_width);
 		src_width = max_t(u32, src_width,
-				  drm_rect_width(&tmp->pipe_cfg.src_rect));
+				  tmp_width);
 	}
 
 	if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
@@ -319,9 +322,10 @@ static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
  * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
+ * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb)
+		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct dpu_format *fmt = NULL;
@@ -335,7 +339,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 				fb->format->format,
 				fb->modifier);
 		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
-				drm_rect_width(&pdpu->pipe_cfg.src_rect));
+				drm_rect_width(&pipe_cfg->src_rect));
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
@@ -461,9 +465,10 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
  * @crtc:		Pointer to drm crtc
+ * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc)
+		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -472,8 +477,8 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
 	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
-	ot_params.width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
-	ot_params.height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
+	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
+	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
 	ot_params.vbif_idx = VBIF_RT;
@@ -651,17 +656,18 @@ static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
-		const struct dpu_format *fmt, bool color_fill)
+		const struct dpu_format *fmt, bool color_fill,
+		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
 	_dpu_plane_setup_scaler3(pdpu, pstate,
-			drm_rect_width(&pdpu->pipe_cfg.src_rect),
-			drm_rect_height(&pdpu->pipe_cfg.src_rect),
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect),
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect),
+			drm_rect_width(&pipe_cfg->src_rect),
+			drm_rect_height(&pipe_cfg->src_rect),
+			drm_rect_width(&pipe_cfg->dst_rect),
+			drm_rect_height(&pipe_cfg->dst_rect),
 			&pstate->scaler3_cfg, fmt,
 			info->hsub, info->vsub);
 }
@@ -679,6 +685,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -695,13 +702,15 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 				pstate->multirect_index);
 
 		/* override scaler/decimation if solid fill */
-		pdpu->pipe_cfg.src_rect.x1 = 0;
-		pdpu->pipe_cfg.src_rect.y1 = 0;
-		pdpu->pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pdpu->pipe_cfg.dst_rect);
-		pdpu->pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pdpu->pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true);
+		pipe_cfg.dst_rect = pstate->base.dst;
+
+		pipe_cfg.src_rect.x1 = 0;
+		pipe_cfg.src_rect.y1 = 0;
+		pipe_cfg.src_rect.x2 =
+			drm_rect_width(&pipe_cfg.dst_rect);
+		pipe_cfg.src_rect.y2 =
+			drm_rect_height(&pipe_cfg.dst_rect);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -710,7 +719,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 		if (pdpu->pipe_hw->ops.setup_rects)
 			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-					&pdpu->pipe_cfg,
+					&pipe_cfg,
 					pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_pe)
@@ -720,7 +729,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		if (pdpu->pipe_hw->ops.setup_scaler &&
 				pstate->multirect_index != DPU_SSPP_RECT_1)
 			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-					&pdpu->pipe_cfg, &pstate->pixel_ext,
+					&pipe_cfg, &pstate->pixel_ext,
 					&pstate->scaler3_cfg);
 	}
 
@@ -1087,10 +1096,11 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
-	memset(&(pdpu->pipe_cfg), 0, sizeof(struct dpu_hw_pipe_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pdpu->pipe_cfg, fb);
+	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
 
 	pstate->pending = true;
 
@@ -1102,17 +1112,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pdpu->pipe_cfg.src_rect = state->src;
+	pipe_cfg.src_rect = state->src;
 
 	/* state->src is 16.16, src_rect is not */
-	pdpu->pipe_cfg.src_rect.x1 >>= 16;
-	pdpu->pipe_cfg.src_rect.x2 >>= 16;
-	pdpu->pipe_cfg.src_rect.y1 >>= 16;
-	pdpu->pipe_cfg.src_rect.y2 >>= 16;
+	pipe_cfg.src_rect.x1 >>= 16;
+	pipe_cfg.src_rect.x2 >>= 16;
+	pipe_cfg.src_rect.y1 >>= 16;
+	pipe_cfg.src_rect.y2 >>= 16;
 
-	pdpu->pipe_cfg.dst_rect = state->dst;
+	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
@@ -1122,7 +1132,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pdpu->pipe_hw->ops.setup_rects) {
 		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
-				&pdpu->pipe_cfg,
+				&pipe_cfg,
 				pstate->multirect_index);
 	}
 
@@ -1139,7 +1149,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	if (pdpu->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
 		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				&pdpu->pipe_cfg, &pstate->pixel_ext,
+				&pipe_cfg, &pstate->pixel_ext,
 				&pstate->scaler3_cfg);
 
 	if (pdpu->pipe_hw->ops.setup_multirect)
@@ -1192,12 +1202,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			pdpu->csc_ptr = 0;
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb);
+	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, fb);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc);
+		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
 	}
 
 	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
@@ -1211,9 +1221,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb);
+	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
 
-	_dpu_plane_calc_clk(plane);
+	_dpu_plane_calc_clk(plane, &pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.33.0

