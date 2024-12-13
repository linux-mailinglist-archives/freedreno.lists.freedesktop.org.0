Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A59F18A1
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73E10F10E;
	Fri, 13 Dec 2024 22:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pTJJ9EpL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E0410F10E
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:56 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso25602901fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128154; x=1734732954; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2oa2F6Om6f+iayhvrpdTHMXhkfRss8voyhoEtcZ2tCA=;
 b=pTJJ9EpLNfJ6frLbZCBP1DXt0UYBotP5gbxf7OeY6APAPvvMdgbRnQW2y5E6yWlR0x
 Gjd4gP9TzSNt917stdJ4juR+TRsqKRZi9PUxJs01rn3o1Sw0CJk4T2ERjQ3cMyIigaQm
 QOZVZQOBcPourwBLdiMCFRD/LJ+68PRaC4ZN31nHBXd25rfnEBHOnVVkxcKyAh7UH8aF
 9etEo6SqxHZo/6v96AU3NoAiOr8WSJ6t/qiYug/tlXNu5f9opVugailla3rtBMPRAQ++
 NaSLyzEhYeHhyW/kNjL9OP9OuDyfpOqlEHjRDtazf7nee3+BRhdx36foDdAzAN2e0Hiw
 w7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128154; x=1734732954;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oa2F6Om6f+iayhvrpdTHMXhkfRss8voyhoEtcZ2tCA=;
 b=mx7tLRXW0Dxtor34TupQ0Bx8jZoHVyt7fDOJYE/0gHGV1FNgTIkZxSMY31T6x3Z7Pr
 GA0LCQFkUVGhB7phdJ3yF4x4GB1m1XCcCg44hlLdpt+Th7Z9ffDN7IBMdqq7VHYzk83k
 hYvZKnxw9IMi/JLlgvVhYv4PO4tF111Tx2qktJdmpw/OuTLCQdHQM7mnrKlrXvP7guvK
 GbqeT2QyuDxUNb6qY25xk+OefwJTY/1uUgo2x1ved1M8E012CJhOqRpXp8NNroo36YGN
 +cfe/4slajYkH200OLakptMIb8BHJqqKiTeO0FOHlqSC+bFL7jnwS3op6LbicCFHa/7/
 C7RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1Nbd4MbQLLDkGeUOHcc6wuix9bXAkooz9KeLfrak8Q5Y3l5csz3f1DUcm9UCXh0IUtsdfkml8nY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeOez5yZCAX4ngoGfYN8FDw/gJ2ZsuAeAE/FwrRKgUJn13S1z7
 ediCIZwNL0mawQCz/dndaRA7yxP1r041Vwe/QQCkipd9csbh3alWAtAr7nukZ2d8CkQq8uBjFtt
 qWtTkLA==
X-Gm-Gg: ASbGncvTT/V+FT6OXPUjUJIncvn7dHX+enXwfrKxg5d5gcmw2t0i0yl3rNLu+SfoaCn
 1bBBj9541jNA8pIEX6icHjVrs9e8wG5itO3bitHBRy0k7mc27bq1laBqj2KbZJueReiley+OMqx
 FFFWC7G6WI29nXicbnt0fzOs75syPTaGB4wKSGFne6RLsXCHJnpwS9PTxC/koDVBEY5VkWZyqhs
 AdiUITAZqPe4o6ZND1gzk+zc0w8ZnSQXikdh3U+IpJvEu7RtLe6Jchrhct7ckcl
X-Google-Smtp-Source: AGHT+IGrZvLOLjgjirwfSjLZCQR/VtLFb9aRo6pqc3/KeOlVBAwXV8XwmBKX+SleLsI6o1tkOe1oxg==
X-Received: by 2002:a2e:a989:0:b0:300:2d54:c2ae with SMTP id
 38308e7fff4ca-302546115demr17181961fa.27.1734128154034; 
 Fri, 13 Dec 2024 14:15:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:50 +0200
