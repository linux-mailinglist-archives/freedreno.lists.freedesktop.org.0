Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4292A0954
	for <lists+freedreno@lfdr.de>; Fri, 30 Oct 2020 16:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A666EDDE;
	Fri, 30 Oct 2020 15:12:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3066EDDE
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 15:12:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 23so7251856ljv.7
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmLApEco+rX8mEQowG+X3JrxaqslQdNzajS3RXlAwc4=;
 b=Tqb7O5kk3DsDfwbCyi/N62cSbTRuKTlWvRDOrRX0UK94p5yx2nykHIfq3F83pRzD4m
 CBnP5gDVH25wtvfCi2WXDdN2Y+eGpbOa0UF6EClN/a1EuS4jsF8amYFS5Y2QOlKWJ8tf
 VVZ7wxL1YgWLRwqKaSWmI2CfH1+lxGwoUixJXMmCe7NxnpYilaBe5ufBKlnUFNXwoSFj
 cFzuMsujm6jKIJR5jMaRCwoEfh3YTFGu36xe8FEkz4RHLMCqMOQ7h0CeAuu107yf6ngb
 06ijysHFIcmX9g4KNx9rK3vmkRombtOQhaPt+MzK9H4TG7Wn93OGrQ8027CBTkEV2wZO
 T4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmLApEco+rX8mEQowG+X3JrxaqslQdNzajS3RXlAwc4=;
 b=DJQQK+4eIEJJyZZ8G+yTWBRIN09355jrsi/g5cRHXaSD+BJ7arQCADsspNqXkl8GaM
 vX/NFCZmlHLvuolLTEQvVmU3U3m90yTofkr/Ii3rnfSFS2/83tp+hiB+K/8oUWMcIAfM
 HNVCryJIR/ygodgosWU4eMivimouKSwsqVAcGHcJnKLvx4TWRUxc7Jn3MbePPqBDxM7I
 buIeSzMte43qxdJokJWzFZJhw9tD0Iai+FzT1Unqv449aHxV3Iui19WB9801+dcYqeQx
 bmfay787HTiQyCjdsYbNC1jDjHDI/R5UPLI2jVSfU0G/Rgf4/nkugLDau51ppOCBFn3i
 zD9w==
X-Gm-Message-State: AOAM530Jka3vaSS60X2IRLFXQ/HADIdQSc7Elueq6fTCxM+FQ7Z1iyJi
 A0IjzDiJ5ntQsGuIZVm5axIiTw==
X-Google-Smtp-Source: ABdhPJz8Jf3qUgHHL0oIhqFyjGJF47n865tCXisEWtPQ4NvvEiiPTNTUXmZA8itu60q/kdRV0TymxA==
X-Received: by 2002:a05:651c:1139:: with SMTP id
 e25mr1238791ljo.63.1604070731032; 
 Fri, 30 Oct 2020 08:12:11 -0700 (PDT)
Received: from eriador.lan ([188.162.64.225])
 by smtp.gmail.com with ESMTPSA id l16sm647269lfe.78.2020.10.30.08.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 08:12:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: benl-kernelpatches@squareup.com
Date: Fri, 30 Oct 2020 18:12:07 +0300
Message-Id: <20201030151207.766857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: do not try reading 28nm vco rate
 if it's not enabled
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
Cc: sean@poorly.run, benl@squareup.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
 dri-devel@lists.freedesktop.org, konradybcio@gmail.com, zhengbin13@huawei.com,
 robdclark@gmail.com, daniel@ffwll.ch, kholk11@gmail.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Reading VCO rate for this PLL can cause boot stalls, if it is not
enabled. Guard clk_hw_get_rate with a call to
dsi_pll_28nm_clk_is_enabled().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
index 6dffd7f4a99b..37a1f996a588 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
@@ -447,7 +447,10 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
+		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	else
+		cached_state->vco_rate = 0;
 }
 
 static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
