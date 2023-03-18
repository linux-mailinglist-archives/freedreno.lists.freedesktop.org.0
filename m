Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1506BFA59
	for <lists+freedreno@lfdr.de>; Sat, 18 Mar 2023 14:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901010E121;
	Sat, 18 Mar 2023 13:43:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BBF10E106
 for <freedreno@lists.freedesktop.org>; Sat, 18 Mar 2023 13:43:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s20so572356ljp.1
 for <freedreno@lists.freedesktop.org>; Sat, 18 Mar 2023 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146979;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=64Eim4J+wnLNg16H207185gsYiLvTQ9YXeAiDAajBeo=;
 b=ZmPK7f34jfn/APMqkk2gLGWySTgDjm48S5x6Fwx1Zwi05nRKt3SlJO2IUJNDEz7THd
 WIHnpkcpQ74MDnGHngpTAYbq/Hhd5BFfMKGWp7TKLIHFy7bZRvkZB8qZMbTBmHnr0EwG
 kN3puilAjHRR8Bb8Gua92H6kezHcO7qXGscCeZP5OsnIYYtU1PwztkZSL69EWp46uZro
 83wBQxrU1qRvCAU9e1/I6x5x2+BtAxriBbQJ+R3Ofa44foGypVUWnIn9FcNXwclp2Ipt
 mr6t+WNUpqHmzCqAL6hSWoUmobNTQEhedKKdIpLN/zFaEhy8/OSf+kdGovb4wKABxAG+
 36Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146979;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64Eim4J+wnLNg16H207185gsYiLvTQ9YXeAiDAajBeo=;
 b=wdZKQ1OcmURTV9y6pXYiO/zAXVflVnmVQ3nBY4p5r+ZRrtcpQYTVAPNYCJYFXaWqzE
 fN2R1r/39LyRjvGqm/NDrtYLeUd7GGjOoZp9GeptLCYxU3DJCn4eKlMuwJ5zsJoSnJpt
 iDJF2kS2RqfXKXRFGkWI1tlG5sw7reoKF54u3kbzLuV5OWf6MxogTjTWC3WYivS/u25S
 PgD4C1P6M2yrFbOUZ2NHsp2mBBgLNNEOXtCWFxKes/EDXdxaHM/I2iaL7jPUTy8sBhwt
 Q3a+rQTyK/brDSqMtYshlJjsrquqPH54+E/f2bMhJNVQbrkponygG52FwdEX2kNNQJej
 Id2Q==
X-Gm-Message-State: AO0yUKUZh8HQrT670Ua24r0FoA7sAngFri7B7MxsXAOemMTe1oCNgplp
 RL4GVUduh/pwoYa6Kmy7BYokpA==
X-Google-Smtp-Source: AK7set99/nq5eGpck0CO6kYinimqMHr04J2cnAXvlgoN7GcS4ZNmQeGEA0/CE3To6dzzTiYYhHBDKg==
X-Received: by 2002:a2e:be29:0:b0:290:6af8:ec25 with SMTP id
 z41-20020a2ebe29000000b002906af8ec25mr5831340ljq.52.1679146979675; 
 Sat, 18 Mar 2023 06:42:59 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:42:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-4-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=7014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eQGewel5eMIUbnjRWU8o9jYKXbfa44urQPoDhCO0rnI=;
 b=aIP2Ci+k4bWQEmaszkmmla0vcEoEAg71XC+VZWKNhlyqM9RKec6JOrzeikoDuGx8RBfy+CT/bgY5
 4VtK1qW0BucTsvI7eVuEMI9vqDsF32vJ41jz2cAyaFqhOepQXBkq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 4/9] drm/msm/dsi: dsi_cfg: Deduplicate
 identical structs
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some structs were defined multiple times for no apparent reason.
Deduplicate them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 93 +++++++++++++--------------------------
 1 file changed, 30 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 6c192963c100..039f503233d7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -47,41 +47,32 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_8916_bus_clk_names[] = {
+static const char * const dsi_v1_3_1_clk_names[] = {
 	"mdp_core", "iface", "bus",
 };
 
-static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
+static const struct regulator_bulk_data dsi_v1_3_1_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
 	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
 };
 
 static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = msm8916_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
-	.bus_clk_names = dsi_8916_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
+	.regulator_data = dsi_v1_3_1_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
+	.bus_clk_names = dsi_v1_3_1_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
 	.io_start = {
 		{ 0x1a98000 },
 	},
 };
 
-static const char * const dsi_8976_bus_clk_names[] = {
-	"mdp_core", "iface", "bus",
-};
-
-static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
-	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
-};
-
 static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = msm8976_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
-	.bus_clk_names = dsi_8976_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
+	.regulator_data = dsi_v1_3_1_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
+	.bus_clk_names = dsi_v1_3_1_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
 	.io_start = {
 		{ 0x1a94000, 0x1a96000 },
 	},
@@ -107,10 +98,6 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_8996_bus_clk_names[] = {
-	"mdp_core", "iface", "bus", "core_mmss",
-};
-
 static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
 	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
@@ -121,8 +108,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = msm8996_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
-	.bus_clk_names = dsi_8996_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
+	.bus_clk_names = dsi_6g_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = {
 		{ 0x994000, 0x996000 },
 	},
@@ -167,24 +154,20 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_sdm845_bus_clk_names[] = {
+static const char * const dsi_v2_4_clk_names[] = {
 	"iface", "bus",
 };
 
-static const char * const dsi_sc7180_bus_clk_names[] = {
-	"iface", "bus",
-};
-
-static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
+static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
 };
 
 static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = sdm845_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
-	.bus_clk_names = dsi_sdm845_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
+	.regulator_data = dsi_v2_4_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
@@ -198,32 +181,24 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sm8550_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
-	.bus_clk_names = dsi_sdm845_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
 };
 
-static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
-};
-
 static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = sc7180_dsi_regulators,
-	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
-	.bus_clk_names = dsi_sc7180_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
+	.regulator_data = dsi_v2_4_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000 },
 	},
 };
 
-static const char * const dsi_sc7280_bus_clk_names[] = {
-	"iface", "bus",
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -232,27 +207,19 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sc7280_dsi_regulators,
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
-	.bus_clk_names = dsi_sc7280_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0xae94000, 0xae96000 },
 	},
 };
 
-static const char * const dsi_qcm2290_bus_clk_names[] = {
-	"iface", "bus",
-};
-
-static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
-};
-
 static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = qcm2290_dsi_cfg_regulators,
-	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
-	.bus_clk_names = dsi_qcm2290_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
+	.regulator_data = dsi_v2_4_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
 		{ 0x5e94000 },
 	},

-- 
2.39.2

