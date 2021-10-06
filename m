Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C729A42470C
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3F6EE50;
	Wed,  6 Oct 2021 19:38:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027E6EE48
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:44 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t11so2315265plq.11
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=147voWq3MMP+9e/FHlW9BwNDYVhXK+csyUVXCf2NteA=;
 b=lXMvuiMq8hDBS+eQ9IBiLv4iJuQR01YqW14KeFdv2SXgBytisZYGSvdJDOtKmAOvN6
 zHGcrOtWZJy2OF3sYPzw+EE113RKOnEEyhsFPAbJblehfwZ7X9lzddUqnE2biPWpGR3Y
 JaN+hKpdBTRkKMHUEyzFFh8LnkjEnkRDrdvSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=147voWq3MMP+9e/FHlW9BwNDYVhXK+csyUVXCf2NteA=;
 b=DpQmXQmiehAdf981JCdlxudqyxxzUTaCeUDdh0yuOqGpFG1dKVTejJdFvhtZDfyx6c
 6W5bnuNVHk+AAV6s8ALucmo/I4/TEDyAPiq1W4md/oCVhyZ7peZF+FAjLLO84G62JMd4
 CNpUnaUS+OJ+UqHfj+tRMcEN37uqmeRMWL4x3nAmXAM2ruNYP1W7MQZKE5A43qjyXDcP
 9pfpL8BBiuLq9f1p+0xhMijt7foPvJ+fzSJ2xPQANWCCEVI/eQE3dTfAXcYS7Wuw1eLj
 9ViM/2XgJOVhjpN0lXhuUHKe3xfS9mVFEwFZWKTfvtwlxTD5lWPxHLEcguKRS4w9G2vX
 u4VA==
X-Gm-Message-State: AOAM532NpEYuiBtvYgizqRe8MRvawirqcTZ4aZHHKCB/FnsSorgRbG0K
 fAe1oQ1jKQShr3y/D23rzv5IgA==
X-Google-Smtp-Source: ABdhPJxU4hwt50HoqlK3Qoo92SCidVgpLN3jBErzx1B92cxFcVEuvHUakr3eWkXCfblXgZvg0cGXVA==
X-Received: by 2002:a17:902:9a06:b0:13c:86d8:ce0b with SMTP id
 v6-20020a1709029a0600b0013c86d8ce0bmr12674304plp.51.1633549120413; 
 Wed, 06 Oct 2021 12:38:40 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:40 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:38:00 -0700
Message-Id: <20211006193819.2654854-16-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 15/34] drm/ingenic: Migrate to aggregate
 driver
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

TODO: Move the helpers to PM in aggregate driver hooks.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24 +++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..058b7bfe5610 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int ingenic_drm_bind_with_components(struct device *dev)
+static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return ingenic_drm_bind(dev, true);
 }
 
@@ -1174,9 +1176,19 @@ static void ingenic_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(&priv->drm);
 }
 
-static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind_with_components,
-	.unbind = ingenic_drm_unbind,
+static void ingenic_aggregate_remove(struct aggregate_device *adev)
+{
+	struct device *dev = adev->parent;
+	ingenic_drm_unbind(dev);
+}
+
+static struct aggregate_driver ingenic_aggregate_driver = {
+	.probe = ingenic_drm_bind_with_components,
+	.remove = ingenic_aggregate_remove,
+	.driver = {
+		.name = "ingenic_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -1196,7 +1208,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
 
-	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+	return component_aggregate_register(dev, &ingenic_aggregate_driver, match);
 }
 
 static int ingenic_drm_remove(struct platform_device *pdev)
@@ -1206,7 +1218,7 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		ingenic_drm_unbind(dev);
 	else
-		component_master_del(dev, &ingenic_master_ops);
+		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

