Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FA738942
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B020E10E4BB;
	Wed, 21 Jun 2023 15:33:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EA710E4B4
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:33:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f866a3d8e4so6379139e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361601; x=1689953601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zqv6dHIj5R/PVt/K2VFqCy6JmpHTawrx9eZsS/DXaNg=;
 b=hIcjehJlxjdrRE7jx1Uun/lGAsveMv/tnJMt08+0rLtQrD/B4s2y/GDpWyyrBhmNXW
 2MyonqxXtGMsIDdq1XgdyyCemLhpWOlfZOSiwNu67ncn6q1VqimVr1DwhOo7OOzFD/EN
 RU4cLib5CA9bAGaTUn4nNI9lhv5iBcRKiRO6ddqGGx6YktbcOe/xWxgyzoptQNL2lERE
 3NoaZC/wnHo5eDv385GE2ONzy2FkCJ16whDhGt8nMxAy0u9Amp6ngpLCDU6DFXahgefn
 oUll90Tbq9GOop/i2qlmbjaXX+4ag6v3AZtbGlQSLK8GfU9A6Eht3Icdkzy5EVV4LN0N
 Amgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361601; x=1689953601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqv6dHIj5R/PVt/K2VFqCy6JmpHTawrx9eZsS/DXaNg=;
 b=FviJuWM9HbIXHbn5jieyQSoy3DUopNZPQVhpWbiF1d0vYyl364JOCNFOzhaej3uVD5
 sfMb2QxLD1T1cLdOuu9IqiELKoEMQG3R+KGa2PWl5zK1TZJuaNS341du+7QGifk+doId
 3dxgbsMihmcjslDBj9sTTdHNxD2I8npE+QDbYm3lZhbJF2RZpfWiGKJJHLB2chkKZqGc
 jIFJDUGJoKhG80JfTuiRl2o5FKT+GvcCsuxMTF3wFbWVOOuCq+XsFV4LTvI239XM/Yk6
 fiDQ1WN77pBgXSgmufpiG0GVfPMkVqpYM40BrsHknDWjnoiei3mk6Lor7kDP/2uIe+on
 t8lQ==
X-Gm-Message-State: AC+VfDzv7OFSRUbJJFjDSqAeGq2V0u3s4Aoe1qjBT2aj7KD6XlLO9v38
 qgM70mk+ImOtXbyU3f7xdBfsPQ==
X-Google-Smtp-Source: ACHHUZ65NQomsaV1aBx/+UUEZuYnEkLmDpY5+L4WHiZf3au3soENF8VM+wLqTQF5jHR+1bZ6T8NoLA==
X-Received: by 2002:a19:3851:0:b0:4f9:56aa:26c2 with SMTP id
 d17-20020a193851000000b004f956aa26c2mr2057423lfj.57.1687361601245; 
 Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:33:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Date: Wed, 21 Jun 2023 18:33:13 +0300
Message-Id: <20230621153317.1025914-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH 3/7] phy: qcom: qmp-combo: reuse register
 layouts for even more registers
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

Instead of passing additional registers to qmp_combo_configure_dp_swing(),
reuse qphy_reg_layout and add those registers to register layout maps.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 104 ++++++++++++------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5a0966e66cc1..2f95e29110df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -113,6 +113,10 @@ enum qphy_reg_layout {
 
 	QPHY_DP_PHY_STATUS,
 
+	QPHY_TX_TX_POL_INV,
+	QPHY_TX_TX_DRV_LVL,
+	QPHY_TX_TX_EMP_POST1_LVL,
+
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -130,6 +134,10 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V3_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V3_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V3_TX_TX_EMP_POST1_LVL,
 };
 
 static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -147,6 +155,31 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V4_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V4_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V4_TX_TX_EMP_POST1_LVL,
+};
+
+static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V5_COM_CMN_STATUS,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V5_DP_PHY_STATUS,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V5_5NM_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V5_5NM_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V5_5NM_TX_TX_EMP_POST1_LVL,
 };
 
 static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -164,6 +197,10 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V6_TX_TX_EMP_POST1_LVL,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
@@ -1648,7 +1685,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v45_usb3phy_regs_layout,
+	.regs			= qmp_v5_5nm_usb3phy_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
@@ -1942,8 +1979,7 @@ static void qmp_v3_dp_aux_init(struct qmp_combo *qmp)
 	       qmp->dp_dp_phy + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
