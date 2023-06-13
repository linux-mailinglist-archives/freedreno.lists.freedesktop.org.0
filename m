Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771072D5C8
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 02:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B82E10E2F8;
	Tue, 13 Jun 2023 00:15:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D0F10E2EE
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 00:15:00 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so5037576e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615299; x=1689207299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=HRnN39XmMxADcgsQ4UsoJKdnb5PupGSLkU8BYR5nbPIWydUvXIVDTLesrEq/RNBodP
 w2SccNj2n0A8cz4ojOHmKKaSxFtqyf2yJc/Uxk5Q9YWSPZPCx4QOO2ZPZlw4pMqFVyBG
 E7qfCv1KiP/Bh2q3/0Y6VA1E1VOnOzR2uu6BTOiU23V63m6kVuofNGHSYnpTijhFLz0F
 WUxJ2nYcK5sxlxsj/+HHvoqTX1CRkrCmovZFnrGGBVBGmHZVCp9yvgoOuTHzT4hw/74+
 3C28oXPupcb9QZr4/dMnR0KOM9VciVrhV0qRaOj3wW2e+GF+JlWuNQdK1G7FRkfseHde
 ipkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615299; x=1689207299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=AuKQ/te7GSVAYjzYlE+mnQsQHH05s2eLh+4aDgHSTbI8VErwcY9V7TJFnrS1XZNIVm
 jRO14VntQRTU0eRVuHmAmMqYbRao1CElNZLeFBW+jjOx/zHT5o7uyJYLdG8U2OZee0Jh
 pIHEl/nQ4KgBJivKYvRaqNsKl1mQLYgIBa41AkvjC4DV3hUhkLvpxYlb562CcJgPm8ks
 HKBxZ3JsVOPM/vHgfA+fzK3PeWIGsr6OaSwW9ZtRC3p4aiieYsJ53TpdqbqGZbF/Ykul
 klhdnyL0RBLTGHHm1mmpEp79LktlyHuq0R6IncCeE8CAZ98W1wj/IXYsyoCWRHJMr59F
 Wbiw==
X-Gm-Message-State: AC+VfDznrvBYa0ui6O8VIjeqdtQNfkyw/pFNkABWwreuQ6e3NkFs0KIX
 9B1dwVpLrjt4xL8SZxknIuT1Kg==
X-Google-Smtp-Source: ACHHUZ6h245In3U7zl4A+OAnezGSXs0aQyBOgAKWeJLrmUYwHYlHLlAnLZ9DWTR7QEgLzFFwpGnXIw==
X-Received: by 2002:a2e:8609:0:b0:2b1:bd11:a71f with SMTP id
 a9-20020a2e8609000000b002b1bd11a71fmr3688278lji.41.1686615299144; 
 Mon, 12 Jun 2023 17:14:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v10-20020a2e960a000000b002adbe01cd69sm1961999ljh.9.2023.06.12.17.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:14:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 13 Jun 2023 03:14:53 +0300
Message-Id: <20230613001453.3427024-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 22/22] drm/msm/dpu: drop empty features mask
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
index d78cedd35c01..060e6a49b2f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -246,7 +246,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -256,7 +255,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -266,7 +264,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 21,
@@ -276,7 +273,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_HDMI,
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index de26f469ebb1..54d7475e1591 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -260,7 +260,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -270,7 +269,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -280,7 +278,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -290,7 +287,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a18fc66a412..3efa22429e5f 100644
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

