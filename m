Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F904AF82F
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB92610E4DA;
	Wed,  9 Feb 2022 17:25:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E565410E407
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m18so5558295lfq.4
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
 b=u5qfYP9TDVSTY4earvH1yPKWmkiPqVvTc49fKYcLElCuaeeEa5+4i4BeQ5HWjhyK7J
 Dgh+bG0HhXimVWD+hufvDQLsxUG22MPfk4yPF+BtgZFn+EyliSvMaf2cycyH7qNBifVr
 z9phkN3FawAzNkDcpdTkfw6U+ImxQTr1Stfoq6sNPqhgsonNwkVZukcAseHoExVKx3EH
 FjbvEuAD6DdN3yXWtUiFRvhZM6cVnzU0TlvWAw4WRD40gYIOdMRqFHAF8KKeyQdKKdWy
 lyJeWTVbY4Hd9gWNXDaM4wNsg/26xjy2uJvpt3mz1uaMdMsG5kZ9i8DUsuLIV0rkUu/W
 CyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
 b=8DY+FNegsv91Ny8Um/cHapO+CqhjilrwvejMyhk6+q0bZNrMGl7sRlA30sIOxBA2TS
 18Nh8LtdDyVrLJzuMm7xGLA6GF6FPNNdnvH7WslM0qXAzefDwiFPny29jMy1DLXBmeeT
 btrVk71B4jy/FjXlqE4s0WICccArAETd75kNyGkjtoDWrOR0OVe3+4yAnbEt+f0ov35O
 y6Sxl6GbMhRXsVdixqEWDiClNIUVoVxpYOb9wJNCEdZNihJr+7mTKaCSD1AXd2qJk/F5
 RnTOnsXmWC+rrPzNOzBh/fkFtBHZKI7bjE0oIYnqeWyckioJSIHUnV9YToXUEZtRaylt
 eJDQ==
X-Gm-Message-State: AOAM532YSe/k2ac0KUmaDkvVKHL7y925mmMfyv2JNh7YqjkZmkyS7Pfi
 lP6mWlJ0gEwNlomw/K13CWRYtQ==
X-Google-Smtp-Source: ABdhPJzkspnpj0RHn32D7wkua/6ALOhuUR/7ZzYarqohURMzFEL3aURJi+Dzg6eCk+O3QN1IBBJPpg==
X-Received: by 2002:a05:6512:114d:: with SMTP id
 m13mr2197256lfg.450.1644427533287; 
 Wed, 09 Feb 2022 09:25:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:25:07 +0300
Message-Id: <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/25] drm/msm/dpu: inline _dpu_plane_set_scanout
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation to reworking dpu_plane_sspp_atomic_update() inline the
_dpu_plane_set_scanout() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++-------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d029ce806039..3ce7dcc285e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -490,28 +490,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
-	if (ret == -EAGAIN)
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-	else if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &pipe_cfg->layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1074,10 +1052,27 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	bool update_src_addr = true;
+	int ret;
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
+	if (ret == -EAGAIN) {
+		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
+		update_src_addr = false;
+	} else if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		update_src_addr = false;
+	}
+
+	if (update_src_addr &&
+	    pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
+	}
 
 	pstate->pending = true;
 
-- 
2.34.1

