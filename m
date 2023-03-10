Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD706B3350
	for <lists+freedreno@lfdr.de>; Fri, 10 Mar 2023 01:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365CD10E949;
	Fri, 10 Mar 2023 00:57:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2770F10E931
 for <freedreno@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d36so4607882lfv.8
 for <freedreno@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuMEa7JmxGfzSNw5Cy7S7gwKFWQp8WlWdvJ9mKz0WfA=;
 b=UVKhlTx07yJ7KEg7CDRa6/7gXoHC9rCDTrV+9dQ1Bu8l9PVVuXkqffee6ciQ9m8i+b
 2glEYi6XklcLF42R6c3F/6zFldiljlBCkXM3DwZHARJXy5thtppVzS8RyBBPYA1Wp4QX
 LkjEZnK4I0R/ok0buxV5sOXXM4AjynWI5erLrg+ygy/cxirnp0MBNmJS1h1WeIXjfV8o
 ETjwD5FYhxFVL4ZaR8InLjVAy6DYxtt9y7zYQBbfdJm1H/bIgRLHrQEqoT9sdRySHmMX
 hu45o3gSVpxuIavAub0xOoRL45T+ds0LtfiVhkc9+Jc/yf5C94s9Ur53k7GK+Oak06/D
 IpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HuMEa7JmxGfzSNw5Cy7S7gwKFWQp8WlWdvJ9mKz0WfA=;
 b=NbQKaL9G2IWVTuqNdYMhx6BEtkTWrtScnSzE2BWNhIF3HiUFUyGFg6dZoj+DR5+dk/
 busru5+Ja9Mqi4vYeZ65HigVxJm+XDucMqjWcqv3xzy79Utu6CuiIBrGUWkE/y5TiR7O
 PDyRbu9iqfkyqQHfAnu09bvB01s18Mrnk+dkhSPaFYVoVb3dACaLfyJCWa1MG+hZThVx
 rXVU+KgiVTdcRB4EHsw/BL6MP8z51QBo6BBjVnqJB2fiui3OuTm3D3n4Djna7/IjI18c
 BNSppQP728GZPOkz+mPaHKb3h0+eOLYv2EVgYZydWPQ2nrUqClfb2eLJJtolIngIO6CY
 bzwA==
X-Gm-Message-State: AO0yUKUgoOIcgslrGNznNTYsVQxohPFBVrI9byIDTYUrmGwNEZ9URWRc
 jajpErlle0kZWzzdbmHeAvSVhQ==
X-Google-Smtp-Source: AK7set+/+2MRo2TR+T2n49fGLNTZjzmHx4dEpIjWGGX+ElGr+a3DFzqu6l9Zq4VRM2jlv0iwsiSf1A==
X-Received: by 2002:ac2:46e5:0:b0:4dd:a7bc:58e2 with SMTP id
 q5-20020ac246e5000000b004dda7bc58e2mr6366157lfo.41.1678409849680; 
 Thu, 09 Mar 2023 16:57:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 10 Mar 2023 02:56:58 +0200
Message-Id: <20230310005704.1332368-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 26/32] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
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

Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
separate functon. This is a preparation for the r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 79 +++++++++++++++---------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 73e1a8c69ef0..e651e4593280 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -400,6 +400,46 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 	}
 }
 
+static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
+				       struct drm_plane *plane,
+				       struct dpu_crtc_mixer *mixer,
+				       u32 num_mixers,
+				       enum dpu_stage stage,
+				       struct dpu_format *format,
+				       uint64_t modifier,
+				       struct dpu_sw_pipe *pipe,
+				       unsigned int stage_idx,
+				       struct dpu_hw_stage_cfg *stage_cfg
+				      )
+{
+	uint32_t lm_idx;
+	enum dpu_sspp sspp_idx;
+	struct drm_plane_state *state;
+
+	sspp_idx = pipe->sspp->idx;
+
+	state = plane->state;
+
+	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
+				   state, to_dpu_plane_state(state), stage_idx,
+				   format->base.pixel_format,
+				   modifier);
+
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+			 crtc->base.id,
+			 stage,
+			 plane->base.id,
+			 sspp_idx - SSPP_NONE,
+			 state->fb ? state->fb->base.id : -1);
+
+	stage_cfg->stage[stage][stage_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
+
+	/* blend config update */
+	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -412,15 +452,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t stage_idx, lm_idx;
-	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
+	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		enum dpu_sspp sspp_idx;
-
 		state = plane->state;
 		if (!state)
 			continue;
@@ -431,39 +468,21 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = pstate->pipe.sspp->idx;
-		set_bit(sspp_idx, fetch_active);
-
-		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
-				crtc->base.id,
-				pstate->stage,
-				plane->base.id,
-				sspp_idx - SSPP_VIG0,
-				state->fb ? state->fb->base.id : -1);
-
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		stage_idx = zpos_cnt[pstate->stage]++;
-		stage_cfg->stage[pstate->stage][stage_idx] =
-					sspp_idx;
-		stage_cfg->multirect_index[pstate->stage][stage_idx] =
-					pstate->pipe.multirect_index;
-
-		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-					   state, pstate, stage_idx,
-					   format->base.pixel_format,
-					   fb ? fb->modifier : 0);
+		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		_dpu_crtc_blend_setup_pipe(crtc, plane,
+					   mixer, cstate->num_mixers,
+					   pstate->stage,
+					   format, fb ? fb->modifier : 0,
+					   &pstate->pipe, 0, stage_cfg);
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
-						pstate, format);
-
-			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
-									    sspp_idx);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
@@ -1297,6 +1316,8 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
+		seq_printf(s, "\tsspp:%s\n",
+			   pstate->pipe.sspp->cap->name);
 		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
 
-- 
2.39.2

