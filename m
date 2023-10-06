Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CA7BB8C1
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 15:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E2D10E4EE;
	Fri,  6 Oct 2023 13:14:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FBE10E209
 for <freedreno@lists.freedesktop.org>; Fri,  6 Oct 2023 13:14:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so2743111e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Oct 2023 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696598094; x=1697202894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
 b=sB2ZRcVe2OB7drzw2fyQ4qCUoKs7QfdaaDT3XSMInvbP+XHSeOPIdBJQ56Iz3U5iTp
 RHw9efwNUGfAIrSP3+3THoJNZpAraBF5uz6hCI52rkEToCbwDWvicWWrhPgG0ZYxgs1t
 m0FhMrYWmuxSbx0dBjK9n91Ivr5MOzxwM55AtPinbTnpdo9HhJpfcdHDQSskk0VIFVF5
 qm3TG5MaYE/o3xkuZFeuWX5n+BFfA5djPjSmBMBamL0TEGJPPVOZGTS6Cve7YoUo7V6H
 7Fd15UaZrsElWV95WWH9UaprOhBEdBFsp22Uohu9yidnl5Byo/LEM4NRU1dqfVgFAh19
 MG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598094; x=1697202894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
 b=WBtrXoGaoQMA4qEtsoIMigD/yyCFn1Z4JFNlZMQy6AV6jU5Xes9rF+rC3gqvEoiNTb
 ookA4R9HNoHcWttCTvnrS8AgSLnHpK5pdf4EOoh0Pcjoipk9aYP5s+JAj9SIS1hDCK2c
 7JhjFkkjSuoM0mMaYxCS+SNrH9rCWXMqpJemasgjulwW9L8OI0SX9tz+ST5Q7XOAxlfm
 nPYydoe5metQ78KfJ0btpEczWrDU1eZbjjrIa6xAZDedpIMBffWZWe28Wh+c0kms71//
 m4YjFaCxQZNxz0r6MkR6k1jzl8/YbxiDX+dtdlS2UAsAx/Yf8/lQN0x7FOLXBohns/0q
 Hmpw==
X-Gm-Message-State: AOJu0YwfXzAAA+9VirqSx9OXOWP69DXOkHiWO3YCpTvU+zX4Im3aIvRq
 rh4fjOxAl6wvPuT0W32frjVofg==
X-Google-Smtp-Source: AGHT+IHHznfuyGZG5syOhRWm43mGZCXfOUe3tfZYraSO9vzH7u2OekNMVIgeJSff/N7tzj1kU7FTsQ==
X-Received: by 2002:ac2:4f82:0:b0:4fe:2f8a:457e with SMTP id
 z2-20020ac24f82000000b004fe2f8a457emr6171467lfs.43.1696598093796; 
 Fri, 06 Oct 2023 06:14:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 16:14:42 +0300
Message-Id: <20231006131450.2436688-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 02/10] drm/msm/dpu: Drop unused
 get_scaler_ver callback from SSPP
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

From: Marijn Suijten <marijn.suijten@somainline.org>

This pointer callback is never used and should be removed.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[DB: dropped the helpers completely, which are unused now]
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 13 +------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ---
 4 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..7e9c87088e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -394,15 +394,6 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 			format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
-{
-	if (!ctx)
-		return 0;
-
-	return dpu_hw_get_scaler3_ver(&ctx->hw,
-				      ctx->cap->sblk->scaler_blk.base);
-}
-
 /*
  * dpu_hw_sspp_setup_rects()
  */
@@ -605,10 +596,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
-		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
-	}
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..ca02f86c94ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -288,12 +288,6 @@ struct dpu_hw_sspp_ops {
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format);
 
-	/**
-	 * get_scaler_ver - get scaler h/w version
-	 * @ctx: Pointer to pipe context
-	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
-
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..af4fb54f3c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -381,12 +381,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_OP_MODE + scaler_offset, op_mode);
 }
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-			u32 scaler_offset)
-{
-	return DPU_REG_READ(c, QSEED3_HW_VERSION + scaler_offset);
-}
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..689d06c7d740 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -340,9 +340,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		u32 scaler_offset, u32 scaler_version,
 		const struct dpu_format *format);
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-		u32 scaler_offset);
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
-- 
2.39.2

