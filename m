Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D2A3C4DE
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 17:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2096710E851;
	Wed, 19 Feb 2025 16:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KJAQiBjh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885F710E853
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 16:23:45 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f29a2c6a2so661985f8f.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 08:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739982224; x=1740587024; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=flx79lLhyjNJ1uQQH7Feun8sDQLsABUenRP8+0wgvY4=;
 b=KJAQiBjhmIto7byRMzrrVvoH7EriHeB3PzV5wpywAzES0DT2UDSVyL2Rc7ykB0vbAF
 09eifd+Y0Dd9QuTE+zp6xfFVkeyiiQ6s0+sUZviJFOItwEcjV6IU/Er6utaGojjgJR7w
 t54MLNUw5CZTaRympfK4evv/KhzclUPEoqc4yn7Gp3ycMLnu/KreVLuQDzDKByiqOjTi
 aVwPhko4mBqL9m+LadhzCfdah99dSzA5vgteMP0+eJp/voQSR0AmAht1gwVxms61usl+
 oTJdiZDqzqdYfeqzQHcIUoHePBRSJNiSX2ixxBvY3sERm4O9eCknN6rIeUYUJDj8Oh1y
 MAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739982224; x=1740587024;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flx79lLhyjNJ1uQQH7Feun8sDQLsABUenRP8+0wgvY4=;
 b=HPgLHEgxXOPewBeXoqABWfhqBtbPYe4zNN5SI1D4TRg2BjDJCxbp2eqqVX1/O3xlg7
 uCETJNPOteSgbU1PkeiChyMhG+Z4i9RL7PCf9U99fqRwe6Oc5PL7My9uWz1kK1Ma9QiC
 GMIlrfByW/bWorHJI9LMtT94EiA3E3FY9UfcbTDaqf1rYE6kq0xhtTOCHgYFFdHIvk8D
 oVWLNoNA85BPpuWSb4W/Z3WH6uw9/wjPTTJ1/u8OJXzznVifCnK2NGKS3YjY859uYAxZ
 3dWVNyWWBd0fwsHiI9iJsED4d58oD8U8vA+mgCVyY618kqFjUuzF8P0QBEthm+0v1pEI
 sn5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2sHkZVHek6Pn86o0orJakxdCtHpPO5gdYm2x91hA48UzaLee46zJ5um+0LzDdsvuYp/aYKpeFWfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN1V0OzsgWiAEJ4xvaKCr35V1ccTmg5pm9tHr4H7j6IJlqr8cV
 47EUT+pL0wCEZdqL3fxa5hBSargOvEt/FtGiR66x3dGKNq8p4koWiUb1Q05QTyU=
X-Gm-Gg: ASbGnct4AqUwE9VRZlhTVdNG1gEmY5OgUkUJORQAxY/NcJdsiXOPKkiOAwFd6NEp3T/
 SiDgu/CJg2/hhRJBZ5t8u2ae/KDeSasi9hQ9YuUSzH34DY1Wjw7aeNrADmr9FKjHHyclVaVuLwy
 sxCY8LGR7/Z+xI8ySm4TdR87nsrKHwW64ZmPgPlg0e21bBDTbP7go1sSLaCm8iL7LPvTUWnKZq6
 rwHZvW1p4pnKF5Z4BxVY46BjMu1h87AWwXuh3bVvlFLJz2v3M1ciy9DEcW4IdYqgxdROI5rjGc3
 iZtsCC1cNTNaxen678cfn5BoQl/ZHho=
X-Google-Smtp-Source: AGHT+IGKoVneTQvKJC5CNmJtYrFVOs50kNrFcO6oV1uqtn6asl3HDOg8xjQNibJEhGg4neAkUWVmNQ==
X-Received: by 2002:a5d:598f:0:b0:38f:20b5:2c80 with SMTP id
 ffacd0b85a97d-38f33f2cbcdmr6538286f8f.6.1739982223890; 
 Wed, 19 Feb 2025 08:23:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fe5esm18442417f8f.99.2025.02.19.08.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:23:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 19 Feb 2025 17:23:32 +0100
Subject: [PATCH v5 1/2] drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update()
 when registering PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HoJJKf2KbkS2X5DYSjb3aYDsagjrOYDoT6ljyujy3rA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBntgWKtcucSVVrV+JpQB35XSs5L2SAmKtx22d+5
 q+mpsfbjMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7YFigAKCRDBN2bmhouD
 16gmD/949j1pjmbpzNX0ZwnPqFTYiEuKoDTSR+KqMSaBI88QYFyOIlLcJTY5hCT+xCVAAhqfnk1
 vcUGlcvzGISUvAVQGIUiSo/Db8E4CYSgM6PhIvlT1MespJwLYvFxyCUC7qojzNhwhHP6qYJdmyH
 vBOtk52PjNUMQ+H6+fYw6CoTXDgsGw7vcAu1g8v588Aaw+3pb9mAZvsO8UJDhIeqctuqmUkAE23
 V/qy9NvSpcHgknXJo7QbukF9JJABXX66dlxU6MKQ0k9OZ5dhuBZVAF/Me/eS1cokF5OT9LxJDof
 gxNeclLnZzq7dhGNbmGv1EB46R8j6bvnP0a5e8S6RA9xgf+wVOed7VFpY6GZPLAAE7EHXsQ5A7j
 +9CJP65N2HHB1Fap3vJC1ffg/Fod1phdQfLGe4ug/5uej5kwZSIZMWxdqmF4HF4JbIwIhcj2aFa
 4IIwjbS0cmzT5REOARFcRszKjlKrjohPr/4rC56nNW5DnmqbaAox6jC3u+7z6at4VCy6FGGxbUv
 ObCQx3xVVW+JKR17q6Uiqfta4vKcL2UhfdX8HKWdDM2UKV5HXXRIOtPDGpfIp9H0qYgOMhcg5mC
 rN6jplRFeSTYwqenJUHWzaL5i+zSoVdcHVXD9ZhMY9gDbj4l5ukslomn2zApoGQmRl5sLyfZrhO
 KZ3TrCcPn8mxoAA==
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

Newly added dsi_pll_cmn_clk_cfg1_update() wrapper protects concurrent
updates to PHY_CMN_CLK_CFG1 register between driver and Common Clock
Framework.  pll_7nm_register() still used in one place previous
readl+writel, which can be simplified with this new wrapper.

This is purely for readability and simplification and should have no
functional impact, because the code touched here is before clock is
registered via CCF, so there is no concurrency issue.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 8 +++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 798168180c1ab6c96ec2384f854302720cb27932..2fca469b10b33ac2350de5ab8a606704e84800ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -736,11 +736,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	 * don't register a pclk_mux clock and just use post_out_div instead
 	 */
 	if (pll_7nm->phy->cphy_mode) {
-		u32 data;
-
-		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-
+		dsi_pll_cmn_clk_cfg1_update(pll_7nm,
+					    DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+					    DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3));
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
 		snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_7nm->phy->id);
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

