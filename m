Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C874A36108
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 16:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5C10ECCC;
	Fri, 14 Feb 2025 15:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FE+QR8HO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B510ECCF
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 15:09:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-abb64620031so809466b.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739545750; x=1740150550; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0GstLIXqd1K/ZKQfJCz4c26uEua+iUU1422NpxaHZF0=;
 b=FE+QR8HOw5eDucLSMhmqRVRM313D+MbFjqDCDB+YO6uOD8HK/UORMizajHaVbd/34W
 0yxamh6l37xJ4FZc71FVLcZztn4WuPjwu8CcrgqtFtMNuS3mvhQNIlBCEMUfd5jquqTB
 fXUrG1NnyvD33UTScUe+Cfqd+2/3ObGBPyFhzQ82wilujTUgYEKz0X/1haE8MYABWS8c
 tid+LHyyF9//SqUI6KnPg3E60ZW+KxtAulhwMVJCc8bOliQ4fKe/VjyHbi95MkyDl1hs
 mHd+6RpW8zESnaIBl6yR21IHTnCU88YdpR4yLuaJCKJ9e4XLIDn5TJ5I5uU2gx/DNE2M
 TPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739545750; x=1740150550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GstLIXqd1K/ZKQfJCz4c26uEua+iUU1422NpxaHZF0=;
 b=jJCQN2DwpUHudlSH2wBZIY8sU0HjwYQR2+NHNbxcYmh7cjO0hwTPs1sjiDP7xeU2Xp
 rhzrr0HBoo7bScJKE6U1jgKJN3ZJbQRM8Myto5GdrwP6GB2666bZEdhD2AcuUUqv0ez6
 csxrXFM/zlddmeBxdDmIYPdcv21BT9PZMNXQa/yvVuoxcXE9MQeK6D7FzV+4/n/PfDd1
 wKlEH2xXLbi+e+Fzw/IxhBdIRV6OkU63m5XIzRRN3y2nAOxOGwf5bV/eezCxRUdzgI3t
 xGLtb17kHZo9mEhe8g00f3nzrYHRJjdnTd3sF68hQKrT6Y2jrPpV3o1n40XH8G32G+Em
 7Hrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDrusbNtUftlgZvMQ8CovyiUap4C5MXVVaJE9bScXaT90K/OhJBY2yOho0BBM1z5edP1fN4q/Kal4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzULAi+NWZoMmih9a+BJU4Y2KlD0Nf/SuzfAbNfom4RyxF5vayY
 nS+JgqTWRX+7OwUiKifrYvZATxepw53UX7h2UGNo4TX3TZtv8tNzAwhYLs+WNxM=
X-Gm-Gg: ASbGncvfzpzE3+pW+jwWJwvJaw36qwy6QMhEsIeK1Fci231DQwHFdwWJlAYGhyrjd7V
 OoDUnle2acLxp2RrZfXC+2lXBM8yhmLnH8hfZcw0l2B7PzGCbYHm7DOwfsMxYIAdcH51+moq2wq
 hJe60j8HuEYViTSOeXEBHGZZPAoJQ0kwp13pMiuCJv245Itd1062FzPISyMTqKreZj+xWzNBbzn
 cDScAxS2mX1T7X5eqmb9sH4X3lfHyaeZpZWFdtcuHFi0FmT2vP7/T10psJK9NqXLw0SJB/IsbJl
 RkLnwVN0uMIzqJQiTipHf73KpuOmbWc=
X-Google-Smtp-Source: AGHT+IEzVqM+iUmxc7skwIAEYucZ3akEM3g7G8GQlo3NC2U8yusEjhbXvucjr1pSP1U70ccqH5eCWg==
X-Received: by 2002:a17:907:9720:b0:ab7:be81:893b with SMTP id
 a640c23a62f3a-ab7f318e3f8mr491212166b.0.1739545750041; 
 Fri, 14 Feb 2025 07:09:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:09:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 16:08:43 +0100
Subject: [PATCH v3 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-3-0943b850722c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BQ4ctpKzt2JNBBm/FezOIGSkr/SYl7Hi5IRx7EgvobQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yMWlXDCCR0YeuZkcFoQUPFixkLcf1UZ+u1H
 9ehMouSx6iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69cjAAKCRDBN2bmhouD
 1yxpD/9hIXb1N3TiLm97hyItMPG7g63u9pCjssD653f4reFjoc0jJWXob0VogwGA28ddfd2BZmH
 vFdKX9XZjh/AvDFseBOPyLcli9Fjxch911KpBsKSmq9q6Q3nUbQd5P8+Xn3Ht2dbwvQLKfh3Kvd
 FNqXJHVP27uxS4mvgwEAyTBCsh+wVu3B4J55nqzedi1+1qMVpnhLxA3X0F3vTiX5H0iWtIkimfm
 MJRMtrVfnB7n02Ygu5H2jZFGUlXpS93eEm9XI1fvsP0/mzyvnCA1SlwbA2XdaFbLH0edDX3VAFz
 audt3Y8np4Ag0nCwAWcyZnVzktz8gpzugw/IsXHAOUdEy4HCSYY7yt7a8lFPhcYTBB0+fUIia6i
 KYmZeyNZHGp3PE1vH4yxjru1Uh4xy3wzzaaxRIHsGWgEpzp3dkIzjeNC6+6YSWgU/uWIKNXSiip
 OKEcR5HRjyhW6vEUGX2WrqfNsUbVoTdGOXtjMnkZwwgdWFJ8A7qQyNRmRu8zrWk/lNolXlZoseD
 N5sezKQ+i951OTx1h1iVSbs6tYzAMRc6W6Li0jKsB8CHLqvGBnHE3n11DJC+yBbn2dKwv0ffUur
 GZ5X88+ofzEY6vDY+2hujXWxKT65+hirW9+QhQvxpBFLQukUvSWw/luF39lQeE0vyMulTx4OctK
 imlK6EKYwx9z9Nw==
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

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Define bitfields (move here parts from patch #4)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 4 ++--
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 388017db45d802c4ef1299296f932c4182512aae..798168180c1ab6c96ec2384f854302720cb27932 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -617,7 +617,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -636,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
+				    DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL(data));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index cfaf78c028b1325682889a5c2d8fffd0268122cf..35f7f40e405b7dd9687725eae754522a7136725e 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -16,6 +16,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00014" name="CLK_CFG1">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0

