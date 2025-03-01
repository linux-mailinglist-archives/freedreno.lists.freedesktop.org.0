Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46807A4A9F6
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 10:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4610ED78;
	Sat,  1 Mar 2025 09:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BiXycRSI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F010E198
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54955222959so1378565e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821109; x=1741425909; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0S3CqHmaZKk/knnnYKsC2gVCXeH/ZZG8lvfqN607uo8=;
 b=BiXycRSIR1UUkuC+I7bKL2fgbUqjAsUL1iHzhnuAb+oUxZ6BsMjhMye7+4F1/CtFoL
 YvbPK86zWuoIaud1aO2HeYzVhIixh5cDRK/09X11iaCpDVR6X/qo0D+0y3VI9TX5nfId
 /1GYZfDSo7UGcQEFNXw0JYo7Tfk8iaEyFjazeWNYKSqfCQbECKVXlNBoz+FTtksw2rhC
 BootNMx2TcB5se1+Mj3CPpmni1ogY81jx7XeUHrr58RmFN07k/GeZmxPH5yoj3LHwoBu
 pAHW83hR3qXq5me8g0xUduhJ/63qs9KQvuibQNcOdg1/7eHmOKktJkbJExzxCzji/uRi
 9EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821109; x=1741425909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0S3CqHmaZKk/knnnYKsC2gVCXeH/ZZG8lvfqN607uo8=;
 b=o7o2QPjhjJNQg77Q/DAqRh5Id3bohc9+GlHGYdRra/ImE/toYlqinW/lzd3Q5TaIte
 EMSnvmJcI+fu5/bryHT7us4m4geskRIQ04OClMe65+c2f2HTreLWEdU2bBZ5R70eW05n
 9HiuLbEIuYMqvNRQkvJ6vSzFZ/EZnfOex/QcrVAwqyzIBI0QfsWRHWbPJw1hyG4OvnCp
 a88Q2nNwg2wq8PCNFnpygsIZjSwKprC26BX4NbPHx770sZJXJAeH9REg6WdzCDl4rKmF
 qFFohpYTDByvFeVvTyu9u82FC3wd+nfeNiRtD+8r4ROSybBy6xaDEj0RfaGJPGW695vb
 q7Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAQsFxoYby7G/+jC2XX9hZ3djcwf6ghPl82HcdQd2Mqr7/v4Lmi3eYFYWxLpe7JHycvDo6qkNvdDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI1BNDND9WHiRyZOGbJM/jk4/W5xSuixhRcUApsHJwUk6Pwx7Q
 FVvVAXunrMdxvYDL5GQWu304Gp9bFwXGy+29nrDf0y4xfCKcWNRFdOnveCicA18=
X-Gm-Gg: ASbGncuZFgXNpx8cuvP7P/3vVGAxdvEmQo63V4VEgcVFGOPrIBj4i098IPNW3yQV/BH
 L0sZgagvcKAJxMaz9+XiussH0QP30+0cJGyQYyNk3COEZ1dJgq0L7iSYAFWkVhOjcCYeWv2mZHx
 tGp1KaSH9HbdNO8s5o39gdM8G7fmSHfQKgMMTAizNGH+MOnOY5eUHLBp5AfFLeiKflAvksi/NfY
 qsknvPEe7o1axuJT9YsuHz1G4ivBNu4R9HRFORpdBBf/PbtTFFYblqAv0SbOCuCa0jZF/Q7jzcn
 0a9zFhQ8SPn9Dj/mAxArZQrvUiIGJAG688PiLeD4WcZ3sLUBXSYS
X-Google-Smtp-Source: AGHT+IH/J66JM3jXcQg4Hm2VzetV+is+xE4RZX/iaVVXbntv7XIHbZKu0lKbD6OmxDUwOs9xArkiDg==
X-Received: by 2002:a05:6512:b88:b0:549:5b54:2c68 with SMTP id
 2adb3069b0e04-5495b54357bmr396446e87.22.1740821109321; 
 Sat, 01 Mar 2025 01:25:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:57 +0200
Subject: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8773;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FGk4O1VHJ/AALXi9JU8E7/AS9MUo+YPgs+S6pZa0Mrg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJoUqN4knEcdJD0ev8uxf4olTQ0qPmspUIZZ
 dF+m4E+3HuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSaAAKCRCLPIo+Aiko
 1WZJB/0QBY82ZFrTQlyyCk4Fj81ctmok/eKg87Go3jbdS/MB3AXf0GlaRXlRL1cfEtEPsCDnV6R
 j5aRI23DxgzeZf6iBBgrUfsDWiWenGEC1O/MxgcR7uphZmn14/D/1D3MOZeZ+NnQtuk1W0/N0EX
 EkWd7X5Jc2Qimj9WSGRIeoPt8EZEDZy4V/ojdhJAJxytHbR5Sh4lYUhAjYnVxuReDT6l6nCySDr
 quWpPjOOb5raORp7puz5D3o2OdE+ChOhgFPv95xNijDrI7IfDsM109K5HNOhP107Sv7qH2LD1lI
 8rEhgiM3Xc6DzRL16MB3GnydaXEu/7NGgvzvIOWTYW+aWvLY
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

Neither DPU driver nor vendor SDE driver do not use TE2 definitions
(and, in case of SDE driver, never did). Semantics of the TE2 feature
bit and .te2 sblk are not completely clear. Drop these bits from the
catalog with the possibility of reintroducing them later if we need to
support ppsplit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
 7 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..400739295de5aa509ed3a7f6c82ef45dda21c47f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,15 +181,15 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
-		.sblk = &msm8996_pp_sblk_te,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
-		.sblk = &msm8996_pp_sblk_te,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..a253e0fdc556b57aa3752b81b803e84550ba146e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -170,15 +170,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..4464d4568aba0577a6f957bbd5d8d1c73f68b403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -141,15 +141,15 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..3aed9aa4c533f167ece7b4a5eb84fe49c4929df5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,8 +115,8 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..c122782ec8bd7e5ad68729c8c12bc8ccd0cfe0c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -194,15 +194,15 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
-		.sblk = &sdm845_pp_sblk_te,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..b67578738dffe1ac83530d93eb0e631f21384efc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,15 +98,9 @@
 #define PINGPONG_MSM8996_MASK \
 	(BIT(DPU_PINGPONG_DSC))
 
-#define PINGPONG_MSM8996_TE2_MASK \
-	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SDM845_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define PINGPONG_SDM845_TE2_MASK \
-	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
@@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
-static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
-	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
-		.version = 0x1},
-};
 
 static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
 	/* No dither block */
 };
 
-static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
-		.version = 0x1},
-	.dither = {.name = "dither", .base = 0x30e0,
-		.len = 0x20, .version = 0x10000},
-};
-
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
 	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -115,7 +115,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
@@ -123,8 +122,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
+	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
 	DPU_PINGPONG_DSC,
@@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
 };
 
 struct dpu_pingpong_sub_blks {
-	struct dpu_pp_blk te;
-	struct dpu_pp_blk te2;
 	struct dpu_pp_blk dither;
 };
 

-- 
2.39.5

