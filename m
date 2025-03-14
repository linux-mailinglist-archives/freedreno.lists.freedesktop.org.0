Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF82A61160
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F8D10E9F2;
	Fri, 14 Mar 2025 12:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtEtNHWu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E0D10E97C
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DMtBF8009129
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rxg6WTy5b8i3vo4PyN3jqKTFwuTSk7Yvh0ES6fNN2UI=; b=XtEtNHWugQ3AYEg3
 wjWzZogbkkZmwVdE2KNA20IfuAsU36tXa/1dt3lM7njr4LoO9XFYpEMz6em2M+9y
 d5NMit+t9E+D5H4bcLE67uhsAT6fUr8QY8b/Egzo0H/sVsj152QVRbiO7OTmkYEz
 PPD0deuf+aRf7iK/StY+w4mZUYMJ5OEgDAVahytjKQc4Yj7isdmSOy4SQi+Btu2e
 TBrmXCmtw7hdRWEqmuQY5rNmr/we7z8RPykKeezOOI6iFxQm3pEh+6h1aOlJYlQo
 kcVx5ei40tS36AKl6PX4BgCxmDUA/XbpwVcsjMbmdzHyzZXAYSIfKwlnHfFQrz5f
 PFcmUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rgqxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:37:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e9083404b7so41149966d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 02:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945024; x=1742549824;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rxg6WTy5b8i3vo4PyN3jqKTFwuTSk7Yvh0ES6fNN2UI=;
 b=rSjkdj3uvBAeMVvkH0HYU7YWUDlG53Ea5Hws/8fwCHp8gadjRTh+lXI/drIprpN1AU
 RPHiRwitwM82faxSwJNBkYqM3myljICHqxYWfgNvpPeQeD0g5P0vjF/eI9bxVkChRTvl
 iaco8IslT8M9Tq1HRT27raoOkfdS65wzg0f82I4t65mWxREss0NSaHPwrGWZc4XId/a8
 9+a8xLnjPLCCCSadRUZuNbWqzvYUURHogpMfT2F5x9OroJow0UYDdtYzWLAdcKj/aVJL
 4NPKEEzjDok8sAJiaCHWo/jUF7rAzV9u52l1oNKHazi2YEu85HgyompfwXwfPWY4vqNH
 HLVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ybel1A1A3L1XN94817fZTDQWuka5bRYigtmvuFepc5MveuLj6n5J4XNcdyBt5YIqLOA/Ns0Wzlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY5vIkXMumCkK1v6qWOCdzR4SwQ26+YJIiqd1E8QYNtfBst+Ar
 KWTgeCIeSeXulT+YsCCCKqx4+XA4fDqt6DcUmqdwoDHnMvSc5ikY+lw38CZARHfhPpHU/zq5Udc
 o9G4l2yN18xr4j937KVUsrkXgwhp1bw0ugQKkzO4UYmOBIej+VLhNpixgoBh94n847jQ=
X-Gm-Gg: ASbGncvBH4ViTIK1+caKis30Emlg9ReCWaI0iVY8plDHRq7WWkfQ9M1lsEfdAhgncIS
 nHH5Z2/9Lzew3TuA+yEVTWSDtgMNx1etmX24H35JBb2LfHoi22y92naxnwArvqXroMQ/XPc0sMJ
 pqXsfcs/C60g1Hh6iZJqvWTdM1UIJxWXPcgEr6nfOw+x4KWE7nJe6MfcIYQg9eyRXD91yIxoYWu
 5STb6uLV4vUsqKjSLA4V7Qrj+aNhQv+6h3Mu1+jw4pU0LeTYkVJBy8lHzuM4TtBOGpsL/mHUJNM
 VNnG1UuxVhoKy8vfuhP4wzLL97rtuslQEywK6kfGA512xqmalWAK3wAjyLVSQFHHpQKvveiEAXg
 O00yQ/076rvNlp0AJJkhqfgakRhvR
X-Received: by 2002:ad4:51ca:0:b0:6e8:9a55:8259 with SMTP id
 6a1803df08f44-6eaea9961efmr20179246d6.9.1741945024320; 
 Fri, 14 Mar 2025 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7M0uXsq5VLmnMusm+b4PPWNokUY8N7huijszRLAgCWSqkBVnma70tsFEMI4SVLCklGwRong==
X-Received: by 2002:ad4:51ca:0:b0:6e8:9a55:8259 with SMTP id
 6a1803df08f44-6eaea9961efmr20178956d6.9.1741945023978; 
 Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:50 +0200
Subject: [PATCH v6 3/4] drm/bridge-connector: hook DisplayPort audio
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6670;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YybX5qyC/YrcFA/7ajmvv9eeRrlrBxymwT3fPWppcb8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixi7kVXfa/jwnTZ4fv8x50RB/nD4bUrHN8i
 hxuJjPE21eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1cclB/wKwPk152dsnu70W8RKywmVujiApcE8B5driQB8QQcmFe/+Bc1/oyfnrs1x1z6sHZxEsEl
 4R2OznLQsTGfvWkudWsrQPP8crg3JP3YqLuGAd9ZXeHIxnOtqw2xwTxcZ4zLKIcRp88hEqMz/LP
 5QupCCL5bGEeA0pilHSpsqRr0dZXitFPux1AHI0DHL3AB7szZxKjCPHO6NGYb2koURYkUXbG7fW
 e4qIzjIN0r/sc/iuzzPTJkflX3JD0Q3JJU8IWPI6E19/bkwryKnGC3tKdCMpahFWQq6NYlJg2Hj
 pMXI2vgKUFGbCfIAhQHNyOIkJJ3Nqn6aJdvf2k826YbEjiQk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d3f8c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZVFr_3E1Ng6cMAc5vHkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Lj6HHGaTQPTJLwWZ0RldwMywqrdWWNod
X-Proofpoint-ORIG-GUID: Lj6HHGaTQPTJLwWZ0RldwMywqrdWWNod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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

Reuse existing code plumbing HDMI audio support and the existing HDMI
audio helpers that register HDMI codec device and plumb in the
DisplayPort audio interfaces to be handled by the drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 117 ++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 030f98d454608a63154827c65d4822d378df3b4c..7d2e499ea5dec2f710c1c67323bf9e6b177d3c9e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -105,6 +105,14 @@ struct drm_bridge_connector {
 	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
 	 */
 	struct drm_bridge *bridge_hdmi_audio;
+	/**
+	 * @bridge_dp_audio:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort Audio infrastructure, if any (see
+	 * &DRM_BRIDGE_OP_DP_AUDIO).
+	 */
+	struct drm_bridge *bridge_dp_audio;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -440,14 +448,25 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
 
-	if (!bridge->funcs->hdmi_audio_startup)
-		return 0;
+		if (!bridge->funcs->hdmi_audio_startup)
+			return 0;
 
-	return bridge->funcs->hdmi_audio_startup(connector, bridge);
+		return bridge->funcs->hdmi_audio_startup(connector, bridge);
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		if (!bridge->funcs->dp_audio_startup)
+			return 0;
+
+		return bridge->funcs->dp_audio_startup(connector, bridge);
+	}
+
+	return -EINVAL;
 }
 
 static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
@@ -458,11 +477,19 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		return bridge->funcs->dp_audio_prepare(connector, bridge, fmt, hparms);
+	}
 
-	return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+	return -EINVAL;
 }
 
 static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
@@ -471,11 +498,15 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+		bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+	}
 
-	bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+		bridge->funcs->dp_audio_shutdown(connector, bridge);
+	}
 }
 
 static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connector,
@@ -485,15 +516,27 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		if (!bridge->funcs->hdmi_audio_mute_stream)
+			return -ENOTSUPP;
 
-	if (bridge->funcs->hdmi_audio_mute_stream)
 		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
 							     enable, direction);
-	else
-		return -ENOTSUPP;
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		if (!bridge->funcs->dp_audio_mute_stream)
+			return -ENOTSUPP;
+
+		return bridge->funcs->dp_audio_mute_stream(connector, bridge,
+							   enable, direction);
+	}
+
+	return -EINVAL;
 }
 
 static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_audio_funcs = {
@@ -587,6 +630,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (bridge_connector->bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
+			if (bridge_connector->bridge_dp_audio)
+				return ERR_PTR(-EBUSY);
+
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
 			    !bridge->hdmi_audio_spdif_playback)
 				return ERR_PTR(-EINVAL);
@@ -598,6 +644,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_audio = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
+			if (bridge_connector->bridge_dp_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (bridge_connector->bridge_hdmi_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+			    !bridge->hdmi_audio_spdif_playback)
+				return ERR_PTR(-EINVAL);
+
+			if (!bridge->funcs->dp_audio_prepare ||
+			    !bridge->funcs->dp_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp_audio = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -641,11 +705,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_connector->bridge_hdmi_audio) {
-		bridge = bridge_connector->bridge_hdmi_audio;
+	if (bridge_connector->bridge_hdmi_audio ||
+	    bridge_connector->bridge_dp_audio) {
+		struct device *dev;
+
+		if (bridge_connector->bridge_hdmi_audio)
+			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
+		else
+			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
 
-		ret = drm_connector_hdmi_audio_init(connector,
-						    bridge->hdmi_audio_dev,
+		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
 						    bridge->hdmi_audio_max_i2s_playback_channels,
 						    bridge->hdmi_audio_spdif_playback,

-- 
2.39.5

