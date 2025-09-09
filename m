Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F621B50028
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5673410E798;
	Tue,  9 Sep 2025 14:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6TqS0/s";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149A10E78D
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LWZV020625
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=; b=e6TqS0/ssnGW24VL
 j8HX5wKhyBO4sXU9zUir2ZnJHrVMlNS9axjvKQUU5CtMNGYCXedC6vV84tyvOIA+
 JK0QHyo5ulNlBcwusOcfhes5nCG28AB4L+FdQ0RfNAo9VUvdV8n9d5pxvH+T2jPQ
 fywkM9O728VyETuFjOtXkcS67+njKXk9bb9i7prOjA+2W8ChQvUb6xKCmiN1jP/A
 N/a8zlM9PCHCdc1I4WO3ax+fjXcGUWD1zOmIOrgbQfpVHzoO7vQe5TBdR/GGV039
 ilu/g+4fG7gVnFTOsM5UHbqO/miyayN87A9dvsx9NtJtLcfYOynsX+WZEbNsFQ+O
 G/d05g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a8g6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7585b6deccaso11461806d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429553; x=1758034353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=;
 b=lsia/RjWLlDjK7jCL266HtdeQfxBT1Fx0jQH89DACgGDXPGTJPeH1DV69cWxCdhWo5
 fhR1pmfAaWE2kJOL4slZ0OANs23aOs5VNQ11bN6PIlP7e3xQ8aUhx00YOHn2RKe/BILs
 laWFgtbWcSRmcdwa9IGhYkmKV5yo/Dt9oyoZtcaxI05Uu6gK9IQCG88T3Nb/ztV12909
 tDVqhCMQ3IMrxQQpeqnWSn5N6LQFxzZOWM0KKt4AnZ39YjRc1mzoQ+XsBMpvL3iHlb9n
 0nbmzrTnCEI8jycNsOU+8j2FBUglg439bNATw4fcneXV9bN7FBou52UU87yj4wgqQxqe
 Z08A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrRDVrmoFx+mYhw8k1yWN5SgvESNYR5NZb+YG6qR712vOz82Pbulv3QpsDuitPqpjXgUekCDEj0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbMlnkZ82VFK/dj2mFvtkZlAHq1WdVSz0NdYtUQ4mh9uTelZYb
 mdY3XiA6pTXnnoX88grL9rgOQaT46uD0IUSPACTvRQ3489nj7w7YzDai7iAQsF8U91yW5M3Gjad
 WTx6Eh4Tq6KOVc6ka5/o3Er64QnG3I61eDwA691Ysz+E/P5XzReMvG9oQsAvdgsa29Ey2F6w=
X-Gm-Gg: ASbGncuWCBiUjuWV1YDG7cnz1Of7USisnMG6hpZsfHm0WBHpmPjUixKttjPvd4ZjSkC
 TMInmpPw1nIxWgjwp+2J6m+YNj9PPnhgs3TiUCuQNa9P7RT/RZITHnIGhRMW368BQAfjg8ceD/O
 tDAAX9ET1Y7/62u9SxNBwt6J+z1iBdqu90GInIaZG2lzgah0B1X1+VW0Z+VWUpOQLdqkgE6YGIK
 ZBjSnDFhJ1o1pzkHx2+c9MynQ3NBNOD+0tmMV9Dv2oTqlEdMKsp5z0brA1B68B3NxpRxvczotYw
 QJz9/ozKgpH1KSIxRCsH2Jb1IViTlmchMIxhDg09bQfN8xVOuS5sW0TMz43hzslvwGFt3KQbAEB
 4UoiQBGQNHH3jdcPi55Wu0Hm6CZfUKDUSLiHM79Vod95kOldOZ9Eo
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id
 6a1803df08f44-739313a7cbemr151871866d6.19.1757429552573; 
 Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDve4l6s2YkUOUAaxLOpnngg8qoLHCn/KPCMWaHyS1kbKSqT06T75VdGjHUIigW6oRqgflOA==
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id
 6a1803df08f44-739313a7cbemr151871436d6.19.1757429552086; 
 Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:05 +0300
Subject: [PATCH v4 07/10] drm/rockchip: rk3066: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-7-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HjpahnDv4iWzcOH6N/sbIkmNRnbCe4ETkSttnmvYk9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bgkGL4BPgsdX7XjtFIfmizuOXrBZvFf/Oq
 7lX1p+1YEyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1VsPB/4iLFY+wAG/K17zLiP4t3HSa+MqZcXP5RqO4a07Z/ru4qsPjYHy3ln/Unz6WWtPUuxNx1G
 wC1tqMHE4jiYFw1S2EgG8AvPre4CoyRzfdUgObhEzKFXnQw/ykVIDEfhRDa5WEWOwilzd/fuaFI
 dS962/TSUBWayf/8939BWRGiFgvjZWtP9QZXMfAOx/19jbhCudCNqXC5rMsqIs6Mf1mOjK7vaB3
 jBj3G75QXeNwLmJR0vKiteTYq8y/JCicP/FVXezBdGf23AznSXJFG12fj6irgs8H3H02MFBoKWU
 kzOW/5U6TFokImtAkLdGpgoG+/2BrclzIiqxM7qKl+sHWghC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c03f32 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=jPQHZD_Wlk31EOZy1E4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: F6RnHYhZOdoYgKsLZVquDL9EscZDc3F6
X-Proofpoint-ORIG-GUID: F6RnHYhZOdoYgKsLZVquDL9EscZDc3F6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX0ZfRdgPEkUcs
 RoTlr5NMdOIkDx5THuyAor34B3Abv7kvFPzuSzYvVE4K426sngOgP2lPZRJjd7hOb108Fr14z3b
 YCBln5wnuczH8k8/f7HQMVYbHNS0FjmJ3sH1y3fDbbSTltilT/1JNvOiMH0Rap+JECIhEcSew7V
 LdnpBHRbTnAILlQWKib+Ne2StenrpZIMgG7FA5qdWnKB4Yrv3WcAntjvZ8xrNV+OyRBxJMEEOKh
 KK0LJYpPsySViwfXVEhQMrv/hZthMH1Qu4ct58Z4IyEqz44Ec7ZMF+READKHrzzJsKhWL5AxroD
 mYaOW+79nYiygn4X2RpxogSsFY+7VhceJ5EibNcMPBZeAXiNtPzbqKQc11ov8EIdquoii7v4vun
 6Mq33i3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..6ac854c0fe4d155b351821782a6d8bbd550de656 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -164,7 +164,7 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
@@ -182,7 +182,7 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
@@ -696,6 +696,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3

