Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD6381909
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0956E405;
	Sat, 15 May 2021 13:12:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6436E2E3
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:26 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j10so2215984lfb.12
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
 b=cF2KeGsyYzGUA7pon9uebG1hW4coCHuUINWddBAL3uKXnxo9/dcRJ4EUsfq60Ldwyk
 3NkOzv1LPLiBKyaQMtudvpy/E6IkGeYn2mNAUKcA/graDG9g+8kcirZcWBNavci2TfCU
 DGUQ6C5PirDbBGRTiOSx4Rnqxgh/E0Q86Ymk4gamA2za9zTTmQlWUKixopNwQ7tQqqNn
 axtpePZ5ZtljSWbC3xTs+neG1bBnMCJbyEFcD1b/N6xXjq2lSKaCWirYKRKPYzk7i3XE
 KEL3oJp7BDoqwBGqB5AMJQjbvYeq6oPgaGyqVViSt2N23GGwiU+BdkqIZ9KNtzwpMjoU
 P3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
 b=j2VfUqLcM25uXMGvc2I3qRU2+NQ/SzMOo0K5vr8EXSlE+R5CjgHg03v+eKzDy04NPU
 J4B2PrUGWKJZQs25ybpgOvRaFqX4u6JoIErrC/hOO1SpfjmyU5ru+r3u/cEXy7arFMFQ
 56Ufhby1j+HfLbHI47bsXN+dZqgqhc9PnYbSTYVGmUzsYjDhWxL+lLqKUHoXLwXcFeTV
 ObdORAzSYXMbogoJBWYmC3RYV6V4Ep6ZeAktWzr0puv36OqX4B/P0j2BNpM9W6VZUlui
 ICQcEoFkVkc6oZ8xzJZpsV12rw8vuMx+XgEjAC5UGGyxP9YnjlG4U3sE4iECu7zU5siU
 A+sQ==
X-Gm-Message-State: AOAM532YwU4NiEJXDW0n2AjqQytt/xgooK7wJTdblnL6nmCjgEGYzcvn
 ve1AR6V74O9tO9W154JgRL08bQ==
X-Google-Smtp-Source: ABdhPJzPOhQuWXDvoHnt0lj+USoizwoV+M2VpSIDnhnvmPHKD6uzEqdeNoJcuvcQjO9pPfLvbyCN+A==
X-Received: by 2002:ac2:410e:: with SMTP id b14mr5408000lfi.56.1621084344791; 
 Sat, 15 May 2021 06:12:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:15 +0300
Message-Id: <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 6/8] drm/msm/dsi: phy: use
 of_device_get_match_data
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

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f2b5e0f63a16..feaeb34b7071 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -625,17 +625,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	int ret;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
-	match = of_match_node(dsi_phy_dt_match, dev->of_node);
-	if (!match)
-		return -ENODEV;
-
 	phy->provided_clocks = devm_kzalloc(dev,
 			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
 			GFP_KERNEL);
@@ -644,7 +639,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 
 	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
 
-	phy->cfg = match->data;
+	phy->cfg = of_device_get_match_data(&pdev->dev);
+	if (!phy->cfg)
+		return -ENODEV;
+
 	phy->pdev = pdev;
 
 	phy->id = dsi_phy_get_id(phy);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
