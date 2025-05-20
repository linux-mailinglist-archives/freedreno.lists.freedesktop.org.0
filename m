Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8AABD667
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 13:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1571710E49B;
	Tue, 20 May 2025 11:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AUjkvzBq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C58110E493
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 11:13:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6006cf5000aso754052a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747739614; x=1748344414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
 b=AUjkvzBqLsqllY7+md8ew8k9sCPoHSxVIXF6LEazrdaD6h0JQKEoHY4nbQFO3rRzES
 oY7jpEeabjkW+8Y1nYN091T3FcmjtrwzWqZaPa5aWR3r57NiW3t7Kt37OVg+QKKy43RT
 GRbbGCV5yn9X8jjFCMWTCwJN3Si0/mwKijpUEsQzFw/Jj4WEVJZJuDSIhYA4q9u4VwA2
 r9tHsmjif0KIqG8FXCJHCEaVapWq1rSS3uQ50k1shvhoDUQaGvxdcq7VGXntkYpUQbP6
 YOR0zqTVOrnz7qvKDpy0fz6n1D4JxsXCnE096MVqJjrkiTjrBXPp/J6vOL78j0IGRr+/
 sqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747739614; x=1748344414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
 b=OmPXGe5k8WfWK2+bsgOnFLlvy7MCqMLmrfyywUIQ4HS04o1JmvJ6O2DLmraBr79ERw
 TpjZxze7h7FpJft9rygiJSxNbuQ1GyWKJ3kAalpu7zLhtr+BzTH5sv5cgJ8SrrLXdNVu
 xohGzjyz4n+dVAglvUrNwrdRA1+61kJeCNXB0DpGSGHHp1K5hefXZf1rHiFgCfwGw0+0
 5wQ+GLJWQ9szJDcZM6xSQBqZjPwGYDYa3Q11QLeZxkPsV5ZwNo45+nCpYr8vqyV1pOvz
 wBQzUoUBC2Dumj+KAf7qCYBtGlDbU1VS8VqA3tH18L0FKYgip1D/3C4BvcUATISlw4On
 mJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnP1cQa06aeEEP3Mnix81QLhgsN6dzeCVCH5jR7BSQ0Lw1mifgzVeCfJAxgDCwY3gAMB4xnqc74Zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0HxjmpDI4gSsQ/rMGgQJfHp4EsDQk7OZNYfpqbh/sU/7CKMru
 bfwUmZtJt1htD05rn3LnKOMv4j58cB6Pj5kXiEPFw99pmBfOdngCQ2OoXARckE7qVqo=
X-Gm-Gg: ASbGncu3JWaRsbwVNhrjM9m9OA6vulxKqrPh6tg+qml0az045cxxIZdkxCSJHp6EAF4
 GB0tbcT3DdYpgeAVK3Q6+UnbZ2Z4DX0nSdo6a99KyT0fGp3QrUcS2/Jaihj7fsPlalmmKdSLclQ
 nQXZk5UX3Wcz4AagC5FWIhU4icFQT8K2VwOA1MPTI5Y8IZvjux5pm+UKAi5SGnPUUUGHkhVnwhE
 zkSqPFLxVslAzoBWD1EIse7/NTa/3uNmNek48cz0k4EeQFCPht34N19EbhFo/iF8WwC7RVQ1ZZr
 D20dA6OboZvIWVRqVno1bmJwx+ZmJx7gaCLyFpU3yYvcDwPR2wqn+dBnhCl9Jg==
X-Google-Smtp-Source: AGHT+IFFcBDcparokAPL5zf+2MVmyXm6MMa40X1yEJQwnjwLJ2/1hy2g6L0BYpZ3G9y+lJt2xMiYYg==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id
 a640c23a62f3a-ad52d4ce281mr470163266b.8.1747739614072; 
 Tue, 20 May 2025 04:13:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06dcafsm729676766b.54.2025.05.20.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:13:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Date: Tue, 20 May 2025 13:13:26 +0200
Message-ID: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLGPVUPKROx0QJfCbeV9e4WfBu8DXgXuh8g72/
 jKif7Qo68CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCxj1QAKCRDBN2bmhouD
 10/kD/9jtNDXdVvPG/epppsydCeNKKYkfy5GiosLMLkTw2AlTI+faS7MwaR/KH12qRYSn9JpZ3S
 vhFnGpBmA0ZAKfCYKRFc6pCmbdvAVp4oc9I3PQSbUrgUJDMbVclf9wZu8QC7QdrYJaJjhhI6Fyy
 95I96JTEEIlHZ++cJCGIm3N3rCw45GJaUlaIIIvfV7mzU0906I2WR+vJPpJ/5V9LhufwDtdMAJG
 rZdiO976aT+nt5kaN5gkaux274MOL9WVK2wNfHpVd3BmoE9f7ktSQgcuX1dzcDcNu0bMLvcDuki
 DjS4XAwZcVRH86XSeoLxEKwySguj5fZeSvMtlk9ZqfPXWzgr/Q4RTRlwI5/q9pPL/bNK2b8Glp+
 O22ndNnkmA6wfpyCKxkliWxS+RBI8RBF8M1Wtu0Qu+BP6P2+GhVKsODGFPFPTX7+PXFi25vvxWU
 lnFxnZ4D1+5E/1UPmEiZcx001aLXa6e48MwkWCVGB8C9yuHEONKd19pyRv4ytTqnpS1RPe4awgR
 9+k5aNcBvgDyc8rnjaXWfUV3sqVIeM7NYHOt1q+03j4FNY0f9yjoGVnDWk4IymXQAtTcXVEsoff
 W3QVUZk9QlqM05zZyWOlsR2Sgt8cf36zRZpq4Hz8s9/IMk5x+QjW7dk8KVB5igadGjjLJXRQPZS
 2T9qrqXbYy3b7SA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Driver unconditionally saves current state on first init in
dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_10nm_pll_restore_state().

Restoring calls dsi_pll_10nm_vco_set_rate() with
pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 9812b4d69197..af2e30f3f842 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
 
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_10nm_pll_restore_state().
+	 */
+	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
+
 	return 0;
 }
 
-- 
2.45.2

