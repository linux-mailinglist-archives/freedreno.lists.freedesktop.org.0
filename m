Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94E74B74D
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 21:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293A710E5E4;
	Fri,  7 Jul 2023 19:39:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55FD10E5E2
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3705625e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
 b=d8kd4LwCK8JmRRCtZ7vWwUrKfbcjO/NRfw++krZjQ+tGGGt0z1ZUrUP3B/S3fwi1T8
 IkCVOVTYUW8T7L5vGkXUUPXlF9GKFZqNXq0gzZn0b2MfrxZhjObf9yyNXsV6w1rXPTb2
 iW8C3LFac4rZoh4Y2kFBBIGc2BQqEeIYnxfVcrHf3AuH4oZ2gdc9GvWnKmqGbQdMV0It
 CCfn/KFK12jPZrfxxAMu1zqhhWHWqkRq4QIXs/AzMq2/5bEYH3+JnYzUH16ImM+3JUSc
 8pxLbaAYAzrQKcbPjdThYknBuIhRiqLZ+aIKuIG5+NMKIz2RVJwtHqxAZMF7GcB1mmJw
 zMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
 b=Ry+Jx1pfOC+vf5CviCDxXIEmO3OZfC1P+4OKSGpUQPsBjwf7JGKm1S5VAkePbc73zm
 jzSpSTUaVo2NV1Eq5GsWj7tKltDGYgq0nL1SN71OpYFJdX34Lwgbj0wlNiS68ZyCLR4q
 bESmwCZyPM3BOW6/Vu/ZEPQo1Y41NM50SF3Im66wZXGvKSqH5j6pDs6Aa4VNw3nqJneN
 Ydjg7fhYMQ87GJ2PE7jcDjquuklKBcv1TI37R15T/iUau19r+aUI6LgJI6Js1k3RGBx9
 QLDcT1v0+VcOWhyc82ZxRP9A0bhpRJSMcKPfkUUWJXS1WQ75/u7PvYSRe3XAT8rRFWVn
 upAA==
X-Gm-Message-State: ABy/qLYZSF3/LzcnTSv5D1l8B4b2i9Z0jA+0qELP9sEadohYnNEp3URy
 mqdImBg3nLm/qnXazZ2rBCtinQ==
X-Google-Smtp-Source: APBJJlHfbUdQtSsSktig1onHXDKAXml/Kgjl06pRamnL6+L3U9sxnMRrUS4tVsN3iFrTAN9JCGYVxA==
X-Received: by 2002:ac2:57cd:0:b0:4fb:7772:7bae with SMTP id
 k13-20020ac257cd000000b004fb77727baemr4383238lfo.6.1688758786063; 
 Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 22:39:35 +0300
Message-Id: <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 04/11] drm/msm/dpu: drop separate
 dpu_core_perf_tune overrides
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

The values in struct dpu_core_perf_tune are fixed per the core perf
mode. Drop the 'tune' values and substitute them with known values when
performing perf management.

Note: min_bus_vote was not used at all, so it is just silently dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 05d340aa18c5..348550ac7e51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
 
 	if (!kms->num_paths)
 		return 0;
@@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
-	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
+	u64 clk_rate;
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+		return kms->perf.fix_core_clk_rate;
+
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
+		return kms->perf.max_core_clk_rate;
+
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -305,11 +311,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 		}
 	}
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
-		clk_rate = kms->perf.fix_core_clk_rate;
-
-	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
-
 	return clk_rate;
 }
 
@@ -397,6 +398,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
+		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
+
 		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
@@ -418,7 +421,6 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -433,14 +435,9 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		DRM_INFO("fix performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
 		/* run the driver with max clk and BW vote */
-		perf->perf_tune.min_core_clk = perf->max_core_clk_rate;
-		perf->perf_tune.min_bus_vote =
-				(u64) cfg->max_bw_high * 1000;
 		DRM_INFO("minimum performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
 		/* reset the perf tune params to 0 */
-		perf->perf_tune.min_core_clk = 0;
-		perf->perf_tune.min_bus_vote = 0;
 		DRM_INFO("normal performance mode\n");
 	}
 	perf->perf_tune.mode = perf_mode;
@@ -456,10 +453,8 @@ static ssize_t _dpu_core_perf_mode_read(struct file *file,
 	char buf[128];
 
 	len = scnprintf(buf, sizeof(buf),
-			"mode %d min_mdp_clk %llu min_bus_vote %llu\n",
-			perf->perf_tune.mode,
-			perf->perf_tune.min_core_clk,
-			perf->perf_tune.min_bus_vote);
+			"mode %d\n",
+			perf->perf_tune.mode);
 
 	return simple_read_from_buffer(buff, count, ppos, buf, len);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 29bb8ee2bc26..c965dfbc3007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -29,13 +29,9 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf_tune - definition of performance tuning control
  * @mode: performance mode
- * @min_core_clk: minimum core clock
- * @min_bus_vote: minimum bus vote
  */
 struct dpu_core_perf_tune {
 	u32 mode;
-	u64 min_core_clk;
-	u64 min_bus_vote;
 };
 
 /**
-- 
2.39.2

