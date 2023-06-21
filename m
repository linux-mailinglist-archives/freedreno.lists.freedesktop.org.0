Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21212738901
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC18310E4BB;
	Wed, 21 Jun 2023 15:27:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9610E4AE
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b47a15ca10so52616031fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361248; x=1689953248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
 b=j3AS4hx00Klja//zSZq6EcICNDh6V+sFiGhimSeRr3qhCyE775SAf3RDwNcRt4Ki3j
 EZl53sUA2QYsb6OrO7fL0yNWS4nF+Nu3d/41wVFs53vsaNC9CZRjWWOwqyBK6cXkOrRt
 CQDjL0P5WXKUA4YSqva42vlK0JCUK0OjuXMpLyWZtOWjLtdG4KjJgbTaMcq2SZKqv547
 pb9UBvDGYNVrTKyo9np/wTxog4tTdU+sLb4ioudsf79iH0Q+HP8y7Tz3+nC1uaIQt1l7
 hnsjTgwCTcSu7sb+aeHmmjKmk23joeWNbmwweaaoKmfE8eihAu3idLHSV4BFH3tmuRXj
 jsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361248; x=1689953248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
 b=MpmRbwm++PBHDlt8OrcUvKeQqqIQz/aqnGL6vw6dktm0h06aK7SaaVaDr997m+iEHx
 IQz5l9ZwwSpYIBNp/Hw4PPHVhDGiAvh9GcALWv9xTHOygZkdJN1cP4U+bij59T1Fp8pK
 eFRGKmBADUZ8tiM+NVNWAa0W1vdth6++HMRpZBH7u+n2+YkGqi3eFDi3UUaUTLK4ZH2i
 Kz4Wz1q8ES770zbxjPKhtztxcgnLQlhzwRHmvcpB43orww+BBNgqo8ru/i71ugFeslrz
 nPujOQRYVoju76yd3wylrzTU0GbeoWXHX8juiwimz5w5A9ouCYFCy/0OmSMIJgZyCEqa
 R+ew==
X-Gm-Message-State: AC+VfDypo4kbNuLMhLn2sD5e0HQAi/PLOORJhhze0pgHN86nUcEVfPA7
 TKm/9w7GbuQt3KvsFo3Epo77LQ==
X-Google-Smtp-Source: ACHHUZ5EtH0JIYoCiImPq++FdLSlJvawI4U6yNfoJPq8giZkqf6rQb3Qz2AhmIARMlYXgosLGRoApw==
X-Received: by 2002:a2e:b601:0:b0:2b4:8623:cf74 with SMTP id
 r1-20020a2eb601000000b002b48623cf74mr4650604ljn.18.1687361248225; 
 Wed, 21 Jun 2023 08:27:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Jun 2023 18:27:19 +0300
Message-Id: <20230621152719.1025801-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
References: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 7/7] phy: qcom: qmp-combo: extract common
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
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

