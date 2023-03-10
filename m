Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E96B3335
	for <lists+freedreno@lfdr.de>; Fri, 10 Mar 2023 01:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED40110E91F;
	Fri, 10 Mar 2023 00:57:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD910E91B
 for <freedreno@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r27so4588513lfe.10
 for <freedreno@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
 b=h7clikgF0RXkODZNzHz1hMVISn9JW0FnPnvLgsB4jlNE0fwtytpQQjCMu9A5F+nRf4
 wbLiIlUwJBFzPSEFqTA2wjXbamdEO+UTj9z4ho0cFDrzsHkFz2eM6/hjUBLvOZamatws
 mnSMULAqEN4Bx8f5s6+xyctyFY3kCcEt3thWwEPQuf8jQTnETOEN29G6Mwb/kyyErHkh
 q6BbzKrz64zW4YRKhwQ4zWA1XtpIDkLl0qP9d7nWJPRbh7+aDUyTjI3wv22s1t0TfU15
 E+ZhB1PzWqrsv/zQT31IOOA5LgxlGB6yDIILiZHmNbNH1mX+dfUafbZ309jjsTNKiXba
 uXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEAIHuUQdGe9FEucwOtRTiTV00TrrhD3yB1aXPp2/rA=;
 b=7myK8Usandffp4MSGJEET4iNc7FkcyN9/a+83sSrAWoQjfqhU5nFWGWbNaZS2CHA1G
 JFTjl1BCZ4FFzjVvO9piGm88IhtmbP9LLSgG+cv+3S63+yvBoRQyffb6LRsV5cADnw+J
 bWE2z4TZxKpPwFkOjFN+g6x3PJjps6RgcpGQjctBIwbq23ZzdF0LjnxroFRsJKUdBN7I
 V+z+uM6Yu9wsqgtGbPmxR7qxOaEavyLD4pWNWgTomc3nh5qNsQBwTLRbcHWyOkJl99x0
 87nH9zolyEy/eEeDz/nG/qFLow3jSUyWTPjAYtlKs2Nhz47zhwECfvZdAJqGrhfRR1/g
 QKJQ==
X-Gm-Message-State: AO0yUKWbA5bmJZcLxNlPPZItx466FZSKx5QyimFquhcfP62iV+Z52f+w
 rVqJ4AI/lX97i5ZGKeK9mtoBdA==
X-Google-Smtp-Source: AK7set8I/eZYUGBKl6TftSAhkKytjV3vLBKBs19ZG9SyOMXVqE3+yTERgW5jfIAcsONux/n/NmTjvw==
X-Received: by 2002:ac2:55a9:0:b0:4dd:9f4d:7459 with SMTP id
 y9-20020ac255a9000000b004dd9f4d7459mr6761930lfg.67.1678409839504; 
 Thu, 09 Mar 2023 16:57:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 10 Mar 2023 02:56:47 +0200
Message-Id: <20230310005704.1332368-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 15/32] drm/msm/dpu: don't use unsupported
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

