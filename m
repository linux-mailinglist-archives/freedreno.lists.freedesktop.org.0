Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE2A36107
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 16:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D0910ECC7;
	Fri, 14 Feb 2025 15:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qH4l+Wlb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A4510ECC7
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 15:09:16 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ab7098af6fdso35413466b.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 07:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739545754; x=1740150554; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B7jsGzrzWA2UpjfP518+Ys9Fu8SxTav8yjO65ThpneE=;
 b=qH4l+WlbSfjX+3m2vE2LDvoH3COkR9EyAh4K++9upv6z2NRJcvQjNcYje3R2BOHZi4
 8olMDp68xUjXGuuav1VVDrliKKz0vT/COeVtVkBOXvm0k8O87ulGOUxPMIy3L15tfSwm
 XZQx65n+Bv99Si+vLMVOEZ9bAHrn4yRZlERRvh8L1blNT+yIBOjitqyiYXz4iZnslgv/
 zyM7umVKXUOwluwOW/62mrH+MwsN/M+HRg2WzjN0jHqMi2GhYRmKOb1E9RVbRYoYQbA3
 cuTIf2HpCmYt0D97pm48iceag61LG/YTutDK/SAUux3sNRNM7BU1ZiP5cInkLJZOPBCb
 1riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739545754; x=1740150554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7jsGzrzWA2UpjfP518+Ys9Fu8SxTav8yjO65ThpneE=;
 b=BpfN4/cFIH6eVLFoJsHy+8wgTgD6aDhz5cxuH5iSixRHQM0ItYN3Zz3E3licbe4jii
 bKxtwp2CUCdEyfQLfaEVT0iS9ZwS3iIMVl8Zqk5TtOVuGph1TPtMd6veSQXOyatPx4Wz
 x6vTRLgKeNhUg7bZGA3kfDSDbs2vcSZdqVwziVHEfV0FynZW202w1fxnVRfaXpTOBISs
 rjoqUYk29DnwLKmZ5lMVUtGHf2SzuIFgZtA9dzMq6MwTNx+ECCxEOMDdUq1FZbDbLKK4
 vH0BK21Jd8W9V2aC2RbzO3ipGugdhhslTI7Iv4SvWoFti3/5z1PQcsQ/VqmSN/TVTMsC
 libg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlKMHkmN1cMVwa7dW2Hf2yYJOVKXGvcPRyK7qa6eTLjafGF/wNro9RTt/oKEoXSoN87wisnAFo6aQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztIHsohjv46cG3dd472sqkCoYQy5WiL/faanK8gGqzlBqdZh9J
 RdaAmV7OhWyQR4wbZ+MMHlGYVoQUGvb2/ZhmXGA7It8hm3HWNLzi8FeX2LYMo84=
X-Gm-Gg: ASbGncsMcEYlD/nh+MchOD3E9onjsslaFOp3ZtC52BdAPDlzszSErju+HH8ljvDxs0P
 6y60z3oygi6j7pMONT76Y3qs5qedO88Ovhp0egai+Bo602q8CrX7JJP04ASrY9mSbDx4loXsbqS
 jN0C9pccFO1fBQ0Jtf6TXa7n016yNedW9Yn3FiUv07GczdSctMtMf03rnQyXl/he4DbDkS1oAK/
 R9h7jwCiTO7AxRQjSTc3mjGb5dJu3CoelvZB5WOAIid9yrCFc8Tcucr84N+BpHTnVz6pHvd7g22
 SgffMHWT0dOsfGF3aUn8I6TW2JTvZ9c=
X-Google-Smtp-Source: AGHT+IE7JU7OBLRkos654tOsr2eurVNX6fP97fyobBh9cWCTtMYkOpMH7QEK2km71kJRMzG661dyZw==
X-Received: by 2002:a17:907:9490:b0:aa6:6f12:aa45 with SMTP id
 a640c23a62f3a-ab7f33cee90mr468424866b.7.1739545753005; 
 Fri, 14 Feb 2025 07:09:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:09:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 16:08:44 +0100
Subject: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3653;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2CBa9IBMibbcITCTnBXKA4ai81Vo/pmWYs2riYsXCmg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yNPOoysNFKaCqU06xwyIbjOpzjtXtIKu6ny
 4+bnqJO1UuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69cjQAKCRDBN2bmhouD
 1yGpD/wMzzZRoNEJddfIEvdwKtLRihZJNRYkTaNYECkfJYQ6wVhuz/xiDFeQ/SsAKz9pXIik4SF
 r1dMnA02Sdxyt8TCDLtpJK0u3ExejMBuU8qebOKqizCR+eo6R0DPttheCsrYtVrbdFF3AdnlwzG
 gAz+vQprz0JP0P0HRcUQ6Lr7dLKjgGlJTEnUD/BA2haAPIeNL65suMKARExE7XPqcKfKKW2rerR
 bP+5YlODHhXC8Ed9PZUTBZeKswlrHetbg+K6sXYVVeiZlrSaHxaAiBKwqRG3aZDmGTck+fXDxAc
 wtArZ7WcsYip5uEe+3IpEMbhKj30Y63CHWBXqhEF3Yy7whUzFW7Y/MidDXE5b6H54iOl1FFTA1M
 ygz7rypxFuKTIhwjjQMwTRwmi7QmB8lYQwO0AXuNjogTa/87fzaHB0ZksZL08OGx7pdzSkD2FVF
 H70bF7zWAVrubgHNrd7dq7mVvW7fUagqjVZgQ4zt0qZyKGq9tfdF32WqOjQzuKP8KTOuJDjzz53
 GU8w3jameWwtUdx94rwQWUwBSybUxrlEFt/u3CyrfAQuJREuLn63Um71DBvnAUeGy5WMAuoceSJ
 0gyuPMvDvi+/l74qISVy8ROY5hlboH4ec0KxaguKF40BhO8oR2imSsOJkhGsagTK+4ZDRJmNgS7
 o1B5XGYPuyYdueA==
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

Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
avoid hard-coding bit masks and shifts and make the code a bit more
readable.  While touching the lines in dsi_7nm_pll_save_state()
resulting cached->pix_clk_div assignment would be too big, so just
combine pix_clk_div and bit_clk_div into one cached state to make
everything simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Use FIELD_GET
2. Keep separate bit_clk_div and pix_clk_div
3. Rebase (some things moved to previous patches)

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
-	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
-	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
+	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
 
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
@@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+				    cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		u32 data;
 
 		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
 		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
+		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0

