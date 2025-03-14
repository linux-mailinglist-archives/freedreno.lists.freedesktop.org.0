Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B286A61166
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F210E9FE;
	Fri, 14 Mar 2025 12:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6wt+O/6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58210E34F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E7l2ED026487
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=; b=l6wt+O/6JjKNXJv6
 qTfaNcP0eRbf10CjgKQAzzap1lDQ5nUqQBwNRIqKm0kVu/muT9H2+VhjcfXdCR3u
 Jh/IZtx91b5WbKwYAxvY9y7ctYXjsloC/wnqUd0+KtFyyI7uUp6YBKIhNE0BBIw3
 JytDXWbOshqZ+n5bxAzMJUo7Xh2G5x7cXwIJr58bv8lUPQXkRffKCoCUzuHjZMWQ
 p/EOtWmL3nN2XkQLKNWdZHofZlUz9Ly0XNh3yhyv/o/D77/jDyObxeOGV4ledJ9r
 uN1JNwdqTcTtrLoMg7bFYK4iWCBL6FzY/eJcZffc5UjQjEEcd7pDvA0WPEtsmVXi
 iGAaJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cgcd8add-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f9450b19so42078716d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 02:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945022; x=1742549822;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=;
 b=gKEGF/VDlC6ML4d6W7RMVoRCZTsuHZ4nU2ElNGok0gpNvkR8NNxUikgi29SNWrp3j0
 Ar1MS+APvk3ddkDJXfdjPju4jLuZcAumyHvtdq4fXEcFcFeikWonSAD0wri9JfwhNUqR
 NlBrxHUR6bqNd81BzZx+Lzx6r9jFobdDXSwnCyoV8JPbsq16LIXo95OU+j/mPHJIwR9I
 bcy1p5HeIC/WP1yMYHBMPnqFY0+QpGW9rhh7CephNfJKMHY4SeWHFIUzeowrGc6Myi4w
 5BuERIrQZWS89Zufnr/IkKoymscFEZd13A2VzeWmPUk2uXj3uRHjeind/iwkmoc6y1BN
 m8ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/j3nrh1ueFk2wIKspsf0jXQ8xkXjvIL0m07brYyRPE5j4gB4dBWUZsuu4Yf2/MSf4TANN94Zpxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvEtatWdItYGYontqHvb5ft6QODauSu5yFlUeLNoZ6uTQER3wq
 HxCQnUliwLmPRcneIZrb3FOVJsjo1BFXcsnA3mVkmTp5GMHvEr5pnpYUjo5cGH721j/kvu1yhUD
 wbNGIjfs7btBqpnkB9XhwgoWotyA/zpXntN0XBY6AjV9P3fmPFm+tRxR0BhjkJEIifiA=
X-Gm-Gg: ASbGncvciwcDFGfNowgSOGKCV6PWOZOnsNb1Y/Kk8hr+fU4iyywXuLrs1luiHxjrz7+
 BNrsGONrxWh50pCZms1m+E13cpJbUwwGVFj/HlwANxplC6ynVbCSXxEoB9sBMr9HB2r/mHnfLtB
 rfbYMxTuodJGnjtAMAcuF/4fPiPLLgLYBDbAg77zmHqdfTTSqQxfb8J/xrOiZa0sKrebBLnAeuv
 odvkMypnGiktS1zgFYUj0fwGIp4ZTLCCL8d559+AI7MhN99h9ZhrekFB5aOX3Xst1W6u/3lRYvG
 dtQiFElP5ld1NLJE5PEw9H/Bg4hxjvjveQ7HoRLiKHDom6wWFP8twNlbfWne8bDNIu/RauuxUva
 ec4LICrzNvnn13YzzkCcQ7paLWrwJ
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6eaddf047edmr86519036d6.8.1741945021769; 
 Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9R6JN0FXci6PacWxLW3IijDjh+4/mh8D4VFIDD4anPJXV7iyWYisApZ+3rhQVxcDkVem3Xg==
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6eaddf047edmr86518726d6.8.1741945021360; 
 Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:36:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:49 +0200
