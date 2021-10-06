Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE46424704
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70CB6EE47;
	Wed,  6 Oct 2021 19:38:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C3F6EE35
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:39 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y5so2377231pll.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbBIA2S7VMXOXCQu3Vr82oQpSXn2i51a0ZJRtaPISIs=;
 b=aN0RTzaXUPCNk+Z7SmH6pe2SeEIbUotZp5TdFO7V2VWXGU+0KZwohqj38kjI+GFn/K
 YXnd/NSMifjTnUK1IgGt/GE7okNm9POSZPSVKn2omkO8WH8sRHi8/rZVhF6IQ6Uz/EQ6
 KNWrvLKUIPlxYo2xiow1LG1hapUFvaPz6OEZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xbBIA2S7VMXOXCQu3Vr82oQpSXn2i51a0ZJRtaPISIs=;
 b=pteCkyxdaSzUHzaU3ghLAjvSihnxVG/ykOPl/HHrHYsjfG/0L0QDLpfCKS6pR66/ue
 7rG6nWvQJbbzVEMZOAZGv0JRCNzS9Umj/H+H0blN45/RBclfXyKB6fo/FKoSW3i1uubr
 dwwFumix86BIcn0pvNohOSzjAgRW0q+qjK51uQ1fuVvTSPTaOcqFmHmfr0Zljm9d9wCZ
 bpyRw4amXeYP3Ov9cn9R2oK8MlGhkTh2pmFK4Xs2snknUioJsvHixngOwUITGIc8lbFS
 V2865B5gUN36rfduCwK2XmBiU3vjmMgVsHuHuVWsNCaBrmSdyAyBbTcAeTp+ji9Hf5l0
 QFCw==
X-Gm-Message-State: AOAM530+6pWlaGU0/lqNj6zVaUrKw+zZHp+mKZSu3HzRH5cCeuPF5djT
 mZPbEXLAnLY2z1C+89piZcOp9w==
X-Google-Smtp-Source: ABdhPJw+gb0O8hLaQn2OkipXTFOr/jVxqa6vjQTWqWuW/U/h57JvAGWQEu5RxusKdo9t0nSMvN+smw==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr631875pjr.83.1633549119266; 
 Wed, 06 Oct 2021 12:38:39 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:38 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:37:59 -0700
Message-Id: <20211006193819.2654854-15-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 14/34] drm/imx: Migrate to aggregate driver
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
index 9558e9e1b431..dbf5cca5201d 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -198,8 +198,9 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == np;
 }
 
-static int imx_drm_bind(struct device *dev)
+static int imx_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	int ret;
 
@@ -266,8 +267,9 @@ static int imx_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void imx_drm_unbind(struct device *dev)
+static void imx_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -281,14 +283,18 @@ static void imx_drm_unbind(struct device *dev)
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
@@ -298,7 +304,7 @@ static int imx_drm_platform_probe(struct platform_device *pdev)
 
 static int imx_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &imx_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &imx_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

