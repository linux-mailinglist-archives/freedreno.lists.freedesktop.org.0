Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A76BD50D
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4668110ED6E;
	Thu, 16 Mar 2023 16:17:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E610E29D
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z42so2236307ljq.13
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QJD67Z+Qk5ayDzJb23oG+yPox8sjac90az/DJ+fvwE=;
 b=sUhQUVRlZPuEgj2PF2jDpKpfFFhU/WMf+tl3wkWEYiBKTmXgMOJFcKWc12/upFLP9N
 +N49yp8fskCVHLkSHhgYDFegEnE3PFmwvXJfK+aOTxFgJeJagncmu00uIwXQp9BUsJds
 UmpF/c/QoiozveTJ+EvdPhQwADZn+oJtSff0mMos3JLDWR00xVRylS3ZcF5YHJWc4EaH
 aH1kHyV4JdO/yVt0MV+qxDd7Eu1M9SzLA/to4QsVktMP/SDGKPUcLZNS3/IPienGjDMg
 MUmWfVc5mSx8QDGr7KsNzbI29mPWZJBgcDqW+j+g8E6dZ1b5D5veSbajoOQ7FwtbkB+N
 H1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QJD67Z+Qk5ayDzJb23oG+yPox8sjac90az/DJ+fvwE=;
 b=xHlBEIXK74gL/NnKbaK5EDvTQa87Ox/9tThCDBl2C/Suq2wqjgUE0Uyv9aC8CYoyOm
 svnYBNx0rdffsLxOps4J6/A9wgy5azrt3CzoZIwgO5/Kox+4PIpLK79BOgqgcg2VR2nV
 hsnin2WYtxqiJAW8jWw9AvwoEmsdUzBW1wV0sWcDuh9zfS1lW8IATu+xZ4Lb8Go0m1sb
 XzAjuQJVwpUNcp1kWKrRxy/Y5ocxoDXuRkEyuzG2T8nvQOJbIJ0JUyo/yirGqhF3/S7d
 paY/+MUj6/q5Y2B0aEv7P31EFBLA6qgu2gkFZvlk7A/uIrO9bsGyE5qrmKUh7kJ9dOSU
 J6NA==
X-Gm-Message-State: AO0yUKU8uFM3XYzvpKJYisHREGeYL6ve0ML+ovZIjA6NWVV8/fToUS/1
 58gdDIPrgbqSiPWMxw0GcutE9w==
X-Google-Smtp-Source: AK7set/w+u9W/lHOCRi8Na0C5iXnFASX41Axa7SHVRi9ErOI6bMmyLtEhRJff4Nppd3gvlKwC54nUw==
X-Received: by 2002:a2e:9b9a:0:b0:299:c2ea:6a52 with SMTP id
 z26-20020a2e9b9a000000b00299c2ea6a52mr399871lji.27.1678983430296; 
 Thu, 16 Mar 2023 09:17:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:16:38 +0300
Message-Id: <20230316161653.4106395-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 17/32] drm/msm/dpu: drop redundant plane dst
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
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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

