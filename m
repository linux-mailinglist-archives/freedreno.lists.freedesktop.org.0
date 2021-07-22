Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4C3D1BDF
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 04:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773A96EE98;
	Thu, 22 Jul 2021 02:44:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB06EE97
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:14 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r80so5052656oie.13
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLfCGQhZ9sWWK6V+miB0xsO475S4ojkH6KbRA6dRnQ4=;
 b=enHglQkCfAeXdX2XT+ADILAHKBjtUZAqEoRhEBxzapVPkQhqIWS4apVqPKtTnx1joi
 DUSrlS4z6vYBIliupHyaFkUYPcxR+vNP+ZTXKQGHizjl1Za4cj0ULDNdh/4QJ6mb04R2
 pWEduzwKUx6sLfFmqgaATyOIG0mu6tz6Q3xLkfRSaJc5YtrouH65Gx5tcTnUxe9HaSoR
 6ZV5KKvwbTZ7Gyl1p9XR70JT+nDqO+JwqJi/XLILzYdQgKS+XsKPhgcb6caDZu/5kcOD
 9/fg43z7lKyi7sw/geLrThpfA9raDy0MbPgbweomzYD4vNs7x6OIMlw8Rw/qJhvsr0h+
 5VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLfCGQhZ9sWWK6V+miB0xsO475S4ojkH6KbRA6dRnQ4=;
 b=flKwynUmTn0VgqU3vTn51sT8PYXhYLIRKFkQUWJ42seGm4e1Mr3opjZnnpsetnQcvp
 2bIdyIk2z4jFM56IqRADZUS2I8kUalB+R9JBH2LDKnU/K5di6yd4dIC2uX19zTtwzSXr
 hqPkfvr23oCOvSDMvVlt+rPa/eMfqO3WRnCg6/V4iy6Tpcp9jW6qRjPtZlIlGgBMtQof
 YskDGHXM88J4fERSC6ObovlzhkuwhUwleRnHGNfp0P5zU8Pf7VF6EsubyohoHLBxeG3A
 z2Wt6P+Sr3Ktcm0bq/GQIJX0XoI+CGUJxFu4rGl/v1yvZQreygNZLEbyIij9lZgTo7fF
 Ro5w==
X-Gm-Message-State: AOAM530QSyA+L+u2fq4vqrmPcGO+hNFWl2kk1mVKGnFz1h8dtYxLitmg
 O2GEl4oCxhRY4Cdp61WdCkNWDQ==
X-Google-Smtp-Source: ABdhPJxv5tX28bUZMIQ2i4FRhBPM5G8KFvgAH21RAfpzAtTS4CaoeIjq0CgLpSyBZVsVug8cKsefIQ==
X-Received: by 2002:aca:1e11:: with SMTP id m17mr4309603oic.104.1626921854077; 
 Wed, 21 Jul 2021 19:44:14 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Wed, 21 Jul 2021 19:42:25 -0700
Message-Id: <20210722024227.3313096-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/5] drm/msm/dp: Refactor ioremap wrapper
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In order to deal with multiple memory ranges in the following commit
change the ioremap wrapper to not poke directly into the dss_io_data
struct.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 28 ++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index c064ced78278..e68dacef547c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -19,39 +19,39 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 	},
 };
 
-static int msm_dss_ioremap(struct platform_device *pdev,
-				struct dss_io_data *io_data)
+static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res = NULL;
+	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
 	if (!res) {
 		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
 			__builtin_return_address(0), __func__);
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
-	io_data->len = (u32)resource_size(res);
-	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
-	if (!io_data->base) {
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (!base) {
 		DRM_ERROR("%pS->%s: ioremap failed\n",
 			__builtin_return_address(0), __func__);
-		return -EIO;
+		return ERR_PTR(-EIO);
 	}
 
-	return 0;
+	*len = resource_size(res);
+	return base;
 }
 
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
-	int rc = 0;
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
+	struct dss_io_data *dss = &io->dp_controller;
 
-	rc = msm_dss_ioremap(pdev, &io->dp_controller);
-	if (rc) {
-		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
-		return rc;
+	dss->base = dp_ioremap(pdev, 0, &dss->len);
+	if (IS_ERR(dss->base)) {
+		DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
+		return PTR_ERR(dss->base);
 	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..dc62e70b1640 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -26,7 +26,7 @@ enum dp_pm_type {
 };
 
 struct dss_io_data {
-	u32 len;
+	size_t len;
 	void __iomem *base;
 };
 
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
