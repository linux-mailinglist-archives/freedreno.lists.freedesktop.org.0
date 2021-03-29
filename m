Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8D34DA17
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 00:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444F6E1BC;
	Mon, 29 Mar 2021 22:21:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88389F2E;
 Mon, 29 Mar 2021 22:21:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3185861985;
 Mon, 29 Mar 2021 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056514;
 bh=LRLTHDoyxZtUu4x9R9wdOxcA34G7xck2pkv/y/zF9LU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FKk2NuQzry5BG+i1Oxbwq2SOlbSz47QlgQe3BK7iyZFx5qlY1Ao8JWkP+2dc/iho7
 SeoJnf1zozDvhvlp44hr+YPcgO0inSIpFd112zeExmDGu3h2fE6A4eHg5jI9nFoTlp
 +NuDTL+jvNsfe2KKwxv+Sc3ZVvxkxUGtFC/fDuDrUdqXN2WDkV3A+Uh06Y7jUjDWUi
 0VQYMAeUrddzJHCQW0jVjzsoaMV3YiLdTMoVptUxZXb1/d/8Wo9sxoeotw1gIX0O0T
 Jj8rJfLoikQ/ismb5f3dIjT3k0Tq/DxlvYn+eI0WPLLFTldAYe4OtTrWZhfto3VcOR
 EE0M4kbS3yitg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 29 Mar 2021 18:21:11 -0400
Message-Id: <20210329222133.2382393-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222133.2382393-1-sashal@kernel.org>
References: <20210329222133.2382393-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Freedreno] [PATCH AUTOSEL 5.11 16/38] drm/msm/dsi_pll_7nm: Fix
 variable usage for pll_lockdet_rate
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 9daaf31307856defb1070685418ce5a484ecda3a ]

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
pll_lockdet_rate")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 93bf142e4a4e..901e8b8819d3 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
-- 
2.30.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
