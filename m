Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71787709ADE
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 17:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F710E4BD;
	Fri, 19 May 2023 15:07:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285210E4BD
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:07:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso3762215e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684508856; x=1687100856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/VepfBnANpD6rMwkGqjM+Wq6F+vMt4iUNeOD4Ra93w=;
 b=g6vv5DD6GPQsSX/SmuvMMt8788IA/kc377+RGYGBDe/Dlo5oAsNv/+ObMUI+Xz5Xef
 1Q051vsbnWxwfcABxtcstQ6QZkJ/PabOFGrKkaGcapvEQ/J2MW3wVi/f69wmtGyJJX2V
 1d7uiQpTVNO+SJyTRml0GDbh88jyPCLIcADk5bPTqcf8qIpRI18xopxhdAGdSiREwNx/
 VL2wMm7bjFLUSz5HAoZDrDu2KahdnzpuK+ZCp8dvLk3QeqWf2dOy6mOT4wl/NeLvObFc
 wrKLY0H6z/hEIAURqfE/PuPKbW3wNXxzD3PmVkX6aJmgGkNkgO+sVgAJWc7+lfwiYjNE
 ZvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684508856; x=1687100856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/VepfBnANpD6rMwkGqjM+Wq6F+vMt4iUNeOD4Ra93w=;
 b=QxBFlFybPWqVj+jkfkCOJkn4PlUiTJzb0mjyT2UroEQEBQ1ymeCDBhvdtVaunX8Li0
 9nOFZXvVNnE0A7TOfp7jEP5ksDu99J+AhAX1BGvjGEIQrSFEWo2aOubTpph3T+vjjTgR
 goLSI6g0po9BcvHs+5or22tRWCdC5VtlLbtOnDmsp+Dgy0ipZIqpOF1g/C1X8XzQw3fP
 cr4RsOUpzZ3Md3iOzSstyJ/9wHHDO9QRNAjgF163YFC92bihE2YMcD7fUPOE9kwJ4QW5
 D6vMcwfeZk4bG0g6NiSWuzEDNVPALHg+q2pUY+0Tawyq7Kt2W+B2LHuxQtEvOSu+9351
 KaVg==
X-Gm-Message-State: AC+VfDywRg0Bnwy+FCx384mj4pJhAattjAdH5Im6BijNtrIasmvCU6Zw
 NvS+j+ihsDMxDClaQrtW4aA7ww==
X-Google-Smtp-Source: ACHHUZ6lks+gQ0hZTSPBtvXhueHV5ZcIMQu49BkS0rmVqcujwvjU09a7m/UpCr09dlRFFYQz7B4bFQ==
X-Received: by 2002:ac2:4d04:0:b0:4ef:ef8e:56f1 with SMTP id
 r4-20020ac24d04000000b004efef8e56f1mr933814lfi.49.1684508856128; 
 Fri, 19 May 2023 08:07:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e6-20020ac25466000000b004f37c0dfcaasm563450lfn.118.2023.05.19.08.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 08:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 18:07:34 +0300
Message-Id: <20230519150734.3879916-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7] drm/msm: stop storing the array of CRTCs in
 struct msm_drm_private
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

The array of CRTC in the struct msm_drm_private duplicates a list of
CRTCs in the drm_device. Drop it and use the existing list for CRTC
enumeration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This was a part of https://patchwork.freedesktop.org/series/105302/

Changes since v6:
- Dropped applied patches
- Dropped msm_drm_thread::crtc as suggested by Abhinav

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 42 ++++++++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  2 --
 5 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..5073f8d60e2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -773,7 +773,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e37072ed302..b6201ae5b42e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -332,7 +332,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 29ae5c9613f3..c1aab7e1a890 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->crtcs[priv->num_crtcs++] = crtc;
+		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b4cfa44a8a5c..ca6b38c778af 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -155,7 +155,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
 
 struct msm_vblank_work {
 	struct work_struct work;
-	int crtc_id;
+	struct drm_crtc *crtc;
 	bool enable;
 	struct msm_drm_private *priv;
 };
@@ -168,15 +168,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
 	struct msm_kms *kms = priv->kms;
 
 	if (vbl_work->enable)
-		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->enable_vblank(kms, vbl_work->crtc);
 	else
-		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
+		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
 
 	kfree(vbl_work);
 }
 
 static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
-					int crtc_id, bool enable)
+					struct drm_crtc *crtc, bool enable)
 {
 	struct msm_vblank_work *vbl_work;
 
@@ -186,7 +186,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
 
-	vbl_work->crtc_id = crtc_id;
+	vbl_work->crtc = crtc;
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
@@ -407,7 +407,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct msm_kms *kms;
-	int ret, i;
+	struct drm_crtc *crtc;
+	int ret;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
@@ -494,20 +495,21 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.funcs = &mode_config_funcs;
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
-	for (i = 0; i < priv->num_crtcs; i++) {
+	drm_for_each_crtc(crtc, ddev) {
+		struct msm_drm_thread *ev_thread;
+
 		/* initialize event thread */
-		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].worker = kthread_create_worker(0,
-			"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].worker)) {
-			ret = PTR_ERR(priv->event_thread[i].worker);
+		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread->dev = ddev;
+		ev_thread->worker = kthread_create_worker(0, "crtc_event:%d", crtc->base.id);
+		if (IS_ERR(ev_thread->worker)) {
+			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].worker = NULL;
+			ev_thread->worker = NULL;
 			goto err_msm_uninit;
 		}
 
-		sched_set_fifo(priv->event_thread[i].worker->task);
+		sched_set_fifo(ev_thread->worker->task);
 	}
 
 	ret = drm_vblank_init(ddev, priv->num_crtcs);
@@ -639,25 +641,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	return vblank_ctrl_queue_work(priv, pipe, true);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	return vblank_ctrl_queue_work(priv, crtc, true);
 }
 
 void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	vblank_ctrl_queue_work(priv, pipe, false);
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..5d56ca99c1c5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -97,7 +97,6 @@ struct msm_display_topology {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	unsigned int crtc_id;
 	struct kthread_worker *worker;
 };
 
@@ -198,7 +197,6 @@ struct msm_drm_private {
 	struct workqueue_struct *wq;
 
 	unsigned int num_crtcs;
-	struct drm_crtc *crtcs[MAX_CRTCS];
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-- 
2.39.2

