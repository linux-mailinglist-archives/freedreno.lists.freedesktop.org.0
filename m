Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F3C6F46C1
	for <lists+freedreno@lfdr.de>; Tue,  2 May 2023 17:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1C710E5A5;
	Tue,  2 May 2023 15:05:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCE110E599
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 15:05:41 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8b3ecf59fso39662521fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039940; x=1685631940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWho3vDBlAyOte9RhNJbwdifZh0HWETRUs9xv+x2glc=;
 b=feteKQydGTacUl6nWs7yJZTVYJeGKpN4v6mOOMqw2v4JQtCDZ4rYBvtDB6rquaaTzN
 pwOYM7GXHCquzF7PhOhXkc8fhlhgpfBl9QesSvtoTBa8dCh/4gaauAa/oMYjmOra+nRx
 IoAMrfqygYAqGtI/0hoJ8r4XLwDFYnmpBDGLobelHMAnnfEq7S0g7qn8T9sliWrWcIHA
 0EShytP+XJTplHJvMFkYMB0pFc2EnLIIEsFtJonVfc05b8cUql3lv55r1xrxMKXXdS1Z
 aOGcff5oO9gUjz5lWD9wTuGjDuwI8d3J9ZiR7Le8fcWBzcw5b97McqZb4IIKcLxZkuAp
 04eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039940; x=1685631940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWho3vDBlAyOte9RhNJbwdifZh0HWETRUs9xv+x2glc=;
 b=ObqcL7qmkMgyyeNVy8Kk9T9sPUizyAZY716WDjP50lvSasX0IswxcIDV76164k+rpC
 eVM7iYhIIyakcphurW6yVHA16TFrK2ElZldXiC6d+Eudm+zbGWcz1YZlsLZm1XUSPnzU
 HiuD6SfcF50YyfDeV2EoKo43FcpTJkv6XOtkSj9dOJj9HuSv5CazPg2Eaf35CMMuiUIe
 kqFrnaju5u0GGZUTW2uBM5b7Pt1/2aFadPThqnLtyC/2HSM1mTNtl4XwXF2XZJIT+4NB
 FejPFuDcPrDQvKr+v1AdRIcDXbthuWkugCJvon6l6G9I1IcnMF+7I2+xw2DvRFPhd0xG
 vPng==
X-Gm-Message-State: AC+VfDwWlgs0kr0g65BMdRrA+gctdNky3u6Py+5ZVzzJkQ8F6EbXT8aC
 7eSoLCJ6Xo8qkU41YYiPM6gGTw==
X-Google-Smtp-Source: ACHHUZ40BQlWFBVBclg6qpM51dHxNnllTgeO5HZJb1ozBv0BWGimhPWyRqvb25gRNDmrpLZCu/90Hg==
X-Received: by 2002:a2e:80cc:0:b0:2a8:ca1c:12b with SMTP id
 r12-20020a2e80cc000000b002a8ca1c012bmr4568869ljg.17.1683039939152; 
 Tue, 02 May 2023 08:05:39 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  2 May 2023 18:05:29 +0300
Message-Id: <20230502150533.3672840-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/9] drm/msm/dpu: drop
 DPU_PLANE_QOS_VBLANK_CTRL
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

Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
in upstream driver and in vendor SDE driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2831b45ac64..d47e7061a36b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -371,8 +371,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @creq_vblank: creq priority during vertical blanking
- * @danger_vblank: danger priority during vertical blanking
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
@@ -387,8 +385,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 creq_vblank;
-	u32 danger_vblank;
 	u32 maxdwnscale;
 	u32 maxupscale;
 	u32 smart_dma_priority;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 731199030336..b198def5534b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -697,14 +697,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			0400,
 			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
-	debugfs_create_x32("creq_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->creq_vblank);
-	debugfs_create_x32("danger_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->danger_vblank);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 586f089756fa..3cb891917b65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,13 +73,11 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_CTRL: Setup VBLANK qos for the pipe.
  * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
  *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_CTRL = BIT(0),
 	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
@@ -361,15 +359,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
-		pipe_qos_cfg.danger_vblank =
-				pipe->sspp->cap->sblk->danger_vblank;
-		pipe_qos_cfg.vblank_en = enable;
-	}
-
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		/* this feature overrules previous VBLANK_CTRL */
 		pipe_qos_cfg.vblank_en = false;
 		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
-- 
2.39.2

