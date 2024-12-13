Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B69F1898
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0A310F10B;
	Fri, 13 Dec 2024 22:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b4Rf8rU+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003ED10F10B
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:46 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ffa8df8850so21884111fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128145; x=1734732945; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VsjNnmljiQF+GcCGHlt35/tGu7gr38B/2X6Hh1KrGkk=;
 b=b4Rf8rU+ULDE01/qA2AP0Ea2emET9g9sAbaJaisqAlSVNXAXzwDJPUyNg8W7kqtkfB
 WeAsKF0+KrTxm7wZ/cLwZIW8FLayQlaWMVLePedUxGv3CGxH2Az1vYlBdztYqCQooD3D
 54cAe6wfAZ5BpgL0h6NbpNkHLT53D+veMwJE14frLeYjoyLmoUNK2caDOVWQA/WrrDQ9
 r0RZcSRmpvqBxkk0IUi7OBePmYNpeegoeNIb6xrsS6T9d37Qw6AkEzImKEQvt8t1Gu6M
 oiSotubrD0oZ6yR7J5EOPEa4AZ3B2b4Mmb6UG+SBSoNSH0T3xpC/6XJuNzJGppiageWP
 or7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128145; x=1734732945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsjNnmljiQF+GcCGHlt35/tGu7gr38B/2X6Hh1KrGkk=;
 b=O+6w36TPH37vmUY6NTj7NEdU8dNCSeGliMbkg9pl+0EFHZ7lpJjjTtX277ESnr3cI6
 BKxjRDQAtoeQ2dEpJSOGhsyyyuBhVvkMsQEWf5J8wuQnALmUE8DfRj9Clst7BFUOAXMU
 Z7rZCnb5yJO1DNsHRSYJDMmETnZQkSCobvlcVAGt3gUe0B2Upsz9B9Nl/3rh2M9Moi7z
 QrQ/SUS5NQRyKXy+FaaCy4FeKv/QVsV2u5SjfJwD7j2hMnbTmq8j9NPLAHtSf+6juFLV
 tQShbcziTNkFXS22EVvBWjLs9vNtoif/xvzW7t6woLV+oQpFH9FeZiJu2NoxiGSdP2FR
 wgMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2vJsJskV2DUDkVGa8O8OH7CNfXkuTphqCGYDex6baPgD9L5YcoMK42SnJ+OqTMeeSeAWymBV4VDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyn41TnXGnRhK3f/sa/4K8hDVWFbfPDa4kXNAnejMEdeFzw957
 +GoTNjVE85QkSy1LdVwW4cPuqsG4kaf/U5+fm3VSrIsYhJ3C2kzNenOXSYBM4YMWqvuxBNzIDEU
 JS15X+Q==
X-Gm-Gg: ASbGncuEf+JqxINK+KqT5ZzovrXr4Lm5GBlX/gHESxMo5dajdVYQI/tfQZ8/HpnozDb
 /s1nc4Zdliv9WJmzelZ+0GRcREJLXfCN7UDd+e2YZvpIIAWKkr1aH4IYec0A7FIqOLt5ysS//1f
 tb+QjKP9m39GwaqgYXF4FBC7a2MuBxv5vb1XEZylExeP9uiQjDmXUVaMFMiU5O9j8N0PXMWzay5
 pNXUN6U4qIpAofn4k6c9KhNC0wJADXG5/cy/5X5XcS1Npxcz3ednQxB16U5DY7B
X-Google-Smtp-Source: AGHT+IFMZfjmEJV5W0WCXtvr7uDBeIph4wB4DN2OZhi0OWGLYJLEPuk1nQeHx9m9aZsGGq6wMJ12ug==
X-Received: by 2002:a2e:a546:0:b0:302:336a:8ada with SMTP id
 38308e7fff4ca-3025459b71fmr12952251fa.27.1734128145067; 
 Fri, 13 Dec 2024 14:15:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:46 +0200
Subject: [PATCH 30/35] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-30-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qthUBE7GoCVMQRQrvEIyEs3ZJm9i1ATpjMVpiF6u644=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHI0Od2Dd/AFSAIFJgmX3MpHf0GiK8Ipdd+1
 WD5XGItjWiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1XSsB/9H/1lvDw8XN2RtXXyn0dWDJ8RtBRCnnhaKyPx+2ybX3shrqNEs4F79olIbIFKSOUTcwuC
 5j2FwKJShpkyXh65wpZ/cg+rfRajyUmlsazlHUwmciQjcZTQM+cY5R2oeuXVZcr1d5pBmkHmZIM
 PcrvHxuHzTymXQ70ex2YGDf+mKwaIcuIkP/+j3vNdVVKGbMOVJIcwEdUoFFgJtiMRtnYsuMpDRz
 pafSmYIBNyQMHVJmO144MaX3mt5CGtwjSJaM0uMbC08Ifk928fW8HEHwiQpbKgRqyknG8I9QQP2
 ABaQNCTBURaRx4RGUed6v/4LZjPdl5P/j/ONveG37oY7EoNv
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

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 45428cf6305dbaf23929079c62dc86de5f5765d1..93d1d64fca3c8a68493109c954896b0fdf2b4ff3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1d067fe8d9b142465115e1a63980492c493686cd..915c4facecb2220fe73a1b44cc60ab30b56780c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 39e0e5790a9a4867f12866d7fef75f9cd7adbb62..78482b42c5f790a84587a330ed7eb160c3a2d06d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 550cc06775be8e8863c29cc2a7f4ec2680339faa..20efb6313a4b98ec835865535dfb67de422168bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 946308eb7a88c1604b152ff98cb27b1766a76718..8b050366e9209fb6761e9da65f0fc2e764abd996 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 2d7e4bdd84705707198c3b265a003630cbccd28a..178c5440a9f4439b3e53719aaafa9458e353e58e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

