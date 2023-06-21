Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C742D7388FD
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BCF10E4B5;
	Wed, 21 Jun 2023 15:27:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7A610E4B6
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:27 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b475b54253so56180831fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361245; x=1689953245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvB3fEKCRuDwI/EV0i9EbALs6x/kgybfzFQBnpXb5js=;
 b=V7+TbF5N04XnZ+rgp1Jx8UUr31B+fY9dt0tXAWrqZzcpp9qBHEpG8H7VlAOGNnLOvF
 V9m2X7wDeuMGzY/tZxh8wkvtpx5NJ2Wu6zfSzICNUfbZRK1yDMVrBeK6NLjxA+NVryLU
 i6dTnpgtB+FESUYCVFnCdIY4fC6jIaUo+X3fo4SAUy6WD7pxNp+jsyfzO4MQoCyfCifm
 8cLO8ZAJ8EJdEJ90sdH5CaS6Zs3TsqU3j+g20kWggxZUP2TpXlaLv5a3T6d/e3IKJeJX
 1IYXWhRyQqEyGSYjBl0xwcSEq/8n3J7d2cTA/HLZYJmGP9Sa0cO1jSh6BQRALWC3Zp9v
 sUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361245; x=1689953245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvB3fEKCRuDwI/EV0i9EbALs6x/kgybfzFQBnpXb5js=;
 b=lM+0sqIzcRcDeFn3vdCExzjH7R0gF8Qshe7HT3i9qAXoka7oR7SJ5SNywe7zsTo0hg
 SReOBNoTFBG24OfADvilZ94zFLekOCNr8Q3M+OB9YgCyf7Ycq2bc2xyjTGPEpAfDZ7CO
 zgkZ2LASIaC0euOrcwhf4fGcex18giusc1L7Hlf7pR0Fh4XeGxlyjr/kIj3e0q4j04N/
 S+64QYS74Eh5PrH/Ns7HKOfhe0ngv0wNB6rgjGeJABB+FfhJqT0rrMcTXQ4r2fX27Z7a
 mUkCOg0GMuelYD385+GtGd64oAxowBz/T/JXfSZndY4C9QAcgtepCdAGUQ3Ty2KY4e59
 A23A==
X-Gm-Message-State: AC+VfDz5e/LBezelboM/4KzbZ3sJK5QWU5kddTFDS/EnnBoR5j0A6SHr
 rtsAZ0rVxoJrYZPCTXNNNZaqhw==
X-Google-Smtp-Source: ACHHUZ4yQkfeJYwdgavRfyCh+1MBSgm/13ITVMCVVbDMNHqZRV7T6pRStuap6alxM0TtVbl88ZcUtA==
X-Received: by 2002:a2e:8ed7:0:b0:2b5:800e:3f14 with SMTP id
 e23-20020a2e8ed7000000b002b5800e3f14mr3198160ljl.40.1687361245738; 
 Wed, 21 Jun 2023 08:27:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Jun 2023 18:27:17 +0300
Message-Id: <20230621152719.1025801-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
References: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/7] phy: qcom: qmp-combo: drop similar functions
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

The functions qmp_v5_configure_dp_phy() and qmp_v6_configure_dp_phy()
are now copies of qmp_v4_configure_dp_phy(). Drop them and use the v4
function in all the cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 123 +---------------------
 1 file changed, 2 insertions(+), 121 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index d034b4f45bd3..80a5bebf86a2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1433,10 +1433,7 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp);
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp);
 static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp);
 
-static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp);
-
 static void qmp_v6_dp_aux_init(struct qmp_combo *qmp);
-static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp);
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
@@ -1686,7 +1683,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
-	.configure_dp_phy	= qmp_v5_configure_dp_phy,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.clk_list		= qmp_v4_phy_clk_l,
@@ -1875,7 +1872,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v6_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
-	.configure_dp_phy	= qmp_v6_configure_dp_phy,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
@@ -2386,122 +2383,6 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	return 0;
 }
 
-static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
-	u32 status;
-	int ret;
-
-	ret = qmp_v456_configure_dp_phy(qmp);
-	if (ret < 0)
-		return ret;
-
-	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x15;
-		drvr0_en = reverse ? 0x13 : 0x10;
-		bias1_en = reverse ? 0x15 : 0x3e;
-		drvr1_en = reverse ? 0x10 : 0x13;
-	} else if (dp_opts->lanes == 2) {
-		bias0_en = reverse ? 0x3f : 0x15;
-		drvr0_en = 0x10;
-		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr1_en = 0x10;
-	} else {
-		bias0_en = 0x3f;
-		bias1_en = 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
-	}
-
-	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-
-	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
-	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
-
-	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-
-	return 0;
-}
-
-static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
-	u32 status;
-	int ret;
-
-	ret = qmp_v456_configure_dp_phy(qmp);
-	if (ret < 0)
-		return ret;
-
-	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x15;
-		drvr0_en = reverse ? 0x13 : 0x10;
-		bias1_en = reverse ? 0x15 : 0x3e;
-		drvr1_en = reverse ? 0x10 : 0x13;
-	} else if (dp_opts->lanes == 2) {
-		bias0_en = reverse ? 0x3f : 0x15;
-		drvr0_en = 0x10;
-		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr1_en = 0x10;
-	} else {
-		bias0_en = 0x3f;
-		bias1_en = 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
-	}
-
-	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-
-	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
-			       status,
-			       ((status & BIT(1)) > 0),
-			       500,
-			       10000))
-		return -ETIMEDOUT;
-
-	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
-	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
-
-	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-
-	return 0;
-}
-
 /*
  * We need to calibrate the aux setting here as many times
  * as the caller tries
-- 
2.39.2

