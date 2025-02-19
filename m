Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C67A3C4DF
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 17:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4A10E850;
	Wed, 19 Feb 2025 16:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dq4ewieM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C0110E853
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 16:23:47 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4397185cfa9so4102405e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 08:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739982226; x=1740587026; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=STDYxeOydJEmeZwWEUJZhgJUaxAx3cfQSyjYXjHJqhE=;
 b=Dq4ewieMY7sgRcOfc/JbrSHyfWyhfV4pKBINNrpyhr0AbXTPCba/73/Dxdej8DUpp0
 Lw8Sk2FNBBJ/VuF3o+oWP7du2hZHWXUJAzs2FyyjfQVmcaXo3dCOXI76hcRyfsyZQ78M
 5QWRbb792YjmGsEpXmelhgT5ktlqv2fJSV5XZXRhlGRxcxKFCgC+riRWpmPQp9cnU6mi
 v8q7N8yqpkqTm7fXEFUmkNAl6lFL8JUhg4GGVg4pe5B+Xk6QoC88bQZwK8qd/ughDcJW
 /eXdg2cZZn7o2LG2CUiOsIAMyJHnXtg9QIAHoLNGpFADvVtI5PC/cUQiaVWO1MNlsHyh
 8SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739982226; x=1740587026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STDYxeOydJEmeZwWEUJZhgJUaxAx3cfQSyjYXjHJqhE=;
 b=HSXW8eQvF9UDXy2euzqEvG+yKdyM3xBgQPLaGBBrCinHB5N7f5XYk4Auqmz6qfC919
 27YUVV9kKuh90U8Ks0h2L/09IY6Waf10SYddzV/lvi0GWSmos5KxnJL5idaL9A1YmceX
 PiHd8qLL0rA835xJwj8oMJ4EFYMVgNTxH77jypOnOErpkn/R/WU6Rs4Lpk7BuYNJ5pJW
 bQwmFbIvFJALff4Wy54O9Emrlon7ItTY0YvK5SFVzoMRQGQ1joOIF39RWxgbsW0A4AFX
 OhoKkscG3cXXAfxVYOimq5h9ooHNjjHMapdqqzvhYcz1tVbbZqQmg+zjdPNUhfpN1bYA
 CiGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGO3m3pnyB8xhsG4+HvSIv/czADalx5Fdwe3IBB2uMWYbMYhdj5z5qXQ/TjpITv1nZWfUHGtChw8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnzbXSoqLp/uZcdHg40VX/sMPiTTz38QDiAWitS7cpjIDTVOGQ
 R1rsR6ZjykIBTB3AE1PdAgMwzlccbYb1H32yzTFsqBuJlhKCwCiE/Vx6FS2gPQ0=
X-Gm-Gg: ASbGncvLMQCW0hyyCsB8h9wSK1+Qf5BakLPQUr1Sy2n9noOaQwCr3OcuvpE9ndrr1yt
 LAozb0zwNHa9NtotzoFCb9pm6J3d69nmCpWric/4IuXkV0/1MUVcOgcaY0miV5apsTewZ9TApUf
 I9tZYJhQcAwd4ASvnUwHES7G2pH5FE6GfCub6SVo4dzQNHG24nq4SIlgANwtytOVqvkF1ZI294x
 fFK1N0TkliAcv3fuJ4H0Wx06X33qFUB6cogSF+1pG57pxtXv4VpgukKkZtFrKwg6HMdKFuTJH77
 ken6t2eyV+QLC/VMtEH7kBJxwSDgn60=
X-Google-Smtp-Source: AGHT+IFCXH6juWXCxM4namsDbJk7fdm7tD4GiYlIZEnzx6Vaog88SCNo/gNggeL5ghgnRcT3Fr5pqw==
X-Received: by 2002:a05:600c:1512:b0:439:8b19:fa9a with SMTP id
 5b1f17b1804b1-4398b19fc41mr36232625e9.2.1739982225613; 
 Wed, 19 Feb 2025 08:23:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fe5esm18442417f8f.99.2025.02.19.08.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:23:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 19 Feb 2025 17:23:33 +0100
Subject: [PATCH v5 2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=e7uWihHaRuX3l60xcjRDNo7zV9F+Ds60faI4+TOm1Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBntgWLptxlLsDSPuC13zxCb4GjCqFlevEaleizP
 796ZuFHIgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7YFiwAKCRDBN2bmhouD
 1/uWD/9Tvjr1rRMWsPNMmAYYIaKkacdXn8m5XOmuCW4DbdnsCKrLkiQMbMlWLiy1dY6qPP7IJxt
 SwAnt2GRPWIxdM8N504hqqx+PG7vc85jOsIh55NAUUFMrHiJbTZ8pTrKat8MOCwb56TVtOLnuKa
 vHomGZwcGqRCZN2TfJ2YdtZWYVQGG01ylF9AEm3LSZHKYB2ykLLgD8locKlvyGymRkOPnSsIWy+
 bXwDv1PkzYSFrSo8CnA5asBzdJHJWEHzGkNbQJCqWuubTtqL1ribeOaYa++cyN/TSWXZMfHBmc0
 z5DZAVQn295rzoroUmrFVSoTEegzudPiICE2Y1NhdLMSZpn/8Oqu52C0/nbSbzMqpDjLb4JHtC4
 WQJtKv1zSumQI1p1xe+StDtLPCm6upiOEfIm0DA3EJaFcTrZWsxY4AnOiZ/V7+hv7QjmRsOBquM
 28PZtgQBdeiW2Uy+2r3y0K7hHb6dJHWEWAdS1DvZDZ15soRKXKJjdZJtaZ21R0z28CeJIBrh2z1
 QgOWGlBbqsWdlFyuwc0Naioi03zY4xCOrJP5Yn7SJEOTBDJj5fckmQOzZkUAAPVDPxNmKjHaCLO
 7psBxs/jikM6sJz/qX+6QfaItHvskVAmhULu23h45HYbbtZnQHf5mqac+g0KlRwMINhciDKtLyh
 VHtIGFCovaGZjJg==
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
readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. Split part touching pll_7nm_register() to new patch.
2. Update commit msg.

Changes in v4:
1. Add mising bitfield.h include
2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)

Changes in v3:
1. Use FIELD_GET
2. Keep separate bit_clk_div and pix_clk_div
3. Rebase (some things moved to previous patches)

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 2fca469b10b33ac2350de5ab8a606704e84800ea..5ef5bc252019486c6f24f256d88d69ad3f6c838b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
@@ -572,11 +573,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
-	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
-	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
+	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
 
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
@@ -598,7 +599,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+				    cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,

-- 
2.43.0

