Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CAB2CC93
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 20:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495AC10E666;
	Tue, 19 Aug 2025 18:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="REYuRK7L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8C010E660
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHV5po023565
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=REYuRK7LpEaB1jrr
 Ps4bdB3jWVAoC4qC190kXkBmvfnqG6tuHQ5TkcYMSpo889j3DVi5EwJkdvGlgiLO
 tUZcMwpnap8pvBftk7CBGDXOo0Z3CBKI0fqwIT6IJ3UgCCM85AP9SYuaFgCTy1n6
 +pGK5/X9/bbSZdE5KdmSLXVHyJIdM0+CrlfiOTvP0VOmAYwjJMwi3gWOTrjT+O+o
 O4oSIuZTJxrGsokxzPk3IJ3fqG2vPApZEoTtZafmoLNpIORV6S7NilvqzGHbLVC8
 wE6NcKfhj8gpllgVo4BjXC3KkTcbZunp6iqHM9bwQZxN2wjMIr2ltLv5r0ToBMII
 wAVHVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmmm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88de16c0so129312516d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629869; x=1756234669;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
 b=hmnuNXdqAcNLgnmVIVKR4nwzIDZIn62t6ou19tit2CJXqm04AX3zkE6frADsjQiS6F
 Pg/j1K+wPckBOkSDMn7JRw7MuSv0BHeoFrvL1l25ApVoHwRCGfw0SdG8d4nwzATYXBhC
 L20XzusXgv8puYraOZGLQ0jz1/M0X7sWn586/cPXKBxexrckYWZ7FwLNoPHEgrS+cBC3
 JS7nI94JAuUNQY+QCQUJNP0t02LhWBn5bydWXpvAAOmR5doY8YiP6ER83LQq08IwXXFw
 1OGksYfwAV5XvaP8gfvFPOKW+FlGLEL3aUdD12qN88q6x/Lz5Jzri0eIKqf56gfKinEs
 HwJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbmCohqUkPdsUlZf8M7JpgRLccW1u2ToRH9rbRvKhEaLcZdDM532voiAN4gIWhfumD/I/Li+dhpBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1epNeRAf5T9135xutc8JGoHFiRZemViQCCvp2xwxs0TNHqdcz
 7HhEN/9rQy59W2NEZTeSv/svA9xxlPqU/O/sFiH+qH/w6MBXkeQohL14pOreZLyN/rGIaD8m/u3
 oK0H4THsEoDplzURJT8FzrLFKYpMUuXMElXpLai/RNU6ivc7Vx75aFjPTNtFeXA4c7a6S9vU=
X-Gm-Gg: ASbGncsgYejlAguAc0j1nPx3itPHfYr2H5NpxJseSe64mhjNlElbuinj2GdIh8QfOoG
 pun4MxZkwk+WeMCOnF046PVEsM0cR9V3jtZHVIwKYyer6L/zXD9Td0W9g10Bo4LJxjXYHXhTwPq
 z6M65SLBzBpxE+9TaDFx37XyG0KpFHdUSoUcJwktQRQk8p0zyl4gOEFGz9hka0jTXMxFH/2G8w2
 8PD9gbtKmrpZaXcEnFUKGFc0cDPopJMH43JGvl2Ws+D+YprGv5FvrnbVAJBXDfSZeI6/IpOP2jB
 8FI5nN0FY7Qi8AspR7Pj4TXYT7bZESWDOINQRPuZsuawJToSh4vgbxJWSVkvPWq9kyFENl8EdE/
 xyt7CWo0IV9IXkTqIuOxM4LHH/GhyHIzsJR0SNoT97hyXU0N06L81
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id
 6a1803df08f44-70d76f5bc39mr1350786d6.5.1755629868719; 
 Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Rup7AhSw4BJ9NwhIDAaqvNpzhK90eK4MaobbpgThtVtwvxC7zzjZweXs4ATCoIwbiBFBpw==
X-Received: by 2002:a05:6214:d83:b0:70b:a525:be29 with SMTP id
 6a1803df08f44-70d76f5bc39mr1350296d6.5.1755629868153; 
 Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:36 +0300
Subject: [PATCH v2 7/8] drm/rockchip: rk3066: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-7-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcSLkRBvL0pMwSNLmEAMo80IQ6eKzuBYdmQ
 c/Ssrh2nvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UjBB/0bEDK9goN07vzlvUrx4/uSf/QCLfLAHGPDaDSCPqe7Wl54y4kNyRCy+aLt4LJ3bP6rTlB
 8etPp+lpeftFkzYybXjLoha1F8bnExHGkttCagiyw/qETQUEea62dP6vYL+vczmXkKuzax9ChhS
 4njNZ0Bqe+i226T9H1brFHCpfAvuenLiOkFeu21UGrpXDSa6KvlzbniugRK53i7qR0MA1fdDfwu
 drLueW09uFn5fxOhbe2nFGWXm1I6T2bscZ1qs0XFtT+YcT9AeGuMmIXvMzaJ5Wd87o4kQzA4qQi
 /zKuVtV3uKZfeat3nHuFrrUfMmgch27HUc/CFJvruhmgfCS9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX3nCnWguqPD3V
 uKyQ7p3GwGoHwJagF+3sBf70MvgdznO8OYMg1UXnFo0vRA8PxcZRDER2fMwT02LtqcbKtV/tvT/
 irIQILUI0sp5MuPXEi/PLLM7qCfCOSiN/8LcOsmESbDzEhG5/SvQDh1/jQixN43oLn2LHN4/tEA
 1VS+y85WwBBxLAWc24HFGmDLjt6N06zNaQOKsvUEZ26tuI0K026yQYiBKE86+eUi9fte4etbVi+
 Ew9f3tIhLbzpSiPXAwbUukXaL8MxgzqnJrGbz2QIBXdQPl+NEzmg8UyaZrjbah3FPAWUP6kM4AI
 utXcoWNTcfbDG0M+HDhlykKKTw1k2l2zf0oWSWOxiMh86O00UwOKeFuRdVPPuQCcd8KeubcnYSj
 V7DTCxP5
X-Proofpoint-GUID: IQG9sHkqUlGb-9p3M6j4yhkv8NyqqqP4
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4c92d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: IQG9sHkqUlGb-9p3M6j4yhkv8NyqqqP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139
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

