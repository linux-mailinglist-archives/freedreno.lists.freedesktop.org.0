Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718241CB48
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 19:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF496EAC1;
	Wed, 29 Sep 2021 17:51:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722B6EABE
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 17:51:46 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 96B9C4019B
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632937903;
 bh=sGmR+urAbR+sGbkj5JCyniQzZ7uplCBGMFqJx16vAAg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=bsSN6nWER8bumdyoV3l7m+HbsFD31ovkw4IeFQjIvi0jlZCXmc/T7SCSMP0+FSP33
 DO2Q6sEuR70JqSS+YQWOHVL6BVjU7b4++wrNXquNwjTPwDyn8MXJxUk0WDp+IHg/kU
 hm08R9do0sFaGLnsez2ijm28Q1pPPeU26/638ZRtYiwFDYC01ETp8GbaN3/YBct+1Z
 SwgFzPps66ZcJBzWArtCFEO6EeQVKSBiwc3Hys6LgBREjwELfD8TMaX2XY1PlwwD6Y
 jr7oCRdUAwKwEIglD98nLb0gx3a1bqRu54GqYWw0LdsIkniNaB2cgIxyzf3Dpx5JUC
 u99YGAqL+mFCA==
Received: by mail-pf1-f198.google.com with SMTP id
 q8-20020aa79828000000b0043d5595dad4so2192417pfl.13
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 10:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGmR+urAbR+sGbkj5JCyniQzZ7uplCBGMFqJx16vAAg=;
 b=O9O+eAqQ5ZYu4HIOFfZLKugYw0R6S14fEcToONvJwtpCUcbxScRfAYKosIZk9PrJ4P
 0jA3NKVWj/zHryHVY5LfhcVFW1696t/EXWifboXK+hE8MbMBkw7YaOEUpkONr2uciq6E
 VmdnaL7K0Uf9rMTKIpgmAGbgmrdw3rmxjZhxVy24JSf53TKeGChdbjjqAobIe1/Ko3Uw
 pO92eKUXTzDc3HsH75Q9J2Jc+/6IzS/nPdmlEgg713/aup4egOwjRQ5hS64XiO443hQz
 o/0InSXjzvAkQN8gVfQ7Hsxuf4RwU4jQo45Fz8tEqk0RxqoBXNqu5e5A0NEwHszpvvqP
 tWbA==
X-Gm-Message-State: AOAM532CzJk+o3airqGGNkDskvw8JsSGD8McsOF586Vey+QmwmAFh//l
 zPxrCL7V/hHJe5ddevUY8al3XxbrL/lNR4Xi9CiIONP3M5UAaLC4G3NMHEtSVSGB23rvHmeqmlg
 /sK9LfCG1q9uCaMCCyqCULpEctal/9gKPEDuq1domc35vRw==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr855677pls.17.1632937902079; 
 Wed, 29 Sep 2021 10:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjjac0TBBohoJcJhQhSRim7mjmRR5K1fIbkEhcN8vg/rftFjZi6B+vE8JDhtXmh2PCd3d37w==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr855648pls.17.1632937901819; 
 Wed, 29 Sep 2021 10:51:41 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id u24sm431805pfm.85.2021.09.29.10.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 10:51:41 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: dri-devel@lists.freedesktop.org
Cc: tim.gardner@canonical.com, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 29 Sep 2021 11:51:34 -0600
Message-Id: <20210929175134.15808-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dsi: prevent unintentional integer
 overflow in dsi_pll_28nm_clk_recalc_rate()
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

Coverity warns of an unintentional integer overflow

CID 120715 (#1 of 1): Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
overflow_before_widen: Potentially overflowing expression ref_clk * sdm_byp_div
  with type unsigned int (32 bits, unsigned) is evaluated using 32-bit arithmetic,
  and then used in a context that expects an expression of type unsigned long
  (64 bits, unsigned).
To avoid overflow, cast either ref_clk or sdm_byp_div to type unsigned long.
263                vco_rate = ref_clk * sdm_byp_div;

Fix this and another possible overflow by casting ref_clk to unsigned long.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 2da673a2add6..cfe4b30eb96d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -260,7 +260,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 		sdm_byp_div = FIELD(
 				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
 				DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV) + 1;
-		vco_rate = ref_clk * sdm_byp_div;
+		vco_rate = (unsigned long)ref_clk * sdm_byp_div;
 	} else {
 		/* sdm mode */
 		sdm_dc_off = FIELD(
@@ -274,7 +274,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 		sdm_freq_seed = (sdm3 << 8) | sdm2;
 		DBG("sdm_freq_seed = %d", sdm_freq_seed);
 
-		vco_rate = (ref_clk * (sdm_dc_off + 1)) +
+		vco_rate = ((unsigned long)ref_clk * (sdm_dc_off + 1)) +
 			mult_frac(ref_clk, sdm_freq_seed, BIT(16));
 		DBG("vco rate = %lu", vco_rate);
 	}
-- 
2.33.0

