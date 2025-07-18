Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73FB0A703
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 17:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A0310E9E5;
	Fri, 18 Jul 2025 15:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmltrWNG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72B10E9E5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UNLd016003
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OarMjpCIfYSkdkdW6bUdGi1fdmdKOoKfw0cvB3ckh4U=; b=AmltrWNGxBmj1k6t
 l9UbP6BkHkJ0vnsjLYXr4wIitr05ohWFpIytlM/Tevby84MPsPuIY+SPnVGcQpQW
 cmy5wMiKyMCiil4fIhvBKKvNIU974RBeIRkiaCf+CaEfwM57SPUBgcjy3PNZy8RA
 flOLAvwkV15PnN16rJQBTb7LGcDnILIG/Ai9kZNxz1VpRiZ7tJ+Dx8C/DEAcZWgZ
 F5PA68+8HeAcnPUPupsc/xS3uMzTvez2jeEhp6FRYeD3a278oU/Rrl+yj9l67WgA
 l27EeKTEjNRiy+bX3tLBJZt3ynF171R3c85Lau/bKOvx0cgw8Dx07aA0jFPr6cHe
 IooKmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyy0p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7da0850c9e5so334619485a.0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 08:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852091; x=1753456891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OarMjpCIfYSkdkdW6bUdGi1fdmdKOoKfw0cvB3ckh4U=;
 b=EZzwbCIZkstqezl9ytBcJX1FRAlEoay2k+f12vaTcETSqfIdScfneD7QjnzcpeewMu
 QMGZv9JoRFZs/i98DgOneoATTI9r7CUXnNVOsWS6HvlBHyZ20BxIwNECa70SOBLE8Aow
 TeeD0+McgXCqB4KjKlVDzSmGqIydBUJSl1n8+2U9V2EveVctS1eWzp9RgEgWhSOCKboK
 vhrigdl2QOBdsDxCBUGwfUDg2jk492gzqg/WQbEorgIcnDftgT8y0EjnRgP7SeMmz1AD
 44GFlUzaFiWVBa+I6IkF1wTVA/umxtcquWVrnlzPN/kn/UYx4re7R8llpdwNjRaDeZYB
 tXkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUaN5ZrWism07Aywv1+st2oRpZk1dPHb5Ez9sfeK46fgmi8l2ABLtSj4jf/3g7ICGhqs+TBE75xI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMQo97bEt72tFB9GjdDsaoBkAkNqUgdlM+5+QEqB4GR+XTA6/W
 CSLmBNhfYvTsD4KJxY0BcBjn+o7/avCZzPDLJTIqKxIBkq7Q87GjBWZei939JAjJIstaBoDBWoS
 dcxdEb/WVRldf5MO1Kc4I+YxwAwXwg7p3G4kTRkxLCBWLMxNYfWdxgc9d2kf23JqlDuuNJGI=
X-Gm-Gg: ASbGncsXxA8SkiVpxzcBURImfMS0nCSdamkKr/zfuLZrOAD8XO8H/JTy+6WYHM+aFaE
 c6z51Pw+uiRCUB1x3cK7l6J+u1rgflnZHqhPuB1rUiDa1XUFq7OWPM0Ma7VSAztK4q3nMu75kwL
 eE+4tdkWAKt97BrN3hy6eJGt1fp+04DNMFYGzdP1tVHhDsND1JMtk9sj5mCT2g1qOf7JgFIVavY
 MH39Al0eRyqrBF5ENSKTq9wP8SNAoaMLCUxYT6+pFT/KDBvgs3ZmytCqfsfiDKPDMvixOzUs4xn
 nFXBIwZ7bdzgfMTlDtckppS4Inc8/yiyHB+BTNthkmUCmmPETJavkIuVc57BclyQpTMo65crV4Z
 2MPrjsfADvWXd2Rx+nhoLmTo8L42dFUWZxCqNnMM7XUiBobE7YyTP
X-Received: by 2002:a05:620a:2603:b0:7d6:f963:8764 with SMTP id
 af79cd13be357-7e342b37069mr1196337385a.34.1752852090412; 
 Fri, 18 Jul 2025 08:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeURN+rUaIOAwCaTzNTedfaTWOZy5Nxma8It0geQsI3eLuCA+/iQCIFo8edRjZEHH8GcSBIQ==
X-Received: by 2002:a05:620a:2603:b0:7d6:f963:8764 with SMTP id
 af79cd13be357-7e342b37069mr1196330285a.34.1752852089500; 
 Fri, 18 Jul 2025 08:21:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:21:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:09 +0300