Subject: [PATCH v6 2/4] drm/bridge: add function interface for DisplayPort
 audio implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sPGFPs8Z9BJzKH3T0QhgjGfhe3qB0nROPdLNLb450jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixcF0KVuK5O3qMfR6zk8CJZvUE1rfBf7MgP
 pa+lkcaIDiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1VicCACT3fkLWM99BgjcdDqMoVZ2qL5iU7A4kGDlUS1EZSsdCxqcqblOHmzmqUNwzLd9RdUp/3h
 lo59QNm+mnNht9pNC4D67dPwm/pcRPGYQhoaiT4BuXb3LYm6GcJ+hF2Zu/IopztZUn0PIVq6bDL
 wwBV4yjwOsyWjXW2eeQYBuZSckBS9VxsI8WWvo4IVE987p+00C1Rzrb5mPG/WeuXtRd+axXAt7e
 0itOGCNXFS96Q+xXEE+7KGP+zt1swUhg9f+oj8xDv+W9MoBrtjY1vXU4ecwMxWj+ln3mUrfwwNM
 50DU1B51imC85WLt7ZfFfpHR/Wg01cv58amOmkvZGODGisPp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UJjdHDfy c=1 sm=1 tr=0 ts=67d3f8be cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4Yht-t6EeviOxvws5vEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: cfMU8IZwMZb9bPftnURWGCfHQOqaaAZQ
X-Proofpoint-GUID: cfMU8IZwMZb9bPftnURWGCfHQOqaaAZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

It is common for the DisplayPort bridges to implement audio support. In
preparation to providing a generic framework for DP audio, add
corresponding interface to struct drm_bridge. As suggested by Maxime
for now this is mostly c&p of the corresponding HDMI audio API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 88 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c6b66f733fffa77afc875e52f9d1500fcb66400f..e8d0e56bcc91c1f4c689e4e6fbd2aceaf4fc5cf1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -737,6 +737,65 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	/**
+	 * @dp_audio_startup:
+	 *
+	 * Called when ASoC starts a DisplayPort audio stream setup.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_prepare:
+	 * Configures DisplayPort audio stream. Can be called multiple
+	 * times for each setup.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @dp_audio_shutdown:
+	 *
+	 * Shut down the DisplayPort audio stream.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*dp_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_mute_stream:
+	 *
+	 * Mute/unmute DisplayPort audio stream.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -830,9 +889,24 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_DP_AUDIO if there is a bridge that sets this
+	 * flag.
 	 */
 	DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
+	/**
+	 * @DRM_BRIDGE_OP_DP_AUDIO: The bridge provides DisplayPort audio operations.
+	 * Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->dp_audio_prepare and
+	 * &drm_bridge_funcs->dp_audio_shutdown callbacks.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_HDMI_AUDIO if there is a bridge that sets this
+	 * flag.
+	 */
+	DRM_BRIDGE_OP_DP_AUDIO = BIT(6),
 };
 
 /**
@@ -934,25 +1008,27 @@ struct drm_bridge {
 
 	/**
 	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
-	 * @DRM_BRIDGE_OP_HDMI_AUDIO is set.
+	 * either of @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO is set.
 	 */
 	struct device *hdmi_audio_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
-	 * I2S channels for the bridge that sets @DRM_BRIDGE_OP_HDMI_AUDIO.
+	 * I2S channels for the @DRM_BRIDGE_OP_HDMI_AUDIO or
+	 * @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
 	/**
 	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
-	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO
+	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
 
 	/**
-	 * @hdmi_audio_dai_port: sound DAI port for @DRM_BRIDGE_OP_HDMI_AUDIO,
-	 * -1 if it is not used.
+	 * @hdmi_audio_dai_port: sound DAI port for either of
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO and @DRM_BRIDGE_OP_DP_AUDIO, -1 if it is
+	 * not used.
 	 */
 	int hdmi_audio_dai_port;
 };

-- 
2.39.5

