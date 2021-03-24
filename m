Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0367347B51
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE96EC4F;
	Wed, 24 Mar 2021 15:00:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE546EC5B
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b14so19184081lfv.8
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
 b=rXGFoie/9yS3qzs+rJXWTT05Cj9L593a8CPJ8P7JADitduceizCaquXGeJ2dT2THGG
 l7ptbGmn9xeu5hmaAEvpiQO9qT+FwE/ECaqg3OIbG41DiXySO6h8W9f7aEUI27jVjJPu
 1ukn0MVHTlA39wHdC5r1iZPoOZ7gH06iUJRmBpBo9FqpvcudlfkwSNG3b2s+dNavzusX
 C58AlG06fKU95nLI0ivQwVshnxAxnyUoMg0h6dB+iDj43ZfRK5U3yrpxu5YV0bD5DoFO
 IExmy9X44z2IW5JhIHpUkXvTVU5ctQYX5CByMy7TzeNohgYjszcY+BuUS5LCblS1gocg
 T9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
 b=Ha8sRiTEFri44phsUDw2zKgrKbIVKgcwte7zMvcNp+gWz3WE/06Wi1cYqJAqQ2N+u+
 b3Ds0gKlxsHC+NIRbYvn+RyND5C3v1TKMbNgEyISAFl37rO+ffG7GnAUwbT1pxXJxvns
 z1U3M3VIGBpV+W09yHM78lJ4fqUzVRDT3fShrizbT3DWSo8mEVdL9M7h9GYUGflvKN3R
 RNBmwDckw5jKdXv/rzr1dfsYnYBg7yoTWoOeJLuHx+2LhcuItBPA7llUYrCyOSD4ukfO
 eyHIsC1/e6rMAtrqnaZqdz/4yWS9+O5Ytiq2DIardJWMIr2DL7sSf3eZTyTyCNhqPUoI
 SSJg==
X-Gm-Message-State: AOAM531b7wo/doEolO3AxoAHp/yToKGGSq73Vi32jadS1swuCDw0Idqe
 fp1RKP4lD6KDtP4237SvTBxIHw==
X-Google-Smtp-Source: ABdhPJwfDblbnU+Z1/65/qUpz0vpTBhQEknwMYuUiS0xokuJL1eIt7NEi2fvByDJR8ileYBvUKnNKg==
X-Received: by 2002:a19:353:: with SMTP id 80mr2095095lfd.97.1616598042791;
 Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:13 +0300
Message-Id: <20210324150024.2768215-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 10/21] drm/msm/dpu: drop
 dpu_hw_lm_setup_blend_config()
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DPU1 driver supports only hardware with the version of 4.0 and higher
(>= sdm845), so drop the dpu_hw_lm_setup_blend_config() used by previous
hardware generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 26 +----------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index fd09b9ab9b4b..7d5b620f7f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -23,9 +23,6 @@
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
-#define LM_BLEND0_FG_ALPHA               0x04
-#define LM_BLEND0_BG_ALPHA               0x08
-
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -117,24 +114,6 @@ static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
-static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
-{
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	int stage_off;
-
-	if (stage == DPU_STAGE_BASE)
-		return;
-
-	stage_off = _stage_offset(ctx, stage);
-	if (WARN_ON(stage_off < 0))
-		return;
-
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
-}
-
 static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	uint32_t mixer_op_mode)
 {
@@ -154,10 +133,7 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (m->hwversion >= DPU_HW_VER_400)
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
+	ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
 }
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
