Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E340841DBD0
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 16:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6976EBFD;
	Thu, 30 Sep 2021 14:00:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A546EBA1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m3so25392900lfu.2
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gL53R+XdMCTb/eRhUK3++4AIECbyYkUaMebTCoLD6nQ=;
 b=J6jzfV3mAuA8nc0fewfvt6KLGVXlOEyRqkQwYLopC7172HNq6KB6hmsKLFke1Cp21x
 zGrLYxD/1J9R8HXUfRVPbghVaGlvriFle0634k4b4DvAi5+BvEWCopwlWiZgGqBCW0/n
 2UhRdV1yUWQGvghdhHVJ3gEwXkJehXNc19RxCEeXTnl/T//JYwSvw/iD/mhnPBdjGcsi
 bPlTwIDmHF0CyXY5WbQIIEmCW09zRWWAFazmjWfexvJUpRebdymAPvhebYSi1EhCiFnR
 D6nWS4snul0Fbs25tQMHkUxfl9fffsrPmW/AL1fClcWbp22PYumQz55HGSN2hH1lnKZu
 h8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gL53R+XdMCTb/eRhUK3++4AIECbyYkUaMebTCoLD6nQ=;
 b=inShJ7QYFPjdTsgfsAZQmqmQJ87v0LSzaKuWS0kvqemzYjtfgGZmv7jgmZdphojDI3
 /USDqCUxRL3/y/XaQKER/mT615PFfeS+JL/rTkzJ++7aQcpSlnRWUuMVDtLkQaf5xISp
 ux0jEm6ZTzohjO5ehNE8VywV8vcIF9ghglqa9ruo9fOoZiNcvXJ4foA/ummj94sSYPo9
 QsycQHaT7SEAhMdf8xwOopf7EUHLSMdWKjaqIUGQgtq2UAC/hlaa38z7+T8nuDl2ACFO
 z32cV1E8RxVKZ82Op7Et3UmcL9TK+yK8TSfK8tL/vQUQG0kEUcTv8dQH7XyPLZ6zSswh
 rodw==
X-Gm-Message-State: AOAM533oSgUa4w4L0a5HrUU94JPK3lkldWM+brHeD+NxhXpG29tq0COQ
 aEbHkAPum1SDanYJPYoaxc8hdQ==
X-Google-Smtp-Source: ABdhPJyFPfkn+twETssQFXkBw8VaStg+qrDcC4ozmbl5fJDs9pwQPV9i9y2HNG88gQvSUoRa2aQPoA==
X-Received: by 2002:a05:6512:513:: with SMTP id
 o19mr6201016lfb.31.1633010421577; 
 Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu, 30 Sep 2021 16:59:53 +0300
Message-Id: <20210930140002.308628-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/11] drm/msm/dpu: remove pipe_qos_cfg from
 struct dpu_plane
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

The pipe_qos_cfg is used only in _dpu_plane_set_qos_ctrl(), so remove it
from the dpu_plane struct and allocate it on stack when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5e0d06f26e53..88d726133b8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -105,7 +105,6 @@ struct dpu_plane {
 
 	struct dpu_hw_pipe *pipe_hw;
 	struct dpu_hw_pipe_cfg pipe_cfg;
-	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -422,38 +421,41 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
+
+	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pdpu->pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
-		pdpu->pipe_qos_cfg.danger_vblank =
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.danger_vblank =
 				pdpu->pipe_sblk->danger_vblank;
-		pdpu->pipe_qos_cfg.vblank_en = enable;
+		pipe_qos_cfg.vblank_en = enable;
 	}
 
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
 		/* this feature overrules previous VBLANK_CTRL */
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
 
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
-		pdpu->pipe_qos_cfg.danger_safe_en = enable;
+		pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe) {
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.danger_safe_en = false;
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.danger_safe_en = false;
 	}
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
-		pdpu->pipe_qos_cfg.danger_safe_en,
-		pdpu->pipe_qos_cfg.vblank_en,
-		pdpu->pipe_qos_cfg.creq_vblank,
-		pdpu->pipe_qos_cfg.danger_vblank,
+		pipe_qos_cfg.danger_safe_en,
+		pipe_qos_cfg.vblank_en,
+		pipe_qos_cfg.creq_vblank,
+		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
-			&pdpu->pipe_qos_cfg);
+			&pipe_qos_cfg);
 }
 
 /**
-- 
2.33.0

