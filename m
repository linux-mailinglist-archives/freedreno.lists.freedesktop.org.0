Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F37BABFF
	for <lists+freedreno@lfdr.de>; Thu,  5 Oct 2023 23:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44B710E49D;
	Thu,  5 Oct 2023 21:27:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15B710E4A0
 for <freedreno@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-505a62d24b9so1786855e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541231; x=1697146031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lkSHeqO9Bom7EjeP/DfvGg2iy3weXU2vvyf5P5euXQ=;
 b=ZY/dSnuZkqO6Kvcuo8vnLW/OLi8HhbTiCvCYYPJsjZH9zXdMBO4SZoT+403nLYyPug
 tvYfc/+MtVlm4Mvuh1dtUpm9TmkFHuN7+hWGAIcswJQBfyXwBI7xyxzDQBomnyJcEHk2
 PrWxss3bXiK4NAEn/cEPtNlOv9Fjj6KCIOer15x2PgWotDJkY/VYtGrfeZNo8DMudPdb
 679AHkEc42cijjk3jf/z75m2Cbc+ka8lQw9WomIQWm9Lf8sUBSn/b3HLwpN4mN+S3y6T
 VHL0yHh3Qlxe7+5BGUGHBRnMPBFhwRe+teb3kG2ekUTQa9T1nCG566pKBbrO9wtaj99B
 JD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541231; x=1697146031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lkSHeqO9Bom7EjeP/DfvGg2iy3weXU2vvyf5P5euXQ=;
 b=CUx0SIDDpokI2CC/2GezAr79LuWsVNKRpqQpl5QpVpdsOpl3T1eH/FeyM5QVo/OH0d
 /p6kz7BOlN0NTNu3uG+DEN4FKLOlKtlaF7Nfgc7xAFFVLczIUXVTvIvrL/P8zgz6mhNT
 xu5JufqZQvEOFgGZdxWxOlPNTsUTsrkps9Hedko9mJt5cXtmRl9nIQEyuMyOxJNMXsgn
 b7P6g2yZCqz5ePjbF0kxBdxcjxP7SXI549QWGAnGf0RyDY9dpSgEUQr1oqfjMdbm2PVz
 l7Udqueb6EF1VKV4C9B5kR7TmI6L/SCQfkCpX08okXvA24ZdG5qaeq7WaLrK8Y1PaWHv
 e+KQ==
X-Gm-Message-State: AOJu0Yx35sQ7FFIDX78jJ30anHjnyXS7ZDRz4RTlkHLL3RHnb/I7itaY
 NAvoJZiZ6O02EGkT/WMpN4Ks5DdrTuAm0nLoIdE=
X-Google-Smtp-Source: AGHT+IE2BN+Bg3ZNk0p35bPEQMMk8lXTcIPMgGO+w+EIzxW9lcC3BzXaocpuaALLwJm9MGvGGr4gSw==
X-Received: by 2002:a05:6512:1289:b0:501:c406:c296 with SMTP id
 u9-20020a056512128900b00501c406c296mr7757598lfs.31.1696541231039; 
 Thu, 05 Oct 2023 14:27:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 00:27:03 +0300
Message-Id: <20231005212703.2400237-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 10/10] drm/msm/gpu: drop duplicating VIG
 feature masks
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

After folding QSEED3LITE and QSEED4 feature bits into QSEED3 several
VIG feature masks became equal. Drop these duplicates.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c        | 11 +----------
 11 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 047dd6d4f5c0..7e43b1b86227 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SM6125_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2aa4c792b306..eb80cc127f53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c5687571ea6b..07a0cda45766 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index f9e4ce9d9f2a..4f602a95ced2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 46d6eca81eed..1d83db69ae97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a8a4fab22c6a..d4d783288bdd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index be05b7ed2013..d18f753febdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ff6cfd612f7b..82aafc67125b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 04d69182ec64..43827df36494 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 860feb9c54e6..fb85168be3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cccafee33825..5dd227f53d8f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,15 +30,6 @@
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
-
-#define VIG_SM6125_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
-
-#define VIG_SC7180_MASK_SDMA \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
@@ -47,7 +38,7 @@
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SC7280_MASK \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+	(VIG_SDM845_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
 
 #define VIG_SC7280_MASK_SDMA \
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-- 
2.39.2

