Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8443A8D6
	for <lists+freedreno@lfdr.de>; Tue, 26 Oct 2021 02:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE826E21A;
	Tue, 26 Oct 2021 00:01:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699F6E1CE
 for <freedreno@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:09 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id m14so12477990pfc.9
 for <freedreno@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f0lZGXHwPviChh1qGaLbcibaQ5KdksPeQeI4kBQa+kk=;
 b=H1hzoo7ApLY0uMJvD00N9D1TGkRyxQQ2zPFTrbqzvm8Eh/4pc2vK5MtOBBHuUiowY3
 FUAbCmmBwO/f39RptBMJ90w2W/Hxa7CwARCNSixhMIVaqZneEzwoxDPEsSKm60jgebE/
 88LkkD2FeU5dXvxGZ6jRrAgs61cTlNQgZ4l5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f0lZGXHwPviChh1qGaLbcibaQ5KdksPeQeI4kBQa+kk=;
 b=Rl9bVW1BClNC8pW5ESQRcN7+BkxoIcSNT//nRUJ5Ar1wVSISTkTY8RkpWwUgx7bnMH
 IhsDTcnxwTVSt3K4sfawocuHKS5NRej224WhUCfVKmToCVTaAsvSCS1se4W0qDyUZhqZ
 M62+xmXwh6RPWaYzJH0rnxHsP8zVx+jKNKSqzX3s42dUViMDWmz/0/TfeP42lrYp50ig
 /ZMidi6MSc8J92nAmhpSjqC+MW31R5+XF5CDkHopQZuJ/vR1S9brVJX0LboL0pPd7oip
 3sy2P9iHMJKaKeEVWYKAaAkuyFoww6erTi1Sjk4x+zEfRCDvr2IPM4fV21hiOV8Fkx0T
 HCpA==
X-Gm-Message-State: AOAM531cxJQvst97WaHNTOW9jmBY9gVek7ygoL3gB1A7jAiX+LBzTCMr
 vRzfutwgwNsa8LDBOtfQSOSLrg==
X-Google-Smtp-Source: ABdhPJySWIfJQrLHwMhEKOAC23jQDBBrH50fS/ffZdqecqKnpwMKv5rrTlHjX5ghquxMmxRGkY4QIw==
X-Received: by 2002:a05:6a00:1950:b0:44d:9402:3396 with SMTP id
 s16-20020a056a00195000b0044d94023396mr22065351pfk.70.1635206468897; 
 Mon, 25 Oct 2021 17:01:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:08 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Oct 2021 17:00:36 -0700
Message-Id: <20211026000044.885195-27-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 26/34] drm/zte: Migrate to aggregate driver
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/zte/zx_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index 064056503ebb..b46f677ea51d 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -45,8 +45,9 @@ static const struct drm_driver zx_drm_driver = {
 	.minor = 0,
 };
 
-static int zx_drm_bind(struct device *dev)
+static int zx_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	int ret;
 
@@ -97,8 +98,9 @@ static int zx_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void zx_drm_unbind(struct device *dev)
+static void zx_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -110,9 +112,13 @@ static void zx_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops zx_drm_master_ops = {
-	.bind = zx_drm_bind,
-	.unbind = zx_drm_unbind,
+static struct aggregate_driver zx_aggregate_driver = {
+	.probe = zx_drm_bind,
+	.remove = zx_drm_unbind,
+	.driver = {
+		.name = "zx_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -135,12 +141,12 @@ static int zx_drm_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(parent, child)
 		component_match_add(dev, &match, compare_of, child);
 
-	return component_master_add_with_match(dev, &zx_drm_master_ops, match);
+	return component_aggregate_register(dev, &zx_aggregate_driver, match);
 }
 
 static int zx_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &zx_drm_master_ops);
+	component_aggregate_unregister(&pdev->dev, &zx_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

