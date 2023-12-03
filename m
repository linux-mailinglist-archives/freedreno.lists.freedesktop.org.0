Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E992802014
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B7D10E24A;
	Sun,  3 Dec 2023 00:32:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB510E24A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50abb83866bso4690369e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563527; x=1702168327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzawnv+H8eBQZ1f28Md0xL056czBkqWOMr7/krgRvws=;
 b=SEl+aXwj+PvIdY1/+Yar8jyYnwfbmvQ90DS3t3dWvdSQjyFXjxs+tmQ7vu58z7vYyp
 dsYH6coi5uPfxIqgkLTH7rOxWfDgCnPxMZkbHEvpst6PGN+dMmjRpXa/0by2/I46An7+
 xoJNjNnalX/bN8oCUHj49UMkTpt0nef0JjwBg7Uhsfpfb8p++OlvUh/A8q2QrSfFKkOt
 PoLgmCSA5ilhjWA26w15AlJqdmEg2qlH41MlgVEc/RufhuFmlpthKxANimmiLmGyQGvk
 TTZmhIfzas+PgMxN7G5eX/1C0+wjkLUNu+S9uAuB9i5vT4EXwFLpLfsehDGtU4My7uHy
 YD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563527; x=1702168327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzawnv+H8eBQZ1f28Md0xL056czBkqWOMr7/krgRvws=;
 b=Y/YcnVkSKwJC8K4WdEjBJdxxUdEWM91bJecwISGD0HTChmh50btYIDfTwM4vSilAD8
 JoQduNuGe9tPDaMaX7PRDymJgN0vRRAfTaDMz5KlVLt4WUioQBbKNuIRjllTz7Nqyy51
 3NXLs+U0nhGA/6h5Wpp+s3ur0AGsWXUrljczBMNMQpypB7p5M/OsC3S1nx2ZKPmyDZ0o
 V44Bs1inbH+7M3bZichM1wma2w2lF1fXMgniosBQYipaiSOPtK04ag04Ky6EppvTihxt
 J1sQh/JV8Fn5Sk673+W41uorEUK9Q3uM7O7EjDDCqV5uuWETG5DNPF0y57gOUnkpoT59
 k9Rw==
X-Gm-Message-State: AOJu0YxQDs8t6MOnGt4lcGSe6RZK+yQP6n1yGPxgJiT0blfc9zeOJjKH
 pnQ0hJ1EHVoxRF5vQw/v0JAvNg==
X-Google-Smtp-Source: AGHT+IHPoMoW+IkTm8S0Mv9PnrYHKs5uHnRTWcNf/X845nTvEjQ6crWLuMR6wcSGJxcHPv8g630uIQ==
X-Received: by 2002:ac2:5f43:0:b0:50b:d764:2911 with SMTP id
 3-20020ac25f43000000b0050bd7642911mr1050984lfz.169.1701563527377; 
 Sat, 02 Dec 2023 16:32:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 03:32:02 +0300
Message-Id: <20231203003203.1293087-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH v2 3/4] drm/msm/dpu: enable writeback on
 SM6125
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index cec7af6667dc..79fca229df18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6125_mdp = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -139,6 +140,21 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6125_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 2160,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6125_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -210,6 +226,8 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.dspp = sm6125_dspp,
 	.pingpong_count = ARRAY_SIZE(sm6125_pp),
 	.pingpong = sm6125_pp,
+	.wb_count = ARRAY_SIZE(sm6125_wb),
+	.wb = sm6125_wb,
 	.intf_count = ARRAY_SIZE(sm6125_intf),
 	.intf = sm6125_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

