Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E590F28F91C
	for <lists+freedreno@lfdr.de>; Thu, 15 Oct 2020 21:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E526E192;
	Thu, 15 Oct 2020 19:03:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3626E192
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d24so4814581lfa.8
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
 b=R6AIOc5WJ33f0BpBRKWYPfmzPqDTmiRJK6HbByTEodetAfGJmFjYidA1TNiqjvR4Fi
 +z1TNNeyEyau6GtusqefeTQnKj5EcAJpmjSyGJsRm4kY0+nEU/tuqZaM645x9d52EkfJ
 XlL9lbev6DTnB4JsfiHTcsinc3sEuY5IWeieKnPKFav7EuFVVDRflL68jIvC95bn0frl
 ORFaopwANTwpTD6Yiy8F9m+79timzuVAvJkC66NNbUskf8Zvx8F7rJhZzbzksEu1tGPC
 TnNB5kTXKRU103n6pq7CvDUmOa/QkY1XLAknl7zyYtDYikwQOcsZTXxzyVWNSIv/3QC6
 4zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
 b=JhbrJB7mOpGIeMSbxrmv+MZsAKWPuwJhUfUQPM/4867G+b7oAFMy9mSl2Qr8bNzd7j
 k8OLqulqYooIeK9U6Kzw3dpWJN/REtNIb/b46rfOa0mMT/xpyJfW5SfE1kZo06d67WY4
 QYh0Pu1MsN+MBMGl2xHIMJUmhhISGrzozLjIfMLNvr2jjUEOc+AOuEm7TxAWJjlMExzZ
 A14wB1fJA/orCzIQI93WYtRI0P+bRJlLRXmbbPsaqgXG+9I+spgB8lxa5ist4L0Oskek
 gJ39xQ6CUkqDPGtOHb0CjWphqAoqhaZqzIcuMhb08yTlkJ23Xnjxy5A5GykrmGVh3WyZ
 TZvw==
X-Gm-Message-State: AOAM533XZqr+IQXrWSsDtEf50G/bHfjpGaZ42FVbAJp9kuFiwz6Glw2X
 KimMULtWMfqtT3TmhP7AbvByBg==
X-Google-Smtp-Source: ABdhPJyrLs7S6IIec/2X2Mr3xlDlbDJAbGZIbUGS6+Evt+QFdDtmpf67+WxUOYXCG2lMLvxRifri5g==
X-Received: by 2002:a19:c3d6:: with SMTP id t205mr21117lff.84.1602788616297;
 Thu, 15 Oct 2020 12:03:36 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Thu, 15 Oct 2020 22:03:29 +0300
Message-Id: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/4] drm/msm/dsi_pll_7nm: restore VCO rate
 during restore_state
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

PHY disable/enable resets PLL registers to default values. Thus in
addition to restoring several registers we also need to restore VCO rate
settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index de0dfb815125..93bf142e4a4e 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -585,6 +585,7 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
+	int ret;
 
 	val = pll_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
@@ -599,6 +600,13 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
+	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	if (ret) {
+		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
+			"restore vco rate failed. ret=%d\n", ret);
+		return ret;
+	}
+
 	DBG("DSI PLL%d", pll_7nm->id);
 
 	return 0;
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
