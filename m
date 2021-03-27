Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FF34B6B1
	for <lists+freedreno@lfdr.de>; Sat, 27 Mar 2021 12:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1D6F542;
	Sat, 27 Mar 2021 11:03:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60016F527
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id z8so10244158ljm.12
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZkwV78IuNtmaq0h8QhjzXk9W9vQ8jeXGP9lM1kXR6HE=;
 b=QTtcaSVah+rbfN+Qnd0J+Q5bLs0dBTq9uo7X154/qJxzyy2b1+MyaRmQMO3z6Mwnr2
 pPb7VZIPP+8EWiSurElVOZqte/qwPAcVYQH6ckmoS1pMSld+x70zMqckhe4JatWb2HQd
 2N19dl4FlFZwQFHcp3xEQmaq2yZwIi+hWFrmHdXzs4InVAMnRFt087ZlS/CZqtN0d7Gy
 tnSR63Rc4OkSABeI6tEVlqS8M9Cn/NSs6V4zGrKRTnqaA28GTH5nUzrS2bgjpDjfgqwI
 j9bQq4VvaiOdEORXZsVWSacMoP79op+z1X1uadlsCNDGtK1vPzbU/Vb3SNz6hZ2f63lD
 463g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkwV78IuNtmaq0h8QhjzXk9W9vQ8jeXGP9lM1kXR6HE=;
 b=ZagKz5rfbrmEV86YkNHEz9Va+GSh8J21pLjx9vwyC3P6Wp3iFega57AJSl6RXPqRUk
 nFLx3hnd+gcKtndaRtyQ+Q6ODbeA+X00ToDEhOZpYPiLBtbNlQJFaBiUCaFksX/6lGTL
 1v0b9DAoUeMtV+yLYMJmpdTCmeBFar/N2MCABTY4p4k8Eg2y6yF6/Zzmx9Ja4fU3LNnK
 OAWkPiiFPW3Za1mvQDL7QiMazQJZbhBY4Z3+wq9uKV4TJ9M80XIqS/7eKewdGlX2oBa7
 HzbpjrHsWBchesNlQ66Y/SWV3kBbSP+Dy21SqY+z1pcKEuyK2ONytVa877TMomc5UBde
 xh3g==
X-Gm-Message-State: AOAM533qJjyRgvtXmqdIWpX5ycreAVGvyUU2eLP/cvu520VqXnjPcnZL
 pk6chFOGj+aW+u2F7fWT6aa0Ug==
X-Google-Smtp-Source: ABdhPJy6cxgJgkqHEz5K2a5c2Hisa3T67LBUvKtXYR1b053qI1iND+HEEsL86Z4S/GB2Od6gIwjifA==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr11497736ljl.255.1616843004098; 
 Sat, 27 Mar 2021 04:03:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 27 Mar 2021 14:02:56 +0300
Message-Id: <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 16/25] drm/msm/dpu: simplify vco_delay
 handling in dsi_phy_28nm driver
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..ed369eb18e9d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -72,8 +72,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
+		udelay(1000);
+	else
+		udelay(1);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 
 	pll = &pll_28nm->base;
 	pll->cfg = phy->cfg;
-	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
-		pll_28nm->vco_delay = 1000;
-	else
-		pll_28nm->vco_delay = 1;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
