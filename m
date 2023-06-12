Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0D72B5E5
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 05:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291A510E153;
	Mon, 12 Jun 2023 03:16:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEB010E13C
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 03:16:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f642a24555so4470353e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jun 2023 20:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686539778; x=1689131778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAmGA4CGrc2mip02rFkO4Zx0BoHPmjJnhKCFRcvi1qk=;
 b=i1Hr6spoFkG/27w/7KVvHCjWfZfx5W58XOzkaRLQTy4MuXverDKit/JoUvTg0TVzqY
 QArSJzbRQ58idwbexI8sdnKskDMV1LFEhXZ2iDI2DPInC0PHtQBwsW6KuDzoTQWk17OY
 IaX+rXbZXiOBP390Kicus3KJ8Dkk4vLJeoZqF8yEQJwNGJk2DX/OCWnk+E3ny/rgNQtP
 E5zLixYas2YRAjK/GMe3lIXtvlDi00KvMxrlyOw2nW6sUGq2OtQRY4uR0Md4EpajdbpI
 xyxNuRqF7h6M8/ERbbA/eVTAtyB2QYNCc3izke62E2Bq7gSAJosZP4Q7JX7KxyZAvQIJ
 3OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686539778; x=1689131778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAmGA4CGrc2mip02rFkO4Zx0BoHPmjJnhKCFRcvi1qk=;
 b=bptY9IwrdEYGxEzMbMuTMUhj9AckYmHbeAR2wviFpIPVZf44mpK8knlEhVA8vwlH3P
 QoMBpDXRoimtQH8ivecCeX6KY8vQvbjMqiM58i571yF8LNbkkqSqHYc4Kd5ckw3LFZ9A
 UUjUW9wGX4KIxQ2KS5luDKIrPyYFik+qXluXQK8HPJbkbEknVQ9QeaKxmqhH5dedIxQu
 oRjUqI9CTaXpx5Q8kG3Cw69ymAPwGV8ju1GcJH5ZXw/BbNMRNHV0C1+uEvzD9/pGuBJb
 CO/TS4KoS8vL8yO5S3yvjHE95LQZdcTuODCuKhHrMRbnmugLFtlNYbKs/KQgDfQ1e0g5
 8mtA==
X-Gm-Message-State: AC+VfDy+FOGSnjMY15g0UwzoVYBrGIHcyyJTECm5vljTJHZttYIyriNE
 rl8244pGi6CNx2J5ZUPr6VyKvg==
X-Google-Smtp-Source: ACHHUZ5ebUVXFqaQVfNpyMR0OjRILdzgCwRKvjDWlBLRqQhCTbm9SliC8tbYuL16gqK4u2/3LcOCPA==
X-Received: by 2002:a19:7104:0:b0:4f2:4df1:f071 with SMTP id
 m4-20020a197104000000b004f24df1f071mr2592817lfc.51.1686539778351; 
 Sun, 11 Jun 2023 20:16:18 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 g12-20020a19ee0c000000b004f27471e0aesm1295901lfb.79.2023.06.11.20.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 20:16:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 12 Jun 2023 06:16:16 +0300
Message-Id: <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO
 with unprogrammed rate
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
Cc: freedreno@lists.freedesktop.org, Degdag Mohamed <degdagmohamed@gmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

CCF can try enabling VCO before the rate has been programmed. This can
cause clock lockups and/or other boot issues. Program the VCO to the
minimal PLL rate if the read rate is 0 Hz.

Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..6979d35eb7c3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
 	wmb(); /* Ensure that the reset is deasserted */
 }
 
+static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate);
 static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 	int rc;
 
+	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
+		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
+
 	dsi_pll_enable_pll_bias(pll_7nm);
 	if (pll_7nm->slave)
 		dsi_pll_enable_pll_bias(pll_7nm->slave);
-- 
2.39.2

