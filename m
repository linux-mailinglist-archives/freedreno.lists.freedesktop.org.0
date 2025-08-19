Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B052B2CC8E
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 20:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2549C10E65B;
	Tue, 19 Aug 2025 18:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIb0QRa8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523CC10E65B
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGsaDZ007244
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=QIb0QRa8heAIzrGP
 AXBqzKI4ZHoUfSR1eAb8IDNQwoM6dTZ8QzzO33m+pcHsZPU2mh4+8JDIOEKKfLD/
 RCin2Ol4oAV9CCWBL+mMoXJT3flTPK1uxYersHokYLdxrdouCcea743RP+Vrb7FG
 YkyrVHNrMgGE+BIrkqr485rdSu+CdoUFsZjZMRlWCYye4rHVYwG7pPAczwy4ODNN
 6ArnXqWbguFKRFZRoqcRqLjXkXIRooAx4kVaRlLV55sokedXGdRxH/arCJHkAtw+
 148WK3+3kWYxrgsAGsG5oh+sre0XUowP5XizgM1Stmk63+Ft68IehdKO59/HqOWJ
 9vmx0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749rfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e8704d540cso680087885a.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629867; x=1756234667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
 b=IDLYi3Qo16lQl1I6ebB8Ch6cdDwVJWYk7QGRD+HxmroBy14m8J/oiPjVQU9/Ct3F68
 l7FwjvqN5GtHRcDLC5cT7uRR8XiBk4BlHtYtK4aoHjkxODCoPfJ9ux6PWa/BRl4wjzD1
 rEiNnqYhir9xSu4CgrrvtHVnIzFpVCdFGhvkYU0V9riZxG0cG93m+Tz9Ui7lc7xFgjmX
 1Yt1flqlTtKGG9Q27dizqJggwjygPibeQdTWxUMRrM2z7WYAst1en4WJ+VLhQiCYU9JU
 DWjBH3DYZBLJLf0xIHAoxanuWBjx7AzKxaXIicSdVZ5EXDzmoDkAyJ+YBmWP1SExJky9
 kZ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6MKBTmmUUAgJ7OSOPNAsvtw6nWqVO8DikbhIZpl/WU5SB1fIzzQBFfBA1zwXPIhxtCkm3d70bmIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEBL/rnvvwewdXNV1qVOkf3TduMzrEA3Llad1cLIARIlYBhGc7
 j7l2gGjawfOuTa2SlP3mAtDma24mcR3PCEevhow0cEHgpPjEIe0xblGkhpcOqQMfWL+9YC2mwQp
 5LUXbUGkukrRSskQV0KOvqWkQBFY1yrXVXxMV2sa2/PCmisaheWutH3ad6VNXJtHMIzZ99DE=
X-Gm-Gg: ASbGncvVjCF2btGGyTYx4K5ytzjTN3Jl9IfDKvyX3Okb47wkTk2fZyhMjcGB56GSI3f
 YNDEyl13CWE4qJhhJlfWX9QIf+2O5d5D1H6szG8aQ/OuCqws+1NZCuhgSOY5zgCkCiiDWr6aX99
 696veycgGEPRPOFXbkgTgl19Q2t9/gu9G6Fr4F8RQ0DaeiT62UTUACIApJqZ+Dio65LQEj8bAgu
 frUHCCfvSbJiD+3G7QZBLdY3TTPnfZGghKT0lul27sfxz4EE/MExHfMW00yCuCoIUYXqjgvQVHs
 nTS6ebshu7QeBosCuxonZgWWpE5lVZU4PElu6Oah62yLexAmvgQ0NxwnNrfO/W36jYwnNEg2pvK
 Nk8Be8Prjsz2q7AlLrNpA1Li9iK9A+y69PIjkpur8ZQkj4quTEBDR
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id
 6a1803df08f44-70d770ebb1dmr764806d6.44.1755629867311; 
 Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHHRhBEXHu7meuKjfvfUMQyn/xX4sNy+2tihw2l9EfepkouN6qL54x+P99KY0cIm6m4WW1Tg==
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id
 6a1803df08f44-70d770ebb1dmr764446d6.44.1755629866811; 
 Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:35 +0300
Subject: [PATCH v2 6/8] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-6-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcjJzhrdtpr84jU23CUsYEilRvFhX2YX678
 OfZlm01HoqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UoSB/4jVjE0YR5wd+GnJ4DK5xi52Yuek7jhDdfrlSH0K80rX/NeKDdZbhLPORAVZ6CFMmsGvPw
 evXQXVUKHZF4ZuiuYTU4gmioVd6RB9vt5FPallgHoGlUW3qgaftCPXNKrZeH5Wovx396cpCFImt
 QfDLUlANeAi0ageLVmUbhJXpqnX242+4QNBYG9U5T8LvWXMljEEaSxbIashznRokT1+T4g6+sIt
 srqvF+4q1MJNHBUQkQYGmlT2/jCX6lrir1n57VxR5ZNFnhR9QrSUMvq7EgZKAfcL9yo11tVpDxN
 OUkM0U9K++rQnD+B1bCpD/MrmOIzhCArcz2/bcZQCfzch/Wd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gw7hDjlprOSGrQOxlWbOQ14wJSBV0yNA
X-Proofpoint-ORIG-GUID: gw7hDjlprOSGrQOxlWbOQ14wJSBV0yNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4QZvvTuoq3AO
 Na9fLtFRm5yceIuHE2Z+6t5OfIH/lyICa1N36IPse/3JJEKqBvj5AUL5i3AVrUZBVOkJc55zpNu
 381MuaWmm6kA1C88XIB8y7mQD8Qc0FrT+BP8eBcrfGtg6uzWF9cetXXUvW1/9lRdC5kGvk2mcnR
 J6S5bxjzMCFycmUxz8oNaOjiLaspYDk9Pkmfr8tO2UVKcQQAH/sCSiSgcYg0t0HdxqrIjDd6yvL
 qGMwmqmGcPJydD1lWDuU9xg5MCrtwH0AIKsIsJF3YGOXQoQu9MwldYfI9mKbc+iuPsbJXUcTuKw
 fAok4b47dkL3qbWF6frd1ZPmG2jraqxKP5GZtBDhnOcfGbNFAwqcuncjqTD3ZM3mGNGhUZqhxXG
 EzbFfoVD
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4c92c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..aa36d203f38f0f5a197afa8493fafb20cdc43476 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -498,6 +498,10 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2

