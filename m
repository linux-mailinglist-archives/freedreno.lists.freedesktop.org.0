Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156C74B811
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 22:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55610E60A;
	Fri,  7 Jul 2023 20:37:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64AA10E5F3
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso3785067e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762252; x=1691354252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4+OIgteCUp6yvV4TFzfxdxo98Q6Tvjyjeta7C9Ua2E=;
 b=dA/sr+pz2TdLGu/KeqaeVM5cjlzK89VDynGvsOgDmcq0TwPrH9aAOlu97arBMCGsgv
 6SWvomtCMvS0is1W4RqNfZFT/Cg/g3wMX8yMxzkQFDP5H8hLwE8ndL5HHKcxKH9NeBRC
 D1Fl8evAlDPJWEjdt9qWxk2FmvXWQG/asrLonjD8nYUhcODbWJdCpKcV1ndplTfNIEws
 wYBrgTlReOMj0JV+ZHNfUnBstInL6absTcgyAxgYn26Y52V+xnhR+RomFSVCkr2OeitC
 7Aq7iNa1doKpSuyuh6WxidnnQTz3i5ljwxSIcFixZgietY1p3GJ4driuWX0Q3wWUqtgZ
 ymgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762252; x=1691354252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4+OIgteCUp6yvV4TFzfxdxo98Q6Tvjyjeta7C9Ua2E=;
 b=ZUXPxxQKzQV8GGFYAmnI7OIeZt3g2+BZe64QOwXLArfDZ/dQbmFP+aJfH3abiaSEFq
 BE3ZkdUZZGzAJdvcGyWudDr7/uul9cF+JVXCkwp9nAaBmbbGsHO4zugWJymnGbANlbBF
 jp0Cseq8JTSYXCou4f48Zp8RyI43jM6D3cJ4JFFBMxAB4CbytGn2L170/UrEe5Me0Ql8
 uQ4Jd8iDNiEsUnNILyJ6HmRfbjcIBJ288zZcI7MTjA5dxgK/TxK2yp8KDYXWVo6d8bx0
 Rh6/XDPXaJTkV9UoiOLMysg4mv/ImFnVlqnrAuOgrsGPcQSjGifYnJf+zWJ8BM9mLJAu
 Y6FQ==
X-Gm-Message-State: ABy/qLZSrrWIlVA9mYbi53bv+XeJ0nkm8HIGeRUNGnBhA8uZJ50IIefo
 MKOfd2rVuW9C6n4Knw5a4XnJ/g==
X-Google-Smtp-Source: APBJJlHAXcHRdueIbiFHN4oywKklCMgpziQ4jmo02/MszVY4DTEUBdpstt/TkQoo3xI6pTZTMXs+ag==
X-Received: by 2002:a05:6512:694:b0:4fb:91c5:fd38 with SMTP id
 t20-20020a056512069400b004fb91c5fd38mr5601586lfe.0.1688762252217; 
 Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 23:37:22 +0300
Message-Id: <20230707203724.3820757-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 11/13] drm/msm/dpu: use drmm-managed allocation
 for dpu_encoder_phys
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

Change struct allocation of encoder's phys backend data to use
drmm_kzalloc(). This removes the need to perform any actions on encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  9 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 ++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++++--------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 ++++---------------
 5 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 493905a5b63a..7c2cd9ce8acd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2199,6 +2199,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
 }
 
 static int dpu_encoder_virt_add_phys_encs(
+		struct drm_device *dev,
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
 		struct dpu_enc_phys_init_params *params)
