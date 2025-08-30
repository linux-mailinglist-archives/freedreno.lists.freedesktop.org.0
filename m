Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA4B3C622
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 02:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D45610E3E0;
	Sat, 30 Aug 2025 00:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UClwzVJg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01D710E3DC
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TKtVEs020471
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yR8ojpGZaE3dckXhUPm62p+tv8/S+wacYcr4NjEKkXY=; b=UClwzVJgdHkDXZo7
 w3HM0F5aHQ2GZ+oRT5p8dn1CO2MLAhjgATxyxp+iakcyr9esh6YHe4ZUpZpeBRjj
 Ik2Gx3v21Yc/5quAu0rD8AjaWkB7FynQ2yGPMT2sdTyQ3p5dLi+8ZWH62WowuuuQ
 lg7kaEmnDKL6WOmc/CutjHol/YWAAKRaPGcX0+g4IoSL8xB/2y4pXhsf9pkzoN3k
 uaoECza7pCvR2bLDT7xtmVAzjw8p+bqzfThSU38R4ssxQrWFLJBYrG4U01wOm8HT
 w6VFuVebCKhIDl8dtJ1o4oJwxidP72REwLXT55tq1sT8XlSEQmJWC1hfwv92yHFu
 UtD4/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se1746gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2dab82f70so75533811cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513390; x=1757118190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yR8ojpGZaE3dckXhUPm62p+tv8/S+wacYcr4NjEKkXY=;
 b=dUfCXCCJ/HmVP1miGLAF/nyDb/t6wdI0CjoWiP3E0n/1/NPFNDBIvHMkIl3Qq6TLLC
 0Bdpp4CRDlUMx+98Zt1yDatbhYzCBID83x14TKd/P4gvGGpmpE8egvnIQQVRMIcLyc/b
 cpv7ripWPCmeBDddXOEoxsobqLFYraUgwXDcr6dvEbxYOH+q3voHm2VupZ24LM9D/CRo
 Ugczdgxr95fu3PYNPGhano1fZScXzGctZ3JapXSqIlF1kjXCCRs6KpuOiE1M1h6dY8FD
 NpaGnlWokaUaTWg5r7exRmun6zgxtKH5wZDQ4SrVz3+q028AVQBfVxT9C79UpbFZHCIA
 0J0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGKYPEcFdQ8TOc47VYjbaoVNsFK1VL6huLK1BGLvlLvJlcbC5ztReX5jQQahTdXWj2Rngx4Qf0seo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxYnTMK09c/4t6pW3MvdsqxRd1n8g/jf5qrXYGFKHr1YQx5wP9
 +82hxeggRUC01MLDR067QtwHRlrNrmJu70FrHOCIolCDHtDEiOjTbqgjZzY0ieSRopVws9hBQdT
 N4SRbt9sRqU0z+kUfvepYZJyFpq9lBXV6MNPwesDMtTlaIN6t+QDNdrKRiVIMHVIYi6LRvmg=
X-Gm-Gg: ASbGncs/xvgkQeQeE8QhIggA5K+fyCL4FxkRZjvzFUrR+ntkkQZ0QEX7OwxgH9q8Uoi
 WPFloFjHRTkMHUE320dprBjjV0+1JG3Xw/S8yCP+sMK0zUXZQEAuDibWImF6CTOBTjjbt6xr1OM
 ufovRlnPbgsQjIdEFpEoQgJ76135BizBAbCssTc2U4htPLJW2PjodNq2AwTXGkh/oCKV2hxDYMw
 m5ekztAapSKDX8XBqgoiIqs10BdWPeaxa7/rmxMWxcXr0G4gwJBS3uXJArNsAmYPpdmC9Ze4jHS
 OEdjbGmNldyLvOfcTySK9FnvZ2cYNT7k/q8rlmNIoVFxy3t7Z5zH8Kru/zlHvDhFUE7XiZij8KL
 3g18mIjlQZeA3U2pKFq870NOQVZZGCsVq+InM9OsPRJS8Mq9SP9PA
X-Received: by 2002:a05:622a:1806:b0:4b2:f786:92dd with SMTP id
 d75a77b69052e-4b31da700f5mr6048991cf.57.1756513390020; 
 Fri, 29 Aug 2025 17:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7MI5AgeDyZIhBXp4nqzUlr+O9xa2caPrlb9g34SvQBLOsNrDgnfALkKyRc05CDcviHb65Vw==
X-Received: by 2002:a05:622a:1806:b0:4b2:f786:92dd with SMTP id
 d75a77b69052e-4b31da700f5mr6048661cf.57.1756513389582; 
 Fri, 29 Aug 2025 17:23:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:22:59 +0300
Subject: [PATCH v3 03/11] drm/bridge: ite-it6263: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-3-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ehca0mnSJRD6ppoLiHXuwtaX4XwYLAYeehZSVf/evtI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRj11vVN09hllSph2xCMLc0Do8yrAjG7XStQ
 fWhXkyDAaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1TWWB/4rD0vAi94fpXgnZ/MAOGSejRTzdVcbXAhKRnofFOaPhsGaS/JXnirro1+t0KnU3RTBpDT
 qUILqYS/Jzl/1JMqs/TPPLURpwv0RrtFpmc/HAZYEcLS2ptOq9zgkpx6EKA3Vu0Q5UjMKra/mNg
 TILceD4EvuFfESWUcc2cjZJtjIIwayFwgP+f0GbyaYK7Tg9o6vR7kh37CYQiAVa8c1Gm1YcK3b1
 C/0Mhu0uJEkwcXFROdPZmEItNVR7kZMZOmfUjYFmjVBcYIwIDe69U7eLVRhFCPqPYKs/1Fb2kPY
 E8QdgsNmJMHRw8efstr7kx/kBQWYWUxXpKZuhf6DFZnhA5B+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: r019NQO5cUqPJ2ztRGEHRmL1TH0UmHlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX0QNjK1Ns+k/y
 VXFBWsAa41FYxcI+Y+mH5dEiXrtT4nmYzELx88ubSB7BpfNC3IexVMflvsiEt5XhEWW6e8IwDX3
 ZUkuzp6tDn0eRvyNfbdlaLjTN47wfsXgsJh19tY+0DsNnp3dTCDz2Aqcch4hOCIRwlyiXcByuMo
 jEiF07eP0Xs3SYPdBn4a5lvy0NkogW872qqUu0C3LfwWUwRP1lu8wxW5V+h7JSmnRFJFZftTsdn
 evwhAmM4D8ES64LG3jnGBaIq8r6FEddMKFKBszuu9T1m30d4278IbN0OY6ahhzojs9hEufgJjPn
 UsqvCbC4ty7xONakzutKPvwuyhq6U9ylCeWVkTGd2ykn0GxrSkkfhfsRFXeRN65igktyD5zJE5H
 NKV50Fqm
X-Proofpoint-ORIG-GUID: r019NQO5cUqPJ2ztRGEHRmL1TH0UmHlK
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b2446f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=HkIXcrnrDl8JFVr2q_4A:9
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
 drivers/gpu/drm/bridge/ite-it6263.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..f2d54ad8fb64254747f2e8e301f19accf337128f 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -755,10 +755,12 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
-		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
-	else
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
+	}
+
+	regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
 
 	return 0;
 }
@@ -772,7 +774,7 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
@@ -875,6 +877,7 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.software_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.2

