Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD5B3C626
	for <lists+freedreno@lfdr.de>; Sat, 30 Aug 2025 02:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9A10E3C5;
	Sat, 30 Aug 2025 00:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOYgwC5T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CCB10E3E6
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFaplc002259
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=; b=ZOYgwC5TrQ70qNtJ
 CBwSeTXLH9UxQ0I5/N8gmk5xlZGUknURoGkAZOHF0rQOsIShKBj5CgBbtNZmf3/T
 dQTkXPx6tVzO2LxWReTSyHfJ+KUdHkyQ0o3n7wBSuO0YF9lT2cCrxAgdRjS68k7j
 +4snMAB9R5JfHWAE+Q9s8E3hmK7DatYDCbWCIu6sM5JbGYbYj8Eio/kUhKjWKBvn
 uDbr3Pd7L3GyKSXCgJPKSosCd3+GkP94Ifrqme375twmU8ar6m3NVyRGD6u34ll0
 Q1p76xCrTJSoRc/aKpiTMSxg0UBwrTlzIo/82Ydm4gxqOJrwzTAPqP/rIWX7GIYi
 10ITvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5vvpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109ae72caso52612361cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513394; x=1757118194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=;
 b=lc3UmNx4V6X4jrz5S2ck5Y3az/25IFQh/or0/A82fHge6VlUWYR8nTkrX8mCu/EOl8
 /DRxABQkArG8GokoCkZY3pCeD8QDsXCbeMNVq3hDPX6F8vHb2UWTW1ThTC0gAK/epzlu
 5G7WBKvUvj2Bi9sJf8JASrFmRPNHwsSZbPRMSGdWLN/h6FSqoi+PL+q/dlriUTHW9JVz
 eJOqKOEDfDmN4h2xVHhwV66loe++ILpUctaQUFBRarAovcrEQm4kAH0KwVuoiQTX5P84
 pv2wmthepXIFfpaOXIG2avdfhzOsmwgaX7GVQrG7OZhP1LzG0uwTR/hYqkhAFfg0xIse
 10bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe0YHnviUqTzi+G66E4wkNigPU35joaHeUIS2crxCWvo9b5NtdA+KnCnH3i/kS4W3p3Zbdzh60SHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR7Kr9GBoNtVWhTkuT5tf7pusaEK6a8Y6MdQj35HrG/D/vo+J2
 ptRMtQEmzRAnfgDuCKG8Zjp2iyQdFRyP/GMD0IobtrcOzfoi86fk9uBKjfCaSLZ1pgMmY95KFri
 UkKjWFmwIGHdciZJCinoPjXmQh4Y76VD3WVJVYllKkw3RwcxkaYa4lladskUMRPckm16pr5E=
X-Gm-Gg: ASbGnct9ditNI4Zlxy7mWSblTqUReOpWKMqnnJEkdMQQ32P/ttljxV6Q1zLxhOCvFKu
 niLLLoLiuKHO1dohYwxN4GOJbm0dFaB7RYCTN1UnMsmsC+Lj2V2Omm2K5mDTCl+Px1LlSORjMGj
 rBJdjHwXjamnoBqmOADEvG1LEhq2tqlmaXqrLrkFVOUNq+csfNVSsQU3ixy9wpySasA7gYDCLU+
 O7QSHZ1lAWlyEl1YSwqbu7zX6fJY91ze+oo5HTLHT8nu0YcMEQI04rs9VtJDLbOnxu8AJNzwOLp
 AbX9ieoSGF7Dz8nENZrAyWz7zW47QJLRYu54n4kXq7/n9uNfb3UZrVjKoSKDO/TF7w61xUaR+jG
 4hsIfYWTd9oiGsIEf1kSMQmaPZc2xs2jQrvN7B/iH+fNDIHSAQutA
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id
 d75a77b69052e-4b31d80cb39mr5664431cf.3.1756513393493; 
 Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ECcTfEmyA0oDw/SDMAaP2b289wQGB6V4nJyogvFjeCA0Q82zJiolJtrAbz+rOP9mbXYTVw==
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id
 d75a77b69052e-4b31d80cb39mr5664051cf.3.1756513393037; 
 Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:01 +0300
Subject: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjn135tRCfVJNBGz8sCeDhP5tCOP7aR8o5A
 t4feOQqmQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1cklB/9ld799npnBEVzpUVL6B/MsuL/WFKALm72JXuja0Df8R5L61ialziPIDOQhwqS7m/CUarR
 BbAyiqXzuPuzqlJe7l8x8oNPMkfoFKSUh6v1bzsao08IUfOpraVdo/cUzHZpRHD+e4Z8qQa+lZD
 wBf0Q4KqCCTPDQVK81CqKt2s49dUX1K3msOCLP+Q9qTWEUhYcipODy0q5i1LOOzeK3q+W79iNMm
 lnkrosjeoE9iQEOOniqNI0p9r7yqKeHQL8lZ+0xiGmqvPd0sbBDmohgkxJhwxe2chOX/N92hTH9
 wpH7XHyXSQPZRmESVQdN7E5BRH3RguYmbQ9At1pUFu6xJ3VQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5iy7aSVYSTRd
 evh20bmgNqzn0vkvoVLFd69zZ/CQ3UD2BrUoy8jfLiMLnR1rDZw+TAyFPeXGOSNhcALWjGTy/gL
 wfvj3UOyNIyjYn4WzBZXHE5HqHQq2V/2GKVcabfItMsxqSs8JPH1xnHrsnRke+gS1uFME80uFBu
 y2iPXsS5X88mvUjObjY4yo6BDJO7pOj5beoQJ1m0LamI7q8PRXU5NHGZm2CTzWGgQ/XDnUXk80W
 wcEzzQ0KgForbV+ze68KpCsexd9zZTb6TugWk5lIV2QzVTxa0ByvVEkg/rntvn/SU1SnSptsntW
 KoLYqqi9OUjQhMjKs4OzeOEqBcbgIKn2kFa2ZJ+iEvwlnM5epzcCo3fEuz3KgJXQ+E/HE5WiYhM
 Xj1P7qws
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b24472 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FXc9NtmIejTHPwvxwzjBApPlAEprsaN_
X-Proofpoint-ORIG-GUID: FXc9NtmIejTHPwvxwzjBApPlAEprsaN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..5320641cb6907a98cbc311a80755f09b88a27ff6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

