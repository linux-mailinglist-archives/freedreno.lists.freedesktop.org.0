Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5F7BE713
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 18:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4BD10E15C;
	Mon,  9 Oct 2023 16:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9887110E15C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 16:56:30 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bfea381255so56955711fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696870589; x=1697475389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l3esYtn//PnsByMSwFAnaxuSQ3nrpt/GZN9bsn/BnFw=;
 b=ASOqOTCS/yHcpiXZcROd8fjrOd3+3wfKcBC5krHGjGgQiDS5GVp1b3tf4fRpmxMf7m
 lDdVs9mQYx5Cc8vRkLfwxbNeIPFlvmu2/IkeC7LhKt8RvwBdGBnkxL0LE00auyK5HMyp
 kJw4GgllD4lxWI0aNLZq0+rS/4VRFhKA+wPZ53NIx5BcYdTVj3ny7ibgwfId4bA126NA
 HLlykTmDVofjOw0j6iuzR/U4uMcKMV+WyAdqMEx/vbf0iiUCuEXDgVAb3OMxawcUHF0A
 Nw0JRiwpRDxLw0FcIjHKlXd4YpV8y+VNsOLB0THN66N+5gBWow/yM3j4y7D4pffVYc82
 gz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696870589; x=1697475389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3esYtn//PnsByMSwFAnaxuSQ3nrpt/GZN9bsn/BnFw=;
 b=Trq503zsj/kEe+/RbaI4J7Z5Q/bBGqJaEC7KzrpdOEbm5uSKVsfzACu/f0QUOARDFp
 m4mmbsI28DgI2c+fuToLHbAQM821+c1hC5dqbYYFSJpFCttdB8SfVcFzlS+AUNgLyzM2
 lLwymG1ifCPvFWbXCkECLwa1UUemPT8fPs6IHYDOhosVg7dcwd0b7ttdwnxo/FlQMdnj
 k0kI4UJ9/EXizCm5r3opxZVZjKb+0NAliDmm+xCrJCURiR98jYonUwWsywOrj7N1RI0D
 TWug9yCGOXI4tpirmM0MLgT6FmquDR4j1sHhgv08PP1/nqN/ZKfcOSVz3BoT7BlHWhLD
 VZFw==
X-Gm-Message-State: AOJu0YytLCG1n8dyyg9MLLbvu7sg6ngV6TthdPrCLCg1n3ljZNHevDwS
 okS/b5rSMgfxsArNUej3vjiH6w==
X-Google-Smtp-Source: AGHT+IEYWAqyPzIYDNNMvdW7a9MBQFdbT6yKNXJEZDsN4ESiPnBsb93D1lZ2HmsontdzpnW6DAxo0g==
X-Received: by 2002:a05:6512:3282:b0:501:b8dc:6c45 with SMTP id
 p2-20020a056512328200b00501b8dc6c45mr11414814lfe.18.1696870588821; 
 Mon, 09 Oct 2023 09:56:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b0050420eff124sm1483407lfl.152.2023.10.09.09.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:56:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 19:56:27 +0300
Message-Id: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: enable SmartDMA on SM8450
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

Enable the SmartDMA / multirect support on the SM8450 platform to
support higher resoltion modes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1b12178dfbca..d0214edcbb0e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_0,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_1,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_2,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_3,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
-- 
2.39.2

