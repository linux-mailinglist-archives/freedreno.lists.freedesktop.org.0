Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90F41DBC4
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 16:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8A6EC02;
	Thu, 30 Sep 2021 14:00:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3ED6EBAC
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:34 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y26so25739542lfa.11
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8VFiMaw/E7ZxLbSKWJNqx7JXJFevPLqAT9XC+qZX/M=;
 b=XRuUHdXCcPCZ31nfxTJEdDWUqsG94tWf5gHM+hYAKNvCVjNm6vpUXYv/YC7ZHwsVZO
 syFCxIojZo3abxSfywZCM2ErvAEZD6oi3DKJBMOgfVOfsC+n5QlhEXVdhxPjj1Yccmvd
 vdVlDiqzQrCkv/ToVSNbFEs9a5UMiOeoixg0MFsTfqJdbumbrg6iFS45ccVusyhsF3lf
 mTJ8Y75uWkhO+iN04eoScym/DupoWqphY0hpQzWGUpN5CxrGA4S4JAr6hkGjeG1P6PzN
 9dIPH6qwWqcFH3t3tSTKdy6FlB52QSU2VcA8LYgZ0phfFOUKxLK2MZWuhWTvBb1qcGHy
 2GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8VFiMaw/E7ZxLbSKWJNqx7JXJFevPLqAT9XC+qZX/M=;
 b=7jidWJsHMEbTJfZJ3JZfb09E0nulsffE88RK8ReTwDUOEiizMuz6/Uk2FzUgwxOjoA
 iL49d44eIAPLoDKsv6ljeEsapt/5FQsubsmvkjsjx5TV1Un2Rev2SZoDaxRHhcv6Nu0H
 zP2SmdMVWSu1Z4o5yWXdz4udEQva+YJ/o1VDrYlpYxgaj1mjfsobtNeSQ1p4lnB9p3vO
 U/PN3ShKzHeRxLML5PEstGURSV+HFwZqrG2ncMsH8EcmWO3hoDHujDrChplO1FV6n7Rc
 Tf8Fo3GRN90XYJDZcMfjWoq90j+w2ZqAiQi4iztUbPErX38yUza3K4GYEJnSJty65Gtq
 N/Eg==
X-Gm-Message-State: AOAM532/eEGz/ZZbH5cwA/g1FQTUaCyfQQTQP2RtEhoOKJcuMnpZ2oWs
 OSoZZ6Q915uUtJ471ecIuwVTKg==
X-Google-Smtp-Source: ABdhPJw6dfFXdeXo/uMfW9AsWXcpNcAm91wNAr2TQcJw1gtsUJ8+fgztk0Jo/clZHwsEgo+uN+bfkQ==
X-Received: by 2002:a2e:2f02:: with SMTP id v2mr5985435ljv.46.1633010428781;
 Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu, 30 Sep 2021 17:00:01 +0300
Message-Id: <20210930140002.308628-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/11] drm/msm/dpu: don't cache pipe->cap->sblk
 in dpu_plane
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

Do not cache hw_pipe's sblk in dpu_plane. Use
pdpu->pipe_hw->cap->sblk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 ++++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af403c0d3d7d..d8018e664925 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -109,8 +109,6 @@ struct dpu_plane {
 	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
 
-	const struct dpu_sspp_sub_blks *pipe_sblk;
-
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
@@ -425,9 +423,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_sblk->danger_vblank;
+				pdpu->pipe_hw->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -982,10 +980,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
+	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_sblk->maxdwnscale << 16,
+						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -1611,20 +1609,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	/* cache features mask for later */
-	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
-	if (!pdpu->pipe_sblk) {
-		DPU_ERROR("[%u]invalid sblk\n", pipe);
-		goto clean_sspp;
-	}
-
 	if (pdpu->is_virtual) {
-		format_list = pdpu->pipe_sblk->virt_format_list;
-		num_formats = pdpu->pipe_sblk->virt_num_formats;
+		format_list = pdpu->pipe_hw->cap->sblk->virt_format_list;
+		num_formats = pdpu->pipe_hw->cap->sblk->virt_num_formats;
 	}
 	else {
-		format_list = pdpu->pipe_sblk->format_list;
-		num_formats = pdpu->pipe_sblk->num_formats;
+		format_list = pdpu->pipe_hw->cap->sblk->format_list;
+		num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
 	}
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
-- 
2.33.0

