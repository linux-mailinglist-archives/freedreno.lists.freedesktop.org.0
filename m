Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8499660AF3B
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82710E8A4;
	Mon, 24 Oct 2022 15:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E3510E87B
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:35 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g7so17374308lfv.5
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=hS5i8UZBkR/cWj7VdSCfhcZKWLJhvP+Yqs1xKuuN8w73PHUNmH+W+a+DtygO+0pIO3
 AGfjPZQDOBxkhNP5JNwTJYiZaDMfeESjqM6Sy1cMCLgP2cp86iDH6e0corRVIB2HTe0x
 rMHreFF81+15JY2fIDWo+1kQBqXEqLTdn6eRzBu2QomiHVdik+AakT4XeNrkCwcDBH1x
 THY39eVf8aN6zKnq6moNdoLRqJ7annrOBPqyJ1+GC92I5xtKwGcUC5ef/S8Ts1/WKSZ6
 YsphFSlNWbYTFnX38QvDfVkXTA79Km28KwVXjuRnFCNGgoNnLaVIgTLbXICw7NmT4lU2
 lEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=T0S4yMd2QzPeqLBfgCzHnOmI7tbjmhUMHQ+txuXN2Zs9AFSVZxlyr5EIlnAviXXal2
 Vw4Oxij24lIU+INdm4zUaFpZXDDvuGEGJL3nqDzOYo15WaZ5cCI/WIyd8vHcrbvNbQ5Q
 O0YUjwKfYS1WDXiNVQmLU7aLlt1JTxNDMe5ssEz4p9QY8qITDQuhK6WnLWa2m0sOen3e
 TZUYr2TY2A71wrMHg9rqtm7e/oXDm9m/DCI4j4ynfnIj08msBWbZVRXT315QSPUmDzx6
 r58yjEqEXRXLAuNEzFQZ2Y1EMGF0dHMcqAtG8chgHSPUrO8507WjEIWgqwzMU0/0ZUWc
 1YhQ==
X-Gm-Message-State: ACrzQf20TvhFMygcBKYasVvF8RhXDH9qEae8NgamP99DXjTjii6rCkMA
 iAV0Lz9mbqMxoFyi8qPzZepJgQ==
X-Google-Smtp-Source: AMsMyM5WEAHjNOOpUszBjpDmkcITZcI2lt2J48qkcMN91xWhoQZqc10tvY/Iw/Q6xGPKjuSkKLzbzQ==
X-Received: by 2002:a05:6512:2a98:b0:4a2:d66f:c57c with SMTP id
 dt24-20020a0565122a9800b004a2d66fc57cmr11628757lfb.506.1666625973239; 
 Mon, 24 Oct 2022 08:39:33 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
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
Date: Mon, 24 Oct 2022 18:39:26 +0300
Message-Id: <20221024153926.3222225-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 7/7] drm/bridge_connector: drop
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

