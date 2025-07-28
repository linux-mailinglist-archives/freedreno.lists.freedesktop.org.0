Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A92B13B2B
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 15:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A044410E161;
	Mon, 28 Jul 2025 13:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k1+a1+1p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EF810E161
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:27 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7682560a2f2so879671b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708527; x=1754313327; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G7QBRDiQ1Py6OddicAjGQQtBPSs4ZG5AJtXQiopnFjQ=;
 b=k1+a1+1pIaPUBEY0KmL45f9ZV4ul3bOEU/ZznUqgnK0NASyYduQvdLC7Q0R2nu1q60
 QVu9daKBstyufA3x8hqQksMso3HYIzvK093+cBYMXg5sxs6oxCEE4oE7vN9zJ8ChQ6p+
 boEyoigMyxy+wxP8yeMXiyMZN3ro1jsJGG2jfd9aUjOTXJmNpvnhQgR8R+Cve44QpRhl
 /IY8FvO8106aBWj7KP19SiPkR93EIS4TDcR0j4EylefRY23HX2449jqcf/rWctqMQznH
 EfgNXYBPiPwU58/abfB3mlWSRHaC4lhFTwlx7uPQdOED8IkX9PuRaKTlzLK3SZWWLO4K
 MXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708527; x=1754313327;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7QBRDiQ1Py6OddicAjGQQtBPSs4ZG5AJtXQiopnFjQ=;
 b=c5Kx9MlDGzFrGcZ0MTlRgCDEjaECYJYKizNmpdcSmhqQxMIq1Uk8gGeoQmLoKjRyl1
 hPS73P0AO34JRG2e9jrCHG75KTknRs8mIeQzixsYqt8/tBcxmfhZu0H7BCsZ1klFRL9w
 f6pogCpb6pQ20ncg5MQ7JLKQtVY0TVwkM0EuzFQb+AdiAPBK3hvGofwaUAmrjFdsWyOn
 7ikWwaYWeQLowhWdrj2OKDfcK3SMlZ0OeipWL8p3Wm7CZSS9eZgrVGak9lWHM/9DYLEq
 u/uvq+y70on9r/s41u2lieJMvjQiy0KRMQ9AJHTJI3mWQ6nUUre/11AtIzcqR/dyD/MP
 gM9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikbvucPHvmNtUEVX0pnQjUY7/QVRfGQlLJWMdBPQhUkB7TLP8TdhnoygX0oCYnlxrgU86Nd/2cGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTsdtPmCotRsw2nN99hH11wGgIeDTFlTOGkr+E5k+ChcHAmphn
 gozhmkKxq5Ek29ySxjOgC5TxfoCqWa/ofz/V0yjsYzXvomDXu0SBkGwT6FNd1Vycg5E=
X-Gm-Gg: ASbGnctSXCIqPf3piSvqiJ6yEZ7J3mCT/eHZ8bk74lgZ56XtkkZ+7y5vd9mwvT+rl9T
 etRtQ7yXmcuvvJYDILGuG/MMOPGBXm70vcJj9jSFN1jmpHZ2JJ/uwEFENllrx67NCUmGsbHa122
 2AQg40x7Wd7lzJnX+ME6UMSaeMgCFZUrHWPjWL6GR8imKo5GuH05tPnuASU3khHIfZdC74PAIZv
 HrgOdXEkukNMyIf3DhhAWaEnwc2O5pktRw5o+k2Csd+CwTWuEKqleda5UF5IToXAJ9uK13gxKbZ
 k9jCOhPX1gnvTuJKvIbbLoKdLsbsCoCDX7uzWe79WDUa06LE7eOz8y98nARd7G34zK1+HJfQyyq
 kzwof8o3ywtnUkLuCPg==
X-Google-Smtp-Source: AGHT+IFqxNffpU/muahhDkPFvU4YD0K+eXdsc094/BrW84xq85Z/xfh0IhbFTvfMd+8QFjaKEG7QcQ==
X-Received: by 2002:a05:6a20:734b:b0:234:efd:9f39 with SMTP id
 adf61e73a8af0-23d6e338bf2mr18092047637.19.1753708526603; 
 Mon, 28 Jul 2025 06:15:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:31 +0800
Subject: [PATCH v13 07/12] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-7-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=6393;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Hb90KUJ17S8+gOgWfDMqgqzT+Roe11thyHVq9dHaPkk=;
 b=jlre35wZZBKs+cuizxCtTr13dH3mbkhJURgFeGc46kgr8nG//J4r2lCGo8Ct+dz0yjvntYgKR
 SFpODTtctRbDM8ghbmmrcoKUBwU7qE7abUCMYwehjFdn0lYgvn+RZmW
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

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 121bd0d304b308bcd7226784eda14d7c7f5a46f4..30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -472,8 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
@@ -1305,7 +1304,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
-#define MAX_CHANNELS_PER_CRTC 2
+#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
@@ -1663,7 +1662,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			seq_printf(s, "\tsspp[%d]:%s\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5e8703b0e2abb89887a5661adb3542a0c10d2b32..55429f29a4b95594771d930efe42aaa4126f6f07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -634,7 +634,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
@@ -1158,7 +1158,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1212,7 +1212,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1345,7 +1345,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1468,7 +1468,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1482,7 +1482,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1501,7 +1501,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1623,7 +1623,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1680,7 +1680,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 007f044499b99ac9c2e4b58e98e6add013a986de..1ef5a041b8acae270826f20ea9553cbfa35a9f82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,8 +31,8 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1

