Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D9CFF5B0
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 19:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253D310E5A9;
	Wed,  7 Jan 2026 18:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpUmQbYb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZfT/zOU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42010E655
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607HU1Tl3752175
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=OpUmQbYb1j/NSFYk
 Xft3zpHcpuFEAv3CwOsCEDm8TTZut6f7fktTiYhP1reTavXR/x0cZtP0e3AsQjk2
 Kd4d6fr83beQDg7xLfrwhBhAE1TfPfdQLKTzu0NA99ht3KT3l1jDTgchxxzV/8nA
 msygtyBCiUhJg4YwVhjC0/Yw4oEbkJVb5gT29FunL44ATkzFsPDvFDPjYgCoR5ls
 J6Ghe+PxRcaqeJPPU3PMEpgkcVIcCIzeIl2l+M80+JIOz89logld2RC4jfJ53ZQm
 YKlxv/l+pU+RIUbbZPSXmCUkNA3IpMNQ3klIl0c0i1wuE62sfSsCVDo1NuIrb25t
 HacGAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcr5e6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b24a25cff5so722230385a.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809720; x=1768414520;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
 b=LZfT/zOUpRqRTEKnBoA4zKV7P3oeEzZb598SiwbcLL+aNewF27BYFByGluc9qa074o
 Y96wNILBf2qDMx34US9DdCOBr9gXYw0LbHd9jDSF5FP0DdaIe157tzx0hLVFLYQTnoim
 sJCNZBGdUponWClWlFw6n7VcNhxK9D1Hhvy8/lDyQWhL8vcV1iXvcPuhLL03AWfV4G7q
 h9wMwjAlQsyGtlMOxCtxpGhpZCbiNxQUxO/N7HbBDjUSURaPGNOi+nK8d3o6ykseVkjs
 SYjAlgHT1ac5IhoU1NNoKujSOmZBY4YheQZHqeNgzasWxs/nKsPXC9q0HmDLgcy7qo1k
 o4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809720; x=1768414520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
 b=aozCa06kGjJoZ4ZRJt+0Xi686FtEenR9Ueoznq1qqhXqf/PqTPz1wis7NG9SMvOc5V
 m7qxeqOfiU7ShXiuqTduzeBdLW3iX3f3XKU672HFAVpX2MimjfbfOjUUO2G+WP4K1lFC
 eZnrpaMyKxG7GkVUXqPfv3brmrOrkvQSGqWtQerpEtXhBGFLiWUY+X6IcAAC5G4pFoEJ
 OBhCc2VJ9Msz3nHrmx2hOtbg3TE8xBg9QLRg7gbyUE8WxYeJKtquWyke0oE5++Q5zHXI
 yAp67DQLV0xwB+c4TMAr7IKXZwtj4zl0I4DXH2upqQahv2icSDb6EWGWH2Z1aVNmC0YB
 xWQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHoHyTt0YVamDrUHtnThKaK+nuggH7Z7RaTksb3ppZMThO+cEYOgl7gWklQQt2IeK1NcOtD3+jWUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5TLZvOBWpSwo5+LA/7qgQx4SyTI45xVs1Qo660Cq7Lf3WEJ2u
 gRiVnITpvnDuKPjLyU1n9fJtFembj4+/pcTrsLv2/+QrJnzrw7E0eiwffMNqVsbJZJ4X9c/t4Qo
 E7Vpctvskibjnk3ercAjM7/zgEFtnjwIedIbakFj/vQXHMmQz4ypa5OP9WkRn7hqIr5D/9Yo=
X-Gm-Gg: AY/fxX5Pq4DRPXYxCQyHuweKBFCi1/W6XITc9LupRVgO03pC8/ZhwUR6T6ZUe4b/fWG
 2wcGv093Cv1TWE/KITr3b5FfoZp9ArKOeDlxbcK+pLBVAdr/aoJP3bxtp9nzBF9WSAGPpUkSoKp
 UH5gozJ2r9OWa29g3pO/GyL3YENzahghTZrI008vPfOLoeJlNeUry2E/Q24GeEa0zraNV5h1cXC
 rtw0FuTbRapY1f9JOART1WNATaqVClz92BPx1PVHT6pLUYQP3jTPRMfB4arNwCC359RgkQ6UWlf
 /DfIIQ4YYK9FQ6+X2slTFJ4i3yyb6BXG53OGgE0HSbuuCAtDVzfV0CXVXpS0+G54oBccanVMvgL
 VOWaBqwKYA9W9IY5fm5GIrRAJIH97nwBghDk1bA2q1+wj7j4Pemu73KaUqct3jZAYIcpvNz0A8H
 0eGeRYdkbqxECWtdAf+s6GOgo=
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id
 af79cd13be357-8c3893a26a4mr408416685a.33.1767809719573; 
 Wed, 07 Jan 2026 10:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUjHXe7uuYeZEqUMuBR5K2kia77K+Kj14ZWPxBppIzS2JiKcdZruRDku2629OMG4LVhagWmw==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id
 af79cd13be357-8c3893a26a4mr408404785a.33.1767809718716; 
 Wed, 07 Jan 2026 10:15:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:06 +0200
