Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEF41DBC8
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 16:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE76EC06;
	Thu, 30 Sep 2021 14:00:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF986EBA8
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g41so25746910lfv.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6k7szBFo3j8aTdpEXsB/ZpCD/JR4bHzUrZ/Dsq5ntZM=;
 b=iQRW3OwRFBL76Hi+dUDeR4Z3cFvAVw5UYwYiX6uQc4CdHc6r6aInykS5+fR42TKRXp
 qJ/3EYgSTa28EZbDHKdwJnlJeuJwdhoRQ95mAVquu/srZ8hR6qv4KexshSwA11kdrzgL
 Cs8xq7H1FynLA0pCaiV6fNi+yGNcdnAjNI+6ZU6ZX8Woc4fkMzMgwbUTfe3l+bOSaqpA
 GM35cqWzvIFa4DmfPS3kYYL2UtjGXJ7ajq4Cp8y10r+kUaveXYpWrPcHUYHE7+ALeWuh
 lhoUZqklmzMOZ6lw+O9I5ztRODYFe5EkKPSacQxXEPHOgDI7u+/0oRb7N86oWzzJ5msr
 JavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6k7szBFo3j8aTdpEXsB/ZpCD/JR4bHzUrZ/Dsq5ntZM=;
 b=VNvs5oAW5+MX4YR8xgd1bsTeXDqbrcfs/ltHegS3Uqcjcx163jj9G1fs3MUPk5KglV
 kpnqi/74itzojM3P67zF6UhxwWJNW0NV2ryKX64JjyFV1mtj3QEONtkpH0smr2zYiBFY
 0OXOGviYNjR/PBX6D0bspAzYnuzaGEIaps+Y3Wz9mWuQ4uacYryGvmjRInoM9zOjaPJp
 CVzbpYSl4gySX/3KAQKFqj9QuZaSK8krXtmznlse1FkKIcMIXBf1or6vnqu8kT3EeY0E
 yljtVDqvGk0RYnlCZrnlLbF7Kg8YEso7yvyjHon3a12nqhz2OjKYIYA9lyHoncuKIj3P
 RxCA==
X-Gm-Message-State: AOAM532TY1LAARC954nAbzw3tRzBb2elXKsBP9v69HG3xeNKWivm91HR
 cEJfR3S5QxmJvVpEhNRQJanaDQ==
X-Google-Smtp-Source: ABdhPJxqdY0zyox3O0A3C2lcMQwoia0Ugdy97gCXDuUYFdDzoqXBScIuF7E1IO+f+xMn27p/YsYm7w==
X-Received: by 2002:a2e:6f1b:: with SMTP id k27mr5994686ljc.117.1633010425390; 
 Thu, 30 Sep 2021 07:00:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu, 30 Sep 2021 16:59:57 +0300
Message-Id: <20210930140002.308628-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 06/11] drm/msm/dpu: drop scaler config from
 plane state
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

Scaler and pixel_ext configuration does not contain a long living state,
it is used only during plane update, so remove these two fiels from
dpu_plane_state and allocate them on stack.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 59 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ---
 2 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5288b5b824f8..4259c4ecde9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -542,14 +542,12 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
+		struct dpu_hw_pixel_ext *pixel_ext,
 		const struct dpu_format *fmt,
 		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
 {
 	uint32_t i;
 
-	memset(scale_cfg, 0, sizeof(*scale_cfg));
-	memset(&pstate->pixel_ext, 0, sizeof(struct dpu_hw_pixel_ext));
-
 	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
 		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
 	scale_cfg->phase_step_y[DPU_SSPP_COMP_0] =
@@ -588,9 +586,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
 		}
 
-		pstate->pixel_ext.num_ext_pxls_top[i] =
+		pixel_ext->num_ext_pxls_top[i] =
 			scale_cfg->src_height[i];
-		pstate->pixel_ext.num_ext_pxls_left[i] =
+		pixel_ext->num_ext_pxls_left[i] =
 			scale_cfg->src_width[i];
 	}
 	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
@@ -660,6 +658,11 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
+	struct dpu_hw_scaler3_cfg scaler3_cfg;
+	struct dpu_hw_pixel_ext pixel_ext;
+
+	memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
+	memset(&pixel_ext, 0, sizeof(pixel_ext));
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
@@ -668,8 +671,23 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg->src_rect),
 			drm_rect_width(&pipe_cfg->dst_rect),
 			drm_rect_height(&pipe_cfg->dst_rect),
-			&pstate->scaler3_cfg, fmt,
+			&scaler3_cfg, &pixel_ext, fmt,
 			info->hsub, info->vsub);
+
+	if (pdpu->pipe_hw->ops.setup_pe)
+		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
+				&pixel_ext);
+
+	/**
+	 * when programmed in multirect mode, scalar block will be
+	 * bypassed. Still we need to update alpha and bitwidth
+	 * ONLY for RECT0
+	 */
+	if (pdpu->pipe_hw->ops.setup_scaler &&
+			pstate->multirect_index != DPU_SSPP_RECT_1)
+		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
+				pipe_cfg, &pixel_ext,
+				&scaler3_cfg);
 }
 
 /**
@@ -710,7 +728,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_width(&pipe_cfg.dst_rect);
 		pipe_cfg.src_rect.y2 =
 			drm_rect_height(&pipe_cfg.dst_rect);
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 
 		if (pdpu->pipe_hw->ops.setup_format)
 			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
@@ -722,15 +739,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 					&pipe_cfg,
 					pstate->multirect_index);
 
-		if (pdpu->pipe_hw->ops.setup_pe)
-			pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
-					&pstate->pixel_ext);
-
-		if (pdpu->pipe_hw->ops.setup_scaler &&
-				pstate->multirect_index != DPU_SSPP_RECT_1)
-			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-					&pipe_cfg, &pstate->pixel_ext,
-					&pstate->scaler3_cfg);
+		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
 	}
 
 	return 0;
@@ -1122,8 +1131,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1136,21 +1143,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 	}
 
-	if (pdpu->pipe_hw->ops.setup_pe &&
-			(pstate->multirect_index != DPU_SSPP_RECT_1))
-		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
-				&pstate->pixel_ext);
-
-	/**
-	 * when programmed in multirect mode, scalar block will be
-	 * bypassed. Still we need to update alpha and bitwidth
-	 * ONLY for RECT0
-	 */
-	if (pdpu->pipe_hw->ops.setup_scaler &&
-			pstate->multirect_index != DPU_SSPP_RECT_1)
-		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				&pipe_cfg, &pstate->pixel_ext,
-				&pstate->scaler3_cfg);
+	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
 
 	if (pdpu->pipe_hw->ops.setup_multirect)
 		pdpu->pipe_hw->ops.setup_multirect(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 34e03ac05f4a..087194be3c22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,8 +23,6 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
- * @scaler3_cfg: configuration data for scaler3
- * @pixel_ext: configuration data for pixel extensions
  * @cdp_cfg:	CDP configuration
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
@@ -38,10 +36,6 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
-	/* scaler configuration */
-	struct dpu_hw_scaler3_cfg scaler3_cfg;
-	struct dpu_hw_pixel_ext pixel_ext;
-
 	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.33.0

