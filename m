Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671F60AF39
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3510E89B;
	Mon, 24 Oct 2022 15:39:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E95E10E881
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a15so8614283ljb.7
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=njFUM8grNBCWhY7+2MQ0vp+r8NhDVi4GL0ALpm64CQc=;
 b=avxClL6eSwzUu0sxq5wEGxkMHNtk3zlzEVAMBiGi9rJxT23NCnbSpq1GYxdpMKzZg9
 B27KMqmNkY1kKnQ2vIkpqKElnfPxFYKmpiPUDAnh5mgvWRLrUsQ8XirkUEWsL+RRR5b6
 bQT1y5KbDejyYGcWMYm5ccGgG721YNhOEnb55xGOhlWLZ/FM3oBcO70sHfctixgqq5W/
 a+dR1BcBeGYjnpDyzZWDW+f34RiwcjcQHKzYidnN9ISSxZ88thh0lF83fte932peROJo
 Y4ThBMk9rkVY1l2C53lN+20LP6sAyL3jcnRHLeeZWFXI4vLTlueqnpQHqjpJ8fbxZ6CR
 6bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=njFUM8grNBCWhY7+2MQ0vp+r8NhDVi4GL0ALpm64CQc=;
 b=P5IXppJveU06cLPUm/5UEk62+dTAeU97S0Dn66qoV9F+qq7aqTm0wie/5tNZx8YRCM
 XzES4iTzBatVk77FQWBPoRlgzQ7yOacsIAA3HjVW57dQwZ4SMJw482MbLOl/z3xjOF6K
 C2zX58Ch5WGDjzU8lEmm5gs1WiHnyWGjX7nA3cTPguTJyqpljBF9LIk1K6rxdXtQsaLZ
 igBZu5xZSItgZx22M9nel8iEzQVqeGj4bh6yoWjO/+TlbBCa8cqK75aZO0n+pbHq6G52
 rXOtojk19bFv933MGVPio5u+Gx4nhMqNj7qwSsWvVm6atMszHqBxY38IvtEkd50RcsyT
 0d+g==
X-Gm-Message-State: ACrzQf3I3zVR1b55hwgSyMB+D4RKMIgln3jtAOLegCfSC1tWspHwUHbi
 4/L7HVWwkDHUUQIsdto2hCrtTQ==
X-Google-Smtp-Source: AMsMyM5Q2p8IDtH9XPUcVaXliXD9Bx2Y5u47a5cqRjasAp6w3byzQsUVB/1QkTYWSBpwaQQ247dwsA==
X-Received: by 2002:a2e:bf23:0:b0:277:f54:f0fe with SMTP id
 c35-20020a2ebf23000000b002770f54f0femr1252326ljr.440.1666625970309; 
 Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
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
Date: Mon, 24 Oct 2022 18:39:22 +0300
Message-Id: <20221024153926.3222225-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/7] drm/bridge_connector: rely on
 drm_kms_helper_poll_* for HPD enablement
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

Use drm_connector's helpers enable_hpd and disable_hpd to enable and
disable HPD automatically by the means of drm_kms_helper_poll_*
functions. As the drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() functions are now unused, replace
them with stubs to ease driver migration.

Enabling the HPD from drm_bridge_connector_init() can happen too early,
before the driver is prepared to handle HPD events. As the
drm_bridge_connector_enable_hpd() is empty anyway, drop this call
anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df..0e13bc87a6ac 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -136,6 +136,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
  * This is typically used by display drivers in their resume handler.
  */
 void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+{
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
+
+static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -145,7 +150,6 @@ void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
 				      bridge_connector);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
 
 /**
  * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
@@ -156,6 +160,11 @@ EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
  * This is typically used by display drivers in their suspend handler.
  */
 void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+{
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
+
+static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -164,7 +173,6 @@ void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 	if (hpd)
 		drm_bridge_hpd_disable(hpd);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
 
 /* -----------------------------------------------------------------------------
  * Bridge Connector Functions
@@ -305,6 +313,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.enable_hpd = _drm_bridge_connector_enable_hpd,
+	.disable_hpd = _drm_bridge_connector_disable_hpd,
 };
 
 /* -----------------------------------------------------------------------------
@@ -387,10 +397,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				    connector_type, ddc);
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
-	if (bridge_connector->bridge_hpd) {
+	if (bridge_connector->bridge_hpd)
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
-		drm_bridge_connector_enable_hpd(connector);
-	}
 	else if (bridge_connector->bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
-- 
2.35.1

