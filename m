Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FDB28DCB
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 14:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFB610E376;
	Sat, 16 Aug 2025 12:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghy7ow3I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F3010E379
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G8FXvg032194
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=ghy7ow3IhXPGTqxh
 rU4w33RBBu9X2DhL/a3zk5EKlCbeZqSqXPiDZgI+ZOqS+s/MpP9WCKD7YeKnB+N/
 NbgE/2btK/ESkOEbf+ABvy2OU8zm4qLvgDMwh2Up6tJpZlgZPcpnP1slSbCv4zTF
 IL6OiD80boGZjmdAZ51B+0tpfRVdyJNyvRuFQZHD/2EOyHaWlodp7Z69InLwRg0C
 +I2jjjAoauJeGmyy3hmJI8vJjoqWoCw9RQOxrToalLnQlO3R00jW1Bd4SBd1lY2N
 gxc6uYuBbls3UEoMtXdNXhBIDmfwpHCLedeIVi2hE+nO4WlpVwP+LOkoWoDnnGZE
 MEt89w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfrk0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88dd1408so59617386d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348076; x=1755952876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
 b=DdEQNXO3hSNZTm9crBATNTg63ahCQzEBCYZIMLJIzJFRmm7k9JWsm5U37xPPiXuf99
 6HMxwtLN8Ns/svmLfYT/wyOHuVQ9VnErPHF1YIh+pfFMCJ/75WRzKa+4g1kdra+ZqfZr
 Wjwe9fRJsaJQAbK8m28uSSDXrwZQjOM+MVWSnZxTRg/jFZAuLeQbwhEEdkeCmk2DlN5G
 8XAG71E7ZJlOnEHkfImZbP2gcU5A7gjPHlm/GOSQLzCgk6M0r+sm1fgQq2vp2HKbvBLT
 7EoLj1A0TAgwoUoe4a1GADHBqwbQ3+32f7v1/kxyxIsE1U5JhmCSqocY4Smr1xERqCVw
 Etdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA/QTF2hyYkqlzc/WG3U5h/vfBFcz0fSdUYzRxQ1mBjfT01cwPzDW/ZgyagII7lSi9iXZ0TSepYdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwDf4VNYgOvxjLIEXBmpfSgT9ulZ7N3ivZihT+hOQGsOZvtbNS
 UzInImSb8q9urAOYh99bpjn5w1ECr2dSZSqOKa7J6z56iQaH17HvddmhTwBKS5mcReV1qMI8ccv
 lU3ubevCqSi9J4bQUm+0H3cHl4i7sTL8aWf+/VdUxDLM+lvzo9uZCo1zYxawxeeGYDjvjw3A=
X-Gm-Gg: ASbGncuXzI3Y/bWKWoftjqcdfCuKriTXh28fwIq5fWIBYr2yAnAv2ZxshjztwNwYEhD
 iGX1AgHe0QDadhutV/JBSWLVSH296ilnSvhbT0OV3td03N/GxuKVP3OQx1E82B0M8Q1i8pvqxBD
 jy/Rk61RXARpFvM1swcbTW039EcQgTaefNzjYzL/T4SBrluOJKzmaOj306ZZu0NMJcrRBx8x1Bn
 cxv/QOfY4AzYTnlYTr09qjvX/nbS20TD425G75oixbTAEjS+En6lQ63tzNC6lSJx2yirrxrLUrn
 e4ECXKD2RoKtMc1u8bcMd26yAXlt8fJ3p36uVS6LpEMn9815cWqHOSbL5qhovTNgBCaAohlc7Ul
 zWaKSGetjTOkCsY/1KSt4NE71Eli3fWMNd1Si/YQKPvJnyZAyDWh5
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id
 6a1803df08f44-70ba7b0fb72mr68628136d6.20.1755348075980; 
 Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3UdiNBmKcbNBSZ74rRqQydXtIbuAXtAkdOOj4dUPQcZFQgwFXOOSXEuXuI37B1EPLUu9GHg==
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id
 6a1803df08f44-70ba7b0fb72mr68627786d6.20.1755348075573; 
 Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:05 +0300
Subject: [PATCH 5/7] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-5-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfF817cuWm0x9Ld7mSI9y3aEDv6yVOAaz6B
 PUV1yKfX8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1YeJCACinc5gTz7egfGIB6yk437KFDLl0hTcWhDnfZD9zWOokKCZsuwjgqgvP++oHdIB/be2QcT
 Zp52KAZ10Legd6GZihS8hapT4SrGoW7JbJeeaLydKZcWSQiqGGw8cj0ORAXsTvnFGhql41oNCAu
 AyHGwl+aAB38jVvd75yA/n7qZRM6iKDKeQMJbQm8Xo4EEXg0Vu66iCDPWSojU6TBTNeJPB8qk6+
 SUZJhUXTFUN48tRXFM7oHP/Rp/1AvxRedsNDY/trIp57DbbpxwgD7NVyWe+Y1LmlDm91m+TTX0/
 158PCZIFuFMCsoNY810tLXPPkT1IJScS1Xraf8Nuc82coAtx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gwe2-TLBjepvRgxE0FEJ-HhhFYcFjogK
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a07c6d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfXzsnf8NcbhjxN
 5d7HxtmgB/WEQi3aXa6xmz2qXknxbd/5zkNLSkP0Od0o1xbz4KBjjWnHnOFN/tTnlAwe9TqqmaX
 CsEWMaprJPILBnmhzjMV/RVvRDUTXgdojzJSpZfT0oibf/uvNX9L3ZwSeMO+kqyLjj/1n+4Pi3M
 3HCIstUb0ZAesdZ4tee4PUO9NTSGy9c7+Ivp31B76EvBNUFUgqgMJVC01RpM8nV2tv5uj5EmZr8
 xzTzATOblx23IVrbyxdyw+Ap2A16nxGFESjdzs7SGs+mBKQ5TTGyvwWtHNh10558tnYH1pUkiD8
 z3uDd8bh60EjvdoB24wgkWVWCAvv/VwvQGeBobrcN9EctQfBl+93dPit5Y2Dx36ziwWqwmtTxzt
 8N/zAgJN
X-Proofpoint-ORIG-GUID: gwe2-TLBjepvRgxE0FEJ-HhhFYcFjogK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

