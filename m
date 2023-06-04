Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7A7219ED
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 22:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898910E188;
	Sun,  4 Jun 2023 20:36:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ADB10E192
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5007658e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910956; x=1688502956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7a2jHc/DyhJMJRLInb6BfdZQNZbmd1K8XURm/ZPutU=;
 b=FoPaNe3tRvupOMuLv4A5B38++2L7Kg2ZkK0T4iT6IfiuPA4dAhj4jnQgDJYo6NrAjt
 WVfRBUPDcvkmHyufqzUOylzw7Pb/yIFPKkd+sOC+93ZlAmwqJhP28J+ljQvF0nGPb/Iz
 u1LmX00Wj3Kkvy2vb5QBF4RT2GNfoT6GFgaHlnrNgSCdTSdPd8IoJXrOVj7GrQso76kV
 ELjoVZQQBKj5cu7Gz8+MeJ41+tya1mZMwxM9MTnwR0gdwjQ4oCwyPR47WE48jXgowGg3
 ggrdmgRULpyZ2YPoxJ/lwI2k9adcSS8SH0pipzZdr1ethWpZ37QrPJLXO/H2GA+5999d
 ggwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910956; x=1688502956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7a2jHc/DyhJMJRLInb6BfdZQNZbmd1K8XURm/ZPutU=;
 b=hfTdCm+f7ldMnM5L1XZu3982MwxWvKlTlQSA0wB0HpolUrw8GPFlejhuh9x7JHrLC7
 1UzHzcd/nYc8EEd8yJr5nwhXh3sVU+hqTQjbzH3QqZXdTW9enfZTmKm+cZJBzgNVYWP/
 mbH7w3/3x7rSWq7jrJlVV2qNFQWew9WPyYXWtt2uBIuLiW7V9Kh9QQBJG7FuqkoxkSbm
 nD+wWkKn9c+bIkn7UdzFMUtU8h995Qfxco6tJJeL8c0ozrLyEvuWB2WuGFzOnuTfRAnl
 JR3aXIu9x0PiRECNDJ2Dl54476MtI/SprSfb6yqGyZYeZ5s5Pov/nK3hHMD6IyE+DmhV
 Nklg==
X-Gm-Message-State: AC+VfDzFpSs1SUyCSxYp4Id1mOjfFploijLthzjRFfg1SuJbyUh+TlN1
 ydNfq1ekJX7ZAhATvapt9Rz7SA==
X-Google-Smtp-Source: ACHHUZ7zTf4TXsYk0/vhYYCbDsdxyTE/J+oWK9bWiB9cywLifJiFRJR+1PS5/RcwI6j1Ge+FGV2YCA==
X-Received: by 2002:ac2:5e9d:0:b0:4f3:872d:10ff with SMTP id
 b29-20020ac25e9d000000b004f3872d10ffmr4779543lfq.64.1685910956229; 
 Sun, 04 Jun 2023 13:35:56 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 23:35:31 +0300
Message-Id: <20230604203532.1094249-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 21/22] drm/msm/dpu: drop empty features mask
 INTF_SDM845_MASK
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

The INTF_SDM845_MASK features mask is zero. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a7940b6a2034..21744d2b3fe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -254,7 +254,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -264,7 +263,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -274,7 +272,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 21,
@@ -284,7 +281,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_HDMI,
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9dd864c47d48..a0b3bdf2e450 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -254,7 +254,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -264,7 +263,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -274,7 +272,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -284,7 +281,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa45ed378884..206ff71227cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,8 +95,6 @@
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
-#define INTF_SDM845_MASK (0)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_TE) | \
-- 
2.39.2

