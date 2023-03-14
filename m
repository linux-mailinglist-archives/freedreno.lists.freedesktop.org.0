Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE16B9985
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46810EA8B;
	Tue, 14 Mar 2023 15:35:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90410EA8A
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16423602lja.12
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ApA2eG25PQK0tDia1yVQJYtoRuIU0jjbmlM672G+C4=;
 b=Vl+MfeEZkDCqU1j2L4hjjJvYgLPnqJKuoilLdcvGeN2Ku920j2T166uyJu7kbxMX9r
 zdeTWmUiH/NsYBR3ONFN/hKy2scMYOGUJPxOkvnXy+CsmEV3qHmStBSJPOiGzkItWgMx
 CHc3TSnI3u0tobbzK2wWVsYwceinMqTozBsv7R8SWfIdgRuiIJ7xSp1CfoWAYAoEuNkp
 wWguH0pVv1/8m51kOYH2wLlCSrzP/qlLmfrs4KSn1/qXApIo0QjaJzp6c0BtTk74KzQQ
 ArrgtbKoehaEqWZpZugkH6TjD0GotOH4Do1tgzJX2HdHgE95ckhDdyEBW9+1mzCkNG7L
 PFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ApA2eG25PQK0tDia1yVQJYtoRuIU0jjbmlM672G+C4=;
 b=ydj7Nwek+pQebbbAYzApTMETHU78d1hDRngYH1j3N+ZsIgXYZcV5VgJJQYXFWR5f0T
 tn8y0X7+e3CH3nwfiWibggC2R7D0so6hVKu4SjbNpYyyjKq5Si/xvrFe1034w/EMTTS7
 +ZPnqIrQofWqQDJrnSW8Ol63w5MkQUMUa0QnX8g1R9A2UjdnCWg60T+a6jUAMC7qmwxV
 ZbhmYt9QuagS1c+YltaDjksjHurxub6Q7U3RJnbWoDnsrlsMA04ay8TC8j8ClJheu2o8
 NRi7VbaueYjt+RFh7g+75TtGOEvFnys+4mYyNVxFbu6wJIOpwM11Ko3vYm8qUdLpS6NS
 kYKw==
X-Gm-Message-State: AO0yUKXNlygr/jQDYtPOWWd6y+V8PSSbY6volHqjc6N8uxxgIbSQU4B3
 wXKeaVwMRGFYI7vQZkJctICvlQ==
X-Google-Smtp-Source: AK7set/JGWvCIT90ZMmsg9Y7cwrGWU03dlZljfWHadKJK8xMLAyS80rJvDiNVTu29AG5clvVJ1TijA==
X-Received: by 2002:a2e:be03:0:b0:298:68d0:e105 with SMTP id
 z3-20020a2ebe03000000b0029868d0e105mr8787905ljq.46.1678808157729; 
 Tue, 14 Mar 2023 08:35:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:29 +0300
Message-Id: <20230314153545.3442879-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 16/32] drm/msm/dpu: move the rest of plane
 checks to dpu_plane_atomic_check()
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

Move plane state updates from dpu_crtc_atomic_check() to the function
where they belong: to dpu_plane_atomic_check().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3ff9c6018a5b..37e6e5750bdd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1154,7 +1154,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
-	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1186,11 +1185,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
 
-	 /* get plane state for all drm planes associated with crtc state */
+	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1204,8 +1202,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
-		dpu_plane_clear_multirect(pstate);
-
 		dst = drm_plane_state_dest(pstate);
 		if (!drm_rect_intersect(&clip, &dst)) {
 			DPU_ERROR("invalid vertical/horizontal destination\n");
@@ -1214,18 +1210,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 				  DRM_RECT_ARG(&dst));
 			return -E2BIG;
 		}
-
-		/* verify stage setting before using it */
-		stage = DPU_STAGE_0 + pstate->normalized_zpos;
-		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
-			DPU_ERROR("> %d plane stages assigned\n",
-				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
-			return -EINVAL;
-		}
-
-		to_dpu_plane_state(pstate)->stage = stage;
-		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
-
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ce01a602cbc9..3fba63fbbd78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	return 0;
 }
 
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
-{
-	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
-
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-}
-
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 {
 	struct dpu_plane_state *pstate[R_MAX];
@@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+		return -EINVAL;
+	}
+
 	src.x1 = new_plane_state->src_x >> 16;
 	src.y1 = new_plane_state->src_y >> 16;
 	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 228db401e905..a08b0539513b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
  */
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
 
-/**
- * dpu_plane_clear_multirect - clear multirect bits for the given pipe
- * @drm_state: Pointer to DRM plane state
- */
-void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
-
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
-- 
2.30.2