@@ -2220,7 +2221,7 @@ static int dpu_encoder_virt_add_phys_encs(
 
 
 	if (disp_info->intf_type == INTF_WB) {
-		enc = dpu_encoder_phys_wb_init(params);
+		enc = dpu_encoder_phys_wb_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
@@ -2231,7 +2232,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
 	} else if (disp_info->is_cmd_mode) {
-		enc = dpu_encoder_phys_cmd_init(params);
+		enc = dpu_encoder_phys_cmd_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
@@ -2242,7 +2243,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
 		++dpu_enc->num_phys_encs;
 	} else {
-		enc = dpu_encoder_phys_vid_init(params);
+		enc = dpu_encoder_phys_vid_init(dev, params);
 
 		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
@@ -2333,7 +2334,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			break;
 		}
 
-		ret = dpu_encoder_virt_add_phys_encs(disp_info,
+		ret = dpu_encoder_virt_add_phys_encs(dpu_kms->dev, disp_info,
 				dpu_enc, &phys_params);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..4fb0d95f3061 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -281,22 +281,24 @@ struct dpu_encoder_wait_info {
  * @p:	Pointer to init params structure
  * Return: Error code or newly allocated encoder
  */
-struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
+struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
  * dpu_encoder_phys_cmd_init - Construct a new command mode physical encoder
+ * @dev:  Corresponding device for devres management
  * @p:	Pointer to init params structure
  * Return: Error code or newly allocated encoder
  */
-struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
+struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
  * dpu_encoder_phys_wb_init - initialize writeback encoder
+ * @dev:  Corresponding device for devres management
  * @init:	Pointer to init info structure with initialization params
  */
-struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
+struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b856c6286c85..2958b64e6e5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -13,6 +13,8 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/drm_managed.h>
+
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
 		(e)->base.parent->base.id : -1, \
@@ -563,14 +565,6 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_encoder_phys_cmd *cmd_enc =
-		to_dpu_encoder_phys_cmd(phys_enc);
-
-	kfree(cmd_enc);
-}
-
 static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -736,7 +730,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
-	ops->destroy = dpu_encoder_phys_cmd_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
@@ -751,7 +744,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->get_line_count = dpu_encoder_phys_cmd_get_line_count;
 }
 
-struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
+struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -759,7 +752,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	DPU_DEBUG("intf\n");
 
-	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
+	cmd_enc = drmm_kzalloc(dev, sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
 		DPU_ERROR("failed to allocate\n");
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 662d74ded1b9..bdfce4ccc0a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -11,6 +11,8 @@
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
 
+#include <drm/drm_managed.h>
+
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->parent ? \
 		(e)->parent->base.id : -1, \
@@ -438,12 +440,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		phys_enc->enable_state = DPU_ENC_ENABLING;
 }
 
-static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	DPU_DEBUG_VIDENC(phys_enc, "\n");
-	kfree(phys_enc);
-}
-
 static int dpu_encoder_phys_vid_wait_for_vblank(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -681,7 +677,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
-	ops->destroy = dpu_encoder_phys_vid_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
@@ -694,7 +689,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
 }
 
-struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
+struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -704,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-EINVAL);
 	}
 
-	phys_enc = kzalloc(sizeof(*phys_enc), GFP_KERNEL);
+	phys_enc = drmm_kzalloc(dev, sizeof(*phys_enc), GFP_KERNEL);
 	if (!phys_enc) {
 		DPU_ERROR("failed to create encoder due to memory allocation error\n");
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a466ff70a4d6..9a44a1575682 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -8,6 +8,7 @@
 #include <linux/debugfs.h>
 
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 
 #include "dpu_encoder_phys.h"
 #include "dpu_formats.h"
@@ -552,20 +553,6 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-/**
- * dpu_encoder_phys_wb_destroy - destroy writeback encoder
- * @phys_enc:	Pointer to physical encoder
- */
-static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
-{
-	if (!phys_enc)
-		return;
-
-	DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
-
-	kfree(phys_enc);
-}
-
 static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc,
 		struct drm_writeback_job *job)
 {
@@ -661,7 +648,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
-	ops->destroy = dpu_encoder_phys_wb_destroy;
 	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
@@ -677,9 +663,10 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 
 /**
  * dpu_encoder_phys_wb_init - initialize writeback encoder
+ * @dev:  Corresponding device for devres management
  * @p:	Pointer to init info structure with initialization params
  */
-struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
+struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
@@ -692,7 +679,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 		return ERR_PTR(-EINVAL);
 	}
 
-	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
+	wb_enc = drmm_kzalloc(dev, sizeof(*wb_enc), GFP_KERNEL);
 	if (!wb_enc) {
 		DPU_ERROR("failed to allocate wb phys_enc enc\n");
 		return ERR_PTR(-ENOMEM);
-- 
2.39.2

