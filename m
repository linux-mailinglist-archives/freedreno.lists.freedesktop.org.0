Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B43515407
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 20:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1970110E77A;
	Fri, 29 Apr 2022 18:52:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AC910F0A4
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n14so15548328lfu.13
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNmsSu5EFMsnDMxNTzSovNKF0T/u6pITv3O7/Fgf9Jc=;
 b=McZLPyglK/9tU+mYeWuO/1tmJahwwBbj4r7sgq0WslepjKDaME/CtmzyGsyk/VBQNu
 NaLRMyuLPEsgsYFDvZJ3N8sm1P99XtaZgTGrTECvw4GLONdP13VhuY6RRhH3ahExtPho
 PnHgPwe3N6BvUL5LV4le75QjdS0lbr0Ua+9uHg0koB0pLNOPJleIXBDx5G57ncei+eF8
 F7zDQMb7Imr9GBi19tFIM6D3LSKFp1lk1PS1Yy1oYl3Sde6d/HQeaDodZ8NEfYVPY1VQ
 tZHjvz4JnoFMUPlYB4uBZR0fcEV6Gmrh3mNPd4DfmZhqAMr1DWwsjULDLGoF5WXvnCOQ
 HXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mNmsSu5EFMsnDMxNTzSovNKF0T/u6pITv3O7/Fgf9Jc=;
 b=CHw/rhyqhepvD0GF5RbGpaIfbWmkG7QG1f/035dUOLP29HD6Yk04YfbD+awIWgC1n0
 KenFxCmI477xMsbTKt3qMvoFMBMLrr/RcrtusquKlCFwV3bEtpVZ7NjAKhaQaBY6602K
 Lm36W0c7+1dNDneIQi4CDtKvZOjklv7GkybDGWm9dE+3aWfDx7ccUhkaYMkIQu/yiKZ6
 Prg+/uHCmHDyY4jv8hoxK677ObzkT3caTACC2gYimj2NAJhylny4UJn+jTeqR3nsa0Hx
 C+fzqpvwM9wjG6vrkUZCOTt2iid4hIPpPY3SQSBzCO9U2Ji4mnNTsungxVPv83M6uAfd
 ATZQ==
X-Gm-Message-State: AOAM533T1NegQ3g8RFcaxR2HexTvEFcpKekBy3D0kOXrRS08DomNxjX6
 yQsTgcputfOk/wdv7xzHak5oXttNovFOIw==
X-Google-Smtp-Source: ABdhPJytbJr6ns9XOXOBR4HEVk85eizRt7BmJyw1M+DX9Ve/Bpz0VhLYSogBpCzoLFACGwmxzaJ6vg==
X-Received: by 2002:a05:6512:3c86:b0:472:1ea6:52bb with SMTP id
 h6-20020a0565123c8600b004721ea652bbmr440553lfv.334.1651258321866; 
 Fri, 29 Apr 2022 11:52:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:01 -0700 (PDT)
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
Date: Fri, 29 Apr 2022 21:51:52 +0300
Message-Id: <20220429185157.3673633-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 2/7] drm/probe-helper: enable and disable HPD
 on connectors
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

Intruct two drm_connector_helper_funcs: enable_hpd() and disable_hpd().
They are called by drm_kms_helper_poll_enable() and
drm_kms_helper_poll_disable() (and thus drm_kms_helper_poll_init() and
drm_kms_helper_poll_fini()) respectively.

This allows drivers to rely on drm_kms_helper_poll for enabling and
disabling HPD detection rather than doing that manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c       | 19 +++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 204f6999113f..7fef16cd80ff 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -251,6 +251,12 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->enable_hpd)
+			funcs->enable_hpd(connector);
+
 		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
 					 DRM_CONNECTOR_POLL_DISCONNECT))
 			poll = true;
@@ -756,12 +762,25 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
 static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
 	if (!dev->mode_config.poll_enabled)
 		return;
 
 	if (fini)
 		dev->mode_config.poll_enabled = false;
 
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->disable_hpd)
+			funcs->disable_hpd(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
 	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 }
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fdfa9f37ce05..7fa67017d303 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1143,6 +1143,28 @@ struct drm_connector_helper_funcs {
 	 */
 	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
 				      struct drm_writeback_job *job);
+
+	/**
+	 * @enable_hpd:
+	 *
+	 * Enable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
+	 */
+	void (*enable_hpd)(struct drm_connector *connector);
+
+	/**
+	 * @disable_hpd:
+	 *
+	 * Disable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
+	 */
+	void (*disable_hpd)(struct drm_connector *connector);
 };
 
 /**
-- 
2.35.1

