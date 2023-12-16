Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE0815D13
	for <lists+freedreno@lfdr.de>; Sun, 17 Dec 2023 02:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1EC10E3CD;
	Sun, 17 Dec 2023 01:04:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089910E3CD
 for <freedreno@lists.freedesktop.org>; Sun, 17 Dec 2023 01:04:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so23763735e9.2
 for <freedreno@lists.freedesktop.org>; Sat, 16 Dec 2023 17:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702775004; x=1703379804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
 b=ehTZvUS9VVCDxBdbbaCCIkinUj8Naxov4j+Spj58JQ7AYjZ0Y7YZ+SOOniuuCWn9Co
 MZYxmDtLeGKzdgagZWkKbuC9RGyOY7x/JD1Y4/1gGQNiI0+fhpYjbzqhdUWqzcCqeRMx
 hSKZzGCFp8tOLSPWTQyYt18y8sujUJ12oGr/tfsTFzoTJysr01ZZn5oZi/JKbpgnQu58
 leQhxn28VR429F5Ytgc48tJ3VzvMbFnuguaySMHo7kIiAoGIBcUXYwpfz9kc0bTCR69X
 ii7PTlr7WFNRL3qCL+VA7XMAGqZRGDh20wMmHU2AYiq1Ijnv+maMy5pNj6ASxfkEEzAW
 Cacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702775004; x=1703379804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
 b=Ja4J+h/ZTXqSVpqk4x8UDRgoWTUbO7xgaTyY7+FwIMXjC+rLla7Dr0qRmBiDxAkg/4
 k5G7lcRr34zQBfYtq5hc2QojZqv1UX6j0LMtOmCSQHA4IqJ1lOe6J2Pzg+H3uC3srga9
 +DeqmBl4C5H/oNMeUUg6OWbHi7sFxxJ6AVpmcWpZnk9XgK6BZZNZJbBhpvBvH201JYuo
 xTxG0TQ6jjnFEFlXhQOSOVgE9xbpfxwcLJ5WvYtx/PoU1H9nY69vzWnCq9k0xRbUzIP3
 8Se53GbAkyAvcxNPrIn4ft/f6n6Fru1AsrBp4meJzZxX1aRKXFkiz3pGMqlixFwWqCvm
 2fqg==
X-Gm-Message-State: AOJu0Yzn9jBb0y8edx2R5F4BkzlYxHxA0FjnKTnB6KeaPEVeC/Rn7o/I
 zpGk4NnjZVjpamgxnw8yBlF4BeJ2aW3CAGobllo=
X-Google-Smtp-Source: AGHT+IEnQkmrsNJ9hVsfbCKkIsEeu+nZ5bTu4VgzAc0L6WjUXz9o6uCxqdywfG2uf/4EhzNmoYDb+Q==
X-Received: by 2002:a05:6512:ba8:b0:50c:d30:3a05 with SMTP id
 b40-20020a0565120ba800b0050c0d303a05mr8894366lfv.25.1702771152155; 
 Sat, 16 Dec 2023 15:59:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v11-20020ac2592b000000b0050bfda10057sm2506647lfi.85.2023.12.16.15.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 15:59:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bridge: properly refcount DT nodes in aux bridge drivers
Date: Sun, 17 Dec 2023 01:59:10 +0200
Message-Id: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The aux-bridge and aux-hpd-bridge drivers didn't call of_node_get() on
the device nodes further used for dev->of_node and platform data. When
bridge devices are released, the reference counts are decreased,
resulting in refcount underflow / use-after-free warnings. Get
corresponding refcounts during AUX bridge allocation.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")
Fixes: 26f4bac3d884 ("drm/bridge: aux-hpd: Replace of_device.h with explicit include")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c     | 2 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 49d7c2ab1ecc..54d721db0ea6 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -57,7 +57,7 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->id = ret;
 	adev->name = "aux_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_bridge_release;
 
 	ret = auxiliary_device_init(adev);
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 1999a053d59b..bb55f697a181 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -68,9 +68,9 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	adev->id = ret;
 	adev->name = "dp_hpd_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_hpd_bridge_release;
-	adev->dev.platform_data = np;
+	adev->dev.platform_data = of_node_get(np);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
-- 
2.39.2

