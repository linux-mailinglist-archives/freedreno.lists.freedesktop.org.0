Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F6732CE0
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 12:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CA310E59C;
	Fri, 16 Jun 2023 10:04:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6810E5CB
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 10:04:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f640e48bc3so626016e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686909877; x=1689501877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=UH0dMSR8J1p5xJus1o/EO5bWsLeq4c9WEpd3X7prBwNQl0Engy1x/dnHAK6j07gYiq
 HFCPs23UeCThmyjUOOE+ZmVMObYxZyNBYc6phYUJOsnmoPoiCMPuvu9oCQg2wPZ18kBc
 S2YW3IAQKfghiWHGGDRvm17ti8BM8xLBEL6rMmlrY5AMX4wOJgvAzZkZaMsOuN9p2deX
 42a+gqiiwmYEFDP5ZfVyMmtlgaQLs17H4FPWtwgtiuBN+ZERkfsSjCDOdP6/c3wqHzMG
 QVNZzY/PVu8hOGxKLhExYKVIwZvUb2ixJe1GuVvr81P/WOcwa4yo0+6KNjMp5anbIICD
 LU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909877; x=1689501877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=A2Izm/abfj2KGO7hcbrcQJaswOvWZDOthfHEmA2WnqF3DLEcbJckgOQ9ym0DT4mBoT
 +TljdiLFDGKBO8+vNQPCYdkwd2hOpGJU4jz5JhJzKWxgeeIEQH0+sApJqPm1iMLYQvKy
 W0Pc15Npbg4Gq0oi5b1n6qKcRHlrtOxFc+xtrcKGhnkKI3bKJk21GgEvmYEc9LWHlj8a
 LdRKy0ZUWBrP3GjHnAtS5d1FI77hviTaVdcl4zA266i4a2MN3/N2lPUKtsX7u7sUa/3P
 Px48dFc6JeBd2wvZ3bVsStvvftj1Ri7ZC2lrucqrDf7Nu8MhRYoG6TECvyRu5W+AqVDL
 AXVQ==
X-Gm-Message-State: AC+VfDyI2hXbur1MapXEU6U/lslZSHpcneqWmcn3owZzDOguLXO7h/eq
 ow8wyZg+clFkfDstpIIKxXCdlw==
X-Google-Smtp-Source: ACHHUZ6evdJwuwSnA7+xNDznvom4QXiXTXlUa6azaqYVsuhHWzrfy04hW54mkrWDDnYVhS/DPgCg3Q==
X-Received: by 2002:a19:5e02:0:b0:4f1:4cdc:ec03 with SMTP id
 s2-20020a195e02000000b004f14cdcec03mr959227lfb.18.1686909877014; 
 Fri, 16 Jun 2023 03:04:37 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:04:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 16 Jun 2023 13:03:17 +0300
Message-Id: <20230616100317.500687-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 19/19] drm/msm/dpu: drop empty features mask
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

