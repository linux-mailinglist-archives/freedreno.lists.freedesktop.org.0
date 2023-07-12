Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E7751350
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F99410E5E7;
	Wed, 12 Jul 2023 22:11:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12A710E5E0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b69e6d324aso122064701fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199905; x=1689804705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69k8fQ2msFBx8smoqv6Ghq5v6ba+yjgk59I3z2zgS4M=;
 b=y4YUMCUHBjoYrBK1UTx/RhzL/iwKpfcaGqiXEVHD0b+HW35gbKPPgvFZaSUF2SOcmN
 8mv7xZ9SGEVSWnKCiv3yIn3EZdZSHJ1IrPzTDRwodGuqlwHxQDtnSnDqYZVJrg16/KvM
 j+sJEKwGfq59qXSwTd08HKY8o2VoZzeWZUCQbnxvkscI5M6FBqKPGaesLJkbocU8Nuz7
 xoR4Rpd/Bw12nw5RGs7H+Fsmuf6LDcWFCM0Qc3fGX/yPIz9LW8rnkDOOALZ5jon3POXC
 N12XXEfi6fuHyBi/bm/GzlWox0EEgi3p/3VMVCtiqZHnpsY//908lWEXD9NFi3x9zHdP
 I64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199905; x=1689804705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69k8fQ2msFBx8smoqv6Ghq5v6ba+yjgk59I3z2zgS4M=;
 b=hoYQudXimkLIkAdBgAlVsHjjgOSQaFV8cxT1tIa70cgtH8Mcq8uRqaAZdxWH9rwRzN
 MBgISL/hfNLWLaNvjQQ4A7xLvvl5ITILgNa4GmQpVCFMr92XYWT3wkR5WBGCl0AB02TG
 UDDNNstDaNR/xhhzZ2n9OiQS3m/Xwk9JyCBK11bS7DJ2jgvSI39g6GfqcHRVmUnJYeCE
 +8XIBEw7kPGq3LzSJ0Sf8m90GVzplRqzdTsudhgYmRHODL8sjtmFoMzg3P04J4hBG3rV
 zJOllwQSLSoVNZVWnLsGhLDOlbLcXJzLNdLOYBpvVrrhqF0qno0I7e+BeJpjRSFNiI79
 yRGg==
X-Gm-Message-State: ABy/qLbZtaMWi38Lk6a3mfb9PS2pBjgPY3bLcdUb8qvw6dkrI0hsCDY0
 MRnxoADtHVW1DS5AKGx7fHuiJA==
X-Google-Smtp-Source: APBJJlGaB0ZubOqqbSsGnIi/l9pAQ5hPfTNVdj72JV/lQ0f4NQC8L4F6Y1SpdZOEc4PcY12qEfyRig==
X-Received: by 2002:a05:6512:159a:b0:4fb:8987:734e with SMTP id
 bp26-20020a056512159a00b004fb8987734emr20217446lfb.68.1689199905188; 
 Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:34 +0300
Message-Id: <20230712221139.313729-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 06/11] drm/msm/dpu: drop the
 dpu_core_perf_crtc_update()'s stop_req param
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

The stop_req is true only in the dpu_crtc_disable() case, when
crtc->enable has already been set to false. This renders the stop_req
argument useless. Remove it completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 841e1fc0c6a7..3b3c2659297d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -315,7 +315,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 }
 
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req)
+			      int params_changed)
 {
 	struct dpu_core_perf_params *new, *old;
 	bool update_bus = false, update_clk = false;
@@ -339,13 +339,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
-	DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
-			crtc->base.id, stop_req, kms->perf.core_clk_rate);
+	DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
+			crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
 
 	old = &dpu_crtc->cur_perf;
 	new = &dpu_cstate->new_perf;
 
-	if (crtc->enabled && !stop_req) {
+	if (crtc->enabled) {
 		/*
 		 * cases for bus bandwidth update.
 		 * 1. new bandwidth vote - "ab or ib vote" is higher
@@ -378,7 +378,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
-		new->core_clk_rate, stop_req, update_bus, update_clk);
+		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
 
 	if (update_bus) {
 		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
@@ -398,7 +398,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
 
-		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
+		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
 		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index c965dfbc3007..c0097b67f9dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -75,11 +75,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
  * dpu_core_perf_crtc_update - update performance of the given crtc
  * @crtc: Pointer to crtc
  * @params_changed: true if crtc parameters are modified
- * @stop_req: true if this is a stop request
  * return: zero if success, or error code otherwise
  */
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req);
+			      int params_changed);
 
 /**
  * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1edf2b6b0a26..8ce7586e2ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
-	dpu_core_perf_crtc_update(crtc, 0, false);
+	dpu_core_perf_crtc_update(crtc, 0);
 	_dpu_crtc_complete_flip(crtc);
 }
 
@@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 		return;
 
 	/* update performance setting before crtc kickoff */
-	dpu_core_perf_crtc_update(crtc, 1, false);
+	dpu_core_perf_crtc_update(crtc, 1);
 
 	/*
 	 * Final plane updates: Give each plane a chance to complete all
@@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		atomic_set(&dpu_crtc->frame_pending, 0);
 	}
 
-	dpu_core_perf_crtc_update(crtc, 0, true);
+	dpu_core_perf_crtc_update(crtc, 0);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-- 
2.39.2

