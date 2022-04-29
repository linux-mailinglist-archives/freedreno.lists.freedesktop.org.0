Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9E515411
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 20:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C7910F115;
	Fri, 29 Apr 2022 18:52:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9410F128
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w19so15574110lfu.11
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
 b=qM8Xa/+knMRPfLTwlN+fR5Ci35dl6BlRHNoNMYX0hVxDfbUjon+grBnYTYSLc3wpKT
 x4zV6cHCKHtbc51lv2Ah2HUBs9k2H86hvUof04MJ+L1RWBgmtKiX1u9XICgIb4T3AWaJ
 m4FUPRzbY7leMHH75zT6l4BjTs5XX2FRI5CUANIwhQ7zdCt+NFhKOGFTpqUu6dfyHv6E
 E4XiPnOg22O0wCoqh1noIhgC01FYKxIVgoGqmFMWCxjXFP/2gHCiaRjXcYzL5MMYMF4x
 ymA6+KoQHsW5hk1e2FGsMk1QRstd2BiHSgXf9rG9TiNHEwN6aK1f8PzkltynBJS2R4sG
 ms2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
 b=6vq16o+7R4Qh4TfmxUAetdvnTB21bcTwqyA0cHKCY5iRJhGBTegRfQXFude/gyKFVv
 6tPI1tzLN7YWLmbEDWmSz8/AzWehXGBe1FtQzJ51EEzOvi5Wa8Ztp8KX+zoDxfwqq1ps
 3PITlywDCwY9trdihwYCkzVsgkmArpnz4G8HAlvJquZfGPQJZS6O3PRg7kKlvWXJW+Tg
 rHnCeXW5BMS/wIXJ6fPMB8QZ7oEZQwqBQhQ04W8mK1PUIB2qMMcV0uzQh2MfxurcITti
 sj5iJrCyW6+WapUIE6i0zLhJBDFCHmZitaU8pdFEXJHLI1nyIwBbuNRn0Qir7mk22pbR
 752g==
X-Gm-Message-State: AOAM532wVXOcFjZsIVvDGzRM7jp6LVjJ+x7PM5M3XAVdyS6/HOdbtar0
 UaCWVjNUFy1yASIEOh0JV4G25w==
X-Google-Smtp-Source: ABdhPJxDM1J9ZFOYujHwlnlADYTDFV6bTMCQTzicA80l40xvHlgv3/pXMH1AjfPq7g134d5qn59tqw==
X-Received: by 2002:ac2:52b4:0:b0:445:ba75:7513 with SMTP id
 r20-20020ac252b4000000b00445ba757513mr442866lfm.248.1651258326717; 
 Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Date: Fri, 29 Apr 2022 21:51:57 +0300
Message-Id: <20220429185157.3673633-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 7/7] drm/bridge_connector: drop
 drm_bridge_connector_en/disable_hpd()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() it is safe to remove them complelely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 25 -------------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1592da3b9403..d9c1f61b6fb6 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,18 +128,6 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
-/**
- * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
- * @connector: The DRM bridge connector
- *
- * This function enables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their resume handler.
- */
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
-
 static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -151,19 +139,6 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 				      bridge_connector);
 }
 
-/**
- * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
- * connector
- * @connector: The DRM bridge connector
- *
- * This function disables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their suspend handler.
- */
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
-
 static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 33f6c3bbdb4a..69630815fb09 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -10,8 +10,6 @@ struct drm_connector;
 struct drm_device;
 struct drm_encoder;
 
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector);
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector);
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
 
-- 
2.35.1

