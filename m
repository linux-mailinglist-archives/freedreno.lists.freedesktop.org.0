Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51A68A1D3
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCFA10E881;
	Fri,  3 Feb 2023 18:22:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DF210E875
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:22:00 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eq11so6011773edb.6
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7J8VhDWHVlFYGAXnUXytZb9Gofq7vS0h8CTTA/X56uA=;
 b=brfiu0kefD/Hr/iO6XFPXYLpjaMDj4lMfYSdcrniHQwNsL74pQiuZoYt4t9MGREMLu
 L/BdObDLQvcD16fhXTyn/mZE7OhfzLG0HwBoDXxhjP34YtFRzgf9Sr7w5Qac5ttV5JrB
 CQFRSjIlP6JMsXQgd5aosbQBSlFmPZzVk5j9c6lD6IG5NhYU1E2uWaFT6Riemjf6y91f
 uZ4hpQLLYNcQJlzpb8IDIaSBF/la6eTxBSzxyY7mZ0+zp9A1g4G+f4YyAPy8BI20tLQk
 VwogDKA8YX1H4EiBiBvsefLG9WkgbM7IER6QG+6SB5UvHpWPK7rbxvnTx3kZz+o8qGGe
 WrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7J8VhDWHVlFYGAXnUXytZb9Gofq7vS0h8CTTA/X56uA=;
 b=TCTvidifpXyRA1oWRt5k1O92zlhxJea+zGfcaV9J+F2gtDts3UuesaESWS7BSoidO4
 /VmgnMy+ZWWwOfYWGxCkWpqtUvzsYulHHoYGoe/UOXVBpiFNyJdD/NdcKzkyhRZWDC40
 /JxbwTmxEozPfptBHRuNn2Vrv0amV3zxNzbXm5Bvx9+cVEa29E+KFRBqgqL1pbsqGNuX
 l1yCg1jJ8m+Xsp14mFVqtclzbIuQB21YQ03XL/2A7jrSfSMfKjMClGnwlpAb3/WfLIsl
 zKs9fHnZe29r21VzCs8kGREy8a/OWVLNwN4PDHnyaH/PiD3xH9SDQcX1//Oiikmj/L5l
 Raiw==
X-Gm-Message-State: AO0yUKXpQSZUGLmIsYFmpx4nMmu7X0VSBU8yAJuJb/TAgW3t98hnscCz
 K0tfan+bATc/m2LlKcGzY3rbQQ==
X-Google-Smtp-Source: AK7set9mKHPTvsoKfYMYKS79IWfXOJlX8uqkHF3P09XU9x/HP79kk9b1HRH/S7b6gb6/SUw5pB7PQg==
X-Received: by 2002:a50:cd8e:0:b0:4a0:d73f:c0ee with SMTP id
 p14-20020a50cd8e000000b004a0d73fc0eemr11952364edi.28.1675448520224; 
 Fri, 03 Feb 2023 10:22:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:28 +0200
Message-Id: <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 23/27] drm/msm/dpu: rework
 dpu_plane_atomic_check()
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

Split pipe-dependent code from dpu_plane_atomic_check() into the
separate function dpu_plane_atomic_check_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 ++++++++++++++---------
 1 file changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f94e132733f3..e69499490d39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -903,6 +903,51 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 	return 0;
 }
 
+static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_sspp_cfg *pipe_cfg,
+		const struct dpu_format *fmt)
+{
+	uint32_t min_src_size;
+
+	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
+		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+		DPU_DEBUG_PLANE(pdpu,
+				"plane doesn't have scaler/csc for yuv\n");
+		return -EINVAL;
+	}
+
+	/* check src bounds */
+	if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -E2BIG;
+	}
+
+	/* valid yuv image */
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -EINVAL;
+	}
+
+	/* min dst support */
+	if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t min_src_size, max_linewidth;
+	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
@@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
-	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
-
-	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
-		 !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
-		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
-		return -EINVAL;
-
-	/* check src bounds */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
-		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
-		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -E2BIG;
-
-	/* valid yuv image */
-	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
-		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
-		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -EINVAL;
-
-	/* min dst support */
-	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
-		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->dst_rect));
-		return -EINVAL;
-
 	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 		return -E2BIG;
 	}
 
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
+	if (ret)
+		return ret;
+
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-- 
2.39.1

