Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80E3C2AB5
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 23:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964E36EA99;
	Fri,  9 Jul 2021 21:07:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E786EA9D
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u25so10103385ljj.11
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
 b=zo8nKP9LqCEewAlV/Hpu705xkphyemres9xFnaNIhUAeh5mFF+U0np4R+XJnnoxHCQ
 nfLpLUlEwcCDnPG4JheD5q7zX5smYjcU/iCf/209AbhbXsrNlVqfHEqvR/vajcEp6oKD
 WYJXijKB69beBXlThUmduFE8T/qf7LjLlS85ShhqYwJZn0cGjroWaxrrTkUlHrdkCSlN
 F0hzw7/KZgkyr0DOwglSb2K5Kdnm7jTsAVipJZJZjfLHFM6291qnng+V5NCAtZJAKdZl
 j5u/CNTmsoTEkg1kZuODwOAifNj/RP2nEMglu41qEwgxP0qy7Q3u0SWpflP+87EVQVIY
 aGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
 b=tH9FrEbhFWNXXHTX9Dr6of3f6ARKCb2Kd+s85di4WNWfAt7+QXa8RSZ/nAC67e/bUL
 XLCI8zbIM7iWDnpuBhQxYuKvCFs2b3BPnbk2rfzVmlhoN/NX2R2vC/24eVAYMGkVPxNL
 YF4sExZ9HSTivnLITgqNJK4SwQyz5STGSbSrPRZgEr0P4tQWYJIVyJMh8R1YmXcwUmvM
 6PCIrnbhvZhrvidn+0jTola1z0a6Z1lmPvSziMFMRq1em27RmH8nwl/vedPNt6bMR8Hn
 rFLgfCAXXcY5zAaDI3D5X0edsegtyHIEHMI9TuRQE8QT9j+7NVJBCN2dYmDJhR9XkVT3
 3K7A==
X-Gm-Message-State: AOAM530rTR4ukgtEvIQ2GEUpoZ8Gvkes/zqg8+Y7UtPhsQI70wYMe1ke
 79R1qhJQ/avvAzU9I+3nGazHWw==
X-Google-Smtp-Source: ABdhPJy+sbW7gwPQC1YnwBSkUQOG4O/Nqf3Ey1YaJh8/bnri/JcwqssCv9mfIPGZX+HJ8dcjCP1OsQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr32140951ljk.58.1625864858423; 
 Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Date: Sat, 10 Jul 2021 00:07:28 +0300
Message-Id: <20210709210729.953114-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 7/8] drm/msm/dsi: phy: use
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 952fd0b95865..c76a6438ffb9 100644
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
