Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB749EBAE
	for <lists+freedreno@lfdr.de>; Thu, 27 Jan 2022 21:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98F10E2E5;
	Thu, 27 Jan 2022 20:02:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2110E223
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:13 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id e6so3785872pfc.7
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jvZVmrWmp26tHtV/xiUrxR2MIRDqBUgzND7wS5OXNzU=;
 b=Bu/x2wm+DigW2JkVo+zDM2QAK9Lh8Lzi7VQRjJWQQjpG5TztXs0H13hQM2D+/X1afo
 F/CZqb3T2TwiS2OBBiEi612vc8lapJ2aK7gIt8pyAQrdw+v+7we61eZhP/USER4FIKc2
 BG1pnFxhjATM9z47bzqsrsQz0U2Se0uYrH80Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jvZVmrWmp26tHtV/xiUrxR2MIRDqBUgzND7wS5OXNzU=;
 b=AMXLwPnwTTt6MouRZ2iw25Jz1MnLBVDtY+CpSduj+PgBr9wLBgu7//kbs49mS319Zg
 rrf4v7XMs98bhEK8KpJmL6Spyk1dv3yd1P1Sy3mEOyx7Xt7Y2z6f3fmU1sFfGpSMbiMW
 YuR0bo7SzYIQnAzm5hutuF2s01CynnUZduSzpFPV+Tct8evfNjG2z/c+hH69pNnjQo+/
 Lz71WMvdlbztSflpTVgD37yk5BcRCbkCj0eDis2VtrzCGjGRHJHHIFu6bJEZxK7Hu7cS
 Wf/qACCXMLvIxRpC6zTFz1L6GVDirsrlTghurCv6z45s/+e4r7x4SgxF9ZWJdQ9RxwVZ
 zuig==
X-Gm-Message-State: AOAM533EB6M58/Q5EnwO5Oke6/HxzqjjA1Ts1ASTuwj7/16iKbel4Rq7
 yHf00Fnkwl7mRHx4iRxTAnUZ6g==
X-Google-Smtp-Source: ABdhPJzgdo2xIvKWNBWJJ7FN2cYeL3DThlERus72aPFfW2Op1TpxXhf3bZPVZCrr2lRRpYJldojIjA==
X-Received: by 2002:a63:fb4a:: with SMTP id w10mr3821171pgj.615.1643313732918; 
 Thu, 27 Jan 2022 12:02:12 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:12 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 27 Jan 2022 12:01:20 -0800
Message-Id: <20220127200141.1295328-15-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 14/35] drm/imx: Migrate to aggregate driver
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index cb685fe2039b..82645e42b7d3 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -196,8 +196,9 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == np;
 }
 
-static int imx_drm_bind(struct device *dev)
+static int imx_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm;
 	int ret;
 
@@ -264,8 +265,9 @@ static int imx_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void imx_drm_unbind(struct device *dev)
+static void imx_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -279,14 +281,18 @@ static void imx_drm_unbind(struct device *dev)
 	dev_set_drvdata(dev, NULL);
 }
 
-static const struct component_master_ops imx_drm_ops = {
-	.bind = imx_drm_bind,
-	.unbind = imx_drm_unbind,
+static struct aggregate_driver imx_drm_aggregate_driver = {
+	.probe = imx_drm_bind,
+	.remove = imx_drm_unbind,
+	.driver = {
+		.name = "imx_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int imx_drm_platform_probe(struct platform_device *pdev)
 {
-	int ret = drm_of_component_probe(&pdev->dev, compare_of, &imx_drm_ops);
+	int ret = drm_of_aggregate_probe(&pdev->dev, compare_of, &imx_drm_aggregate_driver);
 
 	if (!ret)
 		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -296,7 +302,7 @@ static int imx_drm_platform_probe(struct platform_device *pdev)
 
 static int imx_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &imx_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &imx_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

