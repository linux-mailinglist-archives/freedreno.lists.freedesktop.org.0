Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B16F2BAF
	for <lists+freedreno@lfdr.de>; Mon,  1 May 2023 01:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3093410E146;
	Sun, 30 Apr 2023 23:57:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9FC10E0EF
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:37 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so19386211fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899055; x=1685491055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IQnN4Gte1igrHX4jdkN4n+w/u3KCrXki40ba3qKxFY=;
 b=ttXB4JeHr738lEhQHfwj7K6qRQELrwRcrU12ia4+wPF/6YuRZHktnE1ai0X9Jggzk4
 RIF9BunBI6MBnjr4Fme62wT8D3+0qBv+fEUH26Vwqj3G/uRsVg8T9HDhCEy5iQ5ZYX+c
 CjiqchX7z6IzcAFlf3mK+9TMa0SwQO7jZQK5hqCsPuNRBUBO/rmsNp/yevbPZL/i+4cb
 BCjEnrhSbB6UtNdP5eNgo8zn6raH4U+m1JTcqAWo8CvbYAkGSr5YxtiO3mbYMfm7DkOt
 HFVsNngbjz5pYBXWE2rMy5s6mjs6Sd0kEBqBrBDeByGOg+lI8sqb/ZQrLLSuphLdxxl6
 pzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899055; x=1685491055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IQnN4Gte1igrHX4jdkN4n+w/u3KCrXki40ba3qKxFY=;
 b=bVdsBsKv0sGNsNHNRy3dSjDdvCq/hcBpDc3jD6hzMFejHCPwJnwewyXm75y1zli/m9
 yMagY3hRXwU6cKtsA2RrtKE8n49Cr0IxcvErUrlzCpdm/ssNDkeng+FW5uWT/Fj0ppYV
 mctYwmT7HdFjxyfvfCwHtG3fQqpqiN8QOt71pC95MPwhyAv0M9BMaoirfv36BswTwwmi
 AgBmwTbMl0FJGCQRl/DF0iyqLPyR0JORdY3BnAVEmoxvy3Pa45Z1L+xNHv71deCNCAVK
 WvmoyFrRIwt9mEM5p//Nee7gXw9s6nhdXTZXxkHxAUoOQn5+IveninyftfV+ij3Q7FEi
 GJ3A==
X-Gm-Message-State: AC+VfDzAk+TF8i8/j6pMQmY1Md03T3P9MHM/GvUrt8ZMIDDsbnYl3c98
 xOhW631QYd7c3P89P7mK+SGd3lAeDq8Q7Dzmk8o=
X-Google-Smtp-Source: ACHHUZ4Ho7zTW0be7srcNzcVM94C5KhJtP5WGIk+tCaW+K9sigvOBoxKwlkaCU5uQcoe25R0JlKNlg==
X-Received: by 2002:a2e:8017:0:b0:2a8:c82f:2996 with SMTP id
 j23-20020a2e8017000000b002a8c82f2996mr3322131ljg.43.1682899055557; 
 Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  1 May 2023 02:57:28 +0300
Message-Id: <20230430235732.3341119-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/7] drm/msm/dpu: separate common function to
 init physical encoder
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

Move common DPU physical encoder initialization code to the new function
dpu_encoder_phys_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 31 +++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 20 +++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 +++---------
 5 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8c45c949ec39..c60dce5861e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2303,8 +2303,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-		atomic_set(&phys->vsync_cnt, 0);
-		atomic_set(&phys->underrun_cnt, 0);
 
 		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
 			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
@@ -2505,3 +2503,32 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 
 	return dpu_enc->dsc_mask;
 }
+
+int dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
+			  struct dpu_enc_phys_init_params *p)
+{
+	int i;
+
+	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
+	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
+	phys_enc->parent = p->parent;
+	phys_enc->dpu_kms = p->dpu_kms;
+	phys_enc->split_role = p->split_role;
+	phys_enc->enc_spinlock = p->enc_spinlock;
+	phys_enc->enable_state = DPU_ENC_DISABLED;
+
+	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
+		phys_enc->irq[i] = -EINVAL;
+
+	atomic_set(&phys_enc->vblank_refcount, 0);
+	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
+
+	atomic_set(&phys_enc->vsync_cnt, 0);
+	atomic_set(&phys_enc->underrun_cnt, 0);
+
+	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..7019870215c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -405,4 +405,7 @@ void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event);
 
+int dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
+			  struct dpu_enc_phys_init_params *p);
+
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..ce86b9ef6bf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -759,7 +759,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int i, ret = 0;
+	int ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
 
@@ -770,25 +770,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 		return ERR_PTR(ret);
 	}
 	phys_enc = &cmd_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 	cmd_enc->stream_sel = 0;
-	phys_enc->enable_state = DPU_ENC_DISABLED;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
 
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
 	DPU_DEBUG_CMDENC(cmd_enc, "created\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3a374292f311..aca3849621e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -699,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	int i;
+	int ret;
 
 	if (!p) {
 		DPU_ERROR("failed to create encoder due to invalid parameter\n");
@@ -712,24 +712,14 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-ENOMEM);
 	}
 
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
-
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
+
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->enc_spinlock = p->enc_spinlock;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index f879d006de21..c252127552c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -683,7 +683,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
 	int ret = 0;
-	int i;
 
 	DPU_DEBUG("\n");
 
@@ -701,28 +700,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	}
 
 	phys_enc = &wb_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->wb_idx = p->wb_idx;
+
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->wb_idx = p->wb_idx;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->vblank_refcount, 0);
 	wb_enc->wb_done_timeout_cnt = 0;
 
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
 			phys_enc->wb_idx);
-- 
2.39.2

