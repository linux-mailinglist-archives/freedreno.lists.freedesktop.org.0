Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E99A2DA87
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD73E10E471;
	Sun,  9 Feb 2025 03:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FJV7Y0mh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763F510E471
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:42 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-543d8badc30so3746902e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071301; x=1739676101; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ku0sYwA6Z9dPRMZKA3dFauq5bkh59hsd6mNrzYvKW4g=;
 b=FJV7Y0mh3m4qq1SS4fFPEGZAyc2j6M0kavaojgmD+dltdkhuztevyH9MMj4mPN5O6q
 n8l7ipJMQcJP4a+jo8MrsrsCz/Ng4BAXM0MvAMHJptwxrrGjJO+/Pez9YMG9Bsp1PQZW
 4wxM9DZ5pwLXL8omnQBK7Nhj07qV17Fiy9B5GFVdYFVV/gXHvY7v2QHMlnRA+3l2102z
 i8VMRek9RNfJ70LqAzU4ppRh57nP5RPrU/S+1D1gfVua2l+lqildUCvax8C/OkW2B9sl
 +gMONyZI/Y1MSX3fe1utAyAtMk7TUHxdqcVw65EP6LEfMAWidgotax0dqliX2tNXx00B
 IITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071301; x=1739676101;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ku0sYwA6Z9dPRMZKA3dFauq5bkh59hsd6mNrzYvKW4g=;
 b=Ccd1Ba4nPNRZdWRaUzTi09Mz3VK3df0HjadRk4aqtXsttcOgcuv6z8VFML61GzHpvh
 9BQz/SXiBAm6VhleL8GvcBWjvkICaZUTOt9lkV+9xeq/SVp4mIDmZQkt5zZQXumh9APl
 rSrvOESuyaSob23g7o97SKneCGgO/g9Iy37hstmYeR4Rl+x7S273hMIXF+79sFhfb/oQ
 6AWEodskGtPH/BtMikPUUOX2Fr6lVOiBgoYGqzfrvtrnIG3Ie7RsTRUo7Xjd6maVDS5w
 II/PBO8C1/8cz3gnZ762Z+QkAVc6qmwkt9W83e3uMfPS7TBhkJL5j+SQdTLVIWL76hzh
 2ptA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDkaL1uQI0arUVK7Lgi2UWiLmdLZtGRZcObFfTPOLb/Df3uZzREYaX64qbabS36Rj92veAtIN+1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmO5EogrKBnNa876vw99UEZG3vR8gI0G/Om8w4wYCUoBXKw4tw
 FgkNrkMSOBXq/ZZ4xh7ncvMS5VfiPu826ufwLDWmz2+GuNK+ARmeaNqS1E7pGho=
X-Gm-Gg: ASbGnctFeskWKfe33RwO5sLucN1U4LdwXeMUpJvodXtR3JK5k58Q34z+lWUiSuqcONV
 IOygSVaw1bACmSy34tepIjdf72ZofT6Af6dHgilPerMiqoWT+KWh7oIpg1m1zujXsWKLF+zq5pI
 Sb7OdoofoK+Om6wriFYTEVarGeXhhFafSiILA+9bYSRmUIv1zAwCF/iXEr99OAUR6nR7d0FM/qF
 qYhaaSeuv9ryTJu4NaNoh+C5pAKHv2WimTY1m4wZgNOqSG1nWD5Huuj3jIAg5W3M4Rg9JVfwNBz
 JBNMWvUiuAXpQvc2Xa9705s=
X-Google-Smtp-Source: AGHT+IGePwGd1RebmPrp1HI9qS1UxYaPhesybFi+M1gkvl3CAIFaQZZ5SKnQHqSf6VHb6FtMneT2Xg==
X-Received: by 2002:a05:6512:1196:b0:544:1407:4e9e with SMTP id
 2adb3069b0e04-54414aba30bmr2620571e87.29.1739071300792; 
 Sat, 08 Feb 2025 19:21:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:17 +0200
Subject: [PATCH v5 7/8] drm/msm/dpu: drop core_clk_rate overrides from
 _dpu_core_perf_calc_crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-7-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=emVhsAcPMXJo9jthW8kjkV7unV6UYdXutY3krP5kLuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8xGtaeqDuQnMeiiB+yFOQgI/3mzcHxIa549
 qctshj8PxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1ZTXB/9tOXIbVITqUa0mxZ8LeScVG3PhyG4XYqZMYA31A8WayXVwL0iwO4z46BRMll56qDanQZY
 vb7kMze651Slxw8udpY5UsFJvTDGor82C1W2cOrn23AIYYTyx4p1uktvIgN06ADzBIoLCLl3B9r
 QoWqHsI2sea/zc/1Ezwl61bMm5uNGVAjH4FG9qKBtUEKg0V+iEqnUHx8gGPWqRmUMWzSBIBGUZe
 1eznQ8Q2LXrzksspjIomR4OtIS9+1C+mJhsHxUK03YchuANpWIA+QvjgIN4dvGID4+AfTwHBoV7
 00E2/FtsbwAWf6NxIVsI746DRodAdkR+3tXTtCHHtzaMZyU6
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

core_clk_rate override is handled in _dpu_core_perf_get_core_clk_rate().
Drop imperfect duplicating code from _dpu_core_perf_calc_crtc().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..c8e20be08aa83c8bdd70065643b46676eeed610f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -123,16 +123,14 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
 		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
 		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
 		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	}
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",

-- 
2.39.5

