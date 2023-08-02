Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49F76D6EB
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 20:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3B10E568;
	Wed,  2 Aug 2023 18:37:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927410E566
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 18:36:58 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9e6cc93c6so1358981fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691001417; x=1691606217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ggtFCyTuEyyo2aD8lzzIhWGX6dKxbHOb8aCo9hV6An8=;
 b=QLbLEl/uQmxlHR8iVmV6INvv4beTNgF4a7Q4OPRlxfF5U7uhwj1PT+iqvVimR4o44H
 Ns/gmcd5wo3/G3ElVpDG8PEJqLKqWmtuXwha8NQdxEISeN6cLYLTtP5HsR9uo5tOncID
 aNrhkhPsfsEHcqB6k0LZ20Fs7kFW2qycblOdkPxEZ7zRW4JIUBK6KpaV9ps/pR+o+lVX
 S4cmlgHV0885see7Vaxxwb10PacpgSHz77SKVSfEMkNzT6hhYh/rf9Ak6uNd2EQbU5ya
 tUPl7ghaeHvUTr9JOQiQeKWyp1kaNyX/cnJyPPEvl+RxY7AiW5HtaeXs7Wkw49jSelki
 +C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691001417; x=1691606217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ggtFCyTuEyyo2aD8lzzIhWGX6dKxbHOb8aCo9hV6An8=;
 b=Fl19Ygn/DxQT4/6rVufS4cPr+cpc8+kf8Wi88NuuWtrAmiK3UJWhTvlUI5hCKYx3bO
 fN6cGEolxLgKUIUoQR2DGOPSR14VO3ucZoAzhhSf0oMghJrkiDq7HUNRL+YdqcPBMM25
 umS8z/VNQ8OKGJIpHrKtSsjqFEGHf0ePj0pd7uCzr9WBWn4BiSZPB8fRjBVaL0fBleLL
 s9Y1BLEwO096CBXBoNOEKT2Rl/wD+61RLVEnCfmc2EWQpJ9DgPI36pEeCng8lD2woJIk
 GelEhrSUOTS9jixkchut71SIAMtANaKfvlqjO6y1UJmgicnWpVuuWXjzCYF/4MKmVq2d
 uTyw==
X-Gm-Message-State: ABy/qLbPjhHLlsJTbYucWY8cxO3gNe5tJxyrwm4Q5Kt7ybfQpWjkNW1b
 STlKKLauMctOoNaNTzoWgqd+tQ==
X-Google-Smtp-Source: APBJJlGHXsO9Auj7Pm2/sSXEJZtKvS+/HI/5k/EH2ksctqq7fJ1e5OYMMFyIZLfmOoWUjvAVzbV3RA==
X-Received: by 2002:a2e:8812:0:b0:2b8:3a1e:eec9 with SMTP id
 x18-20020a2e8812000000b002b83a1eeec9mr5699192ljh.36.1691001416795; 
 Wed, 02 Aug 2023 11:36:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a2e3a05000000b002b94b355527sm3682821lja.32.2023.08.02.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 11:36:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed,  2 Aug 2023 21:36:54 +0300
Message-Id: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
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
Cc: freedreno@lists.freedesktop.org, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
This includes the common block itself, enc subblocks and some empty
space around. Change that to pass 0x4 instead, the length of common
register block itself.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Rebased on top of the catalog changes

---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index c906b6864b5e..f8d16f9bf528 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -283,22 +283,22 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2bf9f34e54c6..3b5061c4402a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ccd0477f4877..58f5e25679b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -286,32 +286,32 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
-		.base = 0x82000, .len = 0x29c,
+		.base = 0x82000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
-		.base = 0x82000, .len = 0x29c,
+		.base = 0x82000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 2b2e9d4800f8..1b12178dfbca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -305,22 +305,22 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 833be1167499..f2ab02d04440 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -320,22 +320,22 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
-		.base = 0x80000, .len = 0x29c,
+		.base = 0x80000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
-		.base = 0x81000, .len = 0x29c,
+		.base = 0x81000, .len = 0x4,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
-- 
2.39.2

