Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA503768308
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ED010E130;
	Sun, 30 Jul 2023 01:01:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4510E196
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso4156780e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678869; x=1691283669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0ob0u4E7GzEj0lwMhMnl9hV4h4mM4Saha8cWe62og0=;
 b=u1q7WXdLXH6NDmZpjipSV1sAoslbjAqOhCMbRuy9LyX6MeeT4BUl/EzrdFHFEeIm2b
 LfvvZRGV010J6ieOHMZq5btumuF7XTv/wlzJ/0l7Oea4WAqVW0bi27FL7mhAst/YQr0z
 jUSm2D7eVzMv9myDr6dh5Yj8+d2Ktlree/5jW3owNvCthyU/HOPgvoUA9OPClYrRXYe3
 nNQdZZbH4TtGN5+Attez9VSjCLGFcHlDFc2KITptvbpacAc/jHhDVYKDwgk5daeKxYzo
 r692GKcDvk04XZyRl2LPCbxI4q/N0x+73U6jHIdwM3a/YYZFej8ZcNinlY6cjZt2fOOW
 fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678869; x=1691283669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0ob0u4E7GzEj0lwMhMnl9hV4h4mM4Saha8cWe62og0=;
 b=VRARw1IZTXZ3H6OYJaNVNQNKCcTwPYSKcUQDXfSbIfyKRZhNtpOpTJ+eVsu98Mw5NR
 4PTvIaNu3GPf2gbcunnFmiuhEz2I1ac29eSkflwV1miH5tmb1Zs0szcqIkNLwexNi73P
 RWxjIr6s9HxUKDfPcAdDOHmEU9uJ9FDAkCQRvCbezDWjZT4k++WLVxw64zZbdQbR/x1Y
 qKyXHX7cJ0tQcrJBZ9L7RsJ8ch2hs5o1hT2kgrdiOzT0DB3XS6tEmK3Dx/zl6ptDDq1w
 rxakKMRtzDclubj7j/PAYgb2YrQL7kFk88Lh7n1jRY/75FplDgRJyWE1brYLcZeyU58B
 6plQ==
X-Gm-Message-State: ABy/qLZ4+fDiv6zor9QdLqQ/RvdWYtW7yISLrXAhclFNS8OOHV0dnprn
 qIqmZHKWqkVNqCgmgXzE25KG5Q==
X-Google-Smtp-Source: APBJJlGhUEFbkjZAsH6tGDYhLbjPzirRqpSomHHOwdeiUddq1oSE3yvpNw9HLVx8q2+09pNDq4uubg==
X-Received: by 2002:a05:6512:39ce:b0:4f9:5582:a7d3 with SMTP id
 k14-20020a05651239ce00b004f95582a7d3mr2791685lfu.22.1690678869034; 
 Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:00:59 +0300
Message-Id: <20230730010102.350713-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 07/10] drm/msm/dpu: remove unused fields from
 struct dpu_core_perf
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
are not used by the code.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f9585d717902..3dddec868bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -492,15 +492,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 	perf->max_core_clk_rate = 0;
 	perf->core_clk = NULL;
-	perf->dev = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
-	perf->dev = dev;
 	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index f4b84e67138c..e718d523ff30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -36,8 +36,6 @@ struct dpu_core_perf_tune {
 
 /**
  * struct dpu_core_perf - definition of core performance context
- * @dev: Pointer to drm device
- * @debugfs_root: top level debug folder
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
@@ -49,8 +47,6 @@ struct dpu_core_perf_tune {
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
-	struct drm_device *dev;
-	struct dentry *debugfs_root;
 	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
@@ -95,12 +91,10 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
- * @dev: Pointer to drm device
  * @perf_cfg: Pointer to platform performance configuration
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 074c032cd24e..80e08302680c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1156,7 +1156,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

