Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D739676830A
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7965710E23C;
	Sun, 30 Jul 2023 01:01:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466710E130
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b74fa5e7d7so49529721fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678870; x=1691283670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNXjCNC0Y9MPdFbZ/jcuLMXOdtaVI2+wIl/TIFyT37s=;
 b=c54TuTCKZeBzILD71xoPiYYKl9W+TRjlDWaSpFcQbtXCWh8Wx3ZeR/goSXzYm9NCRg
 LxrvZn/3VCGrXKvcw9KG0Rl+9rSITlwaLPMKvuWgW5DoS868ta6un6E7yXMxP+piKVH/
 KIJ6FwU/db418juDjtrolKVVcLn6ZxfMxqF6I2b7EToxflaTaMNqdl4Qlo6sJkC/+eIE
 R2k5I9xnuOw1p7HO0rURuvshPr+B/oB2LQp9qAJ1Y4NXidPhmsHM8sq4Q7l0HsgEQ35Y
 OrEnErQLk0KuQKhQ0AMCVor5XGj7U3yuMJewDAhNwoRGm4JXqQMCrzzUFOKbbe9qxuM4
 qfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678870; x=1691283670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNXjCNC0Y9MPdFbZ/jcuLMXOdtaVI2+wIl/TIFyT37s=;
 b=TlmjAe2kwyDep1YBVluo9N/CLqSIfwtO/RrdbvUyy9RQk4fqkzC2K98IfhTuE3fzJH
 SFpYpRfI9yeVDZn082zwlfu8z1BMsIHaZxtXtqML5tHPA3OGB04lt/oan2A858gVQRf8
 +LCh0nUZReYMh2UmDv+PfHqVxRSYVVPm5Hhr3r3HiguIWD0Tcm79TaOs2UbND8AJTVGO
 9d5SGcic5iNIbnWSPdd23o0InqZvRf4mhg/A6Ll5HJb20BLxC+UZSbCENqC8kpEoHaCv
 YweWSCo5W5+AB07ZJ+Laas2+HgyHhh/P26I6GpkUR898SaEKv/tYY4dwYiDZQVEAwvQM
 gtow==
X-Gm-Message-State: ABy/qLbEFfbqkgSK1JTnWRWdAvk98+vDYRgtzc/ud/K8mlZr1jHUEUQr
 TXdMTk4KTVTM+59hYkIgo++1XQ==
X-Google-Smtp-Source: APBJJlFvpgsqlJJiGYnSMKVGsnqVyrE8MWxwzVHoO713rH2XIiC+GPONnkaC1CN9fG06iuyTD0k9tw==
X-Received: by 2002:a2e:9295:0:b0:2b9:4aa1:71da with SMTP id
 d21-20020a2e9295000000b002b94aa171damr4289474ljh.53.1690678870401; 
 Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:01:01 +0300
Message-Id: <20230730010102.350713-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 09/10] drm/msm/dpu: move max clock decision
 to dpu_kms.
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

dpu_core_perf should not make decisions on the maximum possible core
clock rate. Pass the value from dpu_kms_hw_init() and drop handling of
core_clk from dpu_core_perf.c

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 11 ++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 13 +++++++++++--
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 6a0f0ede4781..665b7b21a817 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -489,21 +489,14 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 	}
 
 	perf->max_core_clk_rate = 0;
-	perf->core_clk = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
-		struct clk *core_clk)
+		unsigned long max_core_clk_rate)
 {
 	perf->perf_cfg = perf_cfg;
-	perf->core_clk = core_clk;
-
-	perf->max_core_clk_rate = clk_get_rate(core_clk);
-	if (!perf->max_core_clk_rate) {
-		DPU_DEBUG("optional max core clk rate, use default\n");
-		perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
-	}
+	perf->max_core_clk_rate = max_core_clk_rate;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e718d523ff30..8cc55752db5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -12,8 +12,6 @@
 
 #include "dpu_hw_catalog.h"
 
-#define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @max_per_pipe_ib: maximum instantaneous bandwidth request
@@ -37,7 +35,6 @@ struct dpu_core_perf_tune {
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
- * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
  * @perf_tune: debug control for performance tuning
@@ -48,7 +45,6 @@ struct dpu_core_perf_tune {
  */
 struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
-	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
 	struct dpu_core_perf_tune perf_tune;
@@ -92,11 +88,11 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
  * @perf_cfg: Pointer to platform performance configuration
- * @core_clk: pointer to core clock
+ * @max_core_clk_rate: Maximum core clock rate
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
-		struct clk *core_clk);
+		unsigned long max_core_clk_rate);
 
 struct dpu_kms;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 80e08302680c..5bfea4868e43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1051,11 +1051,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 	return clk_get_rate(clk);
 }
 
+#define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
+
 static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
 	int i, rc = -EINVAL;
+	unsigned long max_core_clk_rate;
 	u32 core_rev;
 
 	if (!kms) {
@@ -1156,8 +1159,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
-			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
+	/* TODO: use the same max_freq as in dpu_kms_hw_init */
+	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
+	if (!max_core_clk_rate) {
+		DPU_DEBUG("max core clk rate not determined, using default\n");
+		max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
+	}
+
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
 		goto perf_err;
-- 
2.39.2

