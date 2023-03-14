Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4926B9987
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8A10E82E;
	Tue, 14 Mar 2023 15:36:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748210EAA7
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b10so16473331ljr.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
 b=TtGRPNrw6Zwf3wfCLxcsiXUwS3op2Cd83HM0p2C9zMCJG9sV1pvbW0pBg29pT3MGN2
 i9dassk1ApnhltvbZ2Vlis3Gr0luWmSC9j/BulPAqYaZFJpKSt0JDmjiYr8RyaBvi3sT
 OreVUyIbSQDjtpXgk4G15tky9JCBjXYaKQt1LfmskGORKshUyYGh4KpCu0D6PpUitGT5
 ifBmAvbRqahPde2/ZIoeKQccdDVEP7/hbXXk8ibIVlvoz24bVU2Lbp1RKcNE5L6RlvpF
 wAPihqFJ04TIxA62vrp6BBcPCKkjcWsmSui789fQbdY3gkoHlA6jwwOpBfR+dTtcS8LX
 /KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=px47uAOQkqAfQG49cyyMWqMkDhV0IAY5Pz0cQj+iwGU=;
 b=jv6a3kXSKEkWAYuWNimTbq5UfWqX7bH5OyzNV6/bNQ+tCyW5kMmlv1M+0CfV1qKOGr
 vsHAFQtw1GFE25r2e7/nlEjKmgg/Y0vn2W5gtEAUZ3V8v6ON6JBs2ZYLNu23QM6nsYWA
 /FqEQ92WSMsO1RoIoAG3djS9+PizpJdA4UEHy3eTNLHze63h5g8ylGh/MMwF+f0gTGgv
 HN6SbQfigbvHhMZURJdc+aOypvIH+vv657hEI/QKwMbtkurvCi+/7H8gx4493RzVmXbK
 qw5Fwyy6flYCpfo3WqP6dZ3abFhWaTZgbSHZOAN4WMKWnVNPs6sVhWAkMrcdlzRf92iB
 MjdA==
X-Gm-Message-State: AO0yUKVINgzhhx9JG6DslQFPywUiIa5LRS6s2irkJp9puCAahSfJgpeq
 UG6tA3+gB1b2Y8M9gt6NcRI9zg==
X-Google-Smtp-Source: AK7set/wNp5wMTbWY1n0W9X9/90hGF4rYjK9WfWxStkhKJbUvEJ/pzE57xzXQQGe7TxGtHRpRj2hpA==
X-Received: by 2002:a05:651c:544:b0:298:4424:aea9 with SMTP id
 q4-20020a05651c054400b002984424aea9mr12748087ljp.21.1678808156878; 
 Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:28 +0300
Message-Id: <20230314153545.3442879-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 15/32] drm/msm/dpu: don't use unsupported
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

