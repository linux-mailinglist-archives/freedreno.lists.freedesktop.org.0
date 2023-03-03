Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B86A97E3
	for <lists+freedreno@lfdr.de>; Fri,  3 Mar 2023 13:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BD910E5F8;
	Fri,  3 Mar 2023 12:57:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AD910E045
 for <freedreno@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:36 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m6so3469075lfq.5
 for <freedreno@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
 b=LF1zNVZaHKLhkXCj0Ra9Y3ZqhtJPt7KYobahj0LMbeH7bYNlmRi/0mmqFnp14PQDNT
 KRM6VPFvNX0yFu4wQW+q2gQZp6jkk78ehyQAsKDXSAKYfUHI6jMDoCBf5PCTmol+CZar
 c8iT12qb+0xqkNFQyUTDdES4Pt/cKEvdjO7SyIcGfQ+KmX90yUteIjtLwrdVBEDQfmRL
 1s/csnrqeopOa2KgxSU+xSpCuArFFkEzd78neyMSXLS9FODLLADj+KdA8ZUiqqaN+bTp
 G8EkcBG8WDf7siPdguhhlNBoAZpK3U9mMm8QIIPI9Kp6+dUzAlqmouSBehPG1W1rVRCT
 SC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
 b=d2W3pRcsz81BjKl+/zDHiQg2esDxpVNDdhBVai1zhseS7xrpldTJYZzbm+7ogG5eYB
 VOe2HXb+xrMhvLK4/RSzHQvLcXZ5h7lXTWPp/AYGkXXYvrneXgquDINlcJ/8k2/Wpzpn
 O1n9XnBXpMEOcklr8EBykF9jCkokck+zJFJdhutBOTPE5IxtBGOeQ1l2mD1ArSirPDg/
 KxuDIJRyigvvppQalyAi9AL4HNBBeYQvdp3VhsQIs9iHS7e/53ssE4eJr3H4fQ89MS4A
 YkW8Z9SeLrlGcHM/tC5zDQpf9elIVAokmh1e4+166wBaMpEih/MPbI44JFZeAiAhPp60
 f9Gg==
X-Gm-Message-State: AO0yUKWH95pK6Gn3WmvAvd38JtcNyPqObxkG5ek3Mel1XK6VxUsbT02F
 JRAnEhtMU4cyAibUq30xPds6pw==
X-Google-Smtp-Source: AK7set8/CWuO+Cf9zlJ6m26qgkTSaGYJgh41e4BTi1ebq5vhMVeg6Uk7j5h5ByLx8wtc9AWh6wBsQw==
X-Received: by 2002:a05:6512:2254:b0:4db:787:e43b with SMTP id
 i20-20020a056512225400b004db0787e43bmr1380899lfu.8.1677848256246; 
 Fri, 03 Mar 2023 04:57:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Mar 2023 14:57:10 +0200
Message-Id: <20230303125725.3695011-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 15/30] drm/msm/dpu: don't use unsupported
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
index c1579d6f5060..0260c4d6ded7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1129,6 +1129,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
@@ -1164,7 +1165,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 		struct drm_rect dst, clip = crtc_rect;
-		int z_pos;
+		int stage;
 
 		if (IS_ERR_OR_NULL(pstate)) {
 			rc = PTR_ERR(pstate);
@@ -1189,17 +1190,16 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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
2.39.2

