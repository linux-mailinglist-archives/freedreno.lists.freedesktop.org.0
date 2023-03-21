Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3096C2740
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 02:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40110E6BA;
	Tue, 21 Mar 2023 01:18:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0CB10E6BA
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id br6so17202280lfb.11
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AO0YidYDM8F1eGPL01UHbctQjBQAkvqmazA7viDAZgc=;
 b=gCwlW0O/+LJgEGdnKaEIBKKhSX273E+APoYqgC3qYRxG6+QlDyVnm6wjN+XMht/wqE
 5FQNO0gddj3dRYMlE1k1OvYqDOzmKFMAcGrUBgJOQ4eCG4yXcirynZSwSvZmZ8lOp/5N
 iaw+EG6sRhz6tfc7EidMixBFfe0bwjn+QLZqL4V4iDvMor31NvWthkmL1BCTefKVkLSq
 XQI2aEquAI1iNxKSou6x7FvxXNgWWvDpuTJR+ehTskHJ4c0LjYAKPSWQW602YQxWq8Mb
 bb1O0rqCLFbFfSNkCBrVh7mRL7qetN9GK5DqqGPGMz6ofVLwQSD4gYhX6k4uxMucZuxs
 By/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AO0YidYDM8F1eGPL01UHbctQjBQAkvqmazA7viDAZgc=;
 b=Oi7dsxqkjz9GCaJd46b5UsnywaRJCqbTkiyJqBTeIxLwcAQLgGjWKYCAcWznyq8oez
 xDj+AJOM8nfWhY/60kSm61vFgDZ1WAXxj/N4aZ5o/Y7wbfuVfetPOvsowHit1dSYHpQ6
 zSxFRTT6hiLZACjIL48LqguRb3t18hUa3ExfFDu7Yq7PY5+ElI9Al/fKDqDH+v8PIlhp
 T3CFFvpq0Oqp6uCJDOXKcS8U9Iw62FgcUNqZPPDLDzmEAtpbvIDUeNFJ/zYJ1wVCFTBR
 pPAryABo11bh5WAJvDg677yTQDOkDS8/9+rc/NfiCSkxbwC8PjXG06UqVQFTdvy2bK1b
 L11w==
X-Gm-Message-State: AO0yUKXtFHDM3mXPlWdq1lSBMHMvV3K3RYJzKXrBgVoWDLxV7cEa5SJ0
 OEe5WAvf+KTq7QDY1oNAg13rsQ==
X-Google-Smtp-Source: AK7set+5CSW0qRSEuOIp3ACJDnW4akzdN4qZrHAiF6T8Kx5x/0FZNy13nUC1QxUyBebfoRKkMRMlRw==
X-Received: by 2002:ac2:5394:0:b0:4a4:68b9:66f3 with SMTP id
 g20-20020ac25394000000b004a468b966f3mr279649lfh.62.1679361509357; 
 Mon, 20 Mar 2023 18:18:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Mar 2023 04:18:17 +0300
Message-Id: <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
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

In preparation to virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d43e04fc4578..cf17075676d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -845,6 +845,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
@@ -855,13 +856,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	pipe_hw_caps = pstate->pipe.sspp->cap;
+	sblk = pstate->pipe.sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -878,7 +885,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1374,7 +1380,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1396,16 +1401,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
-- 
2.30.2

