Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EC738947
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C45892D3;
	Wed, 21 Jun 2023 15:33:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F310E4B5
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:33:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so5357936e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361605; x=1689953605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
 b=Slt7bijDPuc00cR7GK21PI0yAGTPJ3SLGd/LET/2bbzXsuQaxdTVmVcbnrLHGXRvld
 gTT5ixFlcGeEkU9SYB0rMeRUikh4htYyuxSkl2U1i2NEyi4XcxLOUzA6NfWbjKkwjHwX
 VcqG32Qi7i6LbAGLNXmcu4CwBhHsX6GoNqE4Ss4YMuRbG5Qp3LKJg4PSMOxJC2e0LxOD
 TpO4iPSb8MJYVmTgi/8sIKe+anTDS11qp3MhzdGf5runvrmZezNmv+RocWuQ06W8kyMf
 mRUbnb3LtnhkkiNM+16a56zozpMIjW7N655xTkUkpdEIoQZv2qW7Ey8KQtbdkqMGCaiI
 J5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361605; x=1689953605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
 b=TW/617z2ZyxwJacIk3o46mGXLtFdyD6nipKUbALjLKMAL07hBojLdGxIMGxWeFQ+jH
 oUAR68OH7purQ1V+RxxlChP+iKyn8yIj0VmlmxhSKSOiHqX5KDafBpTdHfvoVbKOYWM9
 5NRPuwoxwDWpRtHsh+ZbkyNYXw4zs462nn8ZdAPaLY3Xl/3VLQbOgM/IeLUtxukEYU5c
 3Zze0fuBGZTyPgNigsZNuADqC2myPa7luzBBnYtT4WLRhDEgloP4KNF+p1ACeYV2qD/8
 OE6gFqohrVnLJtCTT3GqMi0cW9k/RVWdhsBSDsocPje2heSQSq/H9adG6C/c1a+TJ9hz
 sObQ==
X-Gm-Message-State: AC+VfDz2yWo9Jv1/tS2Di4eIAH/pYrt9kzUfN9nFOnshPeiQuB7FBUcF
 0tLJzneOI8/OHrblTVIKTuKcOw==
X-Google-Smtp-Source: ACHHUZ6d9tnTTJ+UQb/PHI4xbPX2ZfLY0+7PMXWtXYuWS2fTmOYXQBiE5sisx78XvHknGMhia9xARw==
X-Received: by 2002:ac2:4d9a:0:b0:4f8:66ec:6ed7 with SMTP id
 g26-20020ac24d9a000000b004f866ec6ed7mr8373364lfe.30.1687361604991; 
 Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Date: Wed, 21 Jun 2023 18:33:17 +0300
Message-Id: <20230621153317.1025914-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH 7/7] phy: qcom: qmp-combo: extract common
 function to setup clocks
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Extact qmp_combo_configure_dp_clocks(), a common function to setup PHY
clocks depending on the selected link rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 63 ++++++++++-------------
 1 file changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index ab6cfa02ecf9..d82fcd060e77 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2074,18 +2074,12 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	return reverse;
 }
 
-static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
+static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	u32 phy_vco_div, status;
+	u32 phy_vco_div;
 	unsigned long pixel_freq;
 
-	qmp_combo_configure_dp_mode(qmp);
-
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
-
 	switch (dp_opts->link_rate) {
 	case 1620:
 		phy_vco_div = 0x1;
@@ -2107,11 +2101,29 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_VCO_DIV);
+	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
 
+	return 0;
+}
+
+static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	u32 status;
+	int ret;
+
+	qmp_combo_configure_dp_mode(qmp);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp_combo_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
 	writel(0x04, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
@@ -2210,10 +2222,9 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 
 static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 {
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	u32 phy_vco_div, status;
-	unsigned long pixel_freq;
+	u32 status;
+	int ret;
 
 	writel(0x0f, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_CFG_1);
 
@@ -2225,31 +2236,9 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
 
-	switch (dp_opts->link_rate) {
-	case 1620:
-		phy_vco_div = 0x1;
-		pixel_freq = 1620000000UL / 2;
-		break;
-	case 2700:
-		phy_vco_div = 0x1;
-		pixel_freq = 2700000000UL / 2;
-		break;
-	case 5400:
-		phy_vco_div = 0x2;
-		pixel_freq = 5400000000UL / 4;
-		break;
-	case 8100:
-		phy_vco_div = 0x0;
-		pixel_freq = 8100000000UL / 6;
-		break;
-	default:
-		/* Other link rates aren't supported */
-		return -EINVAL;
-	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
-
-	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
-	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
+	ret = qmp_combo_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
 
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-- 
2.39.2

