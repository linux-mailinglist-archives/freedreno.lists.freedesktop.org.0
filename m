Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B921C13E
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 02:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1556ED92;
	Sat, 11 Jul 2020 00:50:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72A86EDA0
 for <freedreno@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c30so7064995qka.10
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuKnWcFSgGPyy7W5Q8ckcfqK3DnZHWryFWbqDhKba5s=;
 b=nhfdA00sOP4HeM1eqGTbDiy9hgHHva2H+iOI+mbRMd8gU0X9bPyYzqqHdDc25LMhEc
 Xvmec+YZqRx1RgXtYuA6m10pFaw3+uhCHmpHJTxx1lE+2XY43lvK7kYQwtwv7SLhJ1MB
 /JJCafqgqDkRZuhfgk4cDaz+Qsid/NuECEnb2sa6r0f3t6iE2g6xNf9GX5CUWOUl8c98
 htr9jjRFR4851rYX1RfoyGT/uTEjHAr+pK4sPszaR5wldX90Kr6EZnao0897h+eQOiXE
 XGmXk010Ld8B4tjYsosiQ6zggVW1MN+PrIDt2WD6968z56ULIE1BY4kwIDZ6iSKxPG86
 cQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuKnWcFSgGPyy7W5Q8ckcfqK3DnZHWryFWbqDhKba5s=;
 b=eIWsglBfC0SpcQlEVrxMk3Uyaj7aNpfMKK7zGLYbbeTWFvNd9VHFShH5/CmYzuEeAk
 D5Pgzm9JgOGdXtjzPjZpG+hVjU7XQMtQMKBY1Q7CQfMW7CROgaFBkByjAh/8JhAqIsV0
 aM/fZK/PINovkFDIxgd+uLHmi0B8TwEN+lvrUKOSyl5YCb8KDt2lz/EeM/8nYLURXo8q
 q2+qYPOm6Zy0uGITkGHimuVQ1ewYhSsMvFXLMf3SYKmtUECf3W2fBfVY7D/XEE0aKDvY
 SKuJ+rQ0A2Enkbmtx5YdqcbTUJFO0CJeXFVKtfxD8P+X7oDtYeyeRoM/uT/c3hOn43G4
 wBbw==
X-Gm-Message-State: AOAM533zOiLXkH7BLjY47SyyHRDXaNYwhNBHriY/6PWTf5EIQpbWhLvP
 0b/kZUy/xpJqDOU6Et1bC4Y8xg8fhJI+Yw==
X-Google-Smtp-Source: ABdhPJw0K/rSJJFuRwVzyDZ7MnP/cQazYup2WzIpRertajcyTfq2AIBidcNxMjFRWsiMqPpX9pQsaw==
X-Received: by 2002:a05:620a:633:: with SMTP id
 19mr70729659qkv.372.1594428628616; 
 Fri, 10 Jul 2020 17:50:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:28 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jul 2020 20:47:31 -0400
Message-Id: <20200711004752.30760-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 8/8] drm/msm/dpu: add SM8250 to hw catalog
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This brings up basic video mode functionality for SM8250 DPU. Command mode
and dual mixer/intf configurations are not working, future patches will
address this. Scaler functionality and multiple planes is also untested.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 106 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 2 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f869bbd574..17e9223e5a2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -109,6 +109,21 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
+static const struct dpu_caps sm8250_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.max_linewidth = 4096,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 4096,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -151,6 +166,33 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm8250_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45C,
+	.features = 0,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+			.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
+			.reg_off = 0x2B4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
+			.reg_off = 0x2BC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
+			.reg_off = 0x2C4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+			.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
+			.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+			.reg_off = 0x2BC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+			.reg_off = 0x2C4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
+			.reg_off = 0x2BC, .bit_off = 20},
+	},
+};
+
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -542,6 +584,14 @@ static const struct dpu_reg_dma_cfg sm8150_regdma = {
 	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
 };
 
+static const struct dpu_reg_dma_cfg sm8250_regdma = {
+	.base = 0x0,
+	.version = 0x00010002,
+	.trigger_sel_off = 0x119c,
+	.xin_id = 7,
+	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
@@ -679,6 +729,31 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	},
 };
 
+static const struct dpu_perf_cfg sm8250_perf_data = {
+	.max_bw_low = 13700000,
+	.max_bw_high = 16600000,
+	.min_core_ib = 4800000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
+};
+
 /*************************************************************
  * Hardware catalog init
  *************************************************************/
@@ -772,11 +847,42 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+/*
+ * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
+ * and instance counts.
+ */
+static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &sm8250_dpu_caps,
+		.mdp_count = ARRAY_SIZE(sm8250_mdp),
+		.mdp = sm8250_mdp,
+		.ctl_count = ARRAY_SIZE(sm8150_ctl),
+		.ctl = sm8150_ctl,
+		/* TODO: sspp qseed version differs from 845 */
+		.sspp_count = ARRAY_SIZE(sdm845_sspp),
+		.sspp = sdm845_sspp,
+		.mixer_count = ARRAY_SIZE(sm8150_lm),
+		.mixer = sm8150_lm,
+		.pingpong_count = ARRAY_SIZE(sm8150_pp),
+		.pingpong = sm8150_pp,
+		.intf_count = ARRAY_SIZE(sm8150_intf),
+		.intf = sm8150_intf,
+		.vbif_count = ARRAY_SIZE(sdm845_vbif),
+		.vbif = sdm845_vbif,
+		.reg_dma_count = 1,
+		.dma_cfg = sm8250_regdma,
+		.perf = sm8250_perf_data,
+		.mdss_irqs = 0xff,
+	};
+}
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
 	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
+	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
 	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e9458c85e20c..1b7a9213a756 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -429,6 +429,7 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
+	DPU_CLK_CTRL_REG_DMA,
 	DPU_CLK_CTRL_MAX,
 };
 
@@ -612,6 +613,8 @@ struct dpu_reg_dma_cfg {
 	DPU_HW_BLK_INFO;
 	u32 version;
 	u32 trigger_sel_off;
+	u32 xin_id;
+	enum dpu_clk_ctrl_type clk_ctrl;
 };
 
 /**
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
