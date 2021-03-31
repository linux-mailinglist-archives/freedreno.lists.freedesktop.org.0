Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8A34FE7A
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 12:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D558B6EA64;
	Wed, 31 Mar 2021 10:57:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535DC6EA53
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:49 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d12so7435159lfv.11
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
 b=DdxFqg+UJ9FKMjIZZi6fUqHc4tQRMvdxxHSUffVfU9HMSXKru6kzhwCpfjYqStkBfC
 XT/FIkqJJHOafINowWPi9PbRGtpulo5RxKaAKD7YM4E/aHe+528vrocpPq4tROISvgT3
 CntWnbju89GHH8MhAeBNJwu4Ad5bf7Zae66wHoajRteIgbRJktTRO9dQuRmJfJAY+TBA
 xcR8QJ6q33ZKrAK+ZSO0PIQqnhYyMQZB5x9+/fElOYsKfjIU3MYhS4Wl2GV8LdAt8Q++
 twxhYWtg90yFKkpYDB9PvGqKH3ql3xUpMoE3unLNVZRvyJt753SVUCw1r+BYXrgj8J6T
 HAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+QjMm9irtQduqRvHLr5gFloZB/AZPEuGn8xbbHk1b6E=;
 b=OXq1Bjh2YLCdSfAgBsPrM5zHmMeHodvmJJ04J5utk4GZP4pIb6G4k3xjhnzReLDvlI
 kTjZ6fgzndasSaIm6x840PW1r1hd+ghEYeZcHos9SkPWdIJGiav2b58OcAQMmZbVzL+U
 CaEksP8m1xiVrZNzuy5jvONayOcPmzN3IAU6FZs51fOZqy51N0CuAnNRFnozzVHXbjHw
 tmn8NG3SmwvDRGFFxhpL3iRA1kM/8gIgTUr84snPswbepWaasbiDd2pC8+S6LWemE8Su
 s8LDI9iT2kgz4IXz0kBgsJ/vHG8LvmSYNY9iOCGJ4hTqu9dRDZ72U3eqWPl2H4UcPOP9
 urWg==
X-Gm-Message-State: AOAM531Vwt68WZHDLVg48kgLfTFj8e3uKCRywCv+q8gkPA046uQSMBT1
 Wbe94nJvsYwyv3vgvdMfGl1puQ==
X-Google-Smtp-Source: ABdhPJyAC6SLSg7+Dr9VzDvUXl2f9g0aYK2FUaDNGTXtEdt2Nc3MfNNNyGtrjO5BCFE0WkejuQ6wnQ==
X-Received: by 2002:a19:7716:: with SMTP id s22mr1877170lfc.542.1617188267795; 
 Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 31 Mar 2021 13:57:23 +0300
Message-Id: <20210331105735.3690009-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 12/24] drm/msm/dsi: use
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
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
