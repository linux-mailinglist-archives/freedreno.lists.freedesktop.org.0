Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B768A1D7
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4606D10E87C;
	Fri,  3 Feb 2023 18:22:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9797110E875
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id fi26so6013123edb.7
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFWaguJm4YfR1hpjBNPACSSrmgblBP3/yBm6RJ1W6Ts=;
 b=YeYRu1fV3/T02yj+r0LoxZ9smbbE6+kcOg2tAAhm4zAMNwVMgoX7rQ6G1qzj4FwR3v
 VVZV3KzoQJGX3iufzJhB+mevKutoRJ/cqLZjEc1oid0vfP+RmC1jjhuyhTrVqOpOBtuf
 771Y8BLPJTPE2euziJK+HYfrEp12SxrsM/4rxJPX/WdOI39BVueeP6rCP0mRwQrFNzh5
 Hy0aO/p2JsNnTCY30TbGCY0NV23+Kyn+1z9Hpox2hFTqs1TXm4FN6YYMOPWOivTnjmcU
 4uxdMTYmv3xEevxoKFMKp2BXrudyF5D5ssTF0QMuKfMrvFVtaJaMOykmduMvCFFRZ30p
 gWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFWaguJm4YfR1hpjBNPACSSrmgblBP3/yBm6RJ1W6Ts=;
 b=eznt8V6RhgFd8+WhIRuR6waHkuiRjLmt106G2ytvQ4fXf8uonQ80rBpEAteeebiTVH
 /FeE50CPBxeU+VEW5wQ+B88KEl9LxebLmsSZoJHv7r1+NtKh64YIAnNgU/xpqb1iA1Pi
 FeMoOYq7DaKOHO8y2QbPjaek88GhVSZimYh5nWZW0XIOUtzuJZufaAb8bDBLxG6LjeUT
 UQFh/gGtZcq0XeOLqzHjw0Crwnw105O/EhsuHij7olgc7nsLDJ5t8JBa9ONbxHV4M6u7
 FgAM1sYeRBgOSyW4hboJh0SAyrA+72giX8qHLY6QSCRBr35T2Mq84qSLyZk5aGNSJVli
 DEMw==
X-Gm-Message-State: AO0yUKVlqnQs2p+L9Xx3GmlNnxcfpoSlHO2IhQB1jIcnjcl+HrIUZrOw
 yTjOWPVKoETBUgZ0ILNDSgro8g==
X-Google-Smtp-Source: AK7set9myuTV+Y2zbAIrd+TALi01ISZlUOmAuq2dbgZKUskW5hbQCUdbzgApTZLtz6ONBNQNo2UvjQ==
X-Received: by 2002:a05:6402:2998:b0:4a8:4252:757e with SMTP id
 eq24-20020a056402299800b004a84252757emr5837168edb.32.1675448517134; 
 Fri, 03 Feb 2023 10:21:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:25 +0200
Message-Id: <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 20/27] drm/msm/dpu: add dpu_hw_pipe_cfg to
 dpu_plane_state
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

Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
chance to disagree about src/dst rectangles (currently
dpu_plane_atomic_check() uses unclipped rectangles, while
dpu_plane_atomic_update() uses clipped rectangles calculated by
drm_atomic_helper_check_plane_state()).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 +
 2 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 09a3fde1c910..ecf5402ab61a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -951,7 +951,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
-	struct drm_rect src, dst, fb_rect = { 0 };
+	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct drm_rect fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
@@ -984,12 +985,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	src.x1 = new_plane_state->src_x >> 16;
-	src.y1 = new_plane_state->src_y >> 16;
-	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
-	src.y2 = src.y1 + (new_plane_state->src_h >> 16);
+	pipe_cfg->src_rect = new_plane_state->src;
 
-	dst = drm_plane_state_dest(new_plane_state);
+	/* state->src is 16.16, src_rect is not */
+	pipe_cfg->src_rect.x1 >>= 16;
+	pipe_cfg->src_rect.x2 >>= 16;
+	pipe_cfg->src_rect.y1 >>= 16;
+	pipe_cfg->src_rect.y2 >>= 16;
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -1008,30 +1012,30 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
+	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
 
 	/* valid yuv image */
 	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (src.x1 & 0x1 || src.y1 & 0x1 ||
-		    drm_rect_width(&src) & 0x1 ||
-		    drm_rect_height(&src) & 0x1)) {
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -EINVAL;
 
 	/* min dst support */
-	} else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) < 0x1) {
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
 		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&dst));
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
 		return -EINVAL;
 
 	/* check decimated source width */
-	} else if (drm_rect_width(&src) > max_linewidth) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&src), max_linewidth);
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 		return -E2BIG;
 	}
 
@@ -1045,7 +1049,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
 		(rotation & DRM_MODE_ROTATE_90)) {
-		ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
+		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
 		if (ret)
 			return ret;
 	}
@@ -1120,9 +1124,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_sspp_cfg pipe_cfg;
-
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
+	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
 
 	_dpu_plane_set_scanout(plane, pstate, fb);
 
@@ -1139,16 +1141,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pipe_cfg.src_rect = state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg.src_rect.x1 >>= 16;
-	pipe_cfg.src_rect.x2 >>= 16;
-	pipe_cfg.src_rect.y1 >>= 16;
-	pipe_cfg.src_rect.y2 >>= 16;
-
-	pipe_cfg.dst_rect = state->dst;
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1157,10 +1149,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pipe->sspp->ops.setup_rects) {
 		pipe->sspp->ops.setup_rects(pipe,
-				&pipe_cfg);
+				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
@@ -1201,12 +1193,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
 	}
 
 	if (pstate->needs_qos_remap) {
@@ -1214,9 +1206,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane, pipe);
 	}
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pipe_cfg);
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
 
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index a08b0539513b..079dad83eb37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -19,6 +19,7 @@
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
+ * @pipe_cfg:	software pipe configuration
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -33,6 +34,7 @@ struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
 	struct dpu_sw_pipe pipe;
+	struct dpu_hw_sspp_cfg pipe_cfg;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;
-- 
2.39.1

