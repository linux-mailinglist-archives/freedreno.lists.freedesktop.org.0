Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E331E33F335
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 15:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839E6E5A2;
	Wed, 17 Mar 2021 14:41:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22F6E5D2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m22so3338787lfg.5
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLhXbs59yVzmO7WojFz9RpxOwJYiP3BLmuIktV2OyGs=;
 b=nl1bUP9vw/IpaBHzsqo3AEkPL5XzqGHwM4VB5iC4H7lhplNQYalpa4tunxNqcNXG2Q
 +kwqgJ9rrXh45B+GHRNqlUm1javIx8k9gevIMqvcjQ68ufswedqa7XuIXnsvXuiC+Jr/
 fxrxt8z5JaXiyrV6CkTahzhmSocdrkCXprfq7CILPaxuHuOVEJhy9aDUnKStpsPWvMi+
 ttJgZGrXC9Ad0SJzZrkmxhs5ZUfvn0mOeGkfG5Q7to+1EODAPHvEwYZL7oY48iRvX9h8
 zO5QIkOf8NrU8chm0xaxbBV9B9ozVCDGFKdNeUliel/dF/1uapgLajsfCXSS3FpprYLB
 WoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLhXbs59yVzmO7WojFz9RpxOwJYiP3BLmuIktV2OyGs=;
 b=fRyzd28uK2u+y46fC0mwpwSGObSqrd0mok1w/dt8uo1r7B4LFvwVtWzocIc3mql8Bm
 rjRcqbNRp8EfifTaFc3i7BqGBVIOXaocpMSXmwLz2ZEVpdu2aVboDw+j4A9XCvQ6APGz
 4SlXpP3u2aPecRUnkCaMOzjIelkVD6Oza1IzbxEBiRmkDFS+maNlFQ6fzNvXP89vepry
 SP3CcZB+Y3I+QhmiOwrr+AGWoMtgDpfPGvp1Tncl084aX+2WhBPVtGyJZqRHP4eFa3fR
 t0Bck7LvENtnchtaAzyGTf7pq+tuHBqTP7wVtmmV5QSRoZcAYbBYjA2F5W4rklyi66vZ
 zpwg==
X-Gm-Message-State: AOAM531PEI5yj4CrYqv8chJp5/aJI4rymwMf/X8bYFBnyv3UxH+Fvo0/
 9IVMn8oDGFTjrt1zDJc3s0H13w==
X-Google-Smtp-Source: ABdhPJwAJamfu7D7LdWLEBNqDKVW0j5aucbHTLXOxUTXvfOKJkzzZArUgosgoQtyi1cE8yxIArK7nw==
X-Received: by 2002:a05:6512:10c9:: with SMTP id
 k9mr2714800lfg.532.1615992054711; 
 Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 17 Mar 2021 17:40:26 +0300
Message-Id: <20210317144039.556409-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 13/26] drm/msm/dsi: use
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
index 8c0bc5ccba8f..0c26451db310 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -734,7 +734,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -748,31 +748,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
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
