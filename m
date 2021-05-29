Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB4394981
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 02:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCC66E9CA;
	Sat, 29 May 2021 00:25:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7A6E994
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 00:25:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w33so7733719lfu.7
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
 b=VuDOOtoBvA0CaQnrlfhc8IsfATwRDUEvlzzBZ+oA7N9cflulstBufYmDbG/evOUwLb
 x/g7Dpc9j0x7S1V8GC2Uu6INlHOjwtoPQeVhxQU72H8cWed6G1pVYkD2IvdIfzdJGGam
 sFU2jDtsrFd7Me2icggO5qUR5lyIcjnqJr49M0Q7E+rcymTOok69wHghbv34/dFfSqe0
 VOvMfgVKftK0HWRR4apYZ8IxhiISXZrx/uzTw1cn+4jzKVB9dn6O0b8/YPFMkEPunsXc
 1qH1oWiFnqyGFBXFmN0rThBWHjF54fISqox8BviWBr62tkyxuhZaRpx6Hn2ZfmGIfLx1
 1NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
 b=sLlGAiPq5E/AvQ+CiZO+u+DxqJ7f2NrWG/64HaUPDsdLBNJ3wzig9qmRl3k0n6/ZOO
 sh1hi03laY6iGhlQrlmvfoPqgLJ/1C8QucwYpO/ANI3tTcftGN0dGxsHJYgh8MS9INOS
 HA50cnzVT60QUcig4R3vQImM7z34kns28FxhTTN4+gNBNxv/s18dye+w7aME3lLonvHd
 GWVW6HRH/WtaJegiyojq2Zda6veg5Aq7TgbbcEVj8CbEMd1PGDvTSewJyzUY74qZyYQX
 4cmzOxppUgwVfoS+hM7uv/AMaO9VeSRgN5cxaOsf7NyLIhGW8sRkxa27Vjcn6ge/yky5
 FtxA==
X-Gm-Message-State: AOAM5336a5F0q422Mgom1UjtpliH04NH4jZRwYjmQQ7s2UpQfnlmmOTG
 eN0lhFW4XJcPIzpplLVgL8uamg==
X-Google-Smtp-Source: ABdhPJw22wrdYu0yhkTcrdRn6v+jdyyDFi0zoH9wEQAMDNpmWZz54XvGUxbZPywma0aMj80RT+o5xw==
X-Received: by 2002:a19:ee15:: with SMTP id g21mr7601957lfb.338.1622247916549; 
 Fri, 28 May 2021 17:25:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 29 May 2021 03:25:01 +0300
Message-Id: <20210529002508.3839467-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 1/8] drm/msm/dsi: make
 msm_dsi_phy_pll_restore_state static function
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

msm_dsi_phy_pll_restore_state() is only called from msm_dsi_phy_enable(),
so there is no need to export it. Mark it static.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 30 +++++++++++++--------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 876053ba615b..c467ad609453 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -170,7 +170,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f479e37d6428..36878504bbb8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,21 @@ static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 	pm_runtime_put_autosuspend(&phy->pdev->dev);
 }
 
+static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
+{
+	int ret;
+
+	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_pll_state(phy);
+		if (ret)
+			return ret;
+
+		phy->state_saved = false;
+	}
+
+	return 0;
+}
+
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -838,21 +853,6 @@ void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 	}
 }
 
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
-{
-	int ret;
-
-	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
-		ret = phy->cfg->ops.restore_pll_state(phy);
-		if (ret)
-			return ret;
-
-		phy->state_saved = false;
-	}
-
-	return 0;
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
