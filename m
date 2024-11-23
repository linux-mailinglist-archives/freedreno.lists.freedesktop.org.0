Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F79D67AF
	for <lists+freedreno@lfdr.de>; Sat, 23 Nov 2024 06:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3073910E25A;
	Sat, 23 Nov 2024 05:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="khMrq/19";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432C410E25A
 for <freedreno@lists.freedesktop.org>; Sat, 23 Nov 2024 05:45:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53d9ff92edaso3326062e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 21:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732340703; x=1732945503; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F/nCfdT94fyFdmLpDtTnLp3HU3nkqA/lIsXWnP4b+r8=;
 b=khMrq/19voFc4MFTQYANUpAqGJTniaUmvc5CNeFzRPzImc/4oq3GRApAakhWCKHEY2
 j3LYpLYvNWRc0Xardnun1n32eELJx3M6pfPq3mSpdw4woXhOlU7MAQVFk8MkMMdRzX+M
 BfMSzAqhe/UZmHyraqBpgOIH3sb2Dkct8ZhghQW9q3Pd1us2A4ws72GAZ1xcX7XixJb1
 DdrU3f5Tt8ikGxdcYj9zoPdrINav4bfCI9bGeJM9VamR4DOn0WvmoWrX25O0CHfN4L/a
 eEl+rMu2l9LeR9seman4OaGj6Y2MgA0BLuMvjLtldp3IEjfSGAVB+RpQjRtirT1V7jas
 uoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732340703; x=1732945503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/nCfdT94fyFdmLpDtTnLp3HU3nkqA/lIsXWnP4b+r8=;
 b=rWN2BmQs29q7g2IjByeDBzKoBTE6cRPnBXYXHA3bWo90iAxyfuBIqOT8YnRPnqqy05
 Prc/XAnfhyIKSVn8O0UXtCBI1hwxkrlOWLY96qicz/GJibLNKKvueOZo9alh8RINkGGi
 SWERBCHTQh/XHX5Koon6D4xrJOxfn33IcwCD4opkg+mRs1pdBwREdUnaaOlpUhXhMrqn
 oZpkJMkSOtvhgLTxruxab+URglyP0pmZjon1kJ5LG2gjU4Dn0Oh8d3TyedGuQjQRbnj4
 Lig3Z5WtdR5cWAH+ir/sFwEhat2By0WaUhW+ZVP40y7HrPFxq5YbiigvdzV5XjBxU90q
 OIQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNCIB5PNwhmj0YibZNQMEbvJeSp4xYC7ea63X4gqM6u8jQ7Z66Zw+psCQuKcJsJDBRBubDctmK1mU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiOJGWRJQIPWf9Yc94X5UZlsvbwH2m+FJbuth8hI+NtkWg7Zti
 9XTgZigZqmiHE1/DBgFxy5+vue+DLyvIvv3zKBwjQ3wRi9X6escYW9/qxNkxvgM=
X-Gm-Gg: ASbGnctIyTzOGYeicwQp32i796Yek/NZRWiOHqXEw2GbEY6MMil9Ya2e8mjWlleVLAR
 qn8AiaBqI8rCpXibJjuJU9fxtR514uRQl1xeP/ka72wLR6TD9vr+ajLppg9tAh3N/eBTeK44KJc
 anrYxne4Sh4ytTV+7Y+Gkz/mZkAe8fIe4igc7w94FjB4pBBgDmvPypyUID3f7dR81n3wp0JX39O
 ys2T2sMFpJ72jUdHsvHGp4418nWhND6hEhik/CKl+r+XUYebTp8xQJH9g==
X-Google-Smtp-Source: AGHT+IFY49Rgn1MaIQDHpFNZUMu1vu8VWeMQfbuzyBAcqr3XvF3KCIyE4wfVVxUlCuwrgJywOYILLg==
X-Received: by 2002:ac2:4f11:0:b0:539:e1c6:9d7f with SMTP id
 2adb3069b0e04-53dd389d698mr2913067e87.25.1732340703363; 
 Fri, 22 Nov 2024 21:45:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 21:45:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Nov 2024 07:44:54 +0200
