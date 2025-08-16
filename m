Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901EB28DCF
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 14:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32A10E381;
	Sat, 16 Aug 2025 12:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgn1liOc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4310E37E
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G8FXvi032194
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=pgn1liOc6Kjt3D+7
 tK3LPtR0cFhpN/7UXzrPO256Xo+Iq6k0LLE03rje0GKKYeZBZKTxh2VG8xNXmaTy
 Sn6XScwZs6acyk1pWW/4zVXFg7zdAtJ5dEU37hrpZzIafYiunQNvSjgXkrkVR0JO
 eZwv7UYpWnkTTjrduGBf/1Ojg88LzHiOMisKsjjgNZDDoFulaDUm7BdzaQYF+EU5
 CT5DOv56rPRULdo8RuNx4I+p7pXc3RGffS8h0vgC+Hzh0JrcStyjuaY6kR7JubDY
 ExBTRhgfDiseTsXlx8X8n11pc5+A8GTh0u01mvJr9/k6xSwdd4jjxruWWUk4gGWX
 2tbqeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfrk17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f5b3601so66855216d6.3
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348079; x=1755952879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
 b=UW65O97aehPa//YNjGoVwfGHJVz05xCbx7xrSn7Q5aoG2E6gL5g2sYyWu7a9UsRNxH
 CenDJlWcUDOIbR/nKAc/lV+N7KgE+NE7M09jZhyDm9nbekzY3McxYCA9zGso4Qn185/8
 Kp8unZl+ep8Wchj6AuOFj3K8GiddgXgYBaAOrq/xsDVYu25q+bTpTsea7WgjsNSrP+OF
 OX3RP88Qx27DGFB68yFMv/yDAkKTD67b0tHeHv6DAo2/QI3XTOV0d44TCiiJ312+sGCA
 ctr70rKpxzDnMwN1bFv3jaVTpJ1sM7UNmG0Ah72MWHowY5c05EnJTj4wSo4kp1Zf9eJR
 DLXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG58fD34peqkUbZtj95q4zd7dP8FkYvkLHaeahMwtMCCUbFWHQS+FhVdU6sn7vNgjKuWmE1u7Rl/A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywLdQM2nA3Wxi27uUHNHXUNL0y+ctVoauj6URLxmV8JFcqGwYy
 Gq8GR4NBxaqanfOU0Dd5awd3+XQ1o0V4NYJoBobwGOFXy6GbZgdMzPElrv2plzqyPzg77SzsyZN
 zMIbtqMic4+Ny1OnZ/ePeZe+g/ZNpj27fc29Wai6fGURv/44tyAFmvpBAaj0aKlQ1l/SdKuA=
X-Gm-Gg: ASbGncsSkrShlYhzQJk8N3hjucpgV1FMLN4AQZNhKAGdlLM5re1lRvZ/v8VQDaJM6P7
 HCMCfmMMxAGrUgtTVB+1y5tH8YhslwEf6frg63SWaQL3nPll+oWB3Qjwv5+mZbpkFKTK1R4dlak
 HHAT+HxcQ9brAB1jpH+pn+l29CsmIdicqMJvl5kyJ43/Y8U/l29Md0FkbzhQ4R9LcwZnkmovdlx
 R5qHMYduwm9LexTyHsZhOuJ9Xx0jZIIxPggyYwV9ylgN1BgZxExcwOsDFEez0EeLoAzBtLDBWfZ
 MoCKrfpbuLhLaGtUwL0xwyLykc24NP6E7fdbk+J9hvk5CgM6YCKc8EpNAnv7ossma2BoQzi5Wc3
 sjRN6AiSoQbmchp4cbEyN87EpVa5RulPo4i0Z3Ih7zcPm18jc0jmt
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id
 6a1803df08f44-70bb0618468mr24914966d6.32.1755348079210; 
 Sat, 16 Aug 2025 05:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOQL6onlKjHcTQTSZYwcPj2qboHayn8rKRBdtJHr/kNyKMVVa+u6QH81eKHnsSjAYM+ZfZeA==
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id
 6a1803df08f44-70bb0618468mr24914666d6.32.1755348078746; 
 Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:07 +0300
Subject: [PATCH 7/7] drm/rockchip: rk3066: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-7-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxgMHi4qTkGU45yB+UntdRBVmKZr+x/UsM25
 LEGEgGfYbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8YAAKCRCLPIo+Aiko
 1djgB/4wOmA1OtnxVdCPZ8Z4di39PIjrPkMG0uQmJI/t0Zc1l8LN6lav06X+zI2KDVDqJtxF2NO
 g8QqOU8UNZeo/kURELWxqyJZzOrWgG4qXXEA/4nBe57GtgK/uBOASm5cvxECJmXXrAsl4xFlcdr
 84IRMNS5lpy+y6HeswpNMDsppcEqals/0nvB0xhbIFKM0VHF2eqBD3sWZiaR0h84BPiU6vcvvbD
 lBsE0lzCSfEp0EC2XQvwDi2OJBLUdr6oBSvcad90o7e6CMWks5r49JFQ3pSoeHlLXx9875g9neu
 Me/+6Idd77ROmdlT+vKnBkOG3AAYvWoynfGMjwl6WnS6TzXc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: o_2xwREWjz1l2DHg8W9gPiRQLQRgZm10
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a07c70 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfXxHXFEpSosAtZ
 D1N6qFfKGgjzRBtXpO+F9yR+r+iJNUWg+u0tkei3AzwCrQrDesjbqKzQ1rAwW1Jvev4GHMXeHI6
 nPyIYObFlHHlTGnQKY1eqxNTNpuzOKeV0ONJhliIyMzquhp83fmTs6KhirdbvAAsJtGiz71aOZq
 l2503/JGUjWdti1YTGL11oZmpZxcA1+xhiiMuierIMUYTTAEB+hjwgjNkUBvNmU89SxwXwOEe9D
 4PwgwYPabPZYKASZQE2KLq/XQW7WXpEkYOrrNMeHTMDqFVOYSccwFzQ35XR0jCsG1bYPRc3VDsa
 5NLHfh55twhncncr5zKnU+klSMrutK6h7yuTytPhnzr7FMdBEp1HhLaf4uQCBdyaOohYdnPhMpk
 pTq1LAq5
X-Proofpoint-ORIG-GUID: o_2xwREWjz1l2DHg8W9gPiRQLQRgZm10
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..75bf9a13d8cde1471e8b7e8a8f5f4c0457dd0a14 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

