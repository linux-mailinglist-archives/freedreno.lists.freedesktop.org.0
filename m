Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA6A21CB2
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 12:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162D10E7D3;
	Wed, 29 Jan 2025 11:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n+fnwQnX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C019E10E7D3
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 11:55:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa6954ec439so79814166b.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738151707; x=1738756507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
 b=n+fnwQnXWDGOvJRNVxjCq01eCYuJkwe2VY1mEU3dTK8Mwv4rMYqd/xy5Si/ICHvimU
 Pz7f+33IlRe6H2drVMhXJ9GU7dJYi3VtliR8cf2rjIJice+dXqqhkgG5O6vU558y7unK
 Ov3lYF+tzyDjt6h6eDXhQm8TlmEHptTjUZrq/CPlo7DketdHqPfaQRzF1GwZ7eTi5Ck0
 1mOWGpEMqZ8rvxLJmN1NdiJsooxi0FGXa3rQH8tXG31L8bqMqb5ULOagobMA/jaXnFbR
 uL68SEJ7kgUUMzhNxWb2Ah6M1sn0/JvHor5hbTF12QtAiKbpGC9/wGK6RTVLnm5chaDY
 g2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151707; x=1738756507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
 b=fDEsd7gBHMTJupAahnCGOvq4/uoMycbDO7bIuaoYqi6e/rBB+H042svFXNI0N6qBMD
 RPPQI7I2vP1XHnwqneAuUgE6zF06APlG+Kyr8OandfeWzUsJynZuXNahH5Hxg0C0cYqz
 3D2YWmRhEz5u5qvrcgJIs4FIIYh/iuGFZUZmcYlBS6UYB2uN0iZ/AAlsTjnNC4Z49HqA
 uHW0Vspd6qj3HLew/0ojmVo/AbwVnqzju6vsbb3FSXW90WPErPQVfCmgpYEfMR6syCty
 Xgg4b6QyqLKxZuCKzCpO3onrIF958CtnaAF0jnPDcO7gASETZj5tp0H6WdRX001e1Cfu
 LkJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs8AW0+tgySgk22qsfdQm2TO1brD55y2+YmPEFXng59aa5t63i4sP1TThkCXtc/gXa+ee3KMdK4+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGG5IPTITnOLUseOc7rOKWLTMrbaDdT4XWtrgc0LhfRxxkpUDD
 xdAI9q9FDaPym8/cm1xFgjXH5N2CT0hzlr80GvNK42eTJtkTnrcBscjQC6umMbI=
X-Gm-Gg: ASbGncsJvKn48Re2bUNeVCIbGp8sIq2O5y35Lb30oMhq6XqJhSQNWN1XGX395pdCS/l
 NytnKjrwanfW+x7kx5vNyUfcDI4aE7Y1B+UHMjsgZ5ohD1Eorg6R2TBtTKNPE3JNFQHGaWSUyI3
 yq1xkjP0q4OiE7WUAOOwnv7JVL1qRKZCS6b3ltFsmHwu0UJ0fYAJBdPE8q4jI3xQjr5ZccIwXGi
 Mbr7oZ+cXmBPI0dlWQbrL2d0aZVFm+t1drBj46fzYo+GPSFbSDXvtCFB24DwyznJsyJVNHSSvo3
 06D5TVWpnAXt6VDBRR0eERFlUXVC
X-Google-Smtp-Source: AGHT+IFjZKfgMNqMS3717CUskta9AgMI7HC+LrfGMh5w6tDILVjhok1zF479wv7ce8XTERnEEpq/Tg==
X-Received: by 2002:a17:906:b2d6:b0:ab6:db64:b040 with SMTP id
 a640c23a62f3a-ab6db64b2d7mr7832066b.12.1738151707153; 
 Wed, 29 Jan 2025 03:55:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab26asm949981866b.111.2025.01.29.03.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:55:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Date: Wed, 29 Jan 2025 12:55:04 +0100
Message-ID: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Since SM8250 all downstream sources program clock inverters in
PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested except my work-in-progress oon SM8750. Not sure what is the
impact, so also no Fixes tag.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7f6fb2a840d2..6646f8dbe457 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -326,7 +326,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
 	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
 	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
 	writel(config->pll_clock_inverters,
-	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
+	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.43.0

