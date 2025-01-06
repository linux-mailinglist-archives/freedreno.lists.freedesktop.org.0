Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D08A01E69
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 05:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D310E12B;
	Mon,  6 Jan 2025 04:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/+lFLDf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C45310E12B
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 04:01:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-385df53e559so10980403f8f.3
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 20:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736136053; x=1736740853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yM2i2HYStAdSWG3sjjBGG9Ljxx9LDMbO6ArSQ2Ldm5s=;
 b=j/+lFLDfnBAW/UtVgAVSsRlFNfTYpFi4+lg/wwmB2cSySApnVmHVqj2GlrR7WwHM4T
 rZ8FoqUIDU9J/4Sl3y5+iosWR8pcpaM55BkBZOcACgFAZkGv1fUtYj5dVXgofRvpAC0B
 XFoEozDRVXy7FSN4sNwfOJuEf/OmM/YnIb8p3d7Pyr+1mC0Hw2xlepPJ58fMHtPkSVEs
 JZGD9XvIAcnbmFF5TAhSedNmBiSNaxbp4nJ802PZZaeh3qvbAdCO3w6XrwAtjOfbIGV5
 lJGD9ngnG4YsfZGvYfW6r3GLY8WQ/6JAehweykWjiusAMIHIOatBxQUZmZ/fOHaXP91U
 bPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736136053; x=1736740853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yM2i2HYStAdSWG3sjjBGG9Ljxx9LDMbO6ArSQ2Ldm5s=;
 b=oQmM7VF4GdNEWb8tqeMyzf+z+zvPeAzTUEhY6J3rBrXwQZno4IzegOicFN9oBY0CEE
 OT6FWTPw6xf3OP71/70+H+/9HUt+rAolS1lbvfFpv8OvyGIMNr2vjts1ZnEYzXKsg3q7
 bdg+txaceQNESb7U9tvgdCQFn0paAQeqQx1/z3mVPpqm7w2HDgKcp3uCkYX/8m8pJ0FT
 KRKVFnZIadJBvAdzTaU9RDsd3T4B3ur9Ev9YBWg1MhnNDeOg8ha8r8MoVE/gD5qCSwMa
 ROeMm1cFFaR1h8VVOjGNKAqtJjUV/BLNEh/Ndz979nyfqw7w1x8WlA/MR/5IfDPPk70r
 rETA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg/PqwIYR5QS3PjzTdZTwH+ar8kRTo8lVgg7I4SMiUKjkuEXqzE1llpDV5VC4MIGLh8NGlfBPg1EI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy1skiPsVaRMHt08AV0V0WMS/D+wJ1HIeKWYGbDgmUn0G6X9yw
 sx3TuSc4lAWOODW22K6SbW4iAWV0r67uVR0UL4yMWg6izOWGAzRexHkC6mmRAiB13dYDC+qVZDE
 EPkE=
X-Gm-Gg: ASbGncuOBh+sY0cwFTHvp3Ee4MC8rnfYcIbL82z22VCE0XPh6oK5RCU1lP8x2v634lZ
 R6wQRQBcoGb9aJhBY4saDIYmMnonLybnf6hVpQ/isZs8ITnQpY8JJf99G8QyC5noC/lA7M5KcXq
 lKSD6wLEKkTV9BgsP0VNfhGBfbM+YiWIrzD1KMYCXeAvkwj0ZHkv7Bitla6PQBtuz0a/91JHSQd
 a+h2UM2816iAaIuNzE3PJmrBmHJyZtIp3IKpvIN7NcxMaWQyaUtknxXn6xn3Kx2
X-Google-Smtp-Source: AGHT+IHioDxU4q4Pl3d58Vp5gu9z+6/Xod18Avh5lpeGfTJ9Hh1MCjsdaanLjqQRRYfO3hUvefwjJw==
X-Received: by 2002:a05:6512:68e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-54229530300mr18509766e87.22.1736132877544; 
 Sun, 05 Jan 2025 19:07:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:42 +0200
