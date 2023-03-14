Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E96B998A
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149410EA9F;
	Tue, 14 Mar 2023 15:36:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4CD10EA9B
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f16so16425753ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ty36EYQivSy5QOOAsCbmesDE/+6+5HX1O/RWf+0CDQ=;
 b=nITvLikkhBe0h6rbWe5FzJd+/VXEpKqautc6HMoD+by1VMEB1A56hMA6h48w504K7O
 X1bzG4f7vnzTekfR5Qf2WHVCGSSY3rmLzGDb9IhrjNgNKD6fkUWm4zMPPPfIkKrIK/yK
 syJBFW/UGsQ65RL615SwCCMZPaHJ/dnH1mgmyTR7csdDsQSFx10qHpULlyFbyUk/fREt
 FFp6ZqNvaMtB8v82azeG8eKGxhQ1cwgidMqM/70sN1LAK5txq3MfFi0NeEVl1PBAHNug
 Gf+dr7ryShaysFdgnzirApxN0lge41XXWXRNc2FpaIo4cXuG2/EGIg91znGEtbH3IYsY
 60qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ty36EYQivSy5QOOAsCbmesDE/+6+5HX1O/RWf+0CDQ=;
 b=W0MUdaZ4Zpi3Gs2HYJWt7ykG8AMdOMuIb8n5KxuSfcQ91hsq2d6cyXWQSyJsO7DL7Z
 eG39nWkN53zRqMtaTIE06ZoWJTT/T+kl1Sus+5SviD8XDLscHY1ZUyMlqWwGlHsi6mfi
 TUzT41qoZ0grmQ8W/PXZcQ/hWqC7yiDLIv6comXpemfXcvWBP2UFuJFRokEOYeQhA04K
 jwkDEmwVnDlQwVr7/VFKZ+ypPzwwYJvgtJHlYEH3wjOPqr6V9n6JEjx2x0JcbdScltEP
 j0b9EPFPEXA/vy9OyjUzyAzG+P5dw8MNG3mjYIIp/yY/3dWMZl538MK63JGHZWJsAwY0
 ldYg==
X-Gm-Message-State: AO0yUKW8rAxHgkRbJ0fmKkxyqcrCMTe8GkBDz9EIk5T7cuhGhif/b+MM
 ldCVFtkZRc+FQ6vKGviuCVAZVg==
X-Google-Smtp-Source: AK7set8mc0PHdKQTBYAN6ivdsGyBJoSy+im7YYFzyyVBOA4E4tIvgMghtzbRRKMHZCbDxbnZtlxm6Q==
X-Received: by 2002:a05:651c:115:b0:294:7427:4ec4 with SMTP id
 a21-20020a05651c011500b0029474274ec4mr11282035ljb.41.1678808158450; 
 Tue, 14 Mar 2023 08:35:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:30 +0300
Message-Id: <20230314153545.3442879-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 17/32] drm/msm/dpu: drop redundant plane dst
 check from dpu_crtc_atomic_check()
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

The helper drm_atomic_helper_check_plane_state() already checks whether
the scaled and clipped plane falls into the CRTC visible region (and
clears plane_state->visible if it doesn't). Drop the redundant check
from dpu_crtc_atomic_check().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 37e6e5750bdd..89d2c4735001 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1157,11 +1157,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
-	struct drm_display_mode *mode;
 
 	int rc = 0;
 
-	struct drm_rect crtc_rect = { 0 };
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	if (!crtc_state->enable || !crtc_state->active) {
@@ -1172,7 +1170,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	mode = &crtc_state->adjusted_mode;
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
@@ -1182,13 +1179,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (cstate->num_mixers)
 		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
 
-	crtc_rect.x2 = mode->hdisplay;
-	crtc_rect.y2 = mode->vdisplay;
-
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
-		struct drm_rect dst, clip = crtc_rect;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1201,15 +1194,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			continue;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
-
-		dst = drm_plane_state_dest(pstate);
-		if (!drm_rect_intersect(&clip, &dst)) {
-			DPU_ERROR("invalid vertical/horizontal destination\n");
-			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
-				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
-				  DRM_RECT_ARG(&dst));
-			return -E2BIG;
-		}
 	}
 
 	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
-- 
2.30.2

