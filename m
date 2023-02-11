Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A5692CE7
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E47210E329;
	Sat, 11 Feb 2023 02:11:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141F510E32A
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c26so15413069ejz.10
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6UMK/UjjvISsYZeHNCSG07CSD1GLq5zSkHcgbyV7hk=;
 b=c309fIIoxcPxdKyC+WbwwMmCbaY/kuN4ptMC/6+8yd9iHQ4Bb7puDJ+5H6oBzSI9CX
 GRYoLRMJ/HKwCAY8ZwJ9JDu2aZAN7bwVur4zCM/Yyx5zmA5lQKmEj8cPNvR5Bk+nVrrA
 fWgEnjeVFpPaTkpKnzGID/0zb+UeHc8b3u9WatgRMqCz2tt7sFFxvJUY/3clRM7W4Z2g
 Uc8eSSYn+Hrd4CWP6iTnzakZKIpUkYSPKTLYOwFxqudiitLzLaO+fkCixtl19L9Pn7LA
 UdkwE5P1x9OVqJlyC0Aa4wnocFd50wX7YGEF0FRXPKjfmeBtENOd9tPaKK0ES8iPiKB9
 tCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6UMK/UjjvISsYZeHNCSG07CSD1GLq5zSkHcgbyV7hk=;
 b=nxQhXh76pTa2r5Ho4SDQ36cKe5PmWBzN9cQ4OdTOX5NEtr9VTEd1HS0azBhecskY8+
 52cophRJpgczW0otxQJYS9AIuFlYQH/4+6Vu1J1pt9Lw2v5bWiFwNnXaoNBtZqkdSJjz
 Z/BqnMkz8JqNDEGNBWHJIDVpO2RjHC8rslzjRZaAkp1KmM7F5z3F4/PcBzP61peP93oh
 S6LnsXCvQqBFBC7DJAkG9kXWrmihD6UTdDihmC6Ifxyxm/h8dIr+28svcQouiFaRF/SA
 bwKqhsaRL7tgVDyXaBN1VvrubhdyURZ9qRRAt7V/sn/by2frh0zDW7Fjq3LCQBk/Uugc
 1zDw==
X-Gm-Message-State: AO0yUKVW/YXaQXh74fmPyytAPFP8BJgC5GeiXBm/4iNvz4z3gEZBrpZY
 SdtmyakMND7QR9T8GQ+8BDok+A==
X-Google-Smtp-Source: AK7set+QLtn82FWdMCDs8hpkEM7gNCiULHuZwzLXmoRU5AtwzecYM6N0Ev3zCaX3Fg0JHDKtTe9cDQ==
X-Received: by 2002:a17:906:4ec3:b0:888:b764:54e5 with SMTP id
 i3-20020a1709064ec300b00888b76454e5mr16682207ejv.71.1676081464527; 
 Fri, 10 Feb 2023 18:11:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:19 +0200
Message-Id: <20230211021053.1078648-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/43] drm/msm/dpu: split SM6115 catalog entry
 to the separate file
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 96 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 90 +----------------
 2 files changed, 98 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
new file mode 100644
index 000000000000..547af53a8082
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_3_SM6115_H
+#define _DPU_6_3_SM6115_H
+
+static const struct dpu_caps sm6115_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_10,
+	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
+};
+
+static const struct dpu_mdp_cfg sm6115_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_sspp_cfg sm6115_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+};
+
+static const struct dpu_perf_cfg sm6115_perf_data = {
+	.max_bw_low = 3100000,
+	.max_bw_high = 4000000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
+	.caps = &sm6115_dpu_caps,
+	.ubwc = &sm6115_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sm6115_mdp),
+	.mdp = sm6115_mdp,
+	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+	.ctl = qcm2290_ctl,
+	.sspp_count = ARRAY_SIZE(sm6115_sspp),
+	.sspp = sm6115_sspp,
+	.mixer_count = ARRAY_SIZE(qcm2290_lm),
+	.mixer = qcm2290_lm,
+	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+	.dspp = qcm2290_dspp,
+	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+	.pingpong = qcm2290_pp,
+	.intf_count = ARRAY_SIZE(qcm2290_intf),
+	.intf = qcm2290_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sm6115_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 160486202d64..3586df30fcb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -352,17 +352,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x4,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = 2160,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -425,12 +414,6 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 	.highest_bank_bit = 0x3,
 };
 
-static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
-};
-
 static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.highest_bank_bit = 0x2,
@@ -541,18 +524,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sm6115_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2ac, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2ac, .bit_off = 8},
-	},
-};
-
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -888,13 +859,6 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
 				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
 
-static const struct dpu_sspp_cfg sm6115_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
-		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-};
-
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
@@ -1669,35 +1633,6 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sm6115_perf_data = {
-	.max_bw_low = 3100000,
-	.max_bw_high = 4000000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 800000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
-		.entries = sc7180_qos_linear
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
-		.entries = sc7180_qos_nrt
-		},
-		/* TODO: macrotile-qseed is different from macrotile */
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 static const struct dpu_perf_cfg sm8150_perf_data = {
 	.max_bw_low = 12800000,
 	.max_bw_high = 12800000,
@@ -1884,29 +1819,6 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
-static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
-	.caps = &sm6115_dpu_caps,
-	.ubwc = &sm6115_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6115_mdp),
-	.mdp = sm6115_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
-	.sspp_count = ARRAY_SIZE(sm6115_sspp),
-	.sspp = sm6115_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.perf = &sm6115_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
-};
-
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
@@ -2015,6 +1927,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+#include "catalog/dpu_6_3_sm6115.h"
+
 #include "catalog/dpu_7_0_sm8350.h"
 #include "catalog/dpu_7_2_sc7280.h"
 
-- 
2.39.1

