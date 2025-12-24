Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5BCDB072
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 02:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B2110E2FB;
	Wed, 24 Dec 2025 01:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfH2Ljc+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQ2ShUQ1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C80510E322
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNHwj0l1245990
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=XfH2Ljc+dZzYTrzi
 pD5ysYGQfEwkhPa6D1pi8C2qbcfBhGuJdEE5Tm7axPuo9cDSGursj22LOxEqHeP5
 R9uBpaJ+4/sOsdjt2aULzxdHjQc0CHLodncP7N+ebgW+QzIgym8Fu/RIkEVIq0Jj
 jRDxvdSZXrLN5ge3caHHbALSV00mhM5U92CRhkAtigwUmz2f0w29lkiq9FqPE05j
 iEFxVpGxxc9A96yD8kdKzBFG2/urw5k637d0CrkxbijK0WRFw1tIvf767zHurFAJ
 1U1WFXX9uBnoE3GI5zyeTch4vmOF0P//3srIopPnVaZrtxW8W5okZ4R2ipkZ+bcV
 //Fs7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9csxp8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a2ea47fa5so149346596d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538235; x=1767143035;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
 b=ZQ2ShUQ18aAoOux8xYznqmC+DYn+6aDCMxcJGt9WPrBb8wIGc1jEmFepInbZclatWL
 A06oMD1xWU6GZMwzbt08LMacs0k5/P3evnxTqYSZmgnBW7uATZP3Z7FyN8ZXkADsJCQy
 bj+4mw3AO3Au6xKJnCPT5Th8Uev9nV9CUlmk0hMJMci7lmai84sZkfmbdgPKcGQ1MStX
 8VyrGqM63jZJeWMsfsRwO5NQsrkLCy+7Q2axSSnUMTmOqwJqKlhl7TrJP22evQ8je53F
 rSCkUrQki+kUN0qPv8+zAJJ0K/f4jMv0LPMcm8NvznNOcW7cu5wj+G3NOHa69x7+NiNu
 C9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538235; x=1767143035;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
 b=uX1Gzr9Yy+EmkJeLLTOxLuT6Th2XO0NetYmEEHPzhAEd2GCA11CsFDYl3ebR4cTFqc
 ByAJVku5tEWA6FKVBCi890tQaI02w/grDEfL8ZFGkEmx3w/nfRCSx4wEIbvR7bUZdVAB
 LbOphz27URJI3XRNtqu/7oTb9xr0aa1xSDc5isE1Hhp3F2aXS/2gnyltBAJXfQzLfSXK
 fThalWq2O6C/OJaUGLvwiwnNKl5FuGJPAN3WpGav51AsswYb/U3QkuiFJus5Uk7gjtGB
 GK6jtpPnpaCzsCm+B7wHMFnrjoABZg4YfdulRwmMcOY0n1vNu9xGqWCixFd6VRsy/IuB
 yuLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWq+6prkeWTYRiJXoKcQ2jMZ/+Maou8h9RrRNbIIBQaeppFZceiJizpuFPVBDx3zpmlldL9fc+Gy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqzLtbUrqZxoD3Mm/8XsYYZoJTl3+nWS83sKA0aUB/W9rbOEWq
 3fSx2iNNBUV7C1uuL+g4ANEBvBvftX8cSoDksSVA5kx9AkbKxByokir23otA99kzVtuSMibuKab
 iJJBZVZcMUGxff8iIqg8YZ6mkdz7oyc5bxp7+gp5cUCx574qdsWw/dBNeEAaK/GW/8F/Pfo0=
X-Gm-Gg: AY/fxX4MSGSTSZaLTNOw+EVXCqrZD0L5ZDNAhA9pvY+9PUleDkyj0BRlmPiuNeY4tjG
 SltBeqx5Pg5/B0JsxiMnrKS5SaOUKI6dl1BdBb+3ciwMPIPOEH+56jv1u0fiuWNxTUCtTs6dude
 y4mfMnnoEMJbXfV7QZSwnnx4NR218isTN/7cwlF2ysPuqe/8ITilTqZp0XKd+ajuYYxNDPZ+o/D
 eNe7MY6LrDyHwTJmTrrK7WOpFdvZLlmRnZwhlHIHftIhn5Fn7fkpWMsGXajzXQ2XIyN9Lw9ay2L
 W66iFbkkcrk+E9n2iZMblzyO8ukjsTyjjiqXtrkW4rhZ81/HKwZn7Y0auV5/v1nLlwdsSMffQum
 7MGKDS6GJG/CgFPU2xUNQ15OCrhmtmDo9GfDp0Qb0Y3Fy2L9fXNf5lDSr+w5yOiglV8yGEVmvzU
 tQYV2W1FECBtmrvHYUNu3suPk=
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id
 6a1803df08f44-88d83c64e72mr214392766d6.25.1766538235604; 
 Tue, 23 Dec 2025 17:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaK542l9xmzYYsxqdNmih3a3J+cADi7DGuEWQ94lgYPMK9IxHSj3e3msfodcDCfxK5YjzPVA==
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id
 6a1803df08f44-88d83c64e72mr214392216d6.25.1766538235179; 
 Tue, 23 Dec 2025 17:03:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:56 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZGVPsohAMKCXOdz12kIPkrJMlkOnHo6hb3
 HWobYyhg7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1QKNCACqcQqgJBRBcg7CRb0dfX/GGsMyAFAip0dgaqJtDLf7ApFonc0Vo0fA+NhcV5j0Nx8Ti9U
 I3ZV4TYzf23eOcnZCdm7rXhqmyxWKpftkt+8hIkJizIcSP+w7WDLeC2a6QEPQiGVuMei4kWHGnm
 o85bmygfh11FQZkX2pCCQNJlyfTByGtP4Y8JpLUrRBIvBMTYNUGhePLY9wL2DAFLPPW6ccgE1wi
 X82GoCEVaLpslRdu4Y6qY0DXtzUr9H7AOhKf8Hucv3GM83Xm/DL5TfDXh/a3uK8yiLTMpc8RB1r
 OJlOJIJ4Pu0i+HpaBnRzjUWikC+VvVcYf/m/QP/ndRhcoX39
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7tDIv7UzwTQvmF2K_IV3Chiaq8mvZIX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX+4VVVLkJMjFW
 HxL1J7cpm20jHrEc1d/YlMaB+7/wz7QRRE97WTGHoIV4TnhUIolKwBa0iI0sqXN1r43HnWlt/iG
 vrZzfdq0FFvv6TRBY71KvJ9qF3mTUD2kovpxXeAbXrVHR/feeaAbGqzbMMARqsJS9VT7XOiDYl5
 vx/RfSMfDe+ATpKuh+hD0Ep2Hd7bW4Vzx/zy87F3qRsY9S3EkPc1V54kQmhRl1xcuevaOtTUOE/
 dwqbSw8Ai5nzdtkwyIv+4A3akKOOGayCMkso8kGJfAWEYvHfZoy/Xc1NRVjdjyfia/jqhOJVqEd
 37uI6wb3+aUXpNvCMAIjpJ++WCGP94bzkctw/vOEvtLtBGWfqz/f1TU8mHYjZJSxeqNnlmQGrp6
 d9HNuQe+QIGOFZJsGw0u9Oqid/GD+r33SI1LhdTDILwcg4+5dX5IFBPS2+ma35r5EonbzV0AuBz
 CP7pAS8m+Kpk3ikLFjA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b3bfc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7tDIv7UzwTQvmF2K_IV3Chiaq8mvZIX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
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

