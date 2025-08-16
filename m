Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E62B28DC2
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 14:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF4510E150;
	Sat, 16 Aug 2025 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzF61BOf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0E10E150
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4lnQv031013
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=BzF61BOfHC/Wx1vM
 JMbO+2U9ceQC6hSZZqpe2WMC+JYUUEUgHqmV2su1bxNxoKe47vYUAbfiWfx2acoN
 pZAWVO9TtuTS5hcedjk4ESPa3OPqJqQsWJLC9CKb64lNo8sW2j3qSTCpYDoAInI5
 RTkRAaciWPSackxvFAjSLUACz2fLhcGxoiAcZeGcZuWAxtMtFWl1sTkFIKsdOYEl
 RK2k5a5C4CtUoWYrVc7IoM3RjdE1l9eYP/qtg74Gm6wSsOQ2KV4Qd0nRVL3iUlA+
 iF60U68OWNMLyzMDGvzaU9hJdL7OlT8WU5Tx4BrDyVrdzitRaI6hYqEOs+dAlcu3
 /2476g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99ghmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109acac47so76959001cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348069; x=1755952869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
 b=ECdMoWtVLHW+A6nbrA6ywTWq64oXl8Im9Fn17mx59EmQrCUzPGfcgBCjbRe0zTbkJn
 iVh+QBYs0dlonx2eNRJaGiThVs5beK3XteGD/8BOoAcjfSULAsJ/3q4kXCm8P5hJnKEL
 hmFnsFHc0dwRYU45MfDP+0FKS3m9Xr+DSRz6NUgvIwQreA+hzD743dTbMCjFRAVZ4YKT
 Fj5M0XClty3ozzdNp6J0CQ1YTgaCqUZ1diR70IoqgLcfMOL/bb83MH3YWzi6D6SZe+Z5
 Cz+irpnlXzZ6gRHOuwoRrChRCU9yue2QyYYSBgHO8WBjrq6Z4IUgi+zv4nCaqQ1l5G1n
 FWFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX38IdZmTK1FbrTd8FPVQquwugoPDaUkMhzROH/apyHhaBZPLOU/4YeRpbD1ERFxEK1/0qfaY6l6Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ8p+k6UQLhbPQQBVYuaAFQ8PHEzsa2AO/RpY/hOqpKi3wScZl
 PSKoQQhlXbXnIliwEh4yYbEgQXhdIRlOZLQfzhlc99VuTAyvBTw9X/HUAp8knKf1FnEZqDkeQHL
 +C34flLFrf/0XiJGcndlnwLr5xvVmdjNSNslBKufDZLx3shJ1eaBIiKCPrdsZhK2HkAqidQk=
X-Gm-Gg: ASbGnctRTFLPUGmarf6HTLwiDG8ymH8jrd7+q04+jS4aeGkFHFUjVDJIiTDUx5YcLWf
 j1ibzczWXliKxvkmbZUV722MDUzaHQWGZjyeLR8dk8Zl0cj3R/Ddka5gY2OymVmyY4IXGSiGnMk
 vZazJGN15YHzbtBJOdOzRDQPILd4m5Lp+01AiBAV2rYG09nHB2waCTM+CA8f48D9WzrLaSsUwS9
 5TYligw2jA7ZDbw8xd7z9NeWja7dVcJ3TvPwag/DTolM4CoM9nI+JhQrmedBWU6XQaXJxqY8fqF
 5mUpn7dt1Vfx5MhCfkjWWmZ+U/LBYqUGFalmxBENtLmqLWZKjp5jgmR4kiIu9IqkSlpUOLAixNL
 oNCLonvxDq9J4kdWSWFuw3hdJ/QNQtshKhQKtHi+UGgbn1RnZr4Kz
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b11e23aceemr77142871cf.38.1755348069180; 
 Sat, 16 Aug 2025 05:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEujKVPrwnqPmVwBrT/6yKZDdIPm7Rj84fddbqZ46SbGO9mqJHM95gjJV/0J1FbKa4y9npTlw==
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b11e23aceemr77142321cf.38.1755348068724; 
 Sat, 16 Aug 2025 05:41:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:02 +0300
Subject: [PATCH 2/7] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-2-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfM4SU8e3MmGmakUS5mUvOK2lRk5Rg6pgaF
 Culi/ZbaOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1WmoB/0R5TBxmhvS4QiRmSEhjsQzSxvsfU1laRFx1oRGjZ1ar4jAOFsu3PQIsiMObIXEZWQYtlt
 Dj93ckAo+pDbud90Fki0EYit+uS7JUpd9EiQbxx96Jg0AkYoYu4KGHxOOUbVAXzULWQ5nEQv1A9
 tUjphXky2tRQvOSKl1/pTUPmRBKOOsESu7sQ6Ies/giG2MuIzwKB5Rx1FdxnfB0kNoxYZG7x/R2
 ETKyAzxVXIvMtGQky1Q8JGRdf90hMN4xz2OPiK4qyyJoz0++r6wWjj1TNzeHLacbKh5IIRzQkje
 GKf1BwdeSqphn8lh67+Vx9V3VP7Kb7S7DfYbHr9aVVy1SIa/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DEtxKsffUzceYRcVW-cs2P1Z6fXDl1UM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX6IB1Q4olL0B2
 PrAVv764JiPwEEVcu0/f1E1tLIUeouoUK2QDDPMr9a6m+cYj3gfJFtD7RSYdLlS+7LNkP/MfhfB
 siB4e3f0xINhFeeW90Y0D07j5FvQAuKGcxshkh2YIxqwOfo8zuls93KOG0SEha8pg3EEUQBVzBt
 /GsZ47WFXD6rBipgDlQ4GjyxIYE2Q6qEBJzDwkH665EERMpF3jFWUvOND96ZeGQDFCyQTH46RAG
 8v6RBrCpjm4mLcFm7V0hMtopsKm/aiT2wUU+7/PV+o07Pdl8gwpkaoXkhuSorYaAGcuPIK9A+yC
 GeJMJ1pQDdvjxxZcCysOXTNT6cb5t043Bou1jS+Wkbr9hEB1YG+EXqkqZIrQ6OHRI43WuEPicyr
 7T4Lf3XD
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a07c66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: DEtxKsffUzceYRcVW-cs2P1Z6fXDl1UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
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
interface. Audio infoframe is handled separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..a9b2757d7a2cda1064cbc564cdded429056dde0a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1269,6 +1269,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2

