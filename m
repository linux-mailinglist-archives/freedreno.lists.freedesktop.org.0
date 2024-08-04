Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65F946C3A
	for <lists+freedreno@lfdr.de>; Sun,  4 Aug 2024 07:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71BA10E096;
	Sun,  4 Aug 2024 05:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W+psxqER";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5B10E090
 for <freedreno@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:24 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so13936169a12.2
 for <freedreno@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750023; x=1723354823; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EYBxyQ/YvwiIHaG8jzR0Y70dVbuym8PFNWRpFtHQEf8=;
 b=W+psxqERINYEbLz8h2jrHkwrS5X7Dp7GL6fbvRO2T/j+oF6AKQWpxUZkmaa2ErgGmz
 rvK1sFgdhydSzBt+cYrIZao4Zh1Y6Q8/C0VvJiBMmImDQUtEU1gYlE9jkzh8OnCuKrIk
 qP7UTiZzD80nxk1YfPTAcKH0Z4CoXeozkoEI81EOAP+YRY/f2OWq/06mQrKRGMF153/H
 SlZU2G9lqe3T8DmoAdnBkomQBIXAPPFkN2ANDBimi8YKsinegkwZMXMvW6mOt/VyPKYc
 xhl+So1fEBW+3GiDLdL58/n3JQeEexX0FYU5hCIe+O72sQkRm4fKYrm7rs/L5qUSCYSc
 rA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750023; x=1723354823;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYBxyQ/YvwiIHaG8jzR0Y70dVbuym8PFNWRpFtHQEf8=;
 b=kbSPm7i4zZaZC8qra9DJiX1lUJSzPTbmXWzAsGuQGrf7m8BUzJap1UWbnic7yJTZ28
 H2tT5EtbYgWjPTfs2F2dILCrvMkKFr9VHuz1K0k6zRVCkfxZwK4gatwa/N85RyM5V+J2
 OQowm3GeI+Tw5LAGTQ29VWDchsR/p7eZeGIZgsNAxs/djX4eXMatqq3BFKS3Iy85uHLy
 Aq1EpDXs/M5uSYK3vooHAV7hK4nrksVJcdqVodDdMs0HFi/o1Wo7t2nMU0vCLowX9r6G
 6INMzX5ArpBpbFsCfYuV+28YDn+bZQt9AiMfEatMr2DekBLDydJNLiESV5YUA15qp6Lt
 oDEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVexZR/+W5RU1uBWWeWJGIzKi1bXy9cs3/QDHW1mh/jobpW7d6HohHS7Mmh6oBrmt9/4Es5JwRjXR7pCK5ccUgfkPtDwVR7JwQBkttsV2s8
X-Gm-Message-State: AOJu0YyhdUgzascgXTd+ZJLa2CrG5x+6xAocNGh0VbbWv5CciFNNsvzD
 fg7P4B7xgqWuCjmf0q4yGr8wckQ/GO66FBmEFnFTXbv8t7Ep+rvjak2Zw6nxCdc=
X-Google-Smtp-Source: AGHT+IEb56JcXEdp3cHrbP3Zdb4R00iMmwymYCH9bJ87K9H4uB8Y3mr62+YvNqwi5wZXe7TBUA0HwQ==
X-Received: by 2002:a17:907:7b8d:b0:a7a:97a9:ba28 with SMTP id
 a640c23a62f3a-a7dc4fb6a93mr575059266b.26.1722750023107; 
 Sat, 03 Aug 2024 22:40:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:07 +0300
Subject: [PATCH 03/11] drm/msm/dsi: correct programming sequence for SM8350
 / SM8450
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-3-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZrQo3KWLh48xJDJlDCJhnd58UA7Hm/hQisnNq+wC8eQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ+6l4NppYjUOt2B1Mrx0jUAAKAzHN1dYY7o
 symZsDcsH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPgAKCRCLPIo+Aiko
 1REzB/9ap2qNIrseQCvZa/pTU/KUPvVlida6gouDBjhpuq7T3vUAUBKa74AAqkQOHqraSmgVJ+V
 SnR9/o7ICUDZaE8E9VS16WvKFpcOOw4OaiaCroRfcqvQLCmu0w+72VZ7YAj+Wyq/JqR7g+asp8D
 ZDXh/perTUkRZ6OmXanv4Y2J7IxckRnIShcfucpigmfnyPwI3cBaaUiquig/eEBYWGrdmtISth0
 Hfl9rpFXrXWvTWgAn1OvlDqKbrlNV5liXA2oOAQr2YruWmCjq1+xqTFcHvxuL/CBMwsAHINjojk
 RUtYD2MMuk4xqwqJvLOJ7w7LtPfbGJ8VzQCKA/PK5N4aWiWG
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

According to the display-drivers, 5nm DSI PLL (v4.2, v4.3) have
different boundaries for pll_clock_inverters programming. Follow the
vendor code and use correct values.

Fixes: 2f9ae4e395ed ("drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b59137ca674..031446c87dae 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -135,7 +135,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 			config->pll_clock_inverters = 0x00;
 		else
 			config->pll_clock_inverters = 0x40;
-	} else {
+	} else if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		if (pll_freq <= 1000000000ULL)
 			config->pll_clock_inverters = 0xa0;
 		else if (pll_freq <= 2500000000ULL)
@@ -144,6 +144,16 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 			config->pll_clock_inverters = 0x00;
 		else
 			config->pll_clock_inverters = 0x40;
+	} else {
+		/* 4.2, 4.3 */
+		if (pll_freq <= 1000000000ULL)
+			config->pll_clock_inverters = 0xa0;
+		else if (pll_freq <= 2500000000ULL)
+			config->pll_clock_inverters = 0x20;
+		else if (pll_freq <= 3500000000ULL)
+			config->pll_clock_inverters = 0x00;
+		else
+			config->pll_clock_inverters = 0x40;
 	}
 
 	config->decimal_div_start = dec;

-- 
2.39.2

