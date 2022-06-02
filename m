Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2253BF93
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 22:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC47A11336E;
	Thu,  2 Jun 2022 20:22:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB441113356
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 20:22:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i10so9602091lfj.0
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzLd/7PKjR1s72VRbpZnnb20njOIXn644FvbXu0Em5Y=;
 b=ruspFBPqhD3B/wwEdiTnRF7DIDP20/hPWTh1wGFHKTbWxX243JIMkGdeJsfS7+OvJy
 qFWcJo2wd3plg18eyGxu71fB7JL5H7O2Fy87C9toL35W3CJ8CLHUQPwnwejNJcbP2FBN
 6l2TG3KJrkzCBhSwz+aqmBx9g7kN8j/04welyj55RNlMNnIi2x+aVE7qAClk5aX4YREs
 FznPb6060EcgqatW6/wLMh7RtEtuG8LPMjoNk83ssV0uVEPvXRb3TeeOFqJGTlA4tqaz
 orjfrbqxuHjdK1CfrfSOMaUakk2ThYVraoBj99HHix9pVA/CUfgsUWsGXVyJNGxcE3ng
 SdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzLd/7PKjR1s72VRbpZnnb20njOIXn644FvbXu0Em5Y=;
 b=YgjkG7hHjOsSSYOZlhjzjIrmgM2EN5PycioRri1GsqIiman2tHdKalxJDdt/Dm9Uyh
 kcmyIfko1m2n6ODBzx3cwscCxDwOLh4hQgFmErlR+UqET+gyvje3j2NUMEGh7A5xl/p1
 ryXiRQaNG9GHCeMQpfoXFdOZtJETDAYleocLeGEpkJPgQcNSWoORbwMaVbOuCzKmNM8E
 wc8/S75zYIs6cmWDtWR5v7lYfXAc9O3q1KznNx1XkkxTrBQ6UirOq5Xek5tA8BlgRYeT
 RKrDlqdVIcIPYKewgSKyOFEQExTP1ZyBCmVLVkqkearosd7bD6Tqt1giUPu27lDGvkoL
 dRGw==
X-Gm-Message-State: AOAM533DVGr/4oQxGEAH4UyKxKcdkqY/ov3m0rqte6GTc1y4PsPVqtIN
 lckcl1LG+Zc5ypVjR9yLVsnGWg==
X-Google-Smtp-Source: ABdhPJw0CULyjlamTxjCq53wN2vyh0X5m785J+FSWeSf+Wqz/PqjlBZ4bAYgkVQvno3I8utIid6Nag==
X-Received: by 2002:a05:6512:138b:b0:478:c684:4313 with SMTP id
 p11-20020a056512138b00b00478c6844313mr4537426lfa.426.1654201331289; 
 Thu, 02 Jun 2022 13:22:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.139])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a2e740c000000b0024f3d1daef5sm992451ljc.125.2022.06.02.13.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:22:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 23:22:01 +0300
Message-Id: <20220602202207.1754351-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/7] drm/msm/dpu: use feature bit for LM
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

