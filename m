Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397BB3C634
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 02:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3610E3FE;
	Sat, 30 Aug 2025 00:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS9etg5k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E35810E3EE
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TK6nmp025449
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=; b=gS9etg5kSlPjOI9q
 Dr4xZBf9qVgqpsTAtzWdD4ln9CuhebiznCcCdFYeV0IxD6Cy2TKTzSMoehX+04Zs
 VyASDMByiEtgL40oZsldbgzADMdmO8rZHMWIZPr9ccKOUx79Q6GzIw//z5WAGGHC
 9MnBfKrs+LVR1r+gODwfqHoePUJ5o5zZHDzFP7aqjG8+2pZrw3QRaol5+RKaPdtO
 vJW/GoCVmwWmMR4HQ7AROXAut5YFecrwigNnR82NxTb1fowPr5Bf3FpYQKDX0Q7S
 JTOflOOfgcIi0p7wUgTJEXN65tNUIEz3R2Kc2Lm+ZpaNVbRhtJzzsd4iokfMqUNx
 vQGa0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48u4xyjj53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc103bso56211841cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513402; x=1757118202;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=;
 b=KQr84PW/GV1eG5vuWRTznzjZq9JW/aI784ba7QMNNbxKB1wjlvWlQCINafrHbnDld+
 bT4AupYga7QV8kVd9Ukihfvjl6qy1ATVkB2YYOOIFCFQsPRNa2PR2w7mmFRI3CdLZZqG
 sGLbOwNg0Cy4bzmvJGau3zPxKQqvwLOfmBegWWTgLg7kPT+fI7AGyEhN3RFGWWaFRzUV
 QnCpXXXNIlq1wW7bxTL5c85A9phT5TOIpTxQvcJIo6+hrdHaD6xmARDNTRoToIrU7W/D
 dFN8P7hL/KzUZB+sKPbhx/EWeq0cKIOP0p+yClzYvV1NUdA4BTym/KbSYq5IemBwvqvo
 EtqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxECEPIMm6A+RP861OK/2yHho5TZmFIVpFAGD1s4iOfuX7mRPX+npCEdadFVF3biXsqBi/fNL4IUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8CL0AIvxiRshKZQSxntQruPpAZmy0hhcRtHxngPSUeBFWewO/
 VDWeWa1KBGggfZVCrsBfyUXlDcJJ7nbLSD77ZNcqHFUbltfyw5PB5t9WutnU4BEKvNa/p7m3tYv
 SqK6pJAVVemPndr5XFpaj2Oqruw7G5oXiX/MC9bDzfDjwn9NwppQFuYSnWHjSKwK1Fn9Q444=
X-Gm-Gg: ASbGnctjxNRyohTAMWY6GE+08BJz0iSCU3NHDZBCNQPBKgIAHRPZKaZ84uAUB6QrSSX
 c1AazjS9pNUw2ZCQt3MXdqLdNBiM0Kmnrn/IL/uWmYUmsODZbaRQRu5JkiHLP8iG5faDD6F0vNp
 fvIH678uqBqr92sHGmnMMoK9+aeqJ1BVIZ/FfocBjOxA1n8myMz+7yN5vHDLLDYF5Hio9lR5bTo
 aO/rpNhbFXEjufMVTftGnF89/vcVpQcanxFNM4sRytOC3bH03/BVN/W9J/GWzxpXX/XCvQ0jM/6
 fBWM3m7sfP53GRg1HXI++L6QWx0TkZblJAyb60y8ChgejkhURdMEO8Gx6fX6/uX1vsMTX9Q8kSn
 KGuucvdylnUTrh4Vh+R3c34huER2Y5RXh+O+9BoiT+OUspcivyPT+
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id
 d75a77b69052e-4b31d8607eamr5635131cf.28.1756513402163; 
 Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgTkXP9pj85NxwpdQc0ae5nNZHcprVUGekqFYFf3riFk956UhGONyyTfF4B6OsdIgaiSMUw==
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id
 d75a77b69052e-4b31d8607eamr5634631cf.28.1756513401513; 
 Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:06 +0300
Subject: [PATCH v3 10/11] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-10-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DP8WKS09AQHIP1eUa2wMNyM9LpBbwdIRAz41gdvU1po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk2UNRsRCHOJKzLD77zC3Q7JVu5+ElSTKGc
 O0A/oyeiyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1d8OB/0RMEMUbmxG0SYUoq630dkm8bopfypsnF25uIBgBqc8fbR40rj2Z6O/aFjiC4pxNRKtv0T
 Pb3wXjEx8igMQQyVkYQs5YH9EizhVoDMP2qbMuQD83N2hhtJsjCO9NIG5nBEgGmQDZXWFDqU4gn
 NbRVO+Cz6af8mXjkexPYvOzEvQceTImFY/x9fqz5j13/z4q3QwePf13Pxhvjbi3Ggp4tvM10wqX
 jp4foOuMAal2wFUF9OzE9JeZB5Kuv5vgwi7qeNFxyo+/bSmE60uO0EtP+Ab9Yhdzc8D/TLSUHnP
 MpGBkAz8OvKT70KC2H3AaYh3YkgsM7FphRVhkLoXKB5BRL88
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDAzMyBTYWx0ZWRfX8W4CGwH3L+au
 c6E1CEgPekywJbNM2MAdPFBppfPnb/73zkH0fSjTIpwwyWJP8ChIGEgtFcHisB+moImfbwxwUvq
 faUQ5KkJCZrRCG+pJII6OS7pfXCk2thFbFHVHLXWokSCIMXBE9/tYpOzl2J/274wsG0fvTRzTC/
 5kARklejB747709vbBoQJzg9hecSILJqYSiBiVkOd7eC+uoEzdO0JCXHF3y4UtKttryqAEtKqdm
 dMhBI0GebxVB6e8K39Xcj20JdtGOa34eTZG9ep2urJNFYKG7p/tDDtthu0HOWk5YmqiRH/CDnkS
 NHIl+z+iDW0CEeEgWdzH7PvCMFbDO6zzClVRD+TFCtCi1chAxnscqeEuNVVpjIH31Auv6oh0mPC
 INBD0b2T
X-Proofpoint-ORIG-GUID: JFzmd0R8Xw67OtKU3wztuRV2P0f453rK
X-Authority-Analysis: v=2.4 cv=PYL/hjhd c=1 sm=1 tr=0 ts=68b2447b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yc4j0DFJudTMt519TXkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JFzmd0R8Xw67OtKU3wztuRV2P0f453rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290033
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

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames (either
software-generated or generated by the hardware).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..dfcd0e3b4b0d7cd6adda78dbe9d6e3f65e8f7ffe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #include <sound/hdmi-codec.h>
@@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		unsigned long supported_infoframes =
+			connector->hdmi.software_infoframes |
+			connector->hdmi.autogenerated_infoframes;
+
+		if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.2

