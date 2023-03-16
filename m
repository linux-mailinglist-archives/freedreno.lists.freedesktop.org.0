Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C56BD511
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72DB10ED68;
	Thu, 16 Mar 2023 16:17:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C110ED66
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l22so2245215ljc.11
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMxu228UknSnm7hBHXdsSZRYK1JBi7/hMEuzH/oSPi8=;
 b=aLJ46BlgzGvL6ooDZJH8ibqOX5r/YNvyNA9/w7MxoIix0lZbc9aLqLsXfFQUh3MNi6
 vUDsDfPyYaNdeJ0cLhncSvh2GdNCW+1rhcND+wbzLAl4eWyCaHXcf2C1kJ6OLIN7Y9Pf
 D7tc8kY0r9nn9fbkeQnPHGpNF3zsVt/5qWylUsGqo/dwxLtSXVIa24N1CeKQnRZ5zGbo
 z7V+WWsspr2FofOokzHnTlPTtdyvVD251ixOdHOersx9Cr2vqxeIDfxzKiUkHDZCV21h
 PxwWI2xHhSV/9QOlnJWb6zl1VO2TAlCCR9aaC0WL0ipi31m0Y7NHg4aXXLZWFl6VzYCP
 LrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMxu228UknSnm7hBHXdsSZRYK1JBi7/hMEuzH/oSPi8=;
 b=HwPcHAPhvzBtJSnVclAk8gJSQkct0BTAmZYteNO9Gvm95v3EULl5gHXyr2MChsXj1N
 g9E5u7kh+lBAeC5tTmf2tr3Bszul9iT3a+fTjvwCu++fvw6D1sGUTG7/2LXVciB0FHnr
 Wkh82UDjzrpbvo4CxErEtmODYWA5mGz8lpd37WHViuTjHMgLu8AJP7OORWZBrpInWro1
 wS+81LBhFcTLfDHWBXjjeIWM1TI0vemjc2FoeS+AmXHn4OyYP71Bu1CfA09JIIBZQk0u
 ipQ4Est/KzyEnqRL6DCKlajLlqMyx9vqinVFwVMXCqBf67/ETEO8zaOAFu83eZ9hPFQg
 j9jg==
X-Gm-Message-State: AO0yUKU6aQqawGXgCFFnU/Qb8yTInAD6i14NE/qIZzc9UCJVb461paC8
 nYpKHhaB+R1f81HD0SRdaZKsZQ==
X-Google-Smtp-Source: AK7set/SIy0LrEzwkKzeeWrTZXys5+mkGu/qEaEVOgXxaeCw69QIIu+wCMfB/TadRNoktgUIS3QU4g==
X-Received: by 2002:a05:651c:2111:b0:298:6d41:a663 with SMTP id
 a17-20020a05651c211100b002986d41a663mr2798907ljq.23.1678983428466; 
 Thu, 16 Mar 2023 09:17:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:16:36 +0300
Message-Id: <20230316161653.4106395-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 15/32] drm/msm/dpu: don't use unsupported
 blend stages
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

The dpu_crtc_atomic_check() compares blending stage with DPU_STAGE_MAX
(maximum amount of blending stages supported by the driver), however we
should compare it against .max_mixer_blendstages, the maximum blend
stage supported by the mixer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ca7a9f58a97f..3ff9c6018a5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1154,6 +1154,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1189,7 +1190,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1214,17 +1215,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return -E2BIG;
 		}
 
-		z_pos = pstate->normalized_zpos;
-
-		/* verify z_pos setting before using it */
-		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
+		/* verify stage setting before using it */
+		stage = DPU_STAGE_0 + pstate->normalized_zpos;
+		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
 			DPU_ERROR("> %d plane stages assigned\n",
-					DPU_STAGE_MAX - DPU_STAGE_0);
+				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 			return -EINVAL;
 		}
 
-		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
-		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
+		to_dpu_plane_state(pstate)->stage = stage;
+		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
 
 	}
 
-- 
2.30.2