Subject: [PATCH v4 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-9-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlQWZc4/P6jahK/bWP1w2B50/o9TLzfzbdf
 aaZXx2QNIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1f1FCACoKLk12kYaWdypMvDCzHmH9N8HbMOWbXMZlbluaF79NkCtoNgDonKnKHxYLa9pjqgX17e
 Rvd8pmDpdv2MOg3WP/GMXH5pZGxRG01FGl7SBtEPw2/YXYEskTFSEq6fG4I+tv8X5Ly85MqO9Lj
 9cHsDJOJq0hBFlwxVPg4mvAka59hwWsW69lgA6euCJbibpFCioBMCghtCslqHcxkjZWM/PUGgNE
 Zgf3lcR3ZdkGqSnlQlrowNKspjiwnAe/Q7/uXCEP9N6R5jyGzXlQUqTGFKBPnuzMfXGuvLMm4dg
 RY6CU12eS8wodgZ5W3Ilm0fcBuf2GFwlR9F7fNEmqQh95vO+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX2jIcpk7s6koI
 ea8rT/3cW1ovtuWll0j0wr6szQIlcp+ftlEplM4+6W5f6lbFCEpmmdocNrAoosrJ03kJh71Wx97
 HluxHFaKs+hGoxNdqAuvXyex5fzE5sFXS66Xmbs0fYrWBx+jBT3l4+WqKeKlGxZt4lyZ2L/BgeX
 KTZwM4pIcokrsEp3RrvDpvASqsBinw9sUcEm2WwU6hp757F28tQpi0VN0LI6VErYXvourRrEhkx
 3FjnDFjwMaKDzqo8A/sNjovU5bnssO0g35QO9ZPitJZ0J08TVO3db5ymCcNO4ManARkw2taCllw
 nix2S9t9dFcOqbGFC1CAUX+D3b4bLOV25x9T6xpbupCsFIE8IqtARgLBgaQ5Iaz9d23d23wkiBm
 K9B+IObkPRXAx2UJezPrrtCHKhWnxUZDGA/ZgevELK/iimjEv4kPYwUKOwRN7F5ZZGYGNihlfi7
 QPfPzuxtngRLRQs8Xgw==
X-Proofpoint-ORIG-GUID: h7eSUbdwnBn00B1hCvrfHN6Dr5m0ZvCN
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ea2b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: h7eSUbdwnBn00B1hCvrfHN6Dr5m0ZvCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ca6a72a4cf80..ba8ff113cff1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -123,6 +123,14 @@ struct drm_bridge_connector {
 	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
+
+	/**
+	 * @hdmi_funcs:
+	 *
+	 * The particular &drm_connector_hdmi_funcs implementation for this
+	 * bridge connector.
+	 */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -465,12 +473,7 @@ static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
@@ -484,12 +487,7 @@ static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
@@ -502,12 +500,7 @@ static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
@@ -521,12 +514,7 @@ static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
@@ -539,12 +527,7 @@ static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
@@ -558,12 +541,7 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
 static const struct drm_edid *
@@ -591,18 +569,22 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	.audio = {
-		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
-		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
-		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
-		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
-	},
+	/* audio, hdr_drm and spd are set dynamically during init */
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+	.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_hdr_drm_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+	.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_spd_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+	.write_infoframe = drm_bridge_connector_write_spd_infoframe,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
@@ -971,11 +953,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
+		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			bridge_connector->hdmi_funcs.audio =
+				drm_bridge_connector_hdmi_audio_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			bridge_connector->hdmi_funcs.hdr_drm =
+				drm_bridge_connector_hdmi_hdr_drm_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			bridge_connector->hdmi_funcs.spd =
+				drm_bridge_connector_hdmi_spd_infoframe;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
-					       &drm_bridge_connector_hdmi_funcs,
+					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);

-- 
2.47.3