Subject: [PATCH 2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-lt9611uxc-hdmi-v1-2-0aa8dd26a57a@oss.qualcomm.com>
References: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
In-Reply-To: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6559;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q7HopIOTnY6OvjIs/ZdbZ8AVdNk/D/2TLd7Vbpjb/sM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmEnuVxVTiBauoE5GOOhp4UYUNPIRbkjxA+
 vP9nSa4LxuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1ThbCACCWtCZUZEl8wBu44nYByLMT3AoQo5Nv7kagMOgNvKKnel1JkIbcUW4tnGoRpepDUXqyz/
 LmSY4a/at4X19BiDN7XVw91+3cuJYXyw3dPZPnbG2LsnSfNWcYvFy75XRVdAoMfz/Vi1rax5Urr
 PJJWamnVnvyGyz0Gw3OqWnJ0Gep2/a5Ou6W/VGX7NzkoeOssJRObPzVofbsSYaxrLmlaMLaWsGo
 qkEcwHmKq4KW6j4QV/bLkBngpJS/5YjCZevhWzVWpf7ZiKxp4Z4Tp3021IlsPMHHwNsiLr52dDA
 RUxmPm0kQRGBEqqfHulxyC2oCt/GSMUdAx9K5KynWD4c+9WF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vCHk1dMO6hwBxV-f-tmHKK-zzwbVv3Ow
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a667c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rji8DJjHHTBzgOBfyK4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX8EkT6FaEJ2jp
 EWTx4oCGIVDWPFM0XWdRQA+BFIt5CvXTZ7V0bqi3ha50/sJ5hD/mCvZE3bdvs8rwLSSV/hyT3OF
 zzo8ZASGZ6nesBQaRPoO+uen17C7XhqxmjE3ZNYJ77r9DyO6t/rFZXDReOBVYeSKw37GRdG4kFG
 +v8jirbVraG0mZ5rgL4SmWSFIPqz694DYKz9AugWwRSs1+3czdrbtX7/eLEqSts5DDjAcalxCsX
 9gQbquk+iHZsCBQ6zE5A7SE37wIbCoWNhA8ekq3S9OTHE9yalzQt2Ak+EQyBAKFe9QcyvAUbi1P
 27rWM6lWp5WAbEU5T/2oKuW+8S8Gb1cYEgHEeFNz1JxiYh4Yurz1N6oQkUJn5b2p9TetQCl1O+C
 nodmtFOMo5DVZeaoe4BQ2Y+v7GYqavKczuUIpncgzMEgw2q4vFy6xgIwMyjlXzB1IUMZZ8Az
X-Proofpoint-GUID: vCHk1dMO6hwBxV-f-tmHKK-zzwbVv3Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180119
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

While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
functions internally, in the firmware, thus it doesn't make sense to
implement DRM_BRIDGE_OP_HDMI. However it is possible to implement
DRM_BRIDGE_OP_HDMI_AUDIO, streamlining HDMI audio plumbing (which
includes plugged notifications and ELD handling).

Implement corresponding callbacks and trigger EDID read /
drm_connector_hdmi_audio_plugged_notify() from the hpd_notify callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 125 +++++++++++------------------
 1 file changed, 49 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f441ae433c60a7680aaa6501a8956e..11aab07d88df646a54fea287030a183eb823b26d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -17,8 +17,6 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-#include <sound/hdmi-codec.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -27,6 +25,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
+
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
@@ -48,7 +48,6 @@ struct lt9611uxc {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -429,12 +428,52 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
+static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_edid_connector_update(connector, NULL);
+		return;
+	}
+
+	drm_edid = lt9611uxc_bridge_edid_read(bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected)
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+}
+
+static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	/*
+	 * LT9611UXC will automatically detect rate and sample size, so no need
+	 * to setup anything here.
+	 */
+	return 0;
+}
+
+static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+}
+
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
 	.edid_read = lt9611uxc_bridge_edid_read,
+	.hpd_notify = lt9611uxc_bridge_hpd_notify,
+	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
@@ -508,73 +547,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
 	return ret < 0 ? ret : rev;
 }
 
-static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *fmt,
-				    struct hdmi_codec_params *hparms)
-{
-	/*
-	 * LT9611UXC will automatically detect rate and sample size, so no need
-	 * to setup anything here.
-	 */
-	return 0;
-}
-
-static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
-{
-}
-
-static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint,
-					 void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
-	.hw_params	= lt9611uxc_hdmi_hw_params,
-	.audio_shutdown = lt9611uxc_audio_shutdown,
-	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
-};
-
-static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &lt9611uxc_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = lt9611uxc,
-	};
-
-	lt9611uxc->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
-}
-
-static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
-{
-	if (lt9611uxc->audio_pdev) {
-		platform_device_unregister(lt9611uxc->audio_pdev);
-		lt9611uxc->audio_pdev = NULL;
-	}
-}
-
 #define LT9611UXC_FW_PAGE_SIZE 32
 static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
 {
@@ -858,11 +830,17 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
-	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI_AUDIO;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611uxc->bridge.hdmi_audio_dev = dev;
+	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
+
 	drm_bridge_add(&lt9611uxc->bridge);
 
 	/* Attach primary DSI */
@@ -881,10 +859,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = lt9611uxc_audio_init(dev, lt9611uxc);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -908,7 +882,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 
 	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
-	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 	mutex_destroy(&lt9611uxc->ocm_lock);

-- 
2.39.5

