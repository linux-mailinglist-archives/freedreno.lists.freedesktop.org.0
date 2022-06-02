Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39153BFBB
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 22:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9DF113472;
	Thu,  2 Jun 2022 20:24:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE87113450
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 20:24:52 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id v9so6399326lja.12
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzLd/7PKjR1s72VRbpZnnb20njOIXn644FvbXu0Em5Y=;
 b=SddTxWHym7MXD32VlOYQZa/Bdf3fiM96iVBspk+eHD2L2tdg5MuU774V5HZmupbKbh
 p9Y8CxdhONRZHCPd1q5+pBCbqVf/KRDtnmZblarOyLu9ssq9aKM2MfLssfLiZJ3O4yhk
 UE6gm7iE6xNoE92lgetGIZQ6wzp6nez2vZiURrlYGPQOO7z7u6AqXRga3+cKn5EzTvvL
 2z+1jJ4YqLrwcebSIDk6jX+82H3oQQcThjtMmACRXwzPgyNj685FcAiC7s86WY++DtQk
 CZHdZcyYDsu8zFXbPX8ct+ROAi+vuovLE/i63hqZIscoXH8cbaKCnzxbQJr0O6DsxBRl
 vpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzLd/7PKjR1s72VRbpZnnb20njOIXn644FvbXu0Em5Y=;
 b=S5gAI8TA0WcT+B9tJhYd+9uXd4JovH9DKdKpX+v3601wsFUnMoHu42LkMiWRmiONNK
 rbkp6lRFrEhowFt7h9m/eT8zKWUhtSGdlH21tgkYEGVyxl2VifC20f+vTAgCrklfcy34
 qmYrUZoxcoq/+vBOUuB7A36snrGvTO0jda9uAwHvqeKw5i/IP1ofHJo0zM1B+mD6KMgM
 j9EhdGUOhM9jO7O2GHpmQQZbzG8PRgcBl3rAupZ86kTRxfEQDq3Od6RvFmtgEoP/a4ar
 Rw94STUITnE6RLtOYXAT18CeRV4qjJg+G7lO3oXo/kuXdjERKcG0/1oj1vHry5eWxw+D
 8uwg==
X-Gm-Message-State: AOAM530W4DE+VukVLZSQVpxektf7fWvPZf/CQdvlDnNq3mcbhbRP5I3s
 E9YyhmPB0eL40qLYpWOTdLdDVg==
X-Google-Smtp-Source: ABdhPJxkue078biFfrShwOIXmnKRhKUJ1dj3s0kv5oFtd9LcY/cJZyl0ZpfY5I6/i424cmLf8TCHGw==
X-Received: by 2002:a05:651c:ba4:b0:253:dfde:d7e with SMTP id
 bg36-20020a05651c0ba400b00253dfde0d7emr37492713ljb.436.1654201491067; 
 Thu, 02 Jun 2022 13:24:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.241])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a056512369900b0047255d21114sm1205718lfs.67.2022.06.02.13.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:24:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 23:24:41 +0300
Message-Id: <20220602202447.1755115-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
References: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/7] drm/msm/dpu: use feature bit for LM
 combined alpha check
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rather than checking hwversion, follow the usual patter and add special
bit to the lm->features to check whether the LM has combined or separate
alpha registers. While we are at it, rename
dpu_hw_lm_setup_blend_config_sdm845() to
dpu_hw_lm_setup_blend_config_combined_alpha().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 19 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  6 +++---
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 400ebceb56bb..c3759fc4b154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -50,11 +50,14 @@
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define MIXER_SDM845_MASK \
+#define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
+#define MIXER_SDM845_MASK \
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+
 #define MIXER_SC7180_MASK \
-	(BIT(DPU_DIM_LAYER))
+	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
@@ -936,17 +939,17 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 };
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8cb6d1f25bf9..80bc09b1f1b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,6 +145,7 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
+ * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -152,6 +153,7 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
+	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 462f5082099e..25d2eba28e71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -148,7 +148,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 	return 0;
 }
 
-static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
+static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -204,8 +204,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (m->hwversion >= DPU_HW_VER_400)
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
+		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-- 
2.35.1

