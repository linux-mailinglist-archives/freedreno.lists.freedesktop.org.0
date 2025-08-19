Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE6B2CC92
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 20:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE05A10E660;
	Tue, 19 Aug 2025 18:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjfZLcpa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E9210E664
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHVRxu032168
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GwwcuTSdQf0vvJ25qV2FXPYXtLSGO4QcuUbd1Q+beKM=; b=cjfZLcpa8g0ZiqHC
 za6eFtectx3dKHteVvIWF8BgkDa79oOPaudQEWmqVCwkJGUEvUQNoPIPRmWTF6Fu
 bBQYe694VLPDEk57j30y9ygejpQHTYmeKORc/hHvmeeLaSKZdws+5SnJXJXTIg/T
 7eJZqrCGe/BaRVynTOMv3kTFuHC6aT+MGyH1L0Uf5GRn8Ky2W3TBnl4d8uxaD08R
 nFsSK23dqsamvItlmud5LPV/FrgWTSeLxTGHf5EMFpn7H3W75oIkXxFtxChEhpjo
 SN4JDvPaGuSEOWmDHAlycxa6De74o6ORg+BcdAdWmpsiEJaAiCnxEbiv2HQMT2q7
 iGu1cQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhqba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f57f950so121862416d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629870; x=1756234670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwwcuTSdQf0vvJ25qV2FXPYXtLSGO4QcuUbd1Q+beKM=;
 b=tLolboyAtvTQCBna34LAoSqfz9ecGc5Byl/QPgEAlxikdKgJ0GUGB/Io9ZbTQIyyYQ
 YPaHwhTBxSlV2A8L7xLo6eou7XWyCjc0CudWAqfbfyGkmpGMvfBU8fq0nSuATiM7BwlC
 ThAFP1rBEUqLFEdTEun2nfiqiBs9eUhIZ27jft3Ll0ZpbckIQ9KNimS4rty8pQat5bq3
 VyvHg3ZeKcMtpMCITG7WzUyiNL3Ff4lg7O+fLUekHob1NkUj1siMxfCm5/iwwMKnbn0Y
 0WZZs8tkpgEAG0WjcJTdEi5DGuEAI+c769nifJh4LQhElBbsYq/Up49KVtANJVQ33J8s
 pIqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB3bg4Tf3ZfvrYKwdNRa0aqmSvLeaY7bWG78fFu2ByNI8Q/2ZumtVU+wLam0zP/iCo6oNkCtTVaD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGLphfHCCp26fMPYmSa8r4LLNl+RqrkbDtj+HiIb1ttADaeihC
 uiX6FkK/Nr9OkW6d2AfNKrlPw4aBsM4GIW2gyYlyZELycpvFw+KvHvJkLrbe99zlc8S8jzcb/J9
 FlISIM8d/7S8zvGQ82ReNLszSJG/PFk/RcCe4Qodo3NvTaO3T3Azry8GVbAa8PQZXkHls870=
X-Gm-Gg: ASbGncuD750MZmBvA00zSTmaCZoOs6IKEKjptMX8xZlvtTn4TedqnTGqrj6LuB+Zk7b
 bq7nRwP03j2oxD4xGmtAIcE5nKgKZfubkr+P57a5KQ30aywlkiLxAC+q/XonVzzZhVndlh2q7pX
 c+GjNVD8s7tk6/tGGbx//mowf6uKXCFXNGSCI+I8BMPzPEDtY7sHuVhkit83jkT1RyCsDFvt2mQ
 3hBYQ3k3zabraWImdCser1T9Vz2PHLICam3O2PL3Lk1xlXek9BnJQdgzLoCNwAxxMyFrWiOAMTi
 5ttZcZdqSs++ac27Hpz8PxYoSUu6wAbBmOQZmdb1kmcFinqG8is94OaW7uVmDP89StM0XzS8rmI
 ekt0gfL8f7WcueCAdOlaCHPOFLzQUOUGIGnBd/DTHlVJwwFUiqt6G
X-Received: by 2002:a05:6214:1d06:b0:704:7df6:44b4 with SMTP id
 6a1803df08f44-70d76ff7ea4mr1292626d6.23.1755629870126; 
 Tue, 19 Aug 2025 11:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeB6BspkJmBzVZghKuKkvMQsrc7yh47pgRmrociqcAQYwZxD4o4UnSWHYlSHwPmGuWLNsBA==
X-Received: by 2002:a05:6214:1d06:b0:704:7df6:44b4 with SMTP id
 6a1803df08f44-70d76ff7ea4mr1292266d6.23.1755629869609; 
 Tue, 19 Aug 2025 11:57:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:37 +0300
Subject: [PATCH v2 8/8] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-8-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7deMFPHaCP1tEuAyd0wqGDyMbbgXRm8M3x+yrKhIoqg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcfIiZrdP6T1yKBcFmYUYjGemOpooWhlAir
 XvwHx5bmkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1dK0CACnaQ5P4qzpStTan2KFXA/Co+l8yegd9ipo+oTCj+eykTovOi7mhcG8CZnOFPUnsGb7kQd
 LyZnJQugFjc10kh2vK9lA1XdM4Cf6YI4WK8B7Ve12p3KmEVjnHSYroGza8IHcOF4nVIIrZnfxuo
 weLeMloZjk4ugu8fgJcuYuxcnIpUN8PfaK2EcNwyeJoxv66YrA1H3fQ8A7mfgvlIQDpmbyAhrs4
 3kxvNmJBPnkUKfk2FK+O4X90ktA0eTQdqVfe3mRMeW+YOTxjWtqa0eLtVMjV5QTjc1Dwo9CK2XG
 PqllamKjHCM5PHS0RBut4Mcu0qyvmLtxANCYLQWkCP0lKqND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4c92f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=98uy0pNEvqNMg_-Oa9cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 2g5hVIGiy8IvygNUtNbcoLGC0DAonpOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX1UKAPdhnrsE4
 +KGPWrMVw/st5+psXg1p3Q3U3Basiuep9oIQMLTjE0Dp2lMy5mreMVggTwPDIph3xaTY6iR0NPl
 jO1aCroDB8I5XZRPJuOsEjJlMYLJv4tJXWe4LOfDLx/n/BAF74Hd0eio5sRzShrB7S9SauooK2k
 eTvmE45MKRz6S1eS+biPoO8DgMR0QBRFqyc/49wMTgR14oDZ6Oq+jaUsjcIFWSnBxlciWXdysX4
 gI0EbfNVO7BFf2ZUoL37t4QW/11ssVNNV3WvF/EhDDY6O607Vha27ZBh1Kn2By23w2O4r39I7fO
 3RY9qhBEWQtx3HO5OTGkajoDxnupaMPYO6HiiYvZ7oS4sIYl+AE+UrVNHe7lVBlvn6gYS//9+PL
 sunsetmO
X-Proofpoint-GUID: 2g5hVIGiy8IvygNUtNbcoLGC0DAonpOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
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

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index b94458d5faa9ae283889fc79496ae323bb4dc88c..047fb6276e9d84de39718cb65de72ba782bfb3a7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -781,12 +781,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->supported_infoframes ? :
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->supported_infoframes,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.47.2

