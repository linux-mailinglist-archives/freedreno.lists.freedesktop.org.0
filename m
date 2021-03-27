Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2F34B692
	for <lists+freedreno@lfdr.de>; Sat, 27 Mar 2021 12:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60076F528;
	Sat, 27 Mar 2021 11:03:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706616F527
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id r20so10321336ljk.4
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBY+9qD1ZXGuyQtqkYcuydo9Ohc05hbMC90j6qWFkmU=;
 b=Jqy6C/bJyTDxyFpUddfheGqkwv2uMvD4ASc2pcMh42Z2m6Zhixr6CYlu2MGKaBSYSs
 3roH0ZUvanZ6bu0+jkaRauoEHtsl2Z1BqFw1nAyeggc0mNlHZ0vl9j1trxRmXDJOjA8E
 usYPujvXIadwyARtc1dMx4I3UzMjkSBQN9o1kzB5GqTlz9dhv/64yk2r8F1rzt1YU7En
 ODVkx/nE9qRP0Z1VB2+1aGLeaVFTdCChzHbheR9yMbehqS5Kv5RYTAjTDNBOWcPAPPI9
 vs1iVw9HFIMyjlcCQ4NV5AdfiOGChkYdu6YTIXlAYK6HjwLTiPOsrp7M94805Qty0F+v
 7ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBY+9qD1ZXGuyQtqkYcuydo9Ohc05hbMC90j6qWFkmU=;
 b=fo1rK3UjH4Wf37+MYCC2dTorfONciiwvQkSGpcFhnh+IuiuDWWqUt1PTflgMMP8e5r
 RCgEUhNxm6xn82hTDDB7v8O1Ml/yYolCbeSrcb68KWWMQvBqLVHbuaeN2p3N807eI82/
 8Hel8HKY8i09vVwss5l4kxwnFvtYoAsr8ABWbCaL50FhN5hwYLJ+95lVdcoRBcVFRI5f
 O+fnIk+5YmSFVin9EFOyv3vQiZtSBJVu62wt7OUQVDbzCMzs/V7rKN9Z21Y7bZ0M+4Qf
 XlhFyl4TyaQFQIzfuzGB3y3hYgJTJoG6PbHT3beEqcdLWzBOtghKtxucgL0eRyecxT5H
 j8AQ==
X-Gm-Message-State: AOAM532kwrnxB15/whjvksVhRs0Y6761PIozzfg6/JVq7u5639U3GXs4
 gOO86TdIuDcCgDEAiX0tDl0XbodSCnJ9cw==
X-Google-Smtp-Source: ABdhPJzwdIoPnHdNXz+0PCobNaN44vAuRSGmGC2g/8GawSaPh1yXmbEnoua0ZdagfyC5G5VmUp4xWQ==
X-Received: by 2002:a05:651c:1135:: with SMTP id
 e21mr11746387ljo.151.1616843001918; 
 Sat, 27 Mar 2021 04:03:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 27 Mar 2021 14:02:53 +0300
Message-Id: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 13/25] drm/msm/dsi: use
 devm_of_clk_add_hw_provider
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index df3b91b0ea88..46561435a27d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
