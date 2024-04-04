Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7215899247
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 01:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D14111367E;
	Thu,  4 Apr 2024 23:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H0TAHpLI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9683911367D
 for <freedreno@lists.freedesktop.org>; Thu,  4 Apr 2024 23:43:49 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5cedfc32250so1248221a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Apr 2024 16:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712274229; x=1712879029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RMI5yWOLAVIgIkbCc96VWxktkn/9P3095VY77NHNd1o=;
 b=H0TAHpLI8eiBmYn65K/JjNGoMZKyVfI2P1YF6g7qaUk8xDlKoUfOmsAPS5NwhkhP/u
 zmbwvcqwHSZlUzpWkfeZgWX6ZRa40CmneI0EbGkYp9Ckx9fG6aWfqYAksz1mKL0YwQYH
 G5+jOAP/iOHXLlffw/LVNOk1Cr1lWzr2z/k6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712274229; x=1712879029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMI5yWOLAVIgIkbCc96VWxktkn/9P3095VY77NHNd1o=;
 b=q09Mofx0SMpcAR0RNx/RTlVXfvgy5K3aDxLt4VrL6n+C76d9CJO5V3hKdkrNJD3IZH
 JvNd/eun70dRu6scKeI1OAQWjS1nDvhNuFHDxAmgMAXOqqkgBydsBn8RmXpCCVO42KxN
 ssDuZ92hMniNYu+MSZwEWYE5ctgqr3nG1TzRSxpbxrj2bS4Ofn4UgqcgObNvaBMWOJbK
 InIiXtMkpI4E1kZIRox6cMAesSCfztAZ8pWLWHOkoJ5Kpjld+hQiLnGf0wP78T/MVfTC
 Xi5wEyzkllXsP3ZoitGurrCW/8f7FC/cLZV/rc2lHOE/dN5GojF/e6uyWrnPzgXXiMSx
 adBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8AllatgcLXOcpU5P1t+kIuO5+1tnIUBtDPOr9Yli+hgmlLYcuh4h6bCruZahZTQGG8cRxVMUcqrfHexnKtCqMKqtA/gFMl4l6VeybljW/
X-Gm-Message-State: AOJu0Ywtfs+lIPf1rNYmtffkRLDNk8fTAPpMn2F23SInfGpxrsgKU1wP
 l7gOykU4EX58k58YVmHsYEK1upD0aHsK1Yi3msK2pTpDgY96lOYLePhV4fG4Zw==
X-Google-Smtp-Source: AGHT+IEXZdsBDxClfnWn4V8ckwcGELQZihfoKdxkgEQZf2dDcxavcBDgDIZ9TfrbOn0Q57NFbPr69Q==
X-Received: by 2002:a05:6a20:1057:b0:1a3:6bb1:92fb with SMTP id
 gt23-20020a056a20105700b001a36bb192fbmr45166pzc.19.1712274228928; 
 Thu, 04 Apr 2024 16:43:48 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com.
 [34.125.198.4]) by smtp.gmail.com with UTF8SMTPSA id
 ga16-20020a17090b039000b002a2b06cbe46sm269450pjb.22.2024.04.04.16.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 16:43:47 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-phy@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] phy: qcom: qmp-combo: Fix VCO div offset on v3
Date: Thu,  4 Apr 2024 16:43:44 -0700
Message-ID: <20240404234345.1446300-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Commit ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to
setup clocks") changed the offset that is used to write to
DP_PHY_VCO_DIV from QSERDES_V3_DP_PHY_VCO_DIV to
QSERDES_V4_DP_PHY_VCO_DIV. Unfortunately, this offset is different
between v3 and v4 phys:

 #define QSERDES_V3_DP_PHY_VCO_DIV                 0x064
 #define QSERDES_V4_DP_PHY_VCO_DIV                 0x070

meaning that we write the wrong register on v3 phys now. Add another
generic register to 'regs' and use it here instead of a version specific
define to fix this.

This was discovered after Abhinav looked over register dumps with me
from sc7180 Trogdor devices that started failing to light up the
external display with v6.6 based kernels. It turns out that some
monitors are very specific about their link clk frequency and if the
default power on reset value is still there the monitor will show a
blank screen or a garbled display. Other monitors are perfectly happy to
get a bad clock signal.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to setup clocks")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7d585a4bbbba..3b19d8ebf467 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -77,6 +77,7 @@ enum qphy_reg_layout {
 	QPHY_COM_BIAS_EN_CLKBUFLR_EN,
 
 	QPHY_DP_PHY_STATUS,
+	QPHY_DP_PHY_VCO_DIV,
 
 	QPHY_TX_TX_POL_INV,
 	QPHY_TX_TX_DRV_LVL,
@@ -102,6 +103,7 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V3_DP_PHY_VCO_DIV,
 
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V3_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V3_TX_TX_DRV_LVL,
@@ -126,6 +128,7 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V4_DP_PHY_VCO_DIV,
 
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V4_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V4_TX_TX_DRV_LVL,
@@ -2162,6 +2165,7 @@ static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 phy_vco_div;
 	unsigned long pixel_freq;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
@@ -2184,7 +2188,7 @@ static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
+	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev

