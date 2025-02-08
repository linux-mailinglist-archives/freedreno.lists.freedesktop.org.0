Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3326A2D224
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F6710E355;
	Sat,  8 Feb 2025 00:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f4i+TntR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0010E039
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450475df04so239174e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974443; x=1739579243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RKBfihIb/7toQsuPMJ42zqQSv8Lp5KmiSybZXSECDfY=;
 b=f4i+TntRxJqhmspdtsfaWzO+XqNhMNshpT+g33u2MiJjoO1mQclWGhatgKR5qvxqLj
 Psg7MRmunxVY1qLYnqDPcKLKlKb6UFZVBO/+ZrujSsDRfPX8enJuW+jQi7NbrGeuKBZo
 /pDpLbpf1RKkLObxmZErRnn5d+kGHcvGU8QX+U004YNpqpMUaf8OG+kFFJcRLEaOfQtg
 5kk6cFKCz3IbUJRm0jFHKiW+rzV5K6surs8U1ocmZv5A+OEXQTkzMt0lEW+PG91DlECK
 M48lLup8+kATdVtV7P/NLf6tzwC7sk1k9AXEAHkMjgTQunTO6VdTJ4u+fxSuAkpMFyGM
 Fc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974443; x=1739579243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKBfihIb/7toQsuPMJ42zqQSv8Lp5KmiSybZXSECDfY=;
 b=dMqiOh7LcSd30BVDUd8f2kZdzExH+IBEycIGA1cDOCkQRFkk4cV1smscg12Z+kIRBh
 jyb2TxkPB51ND0SCJllXqoRM1nJpJ6jwaTzM82ILOvfDEGozevWclL07b6A8mPGHd50X
 PRH7lhp/ExAmlRw5gynizVg2wZ+84S6EbyAI8wonoi+46dO1MO1uNcXSbNZq4PhsuDws
 bILIPBCqYM3XNm9bRbifP+MsivxmNxDi9CwtLyfJvdXuNt0fELMBQC6QOLoBz7wES7qJ
 KyoSt/5R9FK8CdO5FXL/vVqnQU3QM+sAaGnHniCAAkpeZLMFNp0RG0btvYqqKkNe40FO
 oFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcdHXsz0psxoV6niFO4e//UqISOPcFaIqFTUsQaaykP0JKT+POlV+AYQHaMOMRoMAfnDkRBJWXs00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9rVsgbsxX0kaT6/UGSOTO89GaNHZAd9MpvBdyL3nag3bkHzW8
 zoO5U7g2aVIjNsiuDHwzfvP5YEXEE7cfS+aJdIhybB61iw5SOA3bx4cLUT5Kkxc=
X-Gm-Gg: ASbGncsRyLfvNBbD4z3E5Jsgd4A+ls68pMN3y/pLmvp+gADK5HtMKfi1SIqUbV/92BJ
 SPIqGCEBNMCTjNAew5sZEILj+nNgCnCcetAh3ohNK/DjNQ2rRQU3QKMJD5bnP3xGRmxLCS1GW+F
 pkbz8UAPYgs3q4+n7mQ94H/eGzQuoOe6AJb/W/Lk39VWt4ztH6vs3ErryjIpzt8Xzi6MmZqhjp1
 Hy75/rfpJCqO72rajqkbzIm63OgshajqkeESwuMjWr0V7mLq1qqf7chgpmkk0FZ1c7yhnegWTVW
 jt5NuEQmGRcGbe3bj6nv1ww=
X-Google-Smtp-Source: AGHT+IHZSW4Dkfz7HURQi0tLhTK84rJtDghh8lEJ0rbz/uo2oI/zXnEvOcA2okiZEs8sAKjV9XPpeQ==
X-Received: by 2002:a05:6512:70e:b0:544:1429:966b with SMTP id
 2adb3069b0e04-54414ae6304mr1353119e87.50.1738974442559; 
 Fri, 07 Feb 2025 16:27:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:06 +0200
Subject: [PATCH v7 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-7-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9768;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mmljonIq4bmX1OF/1IouRRVjrYkdx+Ed4/wrzZ3byT8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWkEs9L1fxTSs1igqv+ShEHJooNjO8pNQ9s
 F4jUjrUx9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1X2HCACkBByn92WsrGJqa5QaM/8pWvBtmUs9SmuLwIsjn++TDN7FD3Ukh0c4NbF+MYJvGt2jOuv
 KFW6Dp4lOUIDm+CUArHlNIja+vCSpv7h5Czyh8Nv5TlMIjJH+RcZVoyPa9610EWusOABoDluSMA
 POoJ+PrYrYkht0iBrIhot9LHW8zm7H0g+/0t0O5y8j5bSasAjYADTqaHc+Q9TOUd4TLuckZCbfN
 m9QHw/izPjI2lCtYk/QM6Y9IGJXePtvydKY2JGH2oHedJiXVbUSI413JzkrkN8kVz6lU+5s8ifz
 MeatTUaZ9JEMLjhIhodifpye8BwnLqSb2112Jpzc2J6F8uXY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In order to simplify the driver even further and to remove the
boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
framework.

Audio InfoFames are controlled centrally via the DRM HDMI framework.
Correct InfoFrame data is programmed at the atomic_pre_enable() time (if
it was set before, drm_atomic_helper_connector_hdmi_update_infoframes()
takes care of writing all InfoFrames, including the Audio one.) or
during msm_hdmi_bridge_audio_prepare() when the new stream is started.

All audio data frame management is deferred to
msm_hdmi_bridge_audio_prepare() and msm_hdmi_bridge_audio_shutdown().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 91 ----------------------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 18 +++----
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  | 68 +++++++++++++++++++++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  5 ++
 4 files changed, 71 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85..248541ff449204c72cd444458dadb9ae4a0a53d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -14,7 +14,6 @@
 #include <drm/drm_of.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-#include <sound/hdmi-codec.h>
 #include "hdmi.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
@@ -245,87 +244,6 @@ static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-/*
- * HDMI audio codec callbacks
- */
-static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *daifmt,
-				    struct hdmi_codec_params *params)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-	unsigned int rate;
-	int ret;
-
-	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
-		 params->sample_width, params->cea.channels);
-
-	switch (params->sample_rate) {
-	case 32000:
-		rate = HDMI_SAMPLE_RATE_32KHZ;
-		break;
-	case 44100:
-		rate = HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
-	case 48000:
-		rate = HDMI_SAMPLE_RATE_48KHZ;
-		break;
-	case 88200:
-		rate = HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
-	case 96000:
-		rate = HDMI_SAMPLE_RATE_96KHZ;
-		break;
-	case 176400:
-		rate = HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
-	case 192000:
-		rate = HDMI_SAMPLE_RATE_192KHZ;
-		break;
-	default:
-		DRM_DEV_ERROR(dev, "rate[%d] not supported!\n",
-			params->sample_rate);
-		return -EINVAL;
-	}
-
-	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
-								      &params->cea);
-	if (ret)
-		return ret;
-
-	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
-
-	return 0;
-}
-
-static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-
-	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
-	msm_hdmi_audio_disable(hdmi);
-}
-
-static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
-	.hw_params = msm_hdmi_audio_hw_params,
-	.audio_shutdown = msm_hdmi_audio_shutdown,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_hdmi_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
-{
-	hdmi->audio_pdev = platform_device_register_data(dev,
-							 HDMI_CODEC_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
-							 &codec_data,
-							 sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
-}
-
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
@@ -337,12 +255,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return err;
 	priv->hdmi = hdmi;
 
-	err = msm_hdmi_register_audio_driver(hdmi, dev);
-	if (err) {
-		DRM_ERROR("Failed to attach an audio codec %d\n", err);
-		hdmi->audio_pdev = NULL;
-	}
-
 	return 0;
 }
 
@@ -352,9 +264,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->audio_pdev)
-			platform_device_unregister(priv->hdmi->audio_pdev);
-
 		if (priv->hdmi->bridge)
 			msm_hdmi_hpd_disable(priv->hdmi);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index cdd3bd4f37831f9a606a4c3627a48364f5d4025f..a5f481c39277631b7a19d294b086d6208be26511 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -33,7 +33,6 @@ struct hdmi_hdcp_ctrl;
 struct hdmi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
-	struct platform_device *audio_pdev;
 
 	const struct hdmi_platform_config *config;
 
@@ -205,17 +204,16 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 /*
  * audio:
  */
-#define	HDMI_SAMPLE_RATE_32KHZ		0
-#define	HDMI_SAMPLE_RATE_44_1KHZ	1
-#define	HDMI_SAMPLE_RATE_48KHZ		2
-#define	HDMI_SAMPLE_RATE_88_2KHZ	3
-#define	HDMI_SAMPLE_RATE_96KHZ		4
-#define	HDMI_SAMPLE_RATE_176_4KHZ	5
-#define	HDMI_SAMPLE_RATE_192KHZ		6
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 
 int msm_hdmi_audio_update(struct hdmi *hdmi);
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
-int msm_hdmi_audio_disable(struct hdmi *hdmi);
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params);
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 0b91ed5eabd234ff3bca0c2dfaa159dd2e6a9df5..8bb975e82c17c1d77217128e9ddbd6a0575bb33d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,7 +4,12 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_state_helper.h>
+
 #include <linux/hdmi.h>
+
+#include <sound/hdmi-codec.h>
+
 #include "hdmi.h"
 
 /* Supported HDMI Audio sample rates */
@@ -192,29 +197,72 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
 {
-	if (!hdmi)
-		return -ENXIO;
-
-	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	unsigned int rate;
+	int ret;
+
+	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
+		       params->sample_rate,
+		       params->sample_width,
+		       params->cea.channels);
+
+	switch (params->sample_rate) {
+	case 32000:
+		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
+		break;
+	case 44100:
+		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
+		break;
+	case 48000:
+		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
+		break;
+	case 88200:
+		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
+		break;
+	case 96000:
+		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
+		break;
+	case 176400:
+		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
+		break;
+	case 192000:
+		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
+		break;
+	default:
+		drm_err(bridge->dev, "rate[%d] not supported!\n",
+			params->sample_rate);
 		return -EINVAL;
+	}
+
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								      &params->cea);
+	if (ret)
+		return ret;
 
 	hdmi->audio.rate = rate;
-	hdmi->audio.channels = channels;
+	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 
 	return msm_hdmi_audio_update(hdmi);
 }
 
-int msm_hdmi_audio_disable(struct hdmi *hdmi)
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge)
 {
-	if (!hdmi)
-		return -ENXIO;
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
 
 	hdmi->audio.rate = 0;
 	hdmi->audio.channels = 2;
 	hdmi->audio.enabled = false;
 
-	return msm_hdmi_audio_update(hdmi);
+	msm_hdmi_audio_update(hdmi);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index aee75eee3d4244cd95e44df46d65b8e3e53de735..c6659e62594558b3c0c25de36aa8c459aa253834 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -478,6 +478,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
+	.hdmi_audio_prepare = msm_hdmi_bridge_audio_prepare,
+	.hdmi_audio_shutdown = msm_hdmi_bridge_audio_shutdown,
 };
 
 static void
@@ -515,6 +517,9 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_dev = &hdmi->pdev->dev;
+	bridge->hdmi_audio_dai_port = -1;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
 	if (ret)

-- 
2.39.5

