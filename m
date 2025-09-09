Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BFB5001F
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A05B10E77E;
	Tue,  9 Sep 2025 14:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="izj5++eI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5710E774
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTPl032407
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=; b=izj5++eI83OeW3j+
 lV+SOwHzoLSPiRWmCo73yMg0KmZZPc8mkwAtdeiIcizeR8nnTYEd2RCNYsY/w0+G
 aAbUTV6DA0kcfHdnH2UDbpkG34PYV22/AuSu/mbo8coycZW4c7NUqKbRO/rnNACl
 CG7leAvrXzxEjqhBJpxcryG0hhQ6J0wl9UHv4aZxALseIugZuSuT/BFqk9fYy0/a
 DXFeOxIGBEunloPcgtLbqavURcRDcM9NqmXGDo54C1b+A+0XornFwhs3rZpw5cXN
 KbV+HL6lCeDkQjbBw4q7CNWJ65kO0fspWQdy/tUmfgh9OsDJrGKnA7mfFSoMJwAx
 elV0Hg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7211f13bc24so119851876d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429544; x=1758034344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=;
 b=cemKIy2hGbcazMuq28Z96xa+pAFv4LspVaywynkZoG56NH/Wl8VVypmZo1buCe3UBv
 eAjkLASNGDi2/HGRvA5davgynttRgkesYm/HMC860u+wlgiXNCWbCt5qqdVrCjg0PvKe
 ovaUqlyA18iO1gpKHrZ7rCeZw7qPjlwg0inRAN5FlAPbkxnW5FAYZOvV4rh3UV1BwQvp
 Bg36GE8yBbSziGinwdJTLu9TlUu6Q5uUAFKMuRy3k0a+OSs6q1uAIikByfc2jPKPP1g4
 UucbdP+fXZ414ZYUb/TmLpw6piuJ2iQvMohu/BbqgSIzGlBLI3BjblOMfTq9IUnit3Fe
 Ib9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwoL9QtukGZv/iis8FkoVnREc54OAJO6SQLzFElLLL11wsWfxc6QpnhTNG8wGpj92YNyEqlGT3vw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl7OLng2bfR3jrYHlGkjSFJQuoZKJtAfCdkeN8NiVgbjepQnag
 rVyNM1TWTIXT3dtqYup+e0xIgeDOTwL1FibQkmFc+ZOCy6ebvYjEcLtNbb43I4VhlY7mQTaz96U
 SdycwZ2GSn4HpXd60MVg73BOXVIoEyUBqE4BEV5lXVkTIaHVwLl4fZi7JoPSg2Dw4vwAFK84=
X-Gm-Gg: ASbGnctlbIYeRVzavkQOVJ0v7LtywJshSb2IVl5+u1Ro/znKThzeUyCL3OOg6VpFRa8
 kMyNdC44CId5VtDjn8lHUgS6quGmIy5HP04TYcB9yjKf/uGsWFBAKRt9gryOB3IoFaWSld3f9J1
 BjUEwNFWpdnfKIKfEIG4s4nvySDC0O1zRBHV4a4QxZ20kc0ZK25ILjCyuxb0btnJjTaO87VpUJM
 t6ruuLSYmtqOk0r6lqNPTl34vbC4kcPSgnxDIHkZyS5GWEFD7FEmDEQK5MNDhXzkQLT11QMpiI8
 U130Mzrv9oHxBotQSGDYu7qCQw95bKJCe6E2JoeYD3+WoXwvWG8NYdjDT3QugJ/qAVApG14m2k/
 ipVctUMEVcycg7OwFKwUMSa2CORqWmO1cZdNFbua3LSMhbx+6xmOD
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id
 6a1803df08f44-74112df7c16mr114471376d6.43.1757429544076; 
 Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3qcUmc5HWgaItJBSMTFOPrjz9C1oV8lSQudH4aunMS3xSVXsDfkPrjvpJJ3ZzD90MSTY/GQ==
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id
 6a1803df08f44-74112df7c16mr114470966d6.43.1757429543548; 
 Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:02 +0300
Subject: [PATCH v4 04/10] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-4-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe6mOiGmmn935q5ct0cr/1pS1u83FZ5P13mkK/k89p
 azua//tZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEAuTZ/2fxTphaase6a52x
 1oaTii/vV/TfvytiaMfGldjbGWgZYH9IRNfivDu7klVbM69V5pWcToEHezsZP0/Ke8Hklx9XWGF
 U1DXfrp+78se8z+v/SU+zv7VzBWOSMmtrQ39OtLml+TUW0xclu5P0Rbnfbeq4Ulpy75r6FrNT//
 V2rdsewHFOepogxx6zj3PP9zLlhZXMUJPPvBa6tJz147wmyy5XQ0OHuEkCc+5a2om/3/Z4sXH5r
 pczrnzn1GcPfpmruPKrveGz0mcMv9qvrWzr/V4kzrPWtsBw+oHIu9LLN15OlGXwdD8mHFBWveqM
 UK1S4KQ6xZUsB/Y/zVnW88I622/h77iPW1/HpF8J5NsMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX53wfy8dhKc/f
 QVhOQAIAxryTopTa7ZiSeUumE7KmJ0fwwtUxFHTodbLERZv6QkwvhngToK4t7XIaDLdTxYiiI2c
 JLXN2aWDY/bvQwJSKt8fl8SodO38RmX+5jFMPp7KkLE1e6t+JZGkXsWLaTytI0RUbXjQH2Fd5N2
 EpN50y5gpPqMkj3DGMkD67swW+22gA4U22Bn7E7FcSlsCI+m+mCv4gOk81QQi/doDxXW0nIVn7l
 7JeqZysoznr2tmejlXVIWgBwSwaqfF/10UzqocQ8KFllaNvG71Veheg1fTLCJV1rajjauXUS348
 +JCbse8iZWypuc38iVRcGLQFmDqNBq4T8oyW94laMpgM7gPvzxrx+z2Fg/MFOoGL08G1xv3Y6ZL
 4l5xciio
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f29 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: JqEq8B-4qBT3sLZMQkJ9r_QvtWPfncUV
X-Proofpoint-ORIG-GUID: JqEq8B-4qBT3sLZMQkJ9r_QvtWPfncUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..019114eb343764dbc3da36ab02d53ece11f46adc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -870,8 +870,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -911,8 +910,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -1136,6 +1134,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.3

