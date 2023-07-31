Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82F768E01
	for <lists+freedreno@lfdr.de>; Mon, 31 Jul 2023 09:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9CD10E1B8;
	Mon, 31 Jul 2023 07:19:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA710E1B9
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jul 2023 07:19:36 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9ab1725bbso61385591fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jul 2023 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690787974; x=1691392774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aArr+Z0OOAMh7dLqu6+G5gaqEsgGaXff5br4Ze76jN4=;
 b=QVfPUkFINU++0UtYQJu+LcaKoI23bnJHqonbs2+f9RPgXDiPa2zZCxyyDWMiOK8XgS
 eV3HuY1x2nwBsf/f4MyS7RR/aX5eQivolz3unvkSfM6vN6eQhkaDpIo3nJoGzU3rq9BY
 IAsS2den+Mma8f35wxGnjHUsh+XyUGhKEux0QNLCU8WuHyyto4x9dcxQ6HqqjSLMVjJ+
 w+SPpUpfYROjzjMpsfoyOml3VkL2CN0SnejVxK1uZrMNQWpTi3Eg7IHyPF70Xcqm7qjo
 6sokl3IVWRLwc7dPuowSPknTT6N6q0wE/ju/beFOVOUvxdGZuhwKm9yUVvEoe7juBWY8
 gKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787974; x=1691392774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aArr+Z0OOAMh7dLqu6+G5gaqEsgGaXff5br4Ze76jN4=;
 b=YpTCrjDT3AG9qypVfvhZLbx0YS3MI/47KvpdELCt0rQEHRL0Gucv7OMT4FGKqGrGq2
 1Fj+3Twt1EByFddQNve6aaCF1asbTIxOXjGmAnkBxm6wib2eRC/GfSZ57+8NBvDKlNfW
 o33gXFf1jhNyxb56ofjbgXA6kFRh2sgeZ7aimP/W0JrU6+38o4q4LHsPvTy2pBJO5hdm
 mEUMi7rQO7jp7UlBBjVpuC/9HO/r00KZAP+02TfYIFLZ6Us+/4XNZinxK1x3XkqIlt1W
 9jGK+azBOpOl0IcTH7ItblZqRuA5bHYJULsOOZ8LCAkPSH1pM2P33SlmpKl38Ys3ooY/
 fFVw==
X-Gm-Message-State: ABy/qLYAbmypuvfuDYax+oHbMARoGPxj0Bj8wI/J2PSl7J6sTL7jsGFJ
 t9UTDCnyhoFEgttoNTyqHlSuFw==
X-Google-Smtp-Source: APBJJlHIL09yD+cpaKj4AkcHas75MqVJTUzMeOhlJXyOtc3pfudP9xHd2NG0vOKt1b+I26sAEFyLGg==
X-Received: by 2002:a2e:9d96:0:b0:2b9:e6a0:5c3a with SMTP id
 c22-20020a2e9d96000000b002b9e6a05c3amr1494502ljj.48.1690787974573; 
 Mon, 31 Jul 2023 00:19:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a2ea1c4000000b002b71c128ea0sm2413267ljm.117.2023.07.31.00.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:19:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Jul 2023 10:19:30 +0300
Message-Id: <20230731071930.3928150-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
References: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] usb: typec: nb7vpq904m: switch to
 DRM_SIMPLE_BRIDGE
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

Switch to using the new DRM_SIMPLE_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/mux/Kconfig      |  2 +-
 drivers/usb/typec/mux/nb7vpq904m.c | 44 ++----------------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 784b9d8107e9..350a7ffce67e 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -39,7 +39,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_SIMPLE_BRIDGE if DRM
 	select REGMAP_I2C
 	help
 	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index 9360b65e8b06..c89a956412ea 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -11,7 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/bitfield.h>
 #include <linux/of_graph.h>
-#include <drm/drm_bridge.h>
+#include <drm/display/drm_simple_bridge.h>
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
+	ret = drm_simple_bridge_register(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.2

