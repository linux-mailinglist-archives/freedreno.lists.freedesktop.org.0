Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959E39498A
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 02:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D26EAE1;
	Sat, 29 May 2021 00:25:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809016EBA0
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 00:25:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f30so7790255lfj.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0myhhwQw1DX5ERjVy5isiupy8P99vq2r3iL98W1qNk=;
 b=xdI1St13jCR84pKFFkr3NytQGaw8aUa83o5O5KlvwbLPeYpNEz4m8/MVluH1GdH3SA
 47ectaztRJMeUzmgJQ2Tr7e7HWdDSuc9Fd/BhJEemyqV/uftjL+PDQTSp7R8CQLe8Flz
 SpBdQckLfQKbbBbBLkFwLkJNSleRQADK9J2ahdnEi60NQepRw5kbSEpwOru7MhtN8ZBf
 z8j/tzP4O+G5zZupiGdWNVWEW/khNBnNLmKnHsE4BK7iB+qUwSjjSMmb6Krok1Ae5epw
 O1IlGR8bSUlhTrnthv0pb9ZTFBdI6eY6ZV3Zk26HqBejI8DrUynNFyFI4zYgcDvk/xTv
 TtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0myhhwQw1DX5ERjVy5isiupy8P99vq2r3iL98W1qNk=;
 b=JFaGVs18gxyrCgIe3/melsR/K8k4lCBvS0aaxoBmM0sUYBV4pcjc5DD/d3o/24zOgw
 yFtocaSJqHb9uUjbOypzMpCcO0kzi1Aozzx9f9Ht1yl1AyKSryqeci2wtlTZpi7KcJJy
 eKK4WvZ0dcrt+Q5CK1hc4ql0YI771fZEdoYkmq1NL5em3kxT2i3dHjvWz4ZyaurP9M6X
 LEqA/vn3rJLBgvS0mrjUCHfRzAtSfKW7HT71YeUyKD4qHXwwajEGeKWPRqaPJl3siFoe
 qIpOAietELAuz0KqRCTz8gTt1zfPyJef/ylcphrHPj0yG7qjdcenvfRY5JRwaj5iQ2kH
 w85w==
X-Gm-Message-State: AOAM530LBPLTloZxJD72jOPLTYj8YDq1ruQRqbSc5fgiTDk7BEdX/G4k
 ZGlYJLstmFmUjyGC/D4bwhexOg==
X-Google-Smtp-Source: ABdhPJwLHnP1Y7WOu1kLQQf1Wg3vDNmahUU5TviiYqcjegJrFCej1BGK+Jpqnpzh2YSTuyAsqs9JnA==
X-Received: by 2002:a19:2454:: with SMTP id k81mr5045371lfk.331.1622247918946; 
 Fri, 28 May 2021 17:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 29 May 2021 03:25:04 +0300
Message-Id: <20210529002508.3839467-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 4/8] drm/msm/dsi: move msm_dsi_phy_pll_save_state
 call to msm_dsi_phy_disable
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

Move DSI PHY state saving from dsi manager to dsi_phy driver. This way
the manager does not need to know that the DSI state is not preserved
acrosss resets. Everything is handled by the DSI PHY driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 21 ++++++++++++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index c467ad609453..d64db1badd4b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -169,7 +169,6 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
-void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 88d56a2bc8ab..de1c41dc5c15 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -524,9 +524,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
-	/* Save PHY status if it is a clock source */
-	msm_dsi_phy_pll_save_state(msm_dsi->phy);
-
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
 		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index e5d25b44f8cb..b7b178cc318b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,14 @@ static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 	pm_runtime_put_autosuspend(&phy->pdev->dev);
 }
 
+static void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
+{
+	if (phy->cfg->ops.save_pll_state) {
+		phy->cfg->ops.save_pll_state(phy);
+		phy->state_saved = true;
+	}
+}
+
 static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	int ret;
@@ -845,6 +853,10 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 {
+	/* Save PHY status if it is a clock source */
+	if (phy->usecase != MSM_DSI_PHY_SLAVE)
+		msm_dsi_phy_pll_save_state(phy);
+
 	if (!phy || !phy->cfg->ops.disable)
 		return;
 
@@ -860,15 +872,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 	if (phy)
 		phy->usecase = uc;
 }
-
-void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
-{
-	if (phy->cfg->ops.save_pll_state) {
-		phy->cfg->ops.save_pll_state(phy);
-		phy->state_saved = true;
-	}
-}
-
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
 {
 	msm_disp_snapshot_add_block(disp_state,
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
