Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE9A23F59
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2025 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131AE10EAD3;
	Fri, 31 Jan 2025 15:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LbRZIax1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381FA10EAD3
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2025 15:03:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4361e82e3c3so2985615e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2025 07:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738335803; x=1738940603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vOG04vmKwSpyueEe3IB81azzOYNf9nZXosv7oYLCah0=;
 b=LbRZIax1d2eC5S4yFm3opu4XjWnz+D0tUxKzbQ4nJPoKfs0woIPQZ+kZq9RVzy6C3w
 afRG3fibvCTBdF4Wff7t9CmmfNhCNGtAbphvuyX/ZaLB5QERrWsQJ/jiVLgd7Z5Lj+SV
 R5Z6pHKqr1p5IsnlUwv2t5Zz9mmEdwcnU6WDluECMVIC7LVi8ya5Ibiybb0N4k1gujdW
 qf8tEaJc7I6UuDbxFRpNm/Ud4CqdGQvB5tTKTIdTA4pOoxEtJfbzi8JpT7dloz5AYTPV
 353UI0NfduYm+LtboNXxuy0JioFtSpPHXnJ9xxpwlAfkyX15D4m49jThiTIf4Svtwa2W
 S0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738335803; x=1738940603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOG04vmKwSpyueEe3IB81azzOYNf9nZXosv7oYLCah0=;
 b=oL8CZRwzR2Iqp4S5WITlIGDD/D0VXYMXYDMzctAuDt+/DgDVqLj4Ih9fvqv9wnbjnt
 wy5rcwDX+NwflNZCAlxRf5DuAhXodLkfq8ECsriSPJq6cDnyEAluXmgY8ojQXhQKzenh
 Jho+BPXQm2E5w7asaYhhqanrEAVYIg0nEJq4iA0g3VY8BRDbhtNkVsu6PD3hNruNXBSp
 8DN010rMdwjgUS9wLPGZJYhvRLfwhxpUmgKuGmrlakwXY1AhfniTVxXs3ITYLRWlvkhx
 sWWwfUq7xTsEWl+NEhRDWiCQkKxGWSU3zOPwu6J2Skxr2NRd3W1IAOrilSzSZxT8f1SW
 Ffog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqNsyEIE95oruy6nBtiUZxNFBD/f3QJyEgnVujkjVHbQemHALVrp5PZugyq2/4CMnCO3KpBYFVd+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoHYD8h7uei/xdsvmd7imns4Hiscj6yIYlaNJmSZ2ebjjIqI7/
 h7U0qeumv4bIuvq20Jin+7z2e+CcoXGUnQoZs4g/LaM6InoKqvksg86QgRYh1PY=
X-Gm-Gg: ASbGncvtXV/Wck1quaVnw59cUydAXH35h1uFoGoNoIO50cEdpw6/CvhLKX6EMYY52Qa
 Dy673wSkWbSs9k0uGlMcvaSqrnOggsdV6+tBfyCS3C3wSXOJvNX2vIBBzhFKd/wZYQ6s9rLSroE
 Cu1GR7wtuMxs1KXqsMrjo36o1i9sgK4SrptigzeIVUiwbv72TLQiFpQATJx+fLhYjZ+ZJCJwNBb
 WRMRjDZ+j82Zo03055Cj4dS8yq/Phc2iJrvaqLi44YD+9/aGZqbg9AT5l/05Z7YCURl+v1S/vk9
 YU52R/ZeXatg9eWqWcI5xUavPOaB1QY=
X-Google-Smtp-Source: AGHT+IG0gOzbonjy401fUUBUdELzQ5desAwbmNzSYkgOdCuyLIAiMWn9cUJeegXo09KdZBWlNYXK9Q==
X-Received: by 2002:a05:600c:19d2:b0:42c:bfd6:9d2f with SMTP id
 5b1f17b1804b1-438dc3a3ea6mr39897945e9.1.1738335801194; 
 Fri, 31 Jan 2025 07:03:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 07:03:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:50 +0100
Subject: [PATCH 1/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from
 driver side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-1-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TQMpX2q60ioSuYRUXxHVBxFSOpUM+v7zvcx6K2VHOjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYym0KBKDhMEN2wb8SIxsqakbhU9C7pTdPul
 yz5WkWsN/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmMgAKCRDBN2bmhouD
 15kHD/9c4oyVXwtyotRJmwCneKgUX+w0FoSrMVh89THMgyOyMr/F9oOKG+hFzLDrr9Tt7BIba7P
 ykIF48LWVhx4yn/ctm1lBWtwPD7P196DQaJLivIfdcuKtAwG9KSTyA5HbzkgTIG+6T44bWISYTx
 g0TxXJTBAq7vDi2c/Rnv60NnamXCNqS8psx33J/HtTlFF1Hz9OaSeWE1wwyYRU2IM3iDlrhB9dg
 8ddut5dznzY+PrJPjGpEgvLTJ056GurYKFqxxlJLxk740r4Um+U2N5Cq7qc+H5L8M5vme+uogvP
 mGfFCPmb9mp0Dy6kWxlYmSSzrEDUgciS62FVLDTbrlrTPD7oj65t/FuLviN8h48VrafC/d+FGqL
 8kQLvT4zziEXkUdqYQ/oOPMxWm2jY2zi+kHsPwPsMs+FqsJvx208/fqefI9NjHNAJMxE98yq6/P
 iDt8/JHX2agVgHiSzRhy/AIGG5tWgXL1LcSoRhTaLV9cj5D15Oow+r1Ufyssoq/G+lc3y8kmMgo
 5lGItK0HilEYpKIUyzF69EUhbEhRY0CYYgVk5eN0TJF/4r0korrYa7A+QjDh1rysioGwp33AeY8
 15Vuj6Wk1T+VUAcLh8epJ/EcDyA1lErfvu9NZWjw+mUtJ6AztohP2NsnHv0FQv0oFzaAULba9fg
 ceHjFl4uHXMW6Eg==
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

PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
divider clocks from Common Clock Framework:
devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
clocks side is protected with spinlock, however driver's side in
restoring state is not.  Restoring state is called from
msm_dsi_phy_enable(), so there could be a path leading to concurrent and
conflicting updates with clock framework.

Add missing lock usage on the PHY driver side, encapsulated in its own
function so the code will be still readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	ndelay(250);
 }
 
+static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->postdiv_lock, flags);
+	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
+}
+
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
@@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;

-- 
2.43.0

