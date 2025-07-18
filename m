Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61FB0A709
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 17:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BAF10E9E7;
	Fri, 18 Jul 2025 15:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrDSLmWS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0F110E9E7
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I9Ho4K016243
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=VrDSLmWS/fBuwTcb
 05J7LPH6Cz+belbs7qtt/Lx0NORZ1V/C/d6EAFXc1vIrQRBz0uFlwCeytXmlnP9x
 nxPjxBa/heOJFz4DAnvUC1JNx2OX7A9qoDlcg1RO1fnmfc/dFmBmSCfbN71NI/Gc
 Qc4LEolwTW/yIXHvha4V5MQO8v1TIDvYVq7qmN+1FLSWyj7aYAzfSEMfCsBBYePx
 reP3dV3zMwrn0cXXa2JI1W6JCcZcNQehVsf7HxqExk31n3MQLq0fkkqas/efJ1so
 IAZQ3O8LftQAJaHeYqbocS1/nW+ceBO579IkjZ/F+yezBxXdff5lbC8pNdETnyFr
 7gqXQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc3xpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-478f78ff9beso19165491cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852109; x=1753456909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
 b=NI9rV6oc72o/xuo0DPCA9i8Z4xic7jGCSYykpZ4RVb7OrMV2eUbCidQ+T2NI7tfr7i
 8EOeFb4rgPga4hiaquv3PtALKRqFMEdNO20faZX9z9pnMii53oW669pxb9CH/0Lk/Dud
 p5qr6HBN3XM+CbgLf0WIyg1fFFRBhCXWE6cUTA+qn5MjYNNRNxZbJNMZvjl1zNl9n3Yi
 pMKMdMnCOSFqd9ph63HBJks7uDcNwTVVDXZHB+8C2RC+QQq5BhPyWZWwVQ0EmbSxk1JI
 QcznQ7Xrtz3ZHhc4pGZKBNtxQQE2d9jAeaKRUzlhcFfQZnLEbjG959IAfeow7wG+rpN4
 qkkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1/bRHq/AlGWoliGXpRkIdeuUxaWp3enK/x4F4uRX/wog63HryfGj+/7ZIfSI3VBCRFU8cGXeqy7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1u3SnmjX6CgYxZnsbkVsPW26P6p1fthdV+l+cl8YjSTxJdjzO
 hikuxSJZx6aMOqUanCMDIbtYormhB/NmlDxq2QQHY7z2/24PNH7k85LQnBDFS8djkCUapyZCQDD
 y3Yjv0Rk2C632nlxOEx4oBncE3qpnZJE9Pu3RhYbL00gJDIvXOkMujPYvMsrSA2zM1Ih41LBq0k
 tHWuE=
X-Gm-Gg: ASbGncu6m7dTferZYNb5ayK/PreS267+WZejj7tJxCqOp5zwbRdRR9eDkK8N9MsGblW
 ywxC3O+c1oxj5V6xvWeZ7CJ66We5G9B4ABl1AoqwlPxTTugypoHPXRiB3eERwaJV+SWtIwn6vbn
 Xg+41ygo5DaPIW9h8PMAX83paZSc69ivzI4jTlZ4hX5Nej18g9uaILc/nqH4zox14kxxTZLufiH
 TgASoHyfHV2+62c9IFAWynkHX4y/Ruw5yNkyo9EhGtsi6ajS9q6DvndtVt4B31Fes1TkE2szv+I
 fFHaisfnvlRE5q1nzFPhltRPY0r8MqzYUwxUCl+77zs49jQN5VS0eJKjoihYjFq46GR90mR/BBT
 bMdmiXDaKXmu4C6szdldRpBQISd8GhLujzvtUz7T5L0Qh+0u9IPgO
X-Received: by 2002:ac8:5f09:0:b0:4ab:5f8f:54b with SMTP id
 d75a77b69052e-4abb2d94e3amr74459711cf.39.1752852102579; 
 Fri, 18 Jul 2025 08:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXlyUsMs9U0U+O1wbUBh1xpkP1sDmfvcZCUKPqD7lL2WBQwooK09f3VjD66V4Apt17hOmKBw==
X-Received: by 2002:a05:6122:2982:b0:531:2afc:463e with SMTP id
 71dfb90a1353d-5376473b9c8mr1645131e0c.5.1752852073027; 
 Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:08 +0300
Subject: [PATCH 1/2] drm/bridge: add connector argument to .hpd_notify callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-lt9611uxc-hdmi-v1-1-0aa8dd26a57a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmjN+Omvftf4kFa7jkLpiochHZs/3UCyjEQ
 KJocwTiOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1WMYCACXfUOHlzufAnv7BolBNMuOWQAeu8OseKQIIQ3KxLuNSMdFlg+PMVybvtBqqW6SAy/QCIM
 lCj8zp7+vQG7lcPnFFiHw3Lfou9u2k/+h5nFwZov6t0LG/8WCRGN2SVHr2eh3mMZPLlRB5NVPRL
 TnrsG/OQab8Jy2JDPyOaCFZu8+GjdYU5lDOJQ82IdRVZ0kGD3wKHiANCYz9UUJouAvEkp8igRyN
 b5GhFmELHKA9+Jlqw3HruviFWFQCo0IefgOAeq64gHFK0MJYaIAKduKw6tSd6U4xHoW+95qydOK
 MiOzZn+V5ZV3n3MBx3uYUNVRbpcaek2Y83IJJGVa2xJpB5+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a668e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kMjXVkutEvp7Fd1UxQ009J-oivPxXQ9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX3UlVFoe2r+Js
 7tcpjo1MsFoo/ICeJyL/2uMOa7cCsu2VzAZccGnc4/sltI0pn8U/kUG23LMjxxPbS69CGVQM2zf
 SIqaNuwJGeMItHpfVuPuXughu7GeAYcdtA4Mi1Vi7gCshYNj0ln8ndAgiZKhloodB2jO9tsAkna
 V9dqiUHMZBZaNPWU/DU6RdeclM/mcXehXcOGXAigIhJyaQyjtN+goY+ieJEgWrRBXkOQueJCI3t
 IqSY3zjId/dShzQbEwTJToeZUUTmGB/WPZQvLKeWA7q4q8yD9OgsiFUdm1a+y+OjI3f8Kj5MdEF
 Y++kSyljCwkpeX9pvYa5ef5rXYdIkpBAxe1pM0btaEIpaeSCVH2kxZBcaVk6A84kXF42tthqpgK
 ScynKU6Y9L+syvTP3sbIsI6soXAR5G6cbiLflw5L6l3GXsTvusf1pkegR3evN+dpWuo/ix8j
X-Proofpoint-GUID: kMjXVkutEvp7Fd1UxQ009J-oivPxXQ9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
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

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5

