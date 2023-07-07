Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83E74B757
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 21:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B579410E5F4;
	Fri,  7 Jul 2023 19:39:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8BA10E5EA
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso3688029e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758791; x=1691350791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vU1c/49oWLanKaAejW+DzYDq4MN30Rv8CE3BrFargO4=;
 b=f22t/0QgU2biLMJ3EILzJv7IMP4A/lRW7TXSYNMbMFKfzqLp9Xs/Z+0v/2zLAg4rYc
 wNZUnJSd06U+DFK85P1StmNBBfpg8H73sep3agFlqQ9m6dJq2IXhp3YO4T1Cq14apA54
 crAuyWXmYwI4GOwBZsLRDF9eq3YIO9EtK9+S1fH/Qo6ot/e0mkneA88+2wZcZvWQr1Y0
 FbZJMdEO4fnPv2hHaMfxdSYaq16MpijN5BOVV9ZcLK8OMAWoqTUgP8/pwVkhXLbFaBMR
 tBxPhZTpVGj/BTXi5QMeukDz3vN0sbob6PnRfonDh/uQuQTeRxIGxRHCPCbfV2a2X6mJ
 GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758791; x=1691350791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vU1c/49oWLanKaAejW+DzYDq4MN30Rv8CE3BrFargO4=;
 b=YQksiQXtCWVm9P1FOeSdHFg5QkOHhXSsKUN8LkDcrpfxkKQ4sFH9g35MJ+wqHrJZAj
 22zrN9kttSMqkLda17qdpjZBtWI3kzKJvxdHJlaPoW+JZ0UKMCjpl5J0gomVwZawio6P
 mgQgttOJkU7JpUy1xiujrH/2vZCQeGJZsvS5uPvpjAdTEKKilqsjNXwJAOR8B1MSl3aX
 EyzIu+1nJw8VeHthV15WAm7DymWC5kfhzm/sKn3jkOVdo/UjDX0x9APgDwVuzcwBDfRi
 Vu6WkCAQLcignXHaVo9PmikH2cW/UuavBI5v2wHgh8JM4xgJE2P/beM7clmjwguX/ZjO
 +EpA==
X-Gm-Message-State: ABy/qLZnO7l9otSFu8OkNr2HP88X9RwENPiPu5x1F572EK8KuZZl8Rzo
 zUJPJvNyTdvuiUZNbpXj0ZJK+A==
X-Google-Smtp-Source: APBJJlEZVx588V4IAHYVE54c/6CgIOxr/uFZfiqyxqLh/ZfRYrV+xq3/7BRQY2yCFYEnzOodRdQpHw==
X-Received: by 2002:a05:6512:3b86:b0:4f9:5396:ed1b with SMTP id
 g6-20020a0565123b8600b004f95396ed1bmr5635257lfv.28.1688758791247; 
 Fri, 07 Jul 2023 12:39:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 22:39:42 +0300
Message-Id: <20230707193942.3806526-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 11/11] drm/msm/dpu: drop
 dpu_core_perf_destroy()
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

This function does nothing, just clears one struct field. Drop it now.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index e9d71c0855df..adb932b0f49c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -486,16 +486,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 }
 #endif
 
-void dpu_core_perf_destroy(struct dpu_core_perf *perf)
-{
-	if (!perf) {
-		DPU_ERROR("invalid parameters\n");
-		return;
-	}
-
-	perf->max_core_clk_rate = 0;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 8cc55752db5e..4186977390bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -78,12 +78,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
  */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
 
-/**
- * dpu_core_perf_destroy - destroy the given core performance context
- * @perf: Pointer to core performance context
- */
-void dpu_core_perf_destroy(struct dpu_core_perf *perf);
-
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f01b2278c01a..44b0daf70c4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1171,7 +1171,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