-static int qmp_combo_configure_dp_swing(struct qmp_combo *qmp,
-		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
+static int qmp_combo_configure_dp_swing(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1972,10 +2008,10 @@ static int qmp_combo_configure_dp_swing(struct qmp_combo *qmp,
 	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
 	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
 
-	writel(voltage_swing_cfg, qmp->dp_tx + drv_lvl_reg);
-	writel(pre_emphasis_cfg, qmp->dp_tx + emp_post_reg);
-	writel(voltage_swing_cfg, qmp->dp_tx2 + drv_lvl_reg);
-	writel(pre_emphasis_cfg, qmp->dp_tx2 + emp_post_reg);
+	writel(voltage_swing_cfg, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(pre_emphasis_cfg, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(voltage_swing_cfg, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(pre_emphasis_cfg, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	return 0;
 }
@@ -1985,8 +2021,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias_en, drvr_en;
 
-	if (qmp_combo_configure_dp_swing(qmp, QSERDES_V3_TX_TX_DRV_LVL,
-				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
+	if (qmp_combo_configure_dp_swing(qmp) < 0)
 		return;
 
 	if (dp_opts->lanes == 1) {
@@ -2174,15 +2209,16 @@ static void qmp_v6_dp_aux_init(struct qmp_combo *qmp)
 
 static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
 	/* Program default values before writing proper values */
-	writel(0x27, qmp->dp_tx + QSERDES_V4_TX_TX_DRV_LVL);
-	writel(0x27, qmp->dp_tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-	writel(0x20, qmp->dp_tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
-	qmp_combo_configure_dp_swing(qmp, QSERDES_V4_TX_TX_DRV_LVL,
-			QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	qmp_combo_configure_dp_swing(qmp);
 }
 
 static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
@@ -2326,14 +2362,16 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x0a, qmp->dp_tx + QSERDES_V4_TX_TX_POL_INV);
-	writel(0x0a, qmp->dp_tx2 + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
+	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
 
-	writel(0x27, qmp->dp_tx + QSERDES_V4_TX_TX_DRV_LVL);
-	writel(0x27, qmp->dp_tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-	writel(0x20, qmp->dp_tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+
+	return 0;
 
 	return 0;
 }
@@ -2384,14 +2422,14 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x0a, qmp->dp_tx + QSERDES_V5_5NM_TX_TX_POL_INV);
-	writel(0x0a, qmp->dp_tx2 + QSERDES_V5_5NM_TX_TX_POL_INV);
+	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
+	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
 
-	writel(0x27, qmp->dp_tx + QSERDES_V5_5NM_TX_TX_DRV_LVL);
-	writel(0x27, qmp->dp_tx2 + QSERDES_V5_5NM_TX_TX_DRV_LVL);
+	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + QSERDES_V5_5NM_TX_TX_EMP_POST1_LVL);
-	writel(0x20, qmp->dp_tx2 + QSERDES_V5_5NM_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	return 0;
 }
@@ -2442,14 +2480,14 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 			       10000))
 		return -ETIMEDOUT;
 
-	writel(0x0a, qmp->dp_tx + QSERDES_V4_TX_TX_POL_INV);
-	writel(0x0a, qmp->dp_tx2 + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
+	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
 
-	writel(0x27, qmp->dp_tx + QSERDES_V4_TX_TX_DRV_LVL);
-	writel(0x27, qmp->dp_tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
+	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-	writel(0x20, qmp->dp_tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	return 0;
 }
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
index a69233e68f9a..b4810c48dc20 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
@@ -7,6 +7,8 @@
 #define QCOM_PHY_QMP_QSERDES_TXRX_USB_V6_H_
 
 #define QSERDES_V6_TX_CLKBUF_ENABLE				0x08
+#define QSERDES_V6_TX_TX_EMP_POST1_LVL				0x0c
+#define QSERDES_V6_TX_TX_DRV_LVL				0x14
 #define QSERDES_V6_TX_RESET_TSYNC_EN				0x1c
 #define QSERDES_V6_TX_PRE_STALL_LDO_BOOST_EN			0x20
 #define QSERDES_V6_TX_TX_BAND					0x24
@@ -15,6 +17,7 @@
 #define QSERDES_V6_TX_RES_CODE_LANE_RX				0x38
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX			0x3c
 #define QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V6_TX_TX_POL_INV				0x5c
 #define QSERDES_V6_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
 #define QSERDES_V6_TX_BIST_PATTERN7				0x7c
 #define QSERDES_V6_TX_LANE_MODE_1				0x84
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 7ee4b0e07d11..32d897684755 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -134,6 +134,8 @@
 #define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
 #define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
 
+#define QSERDES_V5_DP_PHY_STATUS			0x0dc
+
 /* Only for QMP V6 PHY - DP PHY registers */
 #define QSERDES_V6_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
 #define QSERDES_V6_DP_PHY_STATUS			0x0e4
-- 
2.39.2

