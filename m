Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CFA133C9
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154A10E8DE;
	Thu, 16 Jan 2025 07:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IAw6nEBO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8387410E8C6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2165cb60719so9180145ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012443; x=1737617243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hSkT3PGz+hK4c3uKDJme/xz4DdZfcEa+rPOa/pxcuKw=;
 b=IAw6nEBOf9D2ksT1hTBBWCz0nBA+iGEyS+IYa772PjMCCMcYrwYldSBlBXxkSUj2wg
 c2uB7LnDX9ylFor2rEOdHFZ9jfbZw/QDI+44ZWTbBflIOoybImBa7sSeGwi2dukiCtYw
 ryWVmkQAzIuOglaN30zY4h4yEVDkZwuY57PUFKs0SvGLhrUmeSDI5qilNGavVKOUaS9O
 sLVoFyF7l7Zev9Y2nkd2ZAeOs56iH2hHYsXZcdwi07tRLSPHFGnBMbI6t8S+ZpRReMLo
 dsuoK95L7GqFY4NjJZWQgkahjkBfxVqOIDxp20INp6vqLdm5ejXYGmxS5EDcldLx5Zt+
 Mybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012443; x=1737617243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSkT3PGz+hK4c3uKDJme/xz4DdZfcEa+rPOa/pxcuKw=;
 b=Tf6wsYJOocjvo8dalK2cbmSf4b92yulvn7fTvgbPB31FoTVg8/VlRKUeDBzV2mUKpu
 z2cNa6plyFEmf1034agL7R8w1yb0yWbzAbkZcF6dUk+simSZu8L6I4S+vGC51Ayec8hV
 Tq42mhOvWKqpt4dEGjN9spWMZpfDZBBshmsAEMrs4HRoxdruuzvcb9+aNKaVdzVbJL1/
 hzs/FGA5tYjqme/EKphw/PM73v8XE1fV+S9cDSCmyQoZSwtv+Lq/FpD8CPwpTqlCjlD5
 unOg2IaNnBch+jFXIc2benoEU3jDsblnLUmHSqO9X1ZL3JWwBJr1h7jDk3zN93KXZRS0
 m38g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNU5i/p1nZmpU3NOB2la5xs1ymF2+oCvL2Wm+aT9YDb+oZGgX8IS8eszIck2MjvN5RR27elKQeL5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrxaYo3cBHn1el3y56ttH+hgEd8DUpmUgt+HQsy6jOWk74UJWo
 yFotpJoN9HbqlR+8vTJhNrIx6fpaU9ja1vElPPvH3HA5traQ9doDnrXHU2Tlkdg=
X-Gm-Gg: ASbGncu+2+QbOj3OOa/Q4T7t1zQsinGrjholpGoo/l3BC6uRQzgm6/sjYk7EzojndUt
 ypnSsvlKnDkjGjVstWEkgebl1Ex5TPvDq6jzDY7QBeQqVXOe29pWVmBJUBwISwxwVlqWdVDcFUH
 atlfyWzhaDz4uD9VM4yzfZreFltqyT5wabmTiUBAfrpwEOeP2Yta8DT8uy6d5PYJa42eB5yPS5g
 eEtBAKMrabxNUNjYYWvnUGeuHcWJE4Gizkz5gMDKysodAOjyUSpNw==
X-Google-Smtp-Source: AGHT+IEsv0RALMT8qU04Aegf/K+yluWNQbU4I8oM+Lhga6n65548feoEq3KCkDSaqeMuWwoh4OPOyA==
X-Received: by 2002:a05:6a00:1413:b0:725:b12e:604c with SMTP id
 d2e1a72fcca58-72d21f109eemr1061302b3a.4.1737012443090; 
 Wed, 15 Jan 2025 23:27:23 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:27:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:01 +0800
Subject: [PATCH v4 12/16] drm/msm/dpu: blend pipes per mixer pairs config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4704;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=riXvJCYz3ZHmPNnxEFMshsGfh9DVde6M2D9iSPytzY0=;
 b=N90+eokB1/pHDBh9fjgX2d92pIVhyzJtSySJRwUrRkbmzYWATDHJLeNTJaYbgHelleGAuUAfc
 mBJojSGj0IADfqFey7Oaqj8g0qdjqTM9yBukm8HkEVL1UuEcn8CZEUK
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

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array size
STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 42 +++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799..5ae640da53fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,7 +401,6 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -426,8 +425,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
-		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+	mixer->lm_ctl->ops.update_pending_flush_sspp(mixer->lm_ctl, sspp_idx);
 }
 
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
@@ -442,7 +440,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +461,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + stage * PIPES_PER_STAGE;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[pipe_idx], cstate->num_mixers,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +506,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +519,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +538,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There are 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 5f010d36672cc..64e220987be56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1

