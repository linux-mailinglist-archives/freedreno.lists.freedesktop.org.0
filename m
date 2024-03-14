Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AC87B608
	for <lists+freedreno@lfdr.de>; Thu, 14 Mar 2024 02:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B0B10E8AC;
	Thu, 14 Mar 2024 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uhzr8XPQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134110E6D2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so5183421fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378648; x=1710983448; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t+mg/QgGY9aZHLSlX/LvtBL3FjmiyE45LaEWnMCzc0I=;
 b=uhzr8XPQikc8uBZtaWawUieDSo0JQs07smx7usPUnVjHZS9KWzJ9wkKI4G12Iaj0HJ
 NbuonXGWjZQTcA86HYjj14plNsWmESmdHGI9OupCwlBEmTWIDpX9bgtRM/9Y1cvzeFr5
 mTCoZYA5l20wK1mrqDdR4pVWZbt6nYTy1N20OFNWKMuwTZZ+hUpnFXmR+FHnFDc5PWl5
 t7Dd7O9vQngwBXIR9pLd41tLw51R6s8epML13cy23dUi7yIVic2/RO1B3Uu+OQNaYiaa
 n7IDz4kozu+cOXs0e4tCwKYvtSpg0xKBtBnHV1OOwS/HthWoCPypAIagkuuhuBBB1Z0X
 oVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378648; x=1710983448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+mg/QgGY9aZHLSlX/LvtBL3FjmiyE45LaEWnMCzc0I=;
 b=e1ZiAzsrvufg+4ut6Dn30BLGBqsFl9CDzgFKHBYLe/lvyQdN/Z5/0jQxuctLUjd/1D
 YwQEYwoPDdUTjlx7xXj/cNmj8PxNxVoJdbJhsUzSC7AygKMsyPCbsRHMZIIY3SGHn3C2
 AVjoMdmw3fk+crZOe6MN8zsbEArZ3fwd5I1L01ycGwhnwkLhKayIoA5nEE380rRQPFSf
 FxkT9BRAbUaUoSpCY6Bl9Q6w/tUqS0W8Pl71nTTQVGBBzkzjN/Wal0xsuALIrSAjdKvS
 /jx6A5YUN3L9y6EvM/xl4akOPx1esDNJMxPLgVhDSZlmLA2TR/zodxAu5DGbIMI0Fv2F
 ckMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU645w5jzGcTgybuaRJAUhgCcsS2fTBRg8N2O8x4gPoLrtHNC+BzT9Xnauz1MbIznjih2bN3pc6oclM6+JDicJXEUV76KuYVBNYzTOTuw/U
X-Gm-Message-State: AOJu0Yyn3BFVbm72Lv3sVRNDQWKIiJeLGU0DolM0Yf9jCU5VGMB1nUvW
 G9zc6EZx7rII+RGNv8jEw+T9cnkQ8eRYWuzMgQqefKmJ8OCpUxwhGwfDUIQh6AE=
X-Google-Smtp-Source: AGHT+IHBe82yWu81fztcxeSaXu7xVdPyduDpAFU3wzVXa2k2jd69py2qrnLPHlLMY+WKqqnY9ZTvKw==
X-Received: by 2002:a2e:9c07:0:b0:2d2:eeda:c019 with SMTP id
 s7-20020a2e9c07000000b002d2eedac019mr128385lji.28.1710378647800; 
 Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:43 +0200
Subject: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=thk7wK1FydPIdoBcFyLFgX//qapGQtCBVVmk3tJhOWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6ScKobsIPOE/hOw550JGULOX1nrrox+Dnov
 CdrJ/Ys+TOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1f8JCACr/qopx9NwwqC7LgXMdW2hItrEVb5W9z3cNXNh3so9MAaCV0oldYq6/rlgHUzwjYaBBzJ
 atC7SM1afc56E5BHWLyj+2NfkXNGVunm7Lr8VxJsAW09ABAZaT10aDEHbTWBA4igCWO21uffIvs
 Iabcf9CzR0a2plZaBiiU53p2/9iXHkrEne4BNykBunLXVdniMnWu6FbEYDOQciWY9RMG+IzMmRC
 6oIq1ThDUdCbqQpgRKLdWB8NULAEunTVu5ZgZ95j71LvTOquQCd7MHmzjN8bqt0vh7S/8P0GBg7
 undfAeSrJClKMOotZjNenQe8QNl5IXy2jtK9z68aHAuxOrPi
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

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 87b892069526..ff2942a6a678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
@@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }

-- 
2.39.2

