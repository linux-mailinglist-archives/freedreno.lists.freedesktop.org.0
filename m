Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5087D77EE
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 00:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4693710E729;
	Wed, 25 Oct 2023 22:30:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A65B10E5F6
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 22:30:35 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c518a1d83fso3767701fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698273033; x=1698877833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbnyjLnhACt82EK09moKdpQ9JIR1p/S627vZZk1uJi8=;
 b=JCnkb60PHTUedOK1fQpdiB1VBcbEKoqWYGw/TGRSAjcgiaz4tx9T+p4LLXZDEKx876
 WcrgrZH1pC7ODeqEjTAYNy7h/5vng5pMObDdKLU6qxuufR0xD2dbclsyEGuhMNDwsR+d
 eg6t7AphqjADNAEfo3Z5T0RFTH8KCUpz7ytAxxaU9scv6Quxru+SMxMD7PCX2w7UTccl
 wmHMclNPaojIgFpmJyPPqr87sdf7Xp4a7VZykvyhIzhvyhOHeXr+cu1MAyWVWySgLRbp
 9O0a3y+Gk/1agEbU9ZjjJkIs0qI2laJDZj1fTGIh+dDWdDujSZaSwa7+szrDnblbaOTE
 6TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698273033; x=1698877833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbnyjLnhACt82EK09moKdpQ9JIR1p/S627vZZk1uJi8=;
 b=kI6LiQrWC/wW2dneg4J9nT48t+ZFOo8otz/9bCPsDNFB0XHXfan7Sp3hCaUuqRNtCq
 0WkMOxTnCpEr2W92I9Pr0wsVN4rJAZVgu3zH7lFhw0D2quzMv+wjYzYHog/1+ImN4xfb
 CthdWpRFP3KGJk4xC9udfgDwRRiOoroeZNC5van7kZe89HUVqIZMhfJhmSFC+CjvxLW6
 LUHXv08GaeKhlEpiTSu/SQcK9UmO3CJKPKqHPOZOC/Ri7Z6JOSgF1N1hlhRgELxxP2/9
 p4rqKXokgzbHQbicfTKTZfh6dXwZ30CEusHw000e05Y53b7rKkyFfeEWp9O9fvbZo5Qc
 zDKQ==
X-Gm-Message-State: AOJu0Yx9qzQ62oRhe8QGzVYjPDwqfJ1bB5j0GKiH1wCFV0hZXNwzHQxN
 LbfzYLzupz7mXk06Ld+wGpWqeA==
X-Google-Smtp-Source: AGHT+IFWhzc+3EDDpKagjrjHAak0npWhtBP8vzIn+uXozbMGDzZu5lmHOwLkn2nxFFI8mllzQ6KfGw==
X-Received: by 2002:a2e:a690:0:b0:2bf:f670:36dc with SMTP id
 q16-20020a2ea690000000b002bff67036dcmr10000903lje.49.1698273033689; 
 Wed, 25 Oct 2023 15:30:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a36-20020a05651c212400b002bcbae4c21fsm2612543ljq.50.2023.10.25.15.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 15:30:33 -0700 (PDT)
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
Date: Thu, 26 Oct 2023 01:28:04 +0300
Message-ID: <20231025223027.943563-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 3/6] usb: typec: nb7vpq904m: switch to
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
index 65da61150ba7..07395161dd30 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -40,7 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
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
2.42.0

