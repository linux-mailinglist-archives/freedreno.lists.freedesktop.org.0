Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C97B76D5
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 05:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2687A10E0B8;
	Wed,  4 Oct 2023 03:19:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AA910E332
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 03:19:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so19073721fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696389545; x=1696994345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSjHWoNUjbUR/rr+07ACORIedYYwRMMYATHihCLCO58=;
 b=yqUhX3WhXiHPlB2QCR5DOlcj3Lun7BDL4XYDmatdkCaCKnXzDCacJztP4INeqPrrzW
 k5dphbZ8vpCQqvKNy0CBi2DNNx+mWYHGUVxfa4ZNW+zDeQ8QfBNVKwLx1fj0xamXS63Z
 HTAFQzphKqUg/ffBwYUUsJbZC+rHmatsoEKDHT9C2MPEUvoQ8P8MjRzfAoa83ATE0dbZ
 4Wicm0OOH3htPjHVXgGVwpu9XauT0Wvpt0fPnoeQArEBHOnbWESCiNG5GQ9b8/yKXLGA
 x6dGSX1M3tW9vMNeM0ZpOiY+6bVWAhnD8beu5LQKeuuSkajBP0a0JKpl7VZy3pjEWi55
 2g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696389545; x=1696994345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSjHWoNUjbUR/rr+07ACORIedYYwRMMYATHihCLCO58=;
 b=Ti5Q/rWpqyGrBgyAosti8hTKYDC4onHGEXCbYHlcjWpY/lQBP9762hVXj6/PvngkBT
 X/aOxjr/OvjmxvGE8CY1hre5k7jnvH283qpd31ULg1+kUm4Q0SjB8SHjvqTfTsD5oI5b
 ik/JM6BIruhAFfVeD4HVAO1bQlzSeYSKXvgw/PyQ7KZuIAstQp9t5k2PcDXp/TydFSaB
 3s8Ta40TT36QuHHU9BFfTOzY02y7B+h2HQOF3cT9pIZtVUAtJAuoab1hmb22wtYvImc6
 gTxOtJKmnY1jBTlFxJ2WgGbSNVh8Y62jqtAgCOqSPXMx2PpU6yvq6Jjma/jNwBgQ0GjY
 wCLA==
X-Gm-Message-State: AOJu0Yxl2rYaay9R2Pv/KDJJPYnyzNmfb6HiC46AvYuc5qnZH+g1P9tD
 FMig6xqIOkoWffsD6anoeXSfcg==
X-Google-Smtp-Source: AGHT+IH/Sdf+B1sajD57r6zMUeuPKXAWSRNbLwR7DAfh6Nlk3TZKfhlJ6SqduGFUzTUkAWzyFH+uBg==
X-Received: by 2002:a2e:7d15:0:b0:2bb:b01a:9226 with SMTP id
 y21-20020a2e7d15000000b002bbb01a9226mr903948ljc.7.1696389544953; 
 Tue, 03 Oct 2023 20:19:04 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002bffa125afesm486056lji.48.2023.10.03.20.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 20:19:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed,  4 Oct 2023 06:19:03 +0300
Message-Id: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
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

There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
together with the corresponding wait_for_vblank callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 -------------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 +++---
 drivers/gpu/drm/msm/msm_drv.h                 |  2 --
 5 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..83045aa8ba01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2429,9 +2429,6 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
 		case MSM_ENC_TX_COMPLETE:
 			fn_wait = phys->ops.wait_for_tx_complete;
 			break;
-		case MSM_ENC_VBLANK:
-			fn_wait = phys->ops.wait_for_vblank;
-			break;
 		default:
 			DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
 					event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..c6cccab3bb6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -106,7 +106,6 @@ struct dpu_encoder_phys_ops {
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-	int (*wait_for_vblank)(struct dpu_encoder_phys *phys_enc);
 	void (*prepare_for_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..285246837b73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -690,33 +690,6 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 }
 
-static int dpu_encoder_phys_cmd_wait_for_vblank(
-		struct dpu_encoder_phys *phys_enc)
-{
-	int rc = 0;
-	struct dpu_encoder_phys_cmd *cmd_enc;
-	struct dpu_encoder_wait_info wait_info;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
-	/* only required for master controller */
-	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
-		return rc;
-
-	wait_info.wq = &cmd_enc->pending_vblank_wq;
-	wait_info.atomic_cnt = &cmd_enc->pending_vblank_cnt;
-	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
-
-	atomic_inc(&cmd_enc->pending_vblank_cnt);
-
-	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
-			phys_enc->irq[INTR_IDX_RDPTR],
-			dpu_encoder_phys_cmd_te_rd_ptr_irq,
-			&wait_info);
-
-	return rc;
-}
-
 static void dpu_encoder_phys_cmd_handle_post_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -745,7 +718,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
 	ops->wait_for_tx_complete = dpu_encoder_phys_cmd_wait_for_tx_complete;
-	ops->wait_for_vblank = dpu_encoder_phys_cmd_wait_for_vblank;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
 	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c2189e58de6a..94521f6d7f70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -444,7 +444,7 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(phys_enc);
 }
 
-static int dpu_encoder_phys_vid_wait_for_vblank(
+static int dpu_encoder_phys_vid_wait_for_tx_complete(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_wait_info wait_info;
@@ -558,7 +558,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	 * scanout buffer) don't latch properly..
 	 */
 	if (dpu_encoder_phys_vid_is_master(phys_enc)) {
-		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
+		ret = dpu_encoder_phys_vid_wait_for_tx_complete(phys_enc);
 		if (ret) {
 			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
@@ -578,7 +578,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 		dpu_encoder_phys_inc_pending(phys_enc);
 		spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
-		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
+		ret = dpu_encoder_phys_vid_wait_for_tx_complete(phys_enc);
 		if (ret) {
 			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
@@ -684,8 +684,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->destroy = dpu_encoder_phys_vid_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
-	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
-	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
+	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_tx_complete;
 	ops->irq_control = dpu_encoder_phys_vid_irq_control;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 02fd6c7d0bb7..182543c92770 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -78,12 +78,10 @@ enum msm_dsi_controller {
  * enum msm_event_wait - type of HW events to wait for
  * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
  * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
- * @MSM_ENC_VBLANK - wait for the HW VBLANK event (for driver-internal waiters)
  */
 enum msm_event_wait {
 	MSM_ENC_COMMIT_DONE = 0,
 	MSM_ENC_TX_COMPLETE,
-	MSM_ENC_VBLANK,
 };
 
 /**
-- 
2.40.1

