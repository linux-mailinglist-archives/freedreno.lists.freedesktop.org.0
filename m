Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000406B999E
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24F10EAAB;
	Tue, 14 Mar 2023 15:36:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C004310EA86
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j11so20520159lfg.13
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zGkIqrqqIJ8m9Y+BovwTOzYgWB29CBrsS2dtQdDCMs=;
 b=hbDznNwcrt4BbSF22vMGwwfGhhzVLBQ7bcbBws3CltloXoPLtUZGlaWGrJcvKzOINI
 E11rHWlyYCGOpKbkWadBxERx/FeUSptggjguWlPO2clINA9zOfGeuP/cN3FyfeNj4ylM
 UkG5ZTGZFbR7weS6ZxS3gKUnaJbyxFwL0VUwda68WS2BHnT4FauPrl8++Lnki2tE0hgD
 szqDJzuRNLXzNllVbOtHNAzmP41eda3uJoTbLk9xUcbrftJhJXwRUzZjMzhXxDbuYGBp
 YoOoKgTW5fh1rq2mWF+ESHw+hWAsoDn8HgDOrrKcJgnKTBfQaFBfKrCeYmP1R48wKGhw
 4Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zGkIqrqqIJ8m9Y+BovwTOzYgWB29CBrsS2dtQdDCMs=;
 b=RqoQRKcbTLGo63v623O4NSed3Ji4ZSB4kTviXInLTm7glK6ak0lgFC2wW/7taYZbXY
 1xY9OTdC3FxdYOiARGl8sb+KMAX0v7vBJtY5Yyuu6Oi1RI6YsNUy2Ha97Td6cC58HIr8
 YyRQRMGuZWJzLlxivXijw2yOYAWJ3eSj1qI0gu+5b+OW8CVOAr7WQed/jq1uqqYiEx6k
 J6ksm6kqiF1VBrwWdsB/GxgorkDCPVWV9LTzopXKro7fNuS1eij1bR1HfhyBo4WLNu17
 NahrvJWuKHm+Mwg2mziKcHonMAMiEpp0U6m+ChBcAj/pjgjIaYzu/HzT7HOYl3LkizDB
 wMdg==
X-Gm-Message-State: AO0yUKVIsmN7ZycsOBFS/Czaxd8cAHuDC2qvWG52T/bCfXUIjBR90Z0m
 /3OKUQ10zBxgJ3qKJYCL7JQzINXrQFQVqTNp0CM=
X-Google-Smtp-Source: AK7set96dVUdTdmi77Pd/aAMT4LPdILbP6bK4E9HNNnG4JCRcNEiADGFasrdXVOqcQ9hoGBG5qxOZg==
X-Received: by 2002:ac2:5e89:0:b0:4dc:8297:1b18 with SMTP id
 b9-20020ac25e89000000b004dc82971b18mr848533lfq.67.1678808164145; 
 Tue, 14 Mar 2023 08:36:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:36:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:38 +0300
Message-Id: <20230314153545.3442879-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 25/32] drm/msm/dpu: rework static color fill
 code
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

Rework static color fill code to separate the pipe / pipe_cfg handling.
This is a preparation for the r_pipe support.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 69 +++++++++++++----------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6031d270992f..f52120b05b6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -640,20 +640,52 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 				fmt);
 }
 
+static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
+				       struct dpu_sw_pipe *pipe,
+				       struct drm_rect *dst_rect,
+				       u32 fill_color,
+				       const struct dpu_format *fmt)
+{
+	struct dpu_sw_pipe_cfg pipe_cfg;
+
+	/* update sspp */
+	if (!pipe->sspp->ops.setup_solidfill)
+		return;
+
+	pipe->sspp->ops.setup_solidfill(pipe, fill_color);
+
+	/* override scaler/decimation if solid fill */
+	pipe_cfg.dst_rect = *dst_rect;
+
+	pipe_cfg.src_rect.x1 = 0;
+	pipe_cfg.src_rect.y1 = 0;
+	pipe_cfg.src_rect.x2 =
+		drm_rect_width(&pipe_cfg.dst_rect);
+	pipe_cfg.src_rect.y2 =
+		drm_rect_height(&pipe_cfg.dst_rect);
+
+	if (pipe->sspp->ops.setup_format)
+		pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
+
+	if (pipe->sspp->ops.setup_rects)
+		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
+
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
  * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
  * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
- * Returns: 0 on success
  */
-static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
+static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		uint32_t color, uint32_t alpha)
 {
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_sw_pipe_cfg pipe_cfg;
+	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -662,34 +694,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * h/w only supports RGB variants
 	 */
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	/* should not happen ever */
+	if (!fmt)
+		return;
 
 	/* update sspp */
-	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
-
-		/* override scaler/decimation if solid fill */
-		pipe_cfg.dst_rect = pstate->base.dst;
-
-		pipe_cfg.src_rect.x1 = 0;
-		pipe_cfg.src_rect.y1 = 0;
-		pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pipe_cfg.dst_rect);
-		pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pipe_cfg.dst_rect);
-
-		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
-					fmt, DPU_SSPP_SOLID_FILL);
-
-		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
-					&pipe_cfg);
-
-		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
-	}
-
-	return 0;
+	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
+				   fill_color, fmt);
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
-- 
2.30.2

