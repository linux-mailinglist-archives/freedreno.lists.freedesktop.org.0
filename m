Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B551540D
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 20:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7333F10E9C0;
	Fri, 29 Apr 2022 18:52:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733910E77A
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w1so15596143lfa.4
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sz6Xf+FMEM6Pg9TYenwhocv3Ys8GJokg7Junnjnvhs=;
 b=P3bH5SyuxOC+W7nJIP8uFiQe8mfa57voGW/CujGwdt+uWBwVjW1y5jIQ0qwioyG8a5
 z0XoyCQTmflVsbpvWWmnfyZSoAUrVOBSz+OUilUPh+oJKepu6NMiasv4yoF+Luv0X4eY
 sIoQZYtzjlcbAcsQ4ks5JVCZIexkyadB/BGybVVYx8pNJaZC6briTt4ejRa8N1hqiOeZ
 x06azzmpObZd/gZfhoKiqr4FhF8MqvQ6WRZpgNQUlgDauqHAlU+wTWl5BldqUvIpf7ZO
 VSwKGHeA8tVyaASkzh3ReNiFVS7G7nwLykrIYgBkZmuAuWsl0A/v/Z9QwOacS3xoIF9U
 k8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sz6Xf+FMEM6Pg9TYenwhocv3Ys8GJokg7Junnjnvhs=;
 b=YSxqDnQHfSl9V/fKRgot5vqwWtq4hXCrpf4cixBIo/rZ0J0Nz9CRavRML93yf3iMm2
 yl5/jQI7EYtsfUYxYRO5+K7dax1OsP4P5rtoMvmOk8B72D6cPZndjpg8WKsrOyWwLf5+
 1dORRHeXhwOWaol5EZfyhkS5eFmcDbXN6B+trNId3IV6iJnjgm5fG6Jr4iydlJMFY0Au
 Ewe2A7hFNNwCn75996a0Ok3eBumDfEwrTuloNF5d6GU2S9+Ae0pAr4hcYC23Z+EzgowK
 /0kqZPCEPOAgII/bT74WnDAHx7FLAWXoUI6zURey6h0txxj9jxJKVxAP9lpTmHKTvF+o
 TuHg==
X-Gm-Message-State: AOAM533s8IHhdX8Y1Ea0lmjlwhI3PLYU0TGuqsrlY28dGzPh4AX8xIan
 yGxKSGam1zLpiDS7QRF9qd0Spg==
X-Google-Smtp-Source: ABdhPJyFf6J2Z655udBCglne4L6bEQy6aXnOSp8JiHE9dIuE3sE2sj/KEZZXkudFN4tE22D7lR+/zQ==
X-Received: by 2002:ac2:5d6a:0:b0:464:efd7:f964 with SMTP id
 h10-20020ac25d6a000000b00464efd7f964mr433509lft.70.1651258322849; 
 Fri, 29 Apr 2022 11:52:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:02 -0700 (PDT)
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
Date: Fri, 29 Apr 2022 21:51:53 +0300
Message-Id: <20220429185157.3673633-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 3/7] drm/bridge_connector: rely on
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 60923cdfe8e1..1592da3b9403 100644
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
-- 
2.35.1

