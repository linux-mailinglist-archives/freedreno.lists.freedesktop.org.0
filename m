Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8468C7B7644
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 03:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53AA10E332;
	Wed,  4 Oct 2023 01:23:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD62D10E32F
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 01:23:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5041335fb9cso1777686e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 18:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696382592; x=1696987392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldmiZ1B4qHPIROttBws4cHozTCwfz++/pPdWBPL50Rc=;
 b=jw4m4rRsXRZs/JShdtM7XD8iGrng6e8u/QqyekCOK28IACQDhqDlhgAiGMaf0p/ove
 QU3MmnQ5ae3mnHaAqVPhPHYpqKvOJtEq5748pQvVmJnhzbhxySnV6lyNgaDeWOBsR8LU
 cco8Mnt55FoKnha0WKPJIgAa421OPORI1XtnIuvPu108jn+x1265bsbJ0Q6K0NkMtmu5
 SMEOB348bA7BDUazO4zCHclYIP7KvunvjFHTto6doap1w6Zzxi1th91vZ4hdiggaJ1L7
 ZsQ9MOM9hlSERu+NCYkP0PytFLaTZkqHcTwhoXyn1I9MKKJKGNIK80uxRjDHMdHtx5Fr
 +3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696382592; x=1696987392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldmiZ1B4qHPIROttBws4cHozTCwfz++/pPdWBPL50Rc=;
 b=n9gt6Ti3dqJH43yEPeR6d2kgnBk93MJqiDciWRtOJdQkKghTa7AoWQNb/h7upTxjzx
 KGv51S6U9ljLqqJxD6njZ0NboYQ8Aj2XqfR8FEtAjvaQA+5CASakuY0C0295NlaHMuz6
 V/R6I3GG9YdJ0cDmJrC53zcRxi1mZmow7r3kY4EUBB3t/uQH/HNsw4wkga4NWO+rodvN
 Ok2snHQnSrlsyoYHKtxhQiV/b5N05IBvcoP8j4PqbxU5F1rVUF7PZRnalwDHBKyoHjOj
 RGJ1xdZq9dV2LPDJpfhT4ZAO7wVtvqshjWN2K0zjJIiONAkSuH+QUOOSFMNwmFm4v5t/
 Q1Lg==
X-Gm-Message-State: AOJu0Yw1V8Ck483VX2N031Jpuqj+W1qxgn1zJ8u8qqTkCaDZv1+n3+4b
 I1RTqayNDve8A8L47SEMwV+TJA==
X-Google-Smtp-Source: AGHT+IGq1fOheH3WXU9w2brGMWHS03IgADRAs2ftF5RfTuLcwqrZPPdR/N0ePl7HynNJPx0gqNcUOA==
X-Received: by 2002:a05:6512:48d6:b0:500:9734:545a with SMTP id
 er22-20020a05651248d600b005009734545amr741883lfb.5.1696382591910; 
 Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 04:23:07 +0300
Message-Id: <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked'
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
 drivers/clk/qcom/clk-rcg2.c | 56 +++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

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
index 5183c74b074f..fc75e2bc2d70 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
@@ -1150,6 +1151,61 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_parked_is_enabled(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 cmd, cfg;
+	int ret;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
+	if (ret)
+		return ret;
+
+	if ((cmd & CMD_ROOT_EN) == 0)
+		return false;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
+}
+
+static int clk_rcg2_parked_init(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const struct freq_tbl *f = rcg->freq_tbl;
+
+	regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked_cfg);
+
+	if (FIELD_GET(CFG_SRC_SEL_MASK, rcg->parked_cfg) != rcg->safe_src_index)
+		return 0;
+
+	if (WARN_ON(!f) ||
+	    WARN_ON(qcom_find_src_cfg(hw, rcg->parent_map, f->src) == rcg->safe_src_index))
+		return -EINVAL;
+
+	return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);
+}
+
+/*
+ * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
+ * parent_map. This allows us to implement proper is_enabled callback.
+ */
+const struct clk_ops clk_rcg2_parked_ops = {
+	.init = clk_rcg2_parked_init,
+	.is_enabled = clk_rcg2_parked_is_enabled,
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

