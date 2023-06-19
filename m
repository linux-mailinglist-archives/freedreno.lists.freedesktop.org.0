Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00078735F2F
	for <lists+freedreno@lfdr.de>; Mon, 19 Jun 2023 23:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D993810E247;
	Mon, 19 Jun 2023 21:25:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C889B10E160
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 21:25:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso1424112e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687209933; x=1689801933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwbkJJTXMM74g6brchfoNGizz91CpyM97OEhHSbG+zs=;
 b=amtWo1zgfvyqVC0kqzXM3jeiYTcoPoWKjvMqaW+lIyX/IJlGxB8sZHxFdK3ZcxRGI8
 HoDaJgB+kVUx1Wn0ML7jZfDFaEQiDBgfb82C77cbUiqCYW79gFHhTOCfWNaAzjBFJpLs
 6GuItL+cxDSNkMlm7JYr/ORt4GBUsA4c5eH57Eoob/WaFDOY/JwwzNS1faUOkN8nkVPk
 lOAXZyYhvp3t21PmhElEu8NXSmwf3yTpF06jmdZ8fymSgr51BCMEv89cxUGQBFVF+Hvt
 NZnVHNQOcmRUdqP5Frf8bLHyWOiHKF9Z4T5PIpDLdY2jS4aKGR0OUprMEz/5Q1JQGAqr
 L/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687209933; x=1689801933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwbkJJTXMM74g6brchfoNGizz91CpyM97OEhHSbG+zs=;
 b=XXAKUohuZBKI+E7T7nLODizODq7rXmGtCb1TuGoboQQrGtY2krHU/Sicz+gm5B6pC5
 iKDC+oPL5lR3OEJ8lYaMqHxTSEV6VRved4ojILhTwPYuxtHGfD74Kj7JD4ueYttgQLSV
 RE3Tb5OT2n/q/xJhhzVe0gy17AEhWESe58e74B5R4/mOIIphVhzsm0+ZaAn0fiKlx03E
 WA86luOgEE62aReu1OcLlWItb2Ae3uQRvFxPPJimEgitzBcCNeQYmVLUICOyw9YqORIS
 7am5sTvXrR0nDJZ0Sx1qtdfRbLa+S3/tBP7xpyns8Wir4MXSHXHZ3x81A2r5p+nmJBDu
 8f5w==
X-Gm-Message-State: AC+VfDwtfxHrCpJkmMMVghOSJvgFee0pq6hZXhxBsirWV4KgeRzTV53i
 OykS4k5C3vpikxXUhHbPB3bpBQ==
X-Google-Smtp-Source: ACHHUZ7aAnTZA1sczuxRhlo3lPwgUTPGr/SzgC6OcOWDg+I0PdJ+GdO45ZZ8KA8E8SMXkGO816KMaA==
X-Received: by 2002:ac2:5f93:0:b0:4f9:d9d:eacb with SMTP id
 r19-20020ac25f93000000b004f90d9deacbmr110881lfe.8.1687209933180; 
 Mon, 19 Jun 2023 14:25:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 14:25:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 20 Jun 2023 00:25:14 +0300
Message-Id: <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 21 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 21 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ----------
 8 files changed, 99 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9b2de5986e82..0e09e759dc99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 683602e54c0e..4d2b0409a244 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -238,9 +238,19 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a98d63f6c47c..50f857565dbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8a9bfc4af72a..0added438239 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -237,9 +237,19 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index b676819db42c..0b4915dabe7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -235,9 +235,19 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 568523abc1d0..45cda9162685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -247,10 +247,23 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x65f00, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 419624948e83..66dd414253f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -261,10 +261,23 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x66700, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ee24402bf253..72634a8109e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -471,17 +471,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_rdptr = _rdptr, \
 	}
 
-/*************************************************************
- * MERGE_3D sub blocks config
- *************************************************************/
-#define MERGE_3D_BLK(_name, _id, _base) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x8, \
-	.features = MERGE_3D_SM8150_MASK, \
-	.sblk = NULL \
-	}
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.39.2

