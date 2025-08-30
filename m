Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B159EB3C629
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 02:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456B910E3F7;
	Sat, 30 Aug 2025 00:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyLAuIR1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC31510E3E6
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TKtVEu020471
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 43JahB/w4Q9qr3p194NSk9uDBkqDfwBgTH71oZZD5dE=; b=fyLAuIR1IcILuZsH
 jXu6O6Tque4rEy2YIcJd6RPskLnjiWIEb9VXBaFQ1RRRXB3BKrVXss+Z5saHca8h
 fTx9wZEvMFFI4CXX18xMZKtM1FEee6O4g427IzKzZfnLQn5pEHVagJ/kYSJeYMC0
 rcOseGW9ufIJtlUNi4HD3Zaj/K48YG94k7GkgD2dg0rcwt4+6xyrqtDegL0JFdS4
 D4fMry66nEU0aNHxptwvqrsoOyzNCTCHtb0cKTQMkn2GedJvvIeiwn7b0WlMth1u
 i2LqJ8buj3UBuTQIsshr2yuD8pxGZKrnZZ86ysanf7BfphgLZ/aZIbD6W3hycpJC
 d2ITiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se1746hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109affec8so54201771cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513397; x=1757118197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43JahB/w4Q9qr3p194NSk9uDBkqDfwBgTH71oZZD5dE=;
 b=cfYN58UpdX3/BXnuPfSrqlKNI8/mEnfyORSrMu7QUoaow0zIh3u/mhuwkMaJliyM61
 1sOOhYMUmmJAGpaQvIgFsAjBcGH+PjP1C7j1G/1RSxImx3OSSamcm1Ul111Qh4LmOjBk
 6nL2yii7F+s4HiQR8om33aKgKHdNsQug0vxbTdDBN1aDuw4ithAF+XoqZYn7AFGb41BV
 +oeKBvhznaHGYphJAX51XxUETgFTBvLTojVyRk02QAG0UEHDMu8fWpeNVnHOWKMCU9+R
 6HhfHHrkbzNOR1/Irzv4wWQVg5LqJ/7uMGX+u3unHROefS0WUhRerIcNQ4rF6xbFLvbO
 ALnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKdUU9dbQh17nYUKbKrSUSuM7XuPGUUns7nWJCTJ4aTiTYY4Kkqx5BgAnqwMyVdjf79QGu+zIYmEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3qNLG7tLbAYEb8pKMeLRbQ1Hu/qTZtgEwAQfRXapf9QYbkUeb
 mc+FZAWGT1PNH1Ij5cSrBjHrCgJWmQY367kAJA6Z0j+piagFzst2eaX73+i2oWqu6IiQg36hHKQ
 D3A+ECPRtsYbtmWwIp0pTKRbgQLh7eTDxapTNrf9dmUDAMc/Mnst0zStHSi58cq3oTN+2jRk=
X-Gm-Gg: ASbGncu7XmaKEVbCususx2AQYZSe4Zu8oDR8KPZ21L8DNxDeOEZOfiFo/ZeM+zXZYid
 VQPkvRPlSj9CjkL0AsPaCwECBvDuozofnII4wAfpBIXWGpoeU0eI+7OLqqvcfN6dpevSa7YodX0
 Fs6LDcVUZqVyXiiMC1K7fw+QOQm8a0zdT5LrcaC5BKbA4PfkS3aRsXeamK+bcsqCru2Pm/hRkC2
 tcJJ9K2AoGx4FI8VmQM1PFpJdL0VarTQhXk91ROurPuXNjjBp7hAnep8qssgOfKJopi2HbEQzPe
 TS3xJ8D2P2Kj1W4ZZaviTVOYIN4Lb/fZ9hStlyFx4TUrtLS/i4CdNuDkS7IKtKof2uzNdiDa+c3
 w9HjAiWDVVRXj3ZPiXQaT2xeMhe1w7FbVkFmTzcqnteHyJaQ1G/6+
X-Received: by 2002:ac8:5d14:0:b0:4b3:104:792c with SMTP id
 d75a77b69052e-4b31dd03c17mr6898871cf.57.1756513396960; 
 Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4oJ6O6HUL3QeLNimMJy0MJ4h9jyGyWC0EDFCrFCF4+QEafGCozsLgZkA63r60xpdo27y8Fw==
X-Received: by 2002:ac8:5d14:0:b0:4b3:104:792c with SMTP id
 d75a77b69052e-4b31dd03c17mr6898491cf.57.1756513396484; 
 Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:03 +0300
Subject: [PATCH v3 07/11] drm/rockchip: rk3066: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-7-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/A/l0DP2POBzFZyyzIjBAuem9l4ed0fHlnMMJOHp1Ss=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YmlxT5296sO5kLeZM2n3p1M+/z9QjmgHnJS6tXfjsTZ
 fvOL6auk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOb2Z/Q+H+Z4t1z+UTCpr
 ihGM63rdtftGwUyFjQpvlqzSYNPI4bvaq+/7ZDU3T0azBUvytver33ccXfDWvORvXfD7mddcUs1
 rdH/aTFs4xc1r74unr3IzNjDwTfGbMbPZ58gS530c7UarUzolFvoH+lVVF8XFy2R2N7a8VnnTHC
 T75EnMTp/5a89vdik/E+p7tWh7meDOLXOY2Bs3yhR+11XR85kcUh4b01V8bMaTK3xmvwSmsraty
 zf/m3cqesWWcKuS9a3J4loOd/nvpDOf8xd8VLA277VoHkeaSdYEX4Gq2q41y69v2JuwNbesx7s3
 smeXjsQmySCPlfze9gs0C97zHYvj/M8WuO7ctByN+ervAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 984bg5FfZxOAebLcdCsDflnK0VA8OMNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX22nGXMPRN9R7
 Ezo+EqE8DwqSbyCWrnpvSgSyMgArA2sVneHuu6ya5qfS7t+M1eCWH7BSCYf1Lk4qnsZxPUT1kam
 R2sm4jv7+5ezmZ1RqbXfOhd0hqUznRfsQr65LW/JImy+emPdLEEoY1feb+7p8/jVrAdfrKx4BGI
 co7b8mM8xYj6FsC7Hh9TX9b348/118IAuy3Tvg4prLaNqtnd/XiU8G6RN4HjXl3QVIaDF2UvF1M
 6Xun28jDJhJc0Mo/u/EcZwNfghPA3AM39JdpxW8BJ8kDMG9WEglL3/adMeSHlvGHnhcPiloYfa3
 SaJSMe+a0KaDcMafij0YChAB/YWdYKzdG4bJhfy3qU9fQXGZhGfCUJjWA/Y7nnHiSiqW317jSdT
 RIeoHail
X-Proofpoint-ORIG-GUID: 984bg5FfZxOAebLcdCsDflnK0VA8OMNW
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b24476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=xyXfUSUFIH5c4GhWOVcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..330c3e6ecaaca1602aee497c1a1be9599d1f886e 100644
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
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

