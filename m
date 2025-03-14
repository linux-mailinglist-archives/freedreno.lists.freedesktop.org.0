Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A1A6115A
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159A710E261;
	Fri, 14 Mar 2025 12:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIpaRfn3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B60610E34F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKD2v9027243
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E3BE6ik3JEHMZ1NgKof9i60DVCCDulBUMrxm358Ld44=; b=aIpaRfn3YqtSlHpj
 BEiCfp54SaXdYgBa4UqQ/GFhhMYhQrfOHBIc4Xq0f+q+AOaXrnCjTrI31rSDatxa
 hxlFjkxGFtfXQGbkJICISYiNsbSPQG5MHz1caALwHe9LRNQ4eg7NEnguVxtN+Wdu
 KOnQq/FgAid9krKXv0K/258cwYs7vyYx3b5F1IdeOXu32JXiFcpyaOcWQuvu/Y3E
 LbFJwQsP3gWepxZ2p5iU/cmjnRSJZyiY/swcdEWP35VnIMEje7Hj6yo4cKZSGcxT
 jn/u9uPRDPCI1+AyYtI6bsmBl1we5TvjwsIQQU36Ec9LFV8UI0DVTfVXUzjplin0
 63AA1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6731pxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:36:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91f6bb296so37211126d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 02:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945018; x=1742549818;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3BE6ik3JEHMZ1NgKof9i60DVCCDulBUMrxm358Ld44=;
 b=h4DfWluY63JvTNhHfpZgkoa1ooP4V/lwtZXj0LnGkZh1CaKyt/ERsDIAXFTq4rgy7G
 c3VB1vm7M+IHGB5VKvNF4xUejygBqvtIczKHzVIt2l5aVtn9Ni3nvINfrohhZKNwP1E1
 X4qp7+zS/Ez8xkqlME03XcVfdvSP0xvaiTs25xuxNdErl6fLKB3kf2y/7DEc+jcYlYa9
 KmXycm7U1w+i7/SrSTYnSvReyTGEWIsnW0ALZ3mDYQd+UkpQ0qmmH6AC9FNERM76QDlu
 T3ul9B7VkxZ4tT+oz/uwvZVwPCq9oDRijC6GMVyYf+hIDUwyFu0yZT4qHD2sjWRLhvLV
 yvAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf4Ms+GqDNVwcSzeZru9YsW20GVvz30wvSlY1uY7i2DCcNaOythHMW+jhAOrVLj8UEtSijwXoPVus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0aCb+yuHzzv0nfYgzvGCjKdm6FZpm5C/FTqL3dJSG1c817h3F
 wU/ottBjHdefkdh6dFXECCWvEggbMrWsE0vF8lUhst6UfkQ98C+Duj5e9rsTryR5igTsmfzE1E4
 oayfqVItJvpdInJMHtSaah04v9yFrEb+gA1jP9Ig5xHz5p2J2TopNg9kYGogbUzUbrJE=
X-Gm-Gg: ASbGncvlMmBQOeIOt6xpWJtoZOH/q6BzCcp38jQ7Y3tBOlvU5zwyxckiEVJvU2A9brx
 zle2CEPSNSSPw1ZOJWaOIPERsda54dXo27lbbDtkdR2v2FILhJTUeuZDLj+K9Il9pgw7X6b/mkB
 Q1RIGaWAqjHn5kutcTV8tv1v5b/GkcwJtSaMuuCuc9tzwtuVCDV7mplveCZkWlRpnF6DuizLKvW
 +9fPyhsswtDH14ad+tFS98t7o2CfjVLeZX2p4PY6XyuCp17K2TbMyeMJ6sRJOwrEZrUnYvv0r3W
 1FMUjOV/MISh7AYAj31eEbY7Uo6Jxiks77+R0gnLm0LuqSYenUVi+Lpqg+1FbymCzuUCNdfGGYG
 GZBwVqELo4h2aZ23CYUueKgVyXLbF
X-Received: by 2002:a05:6214:da3:b0:6e8:9797:f94e with SMTP id
 6a1803df08f44-6eaeaaf7178mr19512866d6.35.1741945017920; 
 Fri, 14 Mar 2025 02:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSNEaS2HhQ5e8HPlGtZT6eyjJim/p5gmh4hT0gHHUjVecBEl5EiQdprLPXcE1EJsy+ySRxgw==
X-Received: by 2002:a05:6214:da3:b0:6e8:9797:f94e with SMTP id
 6a1803df08f44-6eaeaaf7178mr19512646d6.35.1741945017527; 
 Fri, 14 Mar 2025 02:36:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:48 +0200
