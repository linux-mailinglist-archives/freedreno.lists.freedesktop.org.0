Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED197B75E2
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 02:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F64710E327;
	Wed,  4 Oct 2023 00:31:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D413310E326
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 00:31:29 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c296e6543fso17542041fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696379488; x=1696984288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=is6O+bR+gqOt2V7xYDfe09jbtEu4FjLn3UWhcpanc7c=;
 b=py+TAbsWKGs/QrKBz1JgErsV/7ASHDQhL7HnCy+mbKZT9WzLmpY82WVFLO2AAX6KoW
 R3nQdR1gbfysqPXA7QCmNwD/x0s3E25Csiy6rWnphBD0WG87Lh0gJ3oaIYVC1+Eu5MuV
 XwF1dfBwIEnh1uHzdQMSqvHG6GCFfgXQEL/75KTGYi8Hf38wP5PLHRsKCbAA2j8O51AY
 8cEFJIIYc+QhG0OAg9JzrUPYDlicJFbP4EX6+HPcmAC41ucddqPQfVQmULs1dlJC/Rvd
 YhXS7A2KfZfvcn23HCTgNCMkiNN8goBKj69ZE2kin20T4dxaUpWHpcLf5hc8/Ehq181+
 93kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696379488; x=1696984288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=is6O+bR+gqOt2V7xYDfe09jbtEu4FjLn3UWhcpanc7c=;
 b=azkLto//uO0nno0gY9bNdWG7PS/FK+tWA+pf3HOGD2cFxA9+FJ2UnwBcp/qGlu1LWa
 2AhU/k3D+bo88Jv32OxGMIQWvnhy9mf1uyhh9WjmS6p42VPeu9uqROxPBxvEOHCNH+HT
 8b2KgCK4HLW/0Vv45T+gcm4+ngsj9NRqlCd7moozvULj8fKaapv3T5GZy8/o6D3/7xi7
 8+u7OY6lmfaSk6vvWkYlLFXvByGdoamFCqom7ZRUWSP/BPbtd60KI2DWmaKSHsc5Yz2y
 YC16ZgR8StXBsdp7B32xr6czqMwErbUrDBIL/EyAz4t0bS0DTV80AJEv3ghw3xHtVuFy
 7B8w==
X-Gm-Message-State: AOJu0Yx0gPWwYJ1cr6EeylwQR27tmF8P9rJjExUCupaaCDYTpe8XDLoq
 E/9N2KUdHIJBm+zUcsMyToNrxnHNyfZiUmreF5g=
X-Google-Smtp-Source: AGHT+IFAuBVKaO6Sum5+qKmo5IAu9PD21HlBd1YBSGo05czKi+0TFycKFN/e4FROz0HoJtgKloZSVg==
X-Received: by 2002:a05:6512:ba3:b0:4f9:51ac:41eb with SMTP id
 b35-20020a0565120ba300b004f951ac41ebmr771728lfv.16.1696379487750; 
 Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 03:31:24 +0300
Message-Id: <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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

clk_rcg2_shared_ops implements support for the case of the RCG which
must not be completely turned off. However its design has one major
drawback: it doesn't allow us to properly implement the is_enabled
callback, which causes different kinds of misbehaviour from the CCF.

Follow the idea behind clk_regmap_phy_mux_ops and implement the new
clk_rcg2_parked_ops. It also targets the clocks which must not be fully
switched off (and shared most of the implementation with
clk_rcg2_shared_ops). The major difference is that it requires that the
parent map doesn't conain the safe (parked) clock source. Instead if the
CFG_REG register points to the safe source, the clock is considered to
be disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..9fbbf1251564 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_parked_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 5183c74b074f..3f52abf0025e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
@@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 cfg;
+	int ret;
+
+	if (!clk_rcg2_is_enabled(hw))
+		return false;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
+}
+
+/*
+ * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
+ * parent_map. This allows us to implement proper is_enabled callback.
+ */
+const struct clk_ops clk_rcg2_parked_ops = {
+	.is_enabled = clk_rcg2_park_is_enabled,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
+
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
 				       struct freq_tbl *f)
-- 
2.39.2

