Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D27BE8E0
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0110E2A2;
	Mon,  9 Oct 2023 18:10:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FCA10E29B
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-503065c4b25so6395249e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875043; x=1697479843; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yo+Tbv6d2nOKlw4PvFCcvYipnGPPT636i5Xxfkjy52M=;
 b=R3mdqjLOtjdIpD3p2jQMYdtcAv6uQzW1PB/g/Zc9XZneW1xqmwTtkqmgaSPqPMnLnl
 JWVJU4uNK4vgKBGhIS07t7O5tIWq7yAazxR8nZaVqLljMYxbuE/X3erLvA/pU8mqztpc
 L1Lpy4FWR4RFf+r+JZL2gwG1qLhtMLrDcMDftsidbL07whKSAoE1b3XbluEneP5eFO79
 hh461uojG5MljZIldJHqPfO0xyM5XlJsI5X0McCxSXKviz0mHksK1E5x2Epl5fzmaUZ6
 l8gu/a7haZ5kje3g3WKqEE/kTzINIH3f6p53Snb0oPl+p6CD1b0OlNy1OHp2cRzHr0BS
 k2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875043; x=1697479843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yo+Tbv6d2nOKlw4PvFCcvYipnGPPT636i5Xxfkjy52M=;
 b=OKqDoPsATdF7SFCaSHeexlv+oHZEfGwB0sH7BrFZXjlDo4h+5yFG7Dk8CMQPuYpmcG
 b7AhqY9t1o72KfOJ+v+huOXvC/0llmI8BE8OyS+rkA7kBO69MX6es9scEDTl76eXi2G4
 aPFZ0wtD6jMRkgGyIqal9sr2PpUAAXk5YJ1c0J5JBz7oJfJXPvsFjtX/IqFXdL1ebj2A
 ZehHZu8bsKsAY3G/UK64Cph+7I12g2AYrviCPF8/RBFKTTe1V+d1H83FKcoG/uAxjwuk
 uMDQVAusCZJAj5Kx+bbg2nZ+wXElZ+MqZ44Tft6EkN319iGDgyPn5HI2chO5crHdypon
 QZUw==
X-Gm-Message-State: AOJu0YyPalgJ8sjtuHMpAclkXXloNy1+Z+6OkIp0ie+2hqheSaiWt69R
 Wutf0cJR2HCZOvzpo56L0gSe5Q==
X-Google-Smtp-Source: AGHT+IHsYTLLv3pichduCcVZyIWn3Q1VgNaZPfT4kj4iFfTQQ8zYXhA2XAxOTBNnfnHE7bN2hq4bAA==
X-Received: by 2002:a19:a414:0:b0:503:ed:8616 with SMTP id
 q20-20020a19a414000000b0050300ed8616mr11682247lfc.59.1696875043563; 
 Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:29 +0300
Message-Id: <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/13] drm/msm/hdmi: switch to
 devm_drm_bridge_add()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
 4 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b6bcb9f675fe..c8ebd75176bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		struct drm_device *dev, struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
 	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
 
-	hdmi->bridge = msm_hdmi_bridge_init(hdmi);
-	if (IS_ERR(hdmi->bridge)) {
-		ret = PTR_ERR(hdmi->bridge);
+	ret = msm_hdmi_bridge_init(hdmi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
-		hdmi->bridge = NULL;
 		goto fail;
 	}
 
@@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-
 	return 0;
 
 fail:
-	/* bridge is normally destroyed by drm: */
-	if (hdmi->bridge) {
-		msm_hdmi_bridge_destroy(hdmi->bridge);
-		hdmi->bridge = NULL;
-	}
 	if (hdmi->connector) {
 		hdmi->connector->funcs->destroy(hdmi->connector);
 		hdmi->connector = NULL;
@@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
+		if (priv->hdmi->bridge)
+			msm_hdmi_hpd_disable(priv->hdmi);
+
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e8dbee50637f..ec5786440391 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
  * hdmi bridge:
  */
 
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
+int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_disable(struct hdmi *hdmi);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed3..0b7a6a56677e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -11,14 +11,6 @@
 #include "msm_kms.h"
 #include "hdmi.h"
 
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
-	drm_bridge_remove(bridge);
-}
-
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
@@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 }
 
 /* initialize bridge */
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
+int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
 	struct drm_bridge *bridge = NULL;
 	struct hdmi_bridge *hdmi_bridge;
@@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 
 	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
 			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_bridge)
+		return -ENOMEM;
 
 	hdmi_bridge->hdmi = hdmi;
 	INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
@@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	hdmi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_hdmi_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b47989..9ce0ffa35417 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	return ret;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	int ret;
-- 
2.39.2