Subject: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6299;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8ApQQYwIW4aOZjRGxNwryHLmbasSwJB0LRH46YetCSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5Mi6VClvRmq3zBh2lGjncCTcohiF8id1VY
 3G+z5EHhJiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1doBB/9tSmBOB2fTQ8UKjU94WtOgR8MaCSQI1yH2JjRw0MXFSQYgNAgrnVxeDme0r1bAkstEzmU
 OHj4o2R2ou5UZeOUXR9gv8j9YlHVOKCq+lCWDMqhhux7mhv7qzx306dvzEUeXLG/Qm2pWbLsqP5
 LF+CKjP+h2cbTosVH9n/rqKf1OA8NjdgtUMiIeG97BRIoyCZsjlcgzGOMOJe/jcfhN+rrSituot
 ssZ/ou8JhNR5Skg9r/dH/iG7Y9xHCnv6T5m1D8nmVrQ38iKcA0cn3kiYLrhwRyF6WMr1WYBsUDi
 jVYUYciUTIGtGPmX7x5DWu8jOUZqg5aVqM97IpREUAcWpFo4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently debugfs provides separate 'modes' to override calculated
MDP_CLK rate and interconnect bandwidth votes. Change that to allow
overriding individual values (e.g. one can override just clock or just
average bandwidth vote). The maximum values allowed for those entries by
the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
files in debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
 2 files changed, 9 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -17,20 +17,6 @@
 #include "dpu_crtc.h"
 #include "dpu_core_perf.h"
 
-/**
- * enum dpu_perf_mode - performance tuning mode
- * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
- * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
- * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
- * @DPU_PERF_MODE_MAX: maximum value, used for error checking
- */
-enum dpu_perf_mode {
-	DPU_PERF_MODE_NORMAL,
-	DPU_PERF_MODE_MINIMUM,
-	DPU_PERF_MODE_FIXED,
-	DPU_PERF_MODE_MAX
-};
-
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
@@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	if (!kms->num_paths)
 		return 0;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		avg_bw = 0;
-		peak_bw = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+	peak_bw = perf.max_per_pipe_ib;
+
+	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
-		peak_bw = kms->perf.fix_core_ib_vote;
-	} else {
-		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-		peak_bw = perf.max_per_pipe_ib;
-	}
+	if (kms->perf.fix_core_ib_vote)
+		peak_bw = kms->perf.fix_core_ib_vote;
 
 	avg_bw /= kms->num_paths;
 
@@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+	if (kms->perf.fix_core_clk_rate)
 		return kms->perf.fix_core_clk_rate;
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
-		return kms->perf.max_core_clk_rate;
-
 	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
@@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 #ifdef CONFIG_DEBUG_FS
 
-static ssize_t _dpu_core_perf_mode_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	u32 perf_mode = 0;
-	int ret;
-
-	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
-	if (ret)
-		return ret;
-
-	if (perf_mode >= DPU_PERF_MODE_MAX)
-		return -EINVAL;
-
-	if (perf_mode == DPU_PERF_MODE_FIXED) {
-		DRM_INFO("fix performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
-		/* run the driver with max clk and BW vote */
-		DRM_INFO("minimum performance mode\n");
-	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
-		/* reset the perf tune params to 0 */
-		DRM_INFO("normal performance mode\n");
-	}
-	perf->perf_tune.mode = perf_mode;
-
-	return count;
-}
-
-static ssize_t _dpu_core_perf_mode_read(struct file *file,
-			char __user *buff, size_t count, loff_t *ppos)
-{
-	struct dpu_core_perf *perf = file->private_data;
-	int len;
-	char buf[128];
-
-	len = scnprintf(buf, sizeof(buf),
-			"mode %d\n",
-			perf->perf_tune.mode);
-
-	return simple_read_from_buffer(buff, count, ppos, buf, len);
-}
-
-static const struct file_operations dpu_core_perf_mode_fops = {
-	.open = simple_open,
-	.read = _dpu_core_perf_mode_read,
-	.write = _dpu_core_perf_mode_write,
-};
-
 /**
  * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
  * @dpu_kms: Pointer to the dpu_kms struct
@@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
-	debugfs_create_file("perf_mode", 0600, entry,
-			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -24,20 +24,11 @@ struct dpu_core_perf_params {
 	u64 core_clk_rate;
 };
 
-/**
- * struct dpu_core_perf_tune - definition of performance tuning control
- * @mode: performance mode
- */
-struct dpu_core_perf_tune {
-	u32 mode;
-};
-
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
- * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
@@ -47,7 +38,6 @@ struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
-	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;

-- 
2.39.5

