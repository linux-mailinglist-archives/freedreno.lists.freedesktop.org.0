Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C3A01E1B
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4C210E566;
	Mon,  6 Jan 2025 03:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EFzGwyxP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73CC10E566
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:15:36 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d84179ef26so167700a12.3
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133275; x=1736738075; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BUBRF+7dphUIBvaHeuE5P4CwKEJFwHHGIe7GdZDUN/4=;
 b=EFzGwyxPdEn93rztYJorHCZkuBccFw4iWWnpEOBJ24pi2HJW9YKdrHS5Kld26VVTK5
 Mjy0+sUXLQkvSlaz4AI1+zXsBHysBaN4EsKxK3DRhuiALiI4YIdAeDAnRx7JcV4EVAMZ
 CGkUx1uK6u2o6HxtghH5tF8Yu21oEQdcKwilHr+hLPcZrmd66Dv3Frwo5uHpmitMdVQA
 SVlH7E+o2Rzei2he+P/QJvL7nP5bjWR7v/3+vJEMWHDpnFTRcWe6KRrUXL+huZr+wCYg
 PaILESLvgs/YOMceVvzBLCLAcP/dGAwWumW336VDtE/1xDI5ScC5Mn9tjHiKoPgYZFPz
 ZkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133275; x=1736738075;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUBRF+7dphUIBvaHeuE5P4CwKEJFwHHGIe7GdZDUN/4=;
 b=SazunvE67kJpgxhqdflMmdNy8rFuKw1cJfy5is9aTn0AXunnTbtFvuFsvl4fX2jS6T
 0cP6P6L+tVtsA6nme591n0xpXZ7EFmWxVYdhmTp/m56scCGI7W1T8019P8mU56p1rpX7
 DM5MODf8hBPo6k1g3SgMV8D/W+26LKMsDn3/WkCYAuAdFqJG9xKEJUqQawgbtB1rCgXF
 mZeRCGID6SY4CIzUxnH9HY0nxGa1zMEJ6vPKMr00eO7nekqLXzynkDz+5NXaaRJQ65Qs
 U9S9wMkBxOXcovNYChl/Dms8YiU/oJFVJIoTMLjgr9Hq6hPwGjva7m8kVFdvvXVtIceJ
 Fb7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE/mGI/dyN4XA4RKTNrq0XXSfR1+ZdHbreIjo+0Ee1YaP+xhGFUV+bTkIJdfu75c8CKDnZZOIm4FA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEJrhgvJSs0KrB9ouzTCOFqGbLqwVu2s5iJmaUP53wxoU+usuO
 P/Bxm5U+aq7JsZ+iFloSn1x2VvWKOVup4YsQuJnoHKlyZurpGJkVK2PH3Vl8zqVuHqKyYxdZHKg
 NqoI=
X-Gm-Gg: ASbGncsnBq6kuIMC5CLez0VYkJNiJkTOvtPMY23VHihEyHcT+T989FhKIAB11wmcwu3
 PneRJrZk1Tj2yVf/Trt65Q6B++sVgeL1otRkrx2Bd+TBndBYXwKg0TDjWR3LiHzfjy5ijhcuecM
 +5NhC+a/sQF8TEyaDBxe5ElHcLVGpABMn+JUO3XRD9sDWNPFyYTjrPVzD4l9i9JTFcjfnxudNtT
 agBOTdYcBGQr6MHXh5MEs9/p3tXlzRhc4U5/fkVvj8nDPlxaNdfhdz1oX5Mv55C
X-Google-Smtp-Source: AGHT+IHK7ZCjCmaBz957EJ1YPzDsKQb5wVe2PN7c1gzn1PSJw+qSdoYIjT1J5sq1xrC+jKC144tETQ==
X-Received: by 2002:a05:6512:3f1a:b0:53e:350a:7298 with SMTP id
 2adb3069b0e04-5422953ad7amr14156586e87.25.1736132876085; 
 Sun, 05 Jan 2025 19:07:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:41 +0200
Subject: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3204;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pAykJVSPbhOX5dwvl8G/jrVUqtiroa+GlHDm/8cLuCk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5g8KcjDuZJxWzkiplt1Kts7LQtp6hMIPNC
 pQOAdjyzWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1ePCCACRGyNBo5mLQxszxR5CuVNLwpNnrpdcVa5Xc8QZ9DQTFn8Xp6tc8z/ihv0E8VhducssM6Q
 NY/ziole3EI3iTYOmbeLbE4yDXI0Hq5KIuvlVslFoWBg32IXQj9xd/7Pm9gqkhuSXCRFa234w23
 FLXfwYSc+P+xI/ks0i6RYbpaLGnWi+R2PVR7xTbmx5ILQM0R0jtwTmV1v4VEvkNUVG+f8YMpi8M
 G3mMBvOd1XbR0om4c+jl9xp31jRJt+vTe2TPL58+xkfxaiFzTiQavjmkuCI/poo7Ru6xqcS5rtL
 4wRxIeeoNy6ZRF8flRm53V/vYs3VFmbxjNJzt9tk2xQcQspx
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
interconnect voting. This better reflects user requirements in the case
of different resolutions being set on different CRTCs: instead of using
the same bandwidth for each CRTC (which is incorrect) user can now
calculate overall bandwidth required by all outputs and use that value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-	}
-
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
@@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
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
2.39.5

