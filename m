Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C0CFF5A0
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 19:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDED10E650;
	Wed,  7 Jan 2026 18:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyrngcOK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAKx4R61";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102310E64F
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607BMSGe3152627
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=KyrngcOKBiSTWSSY
 izNCCazNvrE8uikK72XmK+Vv0T/Usx1TJnGEi7FoeFr+BCAWxFn5GM7sB7rkw2+R
 xnkxDU2giwWfYxFgRXZm77sSilAwW+XQfLEnbHeNL5YkgC2bF8pOS/2zY6D1p8zU
 ibMfQnY8buGFHBKi37HBa7fzog69JpxFX/4NuXpuhM5+I5jdzJdUKlQP3QuW94x3
 bA1Uys7tKjWqj4sgvnKSkAfyCHp53cZhkuDxbTa5PCwLUHtNBOuNyxLNwnzd34Ed
 j7PZBZxB2W5SxkdUVH/o8ptaf5HAjEgqZZJHE5EDaujMhMdI9SLzwqRb2mU52Aea
 CfoW6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjasa9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb6a7fea4dso572335885a.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809715; x=1768414515;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
 b=gAKx4R61OyddeOlM7n+2ubdZjhBADyI30W6hl7cyigrhRCy/UexnNmmdbgY+7YPCZn
 H0zQ1e6S2tAuTVExkqoUjkfFyaRPbbEPDWkL5hCoYRkfVPZlIl6pJaA/c9nh2GBCMLNz
 QWLGR8AQP9VOgcQ2mfy+65lvt5UFEO3CXhBKyF8kxPWqqSdTCQZgyX/QFfD10tbKt1B/
 nVBpOaDHDtqGn5FZejORuPUjv4oT1jLj1zXqay5bIRKH9MJ3bOL1qBtvEN5PtZ3xI9ZI
 6Zvlizh6S6I0yCXarrdnTjDVckpXCpFtuwfE+UsTq7J+DOa35mVylRJ1eAF9UVaK+zHs
 L/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809715; x=1768414515;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
 b=gGhBpVam9/on314OVblrzy76za52TSoTNwE7Y4egkwwEp90TgiMjEBUAO9WuJJ4dcO
 YR75lwbW8IOTWG9yznSi0IDNhXf/wJSOkKVg44XdCqkLipgzfD/QSOpSQrcZQytsSaAH
 5bEcpVQkeLO2w784DQFQ1OSAH8oHk/1WMZWTvzJ1TrhZQQdJWpgHDFud4BP7rVvU/xZT
 Prj+YafeQEWfKjrqYkKgpIZTx9rWgXPKwGqS+mxt6ONTz3SiEZYQfjtX6mu+BVtVBE4z
 tMFVbYIMTZMVxHlUHBHewm1MPemw1qMb7ekZGZmCG2arRM+z1BfH4/J7/xAzCOb47slT
 gnGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquEzM70Dv1Mivp7peNWJ9mb0qee8b7M1xqJ3yWwygT3j1WXfQuaWzNeL033JJq80gvWOtVU8hM2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwneGC7MElxht+iFxCt2lcUoYqcHEBAhO0U26S56pQ4xNf41qgW
 VRe3ZZevSe7RtdaAXJmxs+S7nn17C07Ad5dlXvO4dkAKasyUdNNrcc2POb7Z8wA0BoZCM5/95xc
 TkXDp3vaadLTRoE4IMfWPoeWlWyeVx6XHOqpl3R0w/qUO0iZH0p2eMXH2TT84WXzAlhrrxoM=
X-Gm-Gg: AY/fxX50Y6VNSWmnPvis/6AM7/7ulEO4P2e2XRpyMS7DjjSAkwxCg6Oqj8SJ6+2cjdd
 ll1/fvGIvSQuDlYDoJbxbr9Rdr+I8j421HhMCrus2Ai0S9YwOShUssVS6Z4wDD5thhiNnxsh2f1
 lSDyyBhwbFiT+dKQHRZSvw0y+QjoAE4cAWbDQOzfGHfYB6rTsbCKXHCYdakAi5ebFlxJtBb0lxR
 SHzKxI2P/2L3wsQdfPqR0qhw4ovyNJEGXypvLXKURx6hwqdJYBHLQCiXn8d9DAq1rLMlCUSjwh7
 TedGOM1dVJHnXUSqkA0YA0S7/4yJlftQ5QmWYpbc6QzR437heOgpOeH+lh5FFTy2ZHFa2VZkkrh
 G6r+PWzuWiQfFk8uXOoOPUKgjUXj9WnLHayETWtafr3v1GounXYcdfq+bC4IFQCmZ2a6nyFBnkv
 l3UI+4q6j5xTIGKY+0hfLQqg0=
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id
 af79cd13be357-8c38940dd0dmr456874985a.83.1767809714637; 
 Wed, 07 Jan 2026 10:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+D5mrG5EJMb00tLGXnGg/5a3iMwygbvY5+APGv4MWQpPpWnlnvrx9Hf8phdL6F9vP8GwsHw==
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id
 af79cd13be357-8c38940dd0dmr456865885a.83.1767809713987; 
 Wed, 07 Jan 2026 10:15:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:04 +0200
Subject: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoqVOypf3nnz7ysbV1SEu2HFL4awvN5mTrKSPbj51+
 +HNQtvQTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZFMHB8MEnRhDz5j7S+s7
 33/wuCq3e4f0x0ZX/s8/n15gMap103T9tH1VXsdtoTyjK0HrN38MWXF5zjXm73UHjVK8GY/M2v3
 SSqTuxuMI+9iXSq+6WG7sOSCfWmNi1tjVpBC7Sa7Atcb1jx7rMa1jP9dN6+f1uO6p0F7NLHKs7X
 vYqkff23seqZc1hh1t9rINOs58UiHnRuAviVCTrfz7b1QtiT5vyfh3Et+uU3On8c8PKMyJ6V1Wl
 Mzvy3zdzdrznXCNGIfM95Jm3xs73nrUaDuLFp77wabg8FSVhyN77+u9LzM4bD6zrSxoyyi2in6V
 c7dLMv/d453GTG+Kbj738GAInXdKPufnrbyYBYbuh6TUAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695ea2b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dK-P6N5NWPEAPa8RhlMB9M_GdBgi7NYg
X-Proofpoint-GUID: dK-P6N5NWPEAPa8RhlMB9M_GdBgi7NYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4EIDuni0xbjI
 oOvBF3ksnElmFODByIj+yNIJBtH3vow5Q9FWMm9IKas8WwsbOmZj2jwAagNoKYrxHXWMjdFeIOs
 zVbCsFVJGtyIfChPnXaLglfkiDsGcpEWUftDwQPpLSezRSw2mpiit6nEunheHRHbQxppsjuLgaE
 chQ3HqgW57hG7FrrVW4hI2iNftnZnjLX6vlF4tkCuh/ypB8PV3XR/7e8HGYPm+QfOpEy8ewMylk
 V0AMvocUlCjFESfFKyuhVSPj6cGIvUfo/WBLFa0tKwoUotk56KSoGlIN6Ps5zozxoRNpwzPgsld
 6bs8RMDJcSZXh2eSBtkhVfvIvyWMBCmqizGO4NzvZq5Zn+joyUqptwv0hNZnJDQez77uMXTCA3l
 DqXcdhrO9qhyCPPtgZu+PSzpKRjaVglAZQYUmhdxYO7am3DBjiWYKZmPlpbkkRgmxO/ujOQ8dt/
 PSt+3FW0BtVzbC1mkKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3

