Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A2B3C624
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 02:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D850210E3E5;
	Sat, 30 Aug 2025 00:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMrWNzqM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7506210E3D9
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TLNrFl030299
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=; b=UMrWNzqMYMrZjeNx
 lYnPwFSM1DlBJnTfCbOVORANqwmE5ZANTNLbCQxA5h0Nihow7ScdskL6QJWkOmuA
 vnTrj/HyOKDAAoCio5lvtPu2sVEiE6uo+b2Oa+dSqVYs8/PdXmgfmnbY/2CVWKu7
 au00EnICgrvEGxh90n950pV+jSVJxRMi6paAXydM1QJMZxlHRArTP5rFcL+zkMET
 eCRlTP71YCJ9UQ/aErsHTmz9dI16r7nTObvARC+BLZ6KlbnzRfMcOsK6wEfqjWA1
 u+1Rhv4VrkJ3tnGz7xDgal9Bh7h+5oliTjISg7i5WV8VA7v91eEL/Jc5u68XCOZ9
 ClPVBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wectgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so66375611cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513392; x=1757118192;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=;
 b=ZZSYW4mki3uQUSgLxA7DjUnRSuBPalGlm22MrGj7/dOQxrMn5XLkkUvc6dRl2E3yIs
 L/0aTprJdwmsVhrcYNhENpWbHrCqxzIwtn/0TVq8I8SM5hdw2jUtghUWDLCFE+vwQKYm
 z2cxZ9+HapU5r+ADlXiIJi9vJnBTHqicFVTkuh0pPHZIykzHutefqhHKbDW85stc2fnY
 Mx2qNG+Iosy6RLPU6RH2hNEgTNQxQ1DJd6Ua8pF+29/6KK7z8WaJUZGTn8gVQwtJJual
 ArtUo9iFF+DtOkNeA7jgpIFQc683sPbXTHbAKJh7YB9Qp0s4LHBC6sAufYJSCx58G0yd
 UYtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAYwQq8S/g9gW8eoHhsBzXaQVnuBkzuo+USRYj/7cNJ34+phMA5JVwPSmXJTcgv2uio3xrzkLyuoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylAI5D6npdpuBdkFAtCAmwQTr+nTyAfh3dAdBjWuF6orkCVXU/
 gIppJ1FrIVT1d97Dko1MYwi5/1Vzem8ZhR6F3o5ObkZ4r34jM2/uaGyjNibb29wMBzqSqlPvA78
 y0mAW5Cm4BSPgbobyaQfAx+kaVZ0igolZpTg+pnvvkixEjUp0sWro3oZJyhgzaaQk4+pHufI=
X-Gm-Gg: ASbGncsVwqb+ACUfv8I0K2QkSldLqojBy9mG3uzlNZjKMH3SzV6nYRXGcuQT0Y5ZxT+
 typZikvZ7D5DkefkzQXNDan9vZEOEnsmarP1KKdop+m68tdRjrYluqFrZC5A2Ku3YeMncUBHX3M
 SlCibVU3O6ff86ji4dpRqediYAFf6u/SndRmjOfThQt79dwBNP/6GHm5kzSa6pvKvzbnbsw9vtV
 H30GIexhDjChqitzJwscE4Oo3/l5V2L5nAW7CalEtsSuSazKCIPmdYZiAvJ7lZMgCws+b5qFzMC
 BkhsUq/m911h7nbEZkDEhwRBJjIkZ+I15Ov7JN4msCnfIk9kCeYZhJpbgetXZsy92CydtdTaLwr
 l2AGxr4f8UtU2UPhHyibE+mvdCERvXGFTG2S0nTcDr0VnFvWbx6lI
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b31dd21723mr4241471cf.58.1756513391679; 
 Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHd0n8qaUqx1S4BeHPfs6IpVe24aic04/cEgU1Am0csv+xPy83xFNb93VjtGw3hJtcKfrI7A==
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b31dd21723mr4241371cf.58.1756513391171; 
 Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:00 +0300
Subject: [PATCH v3 04/11] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-4-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4s8HKYSS0MgM6zvdVaXPrA7S2HD2NH/k39knkirGVZc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml2SbZ896twlcmpFYdb3yiNI2XV4x9X7bfjcNlm3zv
 ms+vfKyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOSfN/s+U70GO8d2+Db0p
 /pN1z9m/2y0T0DMvz+NpxuZFXmJBn23ZPKsfs4svW+bYZGf3LKdbWyZn2nKFlVejZz2vP7r9Z/E
 E00Bj9pPP38rLZN7Tvp3K2hfeFrhHkWnmKekpb8/mXYoVCMt1+Bztn71ONMRryfo44T1JLy72t2
 33iGl60Wy8bMEafuegeTlLzM3L0y9GWe6c+N9EwnKpp7bm3UdPVlnL3nDd+b/+WJjb1GCZ9u/p1
 y3s+bO9rkc2R5mJrn+TnqR/ZbLwAfuupdoV7uu8bBZYc1hFTWANWLtK7OHNXc0HrV/U/p8bupdz
 16WmTMsyI75JubpRa48wq2S455fpPNVdaKP4xvHWk+oNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9qnQDB5c8k-0gEEQRLGbbcjuQHJ6ywF-
X-Proofpoint-ORIG-GUID: 9qnQDB5c8k-0gEEQRLGbbcjuQHJ6ywF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8aOEC13TC6N5
 +YySlrXV3KkqQH+zzkgqVs9uWCnUHTVvcXqvA/OIub5HJV1vT7JlMXgKA0POaP+LwDgitDncUnh
 xMdDIEGJvSOsUZZGKelEy7qvhI9jOzj+262+Qa54DmLf5a3LqmL+4taVW630ZUTi2Odqx2uiANJ
 UG6MnpX3lWG6MqZBrhguDRbTS6DWglvKzysvEeFF/JxCFXUhOxo01jymBWeoUefY/8vAwFolT42
 bs/+yQuKd4PopA4DsU3zHMyYdIudXTxJQaNtqbWkFDjoQucMfnKjof9TLerrSaXKaKpRbPxdI4X
 Wb+bTaVbMW4yG5CzLKpN3f2utmaJS9L+d6xXUZr7HQ12jCdlRbsyhDfXH9HvSH71wRNdrHF6EzZ
 BUZatC3o
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24470 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..271295e1549885ea054647b06cb95d483e352f4d 100644
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
+	lt9611->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2