Subject: [PATCH v6 1/4] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ftPgm7yawXwdGOb7vf34ICo5af7jf0Sj9BanH4F+8/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixq4SknkMu/WtIOJp3nymsxU+XB4omcfz+1
 1NMSRw2xTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1RmEB/43wfmVTdQOuXcMNe1f1o5xskST9a9GNFKibkBx2k1St0z3qVQcJ56f3Pz+vkEZq4L8e9d
 ZpadDpw7Kxt8R6+yqG7BIUp6bm/JyPswx+UtYEFaRwVHC3NrMdqdc7AF4ZHJS+DS0Amenb4nlCO
 x1/CqEUaHoesJ96N0EO9XahFxFVN0+AeS+wSlk0mxVjQh2EQ2JIggnoAdrmBExQxFYFcQ6OABoG
 klaaH2PilP0KdgtTPcHzHoakgjURM8I6ih/Pp8MCs5uJHZjn5Bsb3OdnMu9yO59P2DwmhlG57+D
 4NLufjgpVAaJ/R48U09bGoSR5x2VmV3HN+/z5EAHXHE+8nH0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3f8bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=h2q6pj4Fa84FeHWKbVkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sb00BPYDhoK4YPWDD93FA5ufsNP3r0__
X-Proofpoint-ORIG-GUID: sb00BPYDhoK4YPWDD93FA5ufsNP3r0__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

From: Dmitry Baryshkov <lumag@kernel.org>

As pointed out by Laurent, OP bits are supposed to describe operations.
Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
overloading DRM_BRIDGE_OP_HDMI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
 include/drm/drm_bridge.h                       | 46 ++++++++++++++------
 5 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI;
+			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
+			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_hdmi_audio:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
+	 */
+	struct drm_bridge *bridge_hdmi_audio;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return;
 
@@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
+			if (bridge_connector->bridge_hdmi_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+			    !bridge->hdmi_audio_spdif_playback)
+				return ERR_PTR(-EINVAL);
+
+			if (!bridge->funcs->hdmi_audio_prepare ||
+			    !bridge->funcs->hdmi_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi_audio = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);
-
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
-
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
@@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		ret = drm_connector_hdmi_audio_init(connector,
+						    bridge->hdmi_audio_dev,
+						    &drm_bridge_connector_hdmi_audio_funcs,
+						    bridge->hdmi_audio_max_i2s_playback_channels,
+						    bridge->hdmi_audio_spdif_playback,
+						    bridge->hdmi_audio_dai_port);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO |
 		DRM_BRIDGE_OP_EDID;
 	bridge->hdmi_audio_max_i2s_playback_channels = 8;
 	bridge->hdmi_audio_dev = &hdmi->pdev->dev;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d4c75d59fa12be1bd7375ce3ea56415235781b28..c6b66f733fffa77afc875e52f9d1500fcb66400f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -681,8 +681,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_startup:
 	 *
-	 * Called when ASoC starts an audio stream setup. The
-	 * @hdmi_audio_startup() is optional.
+	 * Called when ASoC starts an audio stream setup.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -693,8 +695,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_prepare:
 	 * Configures HDMI-encoder for audio stream. Can be called multiple
-	 * times for each setup. Mandatory if HDMI audio is enabled in the
-	 * bridge's configuration.
+	 * times for each setup.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -707,8 +711,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_shutdown:
 	 *
-	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
-	 * the bridge's configuration.
+	 * Shut down the audio stream.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -719,8 +725,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_mute_stream:
 	 *
-	 * Mute/unmute HDMI audio stream. The @hdmi_audio_mute_stream callback
-	 * is optional.
+	 * Mute/unmute HDMI audio stream.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -814,6 +822,17 @@ enum drm_bridge_ops {
 	 * drivers.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
+	 * Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->hdmi_audio_prepare and
+	 * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers.
+	 */
+	DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
 };
 
 /**
@@ -914,23 +933,26 @@ struct drm_bridge {
 	unsigned int max_bpc;
 
 	/**
-	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO is set.
 	 */
 	struct device *hdmi_audio_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
-	 * I2S channels for the HDMI codec
+	 * I2S channels for the bridge that sets @DRM_BRIDGE_OP_HDMI_AUDIO.
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
 	/**
-	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
+	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
 
 	/**
-	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
+	 * @hdmi_audio_dai_port: sound DAI port for @DRM_BRIDGE_OP_HDMI_AUDIO,
+	 * -1 if it is not used.
 	 */
 	int hdmi_audio_dai_port;
 };

-- 
2.39.5

