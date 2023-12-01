Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CD80150F
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 22:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D162F10E963;
	Fri,  1 Dec 2023 21:18:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F6110E82A
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:50 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9bf8964c3so34686061fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465528; x=1702070328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfjmtjuYyUGetq1EYOrQqqOBHzCj2I72tnhNE0aTlL0=;
 b=zD4CeE6Pdt1McDglnKy9EKgicasdYPPgkrHaoP+xp/XpLLsQOR/1IDwfYmlAW6CtcV
 Dsglw36wjH9iafVri3QCCuKE8QZ/uEEJEnIsmKqVHD6XcGOxReB921XgOycKM2udgJ+X
 nV1Wthmmo7WzoWHOvHh+KbvA0jsQYRlbFy69SsDGtBhRtda3+jHhhL5XkmcuFzETpDyo
 iPSeNcMBLTLURJ4YMDDSB+ktB1mVsVntOKW8zmCAAJRHhxuSOKKaSUTO7B9fP9vT30X2
 lMEof2H8LgLhg29l0YAyvrayj5oENnpVpOXZGk3kVoDIO94VJW4WiAMO/2kfONAsK8gr
 2B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465528; x=1702070328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfjmtjuYyUGetq1EYOrQqqOBHzCj2I72tnhNE0aTlL0=;
 b=EuzcFRJwpO1Th/1WdrobBrJvTH5zRLvV2PbFVJcpuQtRKcu30ym+nnd1OQRmgY/OFy
 mV0GSECW/RoDUjLH2lDkEvP/wf+tJThksr4Znn/MPVESywkAs9WWquk2Da6IttTq4Ned
 56WZ1GEldY/7tt38wQqkP9zczUYy7Y/dYiTZzlP+BrsWxIr2VLDyKfzIoN5u8wQs+THx
 ZMFNPSEbKQwWgnnZWy8SMTYd0h3+p6j33oxQj7ZqqjYcmTEl3lnjiHFW2d1oK6jWUWxA
 qb/dFNb9N6o3u0bJFEeQ07PpgHbYiYsda1KMZrOcUd2LzZdbn865luVPF+iYyIGT5Fsz
 Hw6A==
X-Gm-Message-State: AOJu0YxOK7qDi28ZiZz80CqGDeZHlaFS+WRSHAPtL95woFhjIWBDkEFP
 Q+DYd5zxht3Lmmw/uDSkfNVc9Q==
X-Google-Smtp-Source: AGHT+IHE7XUe5xgiG4ivFApONInXTxF4NJgbohhfe1xx/9WzkjLE9wM/mJd731P27tjT5/ICn4YLGg==
X-Received: by 2002:a2e:8457:0:b0:2c9:c191:abb8 with SMTP id
 u23-20020a2e8457000000b002c9c191abb8mr1276983ljh.23.1701465528442; 
 Fri, 01 Dec 2023 13:18:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  2 Dec 2023 00:18:33 +0300
Message-Id: <20231201211845.1026967-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init
 error path
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
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It was noticed that dpu_kms_hw_init()'s error path contains several
labels which point to the same code path. Replace all of them with a
single label.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b3bff5..3b6ed60e1143 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1078,7 +1078,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (!dpu_kms->catalog) {
 		DPU_ERROR("device config not known!\n");
 		rc = -EINVAL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	/*
@@ -1088,26 +1088,26 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_mmu_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get MDSS data: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->rm_init = true;
@@ -1119,7 +1119,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
@@ -1130,7 +1130,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto power_error;
+			goto err_pm_put;
 		}
 
 		dpu_kms->hw_vbif[vbif->id] = hw;
@@ -1146,7 +1146,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto perf_err;
+		goto err_pm_put;
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
@@ -1154,7 +1154,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto hw_intr_init_err;
+		goto err_pm_put;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1179,7 +1179,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto drm_obj_init_err;
+		goto err_pm_put;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1188,10 +1188,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	return 0;
 
-drm_obj_init_err:
-hw_intr_init_err:
-perf_err:
-power_error:
+err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 error:
 	_dpu_kms_hw_destroy(dpu_kms);
-- 
2.39.2

