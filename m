Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A053D1BE0
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 04:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731AB6EE97;
	Thu, 22 Jul 2021 02:44:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8E6EE94
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:13 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so4016611otl.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKV8hlv55ixpHr/xWlsCOYWKdqHbAXYcZUW9Pc8iaEA=;
 b=IzorDbfi4J0yK4IdHULCR9qAHRjagqRlo6FFdpjHS7e93tP4y2cMxhtOq10k2Q6UeG
 iKYKYCdOeywdHLcHZxMvShzyMfyfyQqGP3Sbz+p9+G9DdXGxhbaU/HrLQTx96yIkSv3J
 FCyf3M+5Pz9QjvPfcF1ty/BbOKehfRG5cqA4/8KISGEr1xVXTNUIt+1lAskvVEvH9rx/
 A83k/59flfuGg7xGbZtupKhEiYBu298i9zP6i/xhN1JDUpqh7F7tQ2kPuQlc9I6uaV9I
 i4lfLaUL5LRwClSPU52CW4ZfwQ5bVw9IMwbzfa7UG9rMyHbSw81rWdYbByjVixj7oq4D
 s4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKV8hlv55ixpHr/xWlsCOYWKdqHbAXYcZUW9Pc8iaEA=;
 b=eitcKufoPTwm5m0WL6XVkaO6903+1811+whe2a1EAwlaPWyrfkI9Sfs3EDHWR3WM81
 5tfRMZZeCqm0HzaqDtKRkbOhkxgyYqjNoXOJJsBrPKGTcFxRJfxmsNNge93PWRq/CT7/
 J/jV87+A+RFxQ2dsZSl0ti+oS5pXLEb+oe7yXUGAs8VQqkpnDYZtaiE6o60VaOlqn3At
 26wkQsQ6PmPEW8dtxrAthibvYqF2vb+9UeOjNppUVBPcFtI+QTHe8JIFo+lr5f2282Sk
 8b4NCimH9k+sKlLxg6ZUk54WMi5F8py05+QS+y9Rg55ja2gLGwmDdRrQAP3rtOCA/11N
 OQmg==
X-Gm-Message-State: AOAM5317PBL2uaQXy3Z5T2x+gUf4LbMtNzMrbCnTAoVNXxhJAAWad0oE
 0sxD8caDcU1abjvm8v1Z2GmiVA==
X-Google-Smtp-Source: ABdhPJzh1eqPt0fNok4t32PlvpdYBH5n9ebj7NHDBm2wEIBcrsZWeWlQRl5XwMN6ofEKXljlzL1Afw==
X-Received: by 2002:a05:6830:2786:: with SMTP id
 x6mr25286903otu.359.1626921852888; 
 Wed, 21 Jul 2021 19:44:12 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Wed, 21 Jul 2021 19:42:24 -0700
Message-Id: <20210722024227.3313096-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/5] drm/msm/dp: Use devres for ioremap()
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

The non-devres version of ioremap is used, which requires manual
cleanup. But the code paths leading here is mixed with other devres
users, so rely on this for ioremap as well to simplify the code.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..c064ced78278 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	}
 
 	io_data->len = (u32)resource_size(res);
-	io_data->base = ioremap(res->start, io_data->len);
+	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
 	if (!io_data->base) {
 		DRM_ERROR("%pS->%s: ioremap failed\n",
 			__builtin_return_address(0), __func__);
@@ -42,22 +42,6 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	return 0;
 }
 
-static void msm_dss_iounmap(struct dss_io_data *io_data)
-{
-	if (io_data->base) {
-		iounmap(io_data->base);
-		io_data->base = NULL;
-	}
-	io_data->len = 0;
-}
-
-static void dp_parser_unmap_io_resources(struct dp_parser *parser)
-{
-	struct dp_io *io = &parser->io;
-
-	msm_dss_iounmap(&io->dp_controller);
-}
-
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
 	int rc = 0;
@@ -67,19 +51,14 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	rc = msm_dss_ioremap(pdev, &io->dp_controller);
 	if (rc) {
 		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
-		goto err;
+		return rc;
 	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(io->phy)) {
-		rc = PTR_ERR(io->phy);
-		goto err;
-	}
+	if (IS_ERR(io->phy))
+		return PTR_ERR(io->phy);
 
 	return 0;
-err:
-	dp_parser_unmap_io_resources(parser);
-	return rc;
 }
 
 static int dp_parser_misc(struct dp_parser *parser)
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
