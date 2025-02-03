Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB69A26169
	for <lists+freedreno@lfdr.de>; Mon,  3 Feb 2025 18:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044A810E535;
	Mon,  3 Feb 2025 17:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YL9QrhN3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA510E534
 for <freedreno@lists.freedesktop.org>; Mon,  3 Feb 2025 17:29:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4361f09be37so5872495e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 09:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603777; x=1739208577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Tf+gynoUbS6lxW8GWMLHyFia33+uFkAfKbxTriQ8gQk=;
 b=YL9QrhN3RjIq20Fx7n1WAqnrGsl3KjoY3s5QnES/wMdm8krvzLVfH/tPStK9x+7svB
 tT+GXXEGpCz4v3uSNNbX1R96D92A85JaMl1DFRyXHOgAlyRxL8G6OzfD2Jumt20N7J/Y
 I63xZGZqFiiJMAT+0hV9fJBWRoc95KidHNYyxqFlCCEOshMQ0BAHpmJNq8kwDDWKFTMS
 k/CEHOF5Te1NsDj+hyvATrOcNBpOfx2O9tTnbUtXVN+TVBySH0f8JBth3DVDRWx3uXnv
 LlbLhUjle0gUF2QwtWcxMjStnCbxDUqn7NPOe7WNOInIQvGsBEi/9V/BsnCD9GiqbHWb
 odVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603777; x=1739208577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tf+gynoUbS6lxW8GWMLHyFia33+uFkAfKbxTriQ8gQk=;
 b=caozWd2Iar32i7tbfpbfapdBm50K4pTTm01V8B2HYoyUDzZ59E6Z2ojywRByOp2gch
 klD7yaNX3Rk2dYbVHz0SzXypI401HcJLlYSJ8CAlFTgKjRT3HRfTFwzxzY1bNXsbUQUV
 NVdG7dED9ayJGKCRf2Y36pUG2qlwj+w3H14hIVVuKHjsRjTUSNCy6QS9J0Z7ME8RX+7J
 /Jm7UsGseTT4RlC2WGuIW63xo6fo5hrPCF5aZzHoxzwgjZ6dICm8CDPQzN+xg6UsnZfT
 TSWQTL27b5JLaJcNaC4NTh2qD9Pbcpj/GA2QmVwujCus41o2lEKWqWxiIOI/cmECshwA
 Ey6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLXPGquteVjZenTAtFIkF9pTnWI1WHOz27PxwQcJxQ4GJiecImbS7Iw8xPbvNDGvCu300KIRoHUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzWuQVRh+A1yqYmJBC5kNDjmqbS9ABVeHpaHyGllR22SoZf+de
 cQDK97MbdI24TwXLtLVag7gQwJ/tu40Z6Vq0ATqqR8OlZCngls6aFN/m3ifLnmY=
X-Gm-Gg: ASbGncv8MpTfEEcG/A17BGOtB0ip4yzcxKjDGxOL21r8CAFs2AokIGEgYjsKu41+xtn
 Anu+cz6jczlOtEw7amwNItZH6WHNihTmTmWk8dmiNhMXCo25O1+XPJp88DhoKXeyUBEN4RJ0cge
 hLANhsWy0f8VcyxYpvohHSZLKaaRLt956kSRKu76OAOSoreZF6/UrbK9vKbFSDp/DqMAxUyLrBC
 +UgpFItoYpM7VQP4XWk+5v5bbjngWzyt3ZMNP5R4+QVYj4rEy7ZW/wD+nVgFcaGAZF6JUlnMwm/
 l7zGVpgFuHfC0bcu2YpfOA02ynEahVU=
X-Google-Smtp-Source: AGHT+IHpCi8NFdRZPkNyfk3QyLKPMrZikIzHsaOMm+NxpNTCIpyZ/wD6KwoRM3Rv4yDTUHoHPY3etw==
X-Received: by 2002:a5d:5889:0:b0:38b:ed21:c2ad with SMTP id
 ffacd0b85a97d-38da4e44075mr142580f8f.10.1738603776796; 
 Mon, 03 Feb 2025 09:29:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:29:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:19 +0100
Subject: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3986;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zlnos82iUqx+CQNn8/y/plTrr00WcMZCC6iMPwasfUA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz6SXke1wN3LIxQpJSGHIG66Ahs05fJYVm97
 EI55upUv52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+gAKCRDBN2bmhouD
 17mjEACTFIg2S5sLDyvJm4cvRIu+58N1tdpml8Ho4aDS5A5mzbv5nDSQWGscQ6ljI5t9OSmyelR
 52A6qLGVFefVpEEpaxw+5jbD/Gnac1QsvtOKvYzimBAXKaXegC2ib/um49dePLH4ucgVnF6e2xI
 GIJql9srxKV3yHXOYImS9uYWqkiKNtad4Zv0k8MSXRU1bwD50MwxDAT6jMc2OsSWl6KQTRsQ6tR
 kSEZc0l5I1K9IoWdthde7Dyzg8tTGvrd6bkNp3bqwFwpKFrhDmoZlKDKHNr5BhH2YR0Il3j/F0s
 M+cEIiDjOFhcrZGAAsUGheMS7PUA/BqOcu3aU3lqzrxfLUy/MJRNfuiH30NYo3GzQ8qv69xBssn
 /+Vr+579/tSyDrsXoSs7FvxGqAxKi6EkWAAJt2/36qbcK4HyIC9DChZQ/hqIK+okmYRrwkjE0p4
 Jzvo1yctgd57P2YQNfumHu5FNMlxYdYrMnvkPPq8EPIuJ4u9f6zpSqymJpxxp8B0UKt6IePF642
 pTXbF9H9tNw3zY+tgaswu/lBBWHxRGFNLzJ9SlSev2nN9Q5VasGmouLOlax0LPb2rKiCTcZMVjU
 KZIxOu1nQDbsKA8VLWxousm8vWOwe3B0mkdPQw5hWE3Y7uyxben/ffY27SUS64CQA1ujKG1x7yd
 FYITAlGx+wi/PRA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
clock from Common Clock Framework:
devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
concurrent and conflicting updates between PHY driver and clock
framework, e.g. changing the mux and enabling PLL clocks.

Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
synchronized.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -83,6 +83,9 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
+	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
+	spinlock_t pclk_mux_lock;
+
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
 	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
 }
 
-static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
+					u32 val)
 {
+	unsigned long flags;
 	u32 data;
 
+	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	data &= ~mask;
+	data |= val & mask;
+
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
+}
+
+static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+{
+	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 data;
+	u32 cfg_1 = BIT(5) | BIT(4);
 
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
-
-	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
@@ -585,11 +597,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   cached->bit_clk_div | (cached->pix_clk_div << 4));
-
-	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	val &= ~0x3;
-	val |= cached->pll_mux;
-	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -742,7 +750,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-				0, 1, 0, NULL);
+				0, 1, 0, &pll_7nm->pclk_mux_lock);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -787,6 +795,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
+	spin_lock_init(&pll_7nm->pclk_mux_lock);
 
 	pll_7nm->phy = phy;
 

-- 
2.43.0

