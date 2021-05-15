Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D97381900
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CDE6E3A0;
	Sat, 15 May 2021 13:12:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3076E1A7
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 131so1744473ljj.3
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3tSs2BlSIPitxeqtaxkum4JvycFkd5vmdXplnXAFXU=;
 b=QXMunA05IXaZwY7+Nvxjbddv1Una4UblvTizKJ8AzDDa4De7qevcK60VVhoztcTsOa
 ikhW1FV69Tzt37IzhiFB3hz6Cv324I1VfZGYdraCQ9MM4HzP/TTrPODmn+gweKo7wWH+
 YCd4bsh48bjtkfzAM1o2jIb2Zy/zusD0pBYUvi/CTpUomXO6uUGbnJHiarT5Ig8tuSAJ
 PMSSTALiKT9fCc5UKOyHPsqgtHc9s8S3PjXg280mzvQGsZ50aTUANDl443QZjNimJA2S
 Q2p+9jaF5O/263FvtVAhYoN0epq3jeLrTGX5tn6yPFvkokTc68/dPPQxCfVZSCX9BhNm
 MwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3tSs2BlSIPitxeqtaxkum4JvycFkd5vmdXplnXAFXU=;
 b=riaQSRaec8JNQK4gDj1cYs5ieKCCldDXR6a9ZWx7Ayx6MxW1/RrUFcdsznpH+EFGR4
 LlUSzqXlChxh86Ya/LNZYWw62M+UCNhpVhv0k5VS5vCKCKzfOWSyHxlfiw3lEFGzmTHf
 whYRuIT7kMKoKuW68da89rHuCgAXJS7i4qEW0t0OnYuKAwtu1vtoxmnZn5pw/vImRLEZ
 NnL8aDBZX/m2mPfdKEWetsi1leyV0mj/R5djfWHrECpq9UQ/k5Hfnhusw3Vfwypmve7Z
 6tljEcJCPtaRCxDO4T0fMgSpN0VKFjOgJJCnDTudZ/sroO6W/uFJZkViLekJm1EV3oYp
 S5FQ==
X-Gm-Message-State: AOAM530qmo7mvxn+NANXOJ5sRq75r8yI/PJqQCqPfyIjYrdqnn7x7fSA
 aSUAlv+qDnPOqhSN7XwcrfPOBmAFndlqLQ==
X-Google-Smtp-Source: ABdhPJwEtLI4O0S+BqNMM/Q0Yj5l9zONmdA6RwWxmwxtPaU6LMsXAO3yWihDrMSN3nIHslEKjQKa9g==
X-Received: by 2002:a2e:a7c8:: with SMTP id x8mr21183894ljp.209.1621084343898; 
 Sat, 15 May 2021 06:12:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:14 +0300
Message-Id: <20210515131217.1540412-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/8] drm/msm/dsi: stop setting clock parents
 manually
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There is no reason to set clock parents manually, use device tree to
assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
setup allows us to drop repeating code and to move registration of hw
clock providers to generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 --
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 51 ---------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
 4 files changed, 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7abfeab08165..2041980548f0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -169,8 +169,6 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timing);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8a10e4343281..1f444101e551 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2223,57 +2223,6 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_phy *src_phy)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
-
-	ret = msm_dsi_phy_get_clk_provider(src_phy,
-				&byte_clk_provider, &pixel_clk_provider);
-	if (ret) {
-		pr_info("%s: can't get provider from pll, don't set parent\n",
-			__func__);
-		return 0;
-	}
-
-	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	if (msm_host->dsi_clk_src) {
-		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-	if (msm_host->esc_clk_src) {
-		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-exit:
-	return ret;
-}
-
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..12efc8c69046 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -78,7 +78,6 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
 	} else if (!other_dsi) {
 		ret = 0;
 	} else {
@@ -105,10 +104,6 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, clk_master_dsi->phy);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ff7f2ec42030..f2b5e0f63a16 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -835,17 +835,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
 }
 
-int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	if (byte_clk_provider)
-		*byte_clk_provider = phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 {
 	if (phy->cfg->ops.save_pll_state) {
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
