Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B796F7B7641
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 03:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2DC10E331;
	Wed,  4 Oct 2023 01:23:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32510E32F
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 01:23:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5031ccf004cso1775153e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 18:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696382592; x=1696987392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3yJCB/evHgpBk1/GnjoencE6NFEjBAI7Qfq764GKC4=;
 b=SFlZfzC9pJjgOwSsHP/pYz+xaeQOAfaQpKh9Z0FcdoOsDDwZv0Y4Ft6BbmfvZZRB1e
 6WATdYwUpubPDnEjNTVJiM/F8bcLuZbzcVZwaIQ0dGatEo5paCGTqln7w3NXdGLSmR6z
 6CAGXLW5MiL9lGgClUqW8aN1gVaPcqzofIEd5ddhfQDv4VzhB7LktEWYTUbdjO5vNd0Z
 V1Wt035lVTnXFxkyhsB7zPm71jnAigM1frEQSo31evItscoRu0ciMPAIWC7MPnI6SKKA
 M71cIp71EJ5UMz0vBquYRZ2c+4mfYn+D79bLn/EP5N09a1B7TwLX2mj6ngdpnNsSULgo
 ASDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696382592; x=1696987392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3yJCB/evHgpBk1/GnjoencE6NFEjBAI7Qfq764GKC4=;
 b=IeP8/x45k+2uvRZMvvQBwFPedfbNzoSWj1IWNguwvpAnMDv33Vd+UoldF/Rd5vx466
 r1uYItRmTpw17Qqoos+U8Aoq4MrwFb0LPfR6fAXyz3uCBxbp9pixc/okqq53Mrbpzy9T
 NJZgo2lBPfvo5OAZYPKcGNNnws1II8hIGA7JT/t2vH/NPDAhsRciJ3IQ7j+6Mz5fgzAp
 Lbho1S1cf5U+i5Db5+M2/ajiJDtrw/yPc0f4S9+KtQL/LnROt9PvRh16HpYygpVWuDY3
 b90EI0oPJFnO6iE8Inrw71vdqu8G5qabBbpJeujxMbc1J4M161S+joonsZIkO1RKKav4
 xJrQ==
X-Gm-Message-State: AOJu0Yxi0WWdpRKT6IrFgv2/nuWI72Y4KNku6NKkDUZsHvHG8nf6U8BS
 OJkvsC80K1ILdZ6X3l3XvoGBtw==
X-Google-Smtp-Source: AGHT+IE+6F5tywq+UhxdC+/gyRjLKKJwbtKcNQW+FLXAvKoGyCRIbU3YbA7vOdXkHylL73+L5u8WhA==
X-Received: by 2002:a19:9148:0:b0:504:2d54:b4d0 with SMTP id
 y8-20020a199148000000b005042d54b4d0mr705374lfj.19.1696382592634; 
 Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 04:23:08 +0300
Message-Id: <20231004012308.2305273-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 3/3] clk: qcom: dispcc-sm8250: switch to
 clk_rcg2_parked_ops
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch MDP, AHB and ROT clocks to the clk_rcg2_parked_ops so that the
CCF can properly determine if the clock is enabled or disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e17bb8b543b5..2ce7ec864a5b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -144,12 +144,10 @@ static const struct clk_parent_data disp_cc_parent_data_2[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
 
@@ -166,13 +164,11 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
@@ -202,7 +198,6 @@ static const struct clk_parent_data disp_cc_parent_data_7[] = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
 	F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
 	{ }
@@ -219,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -543,7 +538,6 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(85714286, P_DISP_CC_PLL1_OUT_MAIN, 7, 0, 0),
 	F(100000000, P_DISP_CC_PLL1_OUT_MAIN, 6, 0, 0),
 	F(150000000, P_DISP_CC_PLL1_OUT_MAIN, 4, 0, 0),
@@ -565,7 +559,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -598,7 +592,6 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_rot_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
 	F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
 	F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
@@ -617,7 +610,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
-- 
2.39.2

