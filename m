Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC9616BA5
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663B710E53A;
	Wed,  2 Nov 2022 18:07:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E62310E53A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:13 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g12so29557683lfh.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=i3xbLMfpo4u/j3vNZgefupyMkFAAbJ96c/pOf24fBNy7HrB/ysVdgzBAXPVzzHlx9j
 P+5miB9oSd646vEYdznGFwq4V/Tp/sSlSu1Wce/hZOWOzyI+WMsLAPAIXEgjZyItq1sV
 4Dl2jrhU1whajHLdxFLsBIF9nJI21BLhUqh14i9PNDrYXT+/OCgE9OU6jj1jsiI8osXh
 b9oCInof8Ky9g0oy3MtJ1FWowD8Yh2yKyz72kFLkcOCO0vSmmElhraj3Pi9bN8f5obSk
 AEccIEkuCF0+WjoIqE26i7p8WsgF+w+Lhs4nGpM5RJ/atOlrW2yXtYlOwPfZSf0JA95N
 QirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=sXnhpTE0U9MGbv6qq0HixsWjI7Cu84b+k45CC6OLHjQ2YCtHpRz8+mFy7Gl/0Q+4B8
 X2npghwyvi8V4WNLdJ4a5bELC5kSNkZcDea3EJhslugJoqwMnrVTWhhP2ER7B7Ydv2Ja
 E8++NUGvxtdUuwadPVKBn6V22D1U7ZCZboTki0Kqstc2OzGWvgiHYag+pP6TNS4gCajF
 yxhRNswOwcWdSwWOO0D+yzASRXbbvN60t71I7oxw1JkJnY9sj96F5z5e+sKQngiqEY7d
 WQgB0KwEk5RSnmE6AW5oMJWEDcoE4KtafDGGPIL+qcuCDvyhTi91VIWbJ2vSdh3NUF/2
 H4KA==
X-Gm-Message-State: ACrzQf1JVGSCc/kUorWOQy2lvLT2MfhmYaEulSk7AsOpzDHaYJqvuWMk
 ittpTy5daHXOZwLOEgbYBJ6pAQ==
X-Google-Smtp-Source: AMsMyM7/ORTdXneoE6DaN9PIj1JPI/RyzxtgQE2m3Ivv/Jm4Eq/tj5/cUKwkaFcOmUugbOJSqvxr9A==
X-Received: by 2002:a05:6512:1156:b0:4a2:7e73:1f28 with SMTP id
 m22-20020a056512115600b004a27e731f28mr10847502lfg.38.1667412431525; 
 Wed, 02 Nov 2022 11:07:11 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
Date: Wed,  2 Nov 2022 21:07:05 +0300
Message-Id: <20221102180705.459294-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 7/7] drm/bridge_connector: drop
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
Rename our internal helpers to remove the underscore prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 33 ++++----------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0e13bc87a6ac..19ae4a177ac3 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,19 +128,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
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
-static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -151,20 +139,7 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
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
-static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -313,8 +288,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
-	.enable_hpd = _drm_bridge_connector_enable_hpd,
-	.disable_hpd = _drm_bridge_connector_disable_hpd,
+	.enable_hpd = drm_bridge_connector_enable_hpd,
+	.disable_hpd = drm_bridge_connector_disable_hpd,
 };
 
 /* -----------------------------------------------------------------------------
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