Subject: [PATCH v2 1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-msm-mdss-ubwc-v2-1-41344bc6ef9c@linaro.org>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
In-Reply-To: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5924;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Y68Ugbn4mNiWYoL63ZWT5oQDamfsA6evrZEL1K8NhkE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvax+ERF5jWnoJ2D5csc83mmx3JD2vw5Eoms
 uXY7FLT8QWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2gAKCRCLPIo+Aiko
 1UZBB/45xpSd2K4g1tGqC0fO7jL9S+4VJS9xjljQccCOrTeJuqqpnlre/xgbYxLWh0uVQwgR5KC
 2sTB8byJ384FGqyK4mwOxKEa3UP7jsQUYECX73tQrVyPPQS7Yj3s+dkJND+bU/h8/2REK+3+PFr
 DoJbdGpQ9jvHySdJW6oF5FF64pOx6kP2eiC2y+2k1iRHFkdHyTGVT1vlix/Wi2Hp6l34JPpfrq3
 JXxOnreX/vtQYG053n+RPGI+anQ/Sf0llf0CsIMaYTVgjuhgcCBvp9SXdLbV2bOZ5NFxFEw+u5L
 SVj7ibE6LGutfSSRWWyv2lKtRr5Zn3++rKnpfCYb/gvtyexG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Rather than hand-coding UBWC_STATIC value calculation, define
corresponding bitfields and use them to setup the register value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c                 | 38 +++++++++++++++-----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  3 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index b7bd899ead44bf86998e7295bccb31a334fa6811..4b57f39bec4e6232a0f5b4d49f8ae1200e74ac78 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -173,15 +173,17 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x1) |
-		    (data->highest_bank_bit & 0x3) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
-		value |= BIT(10);
+		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= BIT(8);
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -189,10 +191,14 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = (data->ubwc_swizzle & 0x7) |
-		    (data->ubwc_static & 0x1) << 3 |
-		    (data->highest_bank_bit & 0x7) << 4 |
-		    (data->macrotile_mode & 0x1) << 12;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
@@ -572,7 +578,7 @@ static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 4,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
@@ -590,7 +596,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 74000,
@@ -608,7 +614,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 	.reg_bus_bw = 76800,
@@ -671,7 +677,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -682,7 +688,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -693,7 +699,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
@@ -704,7 +710,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 1,
+	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 3afef4b1786d28902799333ff66c8b3ad0ab77fa..715e1426093de5a4f3b7d2b66b889573c30b7b5c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -13,7 +13,8 @@ struct msm_mdss_data {
 	u32 ubwc_swizzle;
 	u32 ubwc_static;
 	u32 highest_bank_bit;
-	u32 macrotile_mode;
+	bool ubwc_bank_spread;
+	bool macrotile_mode;
 	u32 reg_bus_bw;
 };
 
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
index ac85caf1575c7908bcf68f0249da38dccf4f07b6..b6f93984928522a35a782cbad9de006eac225725 100644
--- a/drivers/gpu/drm/msm/registers/display/mdss.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 
 	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
 
-	<reg32 offset="0x00144" name="UBWC_STATIC"/>
+	<reg32 offset="0x00144" name="UBWC_STATIC">
+		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
+		<bitfield name="UBWC_BANK_SPREAD" pos="3"/>
+		<!-- high=5 for UBWC < 4.0 -->
+		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
+		<bitfield name="UBWC_MIN_ACC_LEN" pos="8"/>
+		<bitfield name="UBWC_AMSBC" pos="10"/>
+		<bitfield name="MACROTILE_MODE" pos="12"/>
+	</reg32>
+
 	<reg32 offset="0x00150" name="UBWC_CTRL_2"/>
 	<reg32 offset="0x00154" name="UBWC_PREDICTION_MODE"/>
 </domain>

-- 
2.39.5

