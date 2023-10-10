Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2AF7C4549
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 01:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9E10E3FE;
	Tue, 10 Oct 2023 23:10:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18E10E3F9
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 23:10:23 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c1854bebf5so78582781fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696979421; x=1697584221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49WEzE515I0ANoTjoSbionG+bBv7CT3FewEilKjLPnE=;
 b=UZ4dtdms+aLmPvYVAa0oA5k/18FseZ7Hx6xrYHzeMijkfc0TY8GTblokryRDWjaBRh
 lhol8gA+tUfJipGm3Excz1OalHqEzuDCLJzQnTOcdG7rXpdt8Utte6eRtH1TCZ8ZA1xg
 vIJA1TguMGZuXr/3YP4w2G+g5dMHxJR0hsKoDPYCfrl7YyRh+sXFSscxCdLk8W2dp/Yk
 9C8c+9ELlBI/7u6gMeNoxAnICtXl0QEzyxkEHW9XT8G1vHi0GFbhNPhWX88bvoxVjaxf
 cF2gvV3tcMGsT2JjttTTCEex/hhUn4te0GMhBgi6fqc70lKq6AvNBKuG84I7cJS42v4m
 HhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696979421; x=1697584221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49WEzE515I0ANoTjoSbionG+bBv7CT3FewEilKjLPnE=;
 b=xE+pF8HVlGK1F1tYK6A+0G3OYxoHKusYtiE8HUn0m7QWJcvN8we4DD94RMesMi/STA
 7FEvuoQLJt4RwF0wXq95viQ1sQsRpOgKiVk66LFJWb5gRuY2BZ5Yysi7SWwx+G0X414j
 pVjLwHyqbtmPkknKOo0YBJC8jfgxO4OIsp5ybL/6KAiMNyoA0GxMOwk5BtVixYyT1+HX
 FFscxQDtDe2sc4HFN2AHOBe0UNR/AN8nVGZPvj9ioNX8VVPl+4JUywL23Esqc4jHZLZf
 XoPNpTVPr+tdRo6QPy/4OL5243PEs9Dzo9cjVxicsl3Atkh5vdXi/+2V/tae4UyDZJ+j
 qMLw==
X-Gm-Message-State: AOJu0YyVoElLIzt+DOs47dXBbqfjE56hastT9sNcpl3xCAz1speULcN3
 7i7m3qbkRmNPGeNJUyFf/U+0NQ==
X-Google-Smtp-Source: AGHT+IEeMkOBEiq/19mlTNwNy0qSaJ3+e5Jvi/f+FUh7VZXrQt0MUNxA9fSUrdZfzwjsmjqJV3wR7g==
X-Received: by 2002:a2e:2c1a:0:b0:2bc:e470:1405 with SMTP id
 s26-20020a2e2c1a000000b002bce4701405mr15249986ljs.46.1696979421717; 
 Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 11 Oct 2023 02:10:18 +0300
Message-Id: <20231010231018.77381-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
References: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 3/3] usb: typec: nb7vpq904m: switch to
 DRM_AUX_BRIDGE
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch to using the new DRM_AUX_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/mux/Kconfig      |  2 +-
 drivers/usb/typec/mux/nb7vpq904m.c | 44 ++----------------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 65da61150ba7..e3fee531548f 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -40,7 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_AUX_BRIDGE if DRM && OF
 	select REGMAP_I2C
 	help
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index cda206cf0c38..b17826713753 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -11,7 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/bitfield.h>
 #include <linux/of_graph.h>
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
@@ -70,8 +70,6 @@ struct nb7vpq904m {
 	bool swap_data_lanes;
 	struct typec_switch *typec_switch;
 
-	struct drm_bridge bridge;
-
 	struct mutex lock; /* protect non-concurrent retimer & switch */
 
 	enum typec_orientation orientation;
@@ -297,44 +295,6 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
-static int nb7vpq904m_bridge_attach(struct drm_bridge *bridge,
-				    enum drm_bridge_attach_flags flags)
-{
-	struct nb7vpq904m *nb7 = container_of(bridge, struct nb7vpq904m, bridge);
-	struct drm_bridge *next_bridge;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	next_bridge = devm_drm_of_get_bridge(&nb7->client->dev, nb7->client->dev.of_node, 0, 0);
-	if (IS_ERR(next_bridge)) {
-		dev_err(&nb7->client->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
-		return PTR_ERR(next_bridge);
-	}
-
-	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
-				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-}
-
-static const struct drm_bridge_funcs nb7vpq904m_bridge_funcs = {
-	.attach	= nb7vpq904m_bridge_attach,
-};
-
-static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
-{
-	nb7->bridge.funcs = &nb7vpq904m_bridge_funcs;
-	nb7->bridge.of_node = nb7->client->dev.of_node;
-
-	return devm_drm_bridge_add(&nb7->client->dev, &nb7->bridge);
-}
-#else
-static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
-{
-	return 0;
-}
-#endif
-
 static const struct regmap_config nb7_regmap = {
 	.max_register = 0x1f,
 	.reg_bits = 8,
@@ -461,7 +421,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
 
 	gpiod_set_value(nb7->enable_gpio, 1);
 
-	ret = nb7vpq904m_register_bridge(nb7);
+	ret = drm_aux_bridge_register(dev);
 	if (ret)
 		goto err_disable_gpio;
 
-- 
2.39.2

