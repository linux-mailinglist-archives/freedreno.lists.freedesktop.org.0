Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AC7B75E6
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 02:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2CF10E329;
	Wed,  4 Oct 2023 00:31:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92010E327
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 00:31:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4066241289bso15140095e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696379488; x=1696984288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLl0HwSpebHQPe1HZIMtv8j9E/LK6fVYcwfGDJYdmX8=;
 b=PFled2FGshvc2P8bvLeMOo2FN9st0O56dXpCc3RoXpCvlAm5khLG5/WMvS/Z45X+II
 MObiAnQhFUKSWiIePuzBrGhrUDxZA7lajy23mJlrS+mq/O3ESBv/PhmPYnnWUIouhU3R
 BgLCCpva0RCuSS58P+3cI1Doi7GNTeIZ7XuQvMH1UdWO71VUUjYZUP+7NsZ6+x+RJjzD
 X7h1KSjnqzY0Ea9SYtpivfAN264M8n9XscnRpUlZC14X1hEZ5y15k1fxCFRX58l5M6X2
 YmhYFXqu8vS05KQaVjcDQIHtFwgHNcaU8cWPrMe62j5KDsZUN4bT0Pk0GdfyJPDL18BS
 6Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696379488; x=1696984288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLl0HwSpebHQPe1HZIMtv8j9E/LK6fVYcwfGDJYdmX8=;
 b=n2Nib2stgvLD9mi2XNALN98dy/RCozIFjRdcEbW1LGcFI4B6QjNNFjQzoUTdzQeYjh
 WYK8HGC8vMN7plg2BScLCZpkSSQNVPe1CagzMo/eVhL6o3FBlDoEHvyKgUrMZIs8f0eo
 xrkIwLX2wsrlwuTGwXf0PWQn8zmTnAt80M0eFguVW6mzXZUdabCTTeM8yrA7UD2HjEcS
 A72/m5z1Ae8yHQ+8xPGbgjiXTuhpclyuU5FWm62DTEk9+yYfigs1+d9P0W3VKUVGGLJl
 iT1Kl4k/DWJUATPu6Uv1gHXxJz//cXqfCN3C2hcmTHbKIVYUWaaGyiKnzM+yI14fbQhk
 0wDA==
X-Gm-Message-State: AOJu0YwwLzIgRK7pv7PvTE2v0XxUUsUtDT4RgqfyiIwvOQsXGmjT467W
 OCmtQXkWstcv8e2juoeJxwBsQhjkGl7LG7t71Kg=
X-Google-Smtp-Source: AGHT+IGd0wiDCW72fyJSci0cDwyaeDLNNsCxDImCmLd2d9uiLe8TptjX5U3tzlSjXQIbCu490pQpww==
X-Received: by 2002:a7b:cb8c:0:b0:405:3f19:fc49 with SMTP id
 m12-20020a7bcb8c000000b004053f19fc49mr935957wmi.34.1696379488521; 
 Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 03:31:25 +0300
Message-Id: <20231004003125.2289613-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 2/2] clk: qcom: dispcc-sm8250: switch to
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
 drivers/clk/qcom/dispcc-sm8250.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e17bb8b543b5..229d32aee431 100644
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
@@ -219,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -565,7 +561,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -617,7 +613,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
-- 
2.39.2