Subject: [PATCH 34/35] drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-34-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19053;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+r0yMgvAcmqVJeFWGnTvKvZgv2ytrwoTWcaZvOcK1dU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHJx5pYS76+n/EofFEb+VuYR548p4WAqh09O
 qVqlazYxIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyQAKCRCLPIo+Aiko
 1ZK1B/wNUFX/fsGuov4UADHEBgkk2jgZ6WedA1Kx5s0ig06ebS4pLpK6HjVQ1OBIzBh2tBXaH6u
 QYxtpUgX9y6v3OVkZqMRj5bhSZYX5siifV2ryOXgfEyT3/zKVtK7X5QHr/Gqea2V49fAj1Ri29/
 ym0k6feXwZrq+/qCABhQGNtZXHH34QDXacBX/pYVTHbEIszTzfGOSXHwG6Q7AQyrAt5YuSlZyM4
 LNxB2LniuYMbxujxmfGpYiOU/n5V3Wa6AhvkyvfiWh7Fx+wlikmAoHGi+yFrIyg3xeESzT/sXuK
 3idANZQTmzT7P8aOxiD2zgAhIovf8Jyvf9hmVjQrKf5C0BVx
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

Continue cleanup of the feature flags and replace the last remaining CTL
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  9 +++------
 17 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 5ab18f8e52b6662752e7307b39163afee1ef0ddf..14917ae5a6e08910f676d64cd01a5ff77b31cdda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 3d9d4c13200da0708fd2ea86761b824ae0ab19f2..8c92154598c302af671ba70b2dc52c3deffd699e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -41,7 +41,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -50,7 +50,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index e4981bba80615603a0b96eb095a2ff69358ae115..5e53d38650156b01eb950ed4ed816cafcaa5f97c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -36,7 +36,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -45,7 +45,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 2b2628fcfaa30ffa76e20e1affbb4a7ca4bede4e..0de87d2c3055693910b00de3d8a24f9a8c256ad2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -35,7 +35,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -44,7 +44,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ad13471da10a0a1390d766f14a472a28a2d74cb0..42d25a46e885bb9f9bb9dc133177e7e6630b2998 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -39,12 +39,12 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5d192e86d905d749fdfde3b58cc55d812fa08777..de5b9943734229301889aa82e81a3b4b52ff8e4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -36,17 +36,17 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 276130a1a09e5972581745c87e630778e738508b..ed00374afafdc304cfa0ff6402aebb9697cd58b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -40,12 +40,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index cc702fc4abf76024662b73fbdf0c3c714ce0a50e..a0f3c83d87b2295f21e9d9d720a7d56312d9873f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -37,12 +37,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7079b43aada52f72a7e898e5af2946fc679878f1..5e2dd82afe4791631a8348ebc821e7dbf78599d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index d8fe836a9c8e2f1b039e58bc2a6e9135607bb49c..94e906c051aa61e2a6b165b4afc8eeab44305b93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 336b5fbe23fee2a734601168ba03a172115b932b..60ac6fe40e3703c0762c0ec28c1b301bb26a63d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 50de4597b28928cd0619244d2879743949e38ff7..4101447f043f1645c53d557c47197c5331382469 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index abc3c41f036c3bb0c29866c59bf9998e05affaa6..f3d7e4991697f2af160267174299866e349c0566 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 56f7f271638e7b0cea35f6eaa0a9fa927b4a7113..0eff1e958571e459fdd036810fd81ba683931775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 0a9d42bbc7fd29f924eee4c055ee81174c75f40f..eebb4a7b68c6f286a9dd444849d97b4538085e8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -25,17 +25,17 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index dfa27098929e8f9529f2b44b11d6005593801cd9..93d15af04657dcd961fd9bdce68bedab3fb02335 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -73,16 +73,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_MAX
- */
-enum {
-	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
@@ -371,10 +361,12 @@ struct dpu_mdp_cfg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
+ * @has_split_display:	CTL supports video mode split display
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
 	unsigned int intr_start;
+	unsigned long has_split_display : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a7c5cea7489df353491a8885e32d2673133d41c3..aab2e066a2100799d632f3cf6489d00ec0ca5d2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -383,8 +383,6 @@ static int _dpu_rm_reserve_ctls(
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
-		unsigned long features;
-		bool has_split_display;
 
 		if (!rm->ctl_blks[j])
 			continue;
@@ -392,12 +390,11 @@ static int _dpu_rm_reserve_ctls(
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
-		features = ctl->caps->features;
-		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("ctl %d split_display %d\n", j + CTL_0,
+			  ctl->caps->has_split_display);
 
-		if (needs_split_display != has_split_display)
+		if (needs_split_display != ctl->caps->has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5

