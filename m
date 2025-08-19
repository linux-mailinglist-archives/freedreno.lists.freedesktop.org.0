Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573BB2CC8A
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 20:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218E110E658;
	Tue, 19 Aug 2025 18:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtMlo2zu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882410E65C
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH0sEx030300
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Z+zXyN1a2bnqpBRyBAM++GE0cnz1QaFhTiRC3XSmnvs=; b=NtMlo2zuHwaiL9oG
 +6oBzhNADdym+pcp4UfP4pxGo6CXzfL1l55KjQPOH62+3+KvrdLqGWJ0Q9BN9lGP
 0PWBwMECEWUIHBRPyPVzKTHkzpbZuBG4vFnHmvob0QBqfW5l0U+b2VbcPruf2egR
 eMdfBxl1Zodj+wTfwzpDSPzCgWBRYeElbfMqmgYQuzGeiFgIz5f2QFokoago8M8e
 meAkjhtgdfQuo9Uc5D3H99PuDfOmuBpJoB6E42bR0SyDHt+lVWlIQbxy6zAB3TvZ
 Fk8ghk0t8bReHbTflKO02GPrGqigQ/sF1UgvC8AXN4VQwVAvGP2U78G4gBjmgqUe
 nHoTcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwwd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 18:57:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a928dc378so134397826d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755629863; x=1756234663;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+zXyN1a2bnqpBRyBAM++GE0cnz1QaFhTiRC3XSmnvs=;
 b=Ng3hAZdxcNNrMT4yeo5c8BXauACfYVJQo0o1+RM0DyvjRwnijxuMPWncvY5Z+Ei3Bh
 mW0AQzELvkorlA+cbFHhIOwheBwuCh6lgPc9pdCrPGE7yfjb8j8XkyID9JYO30DpCvgP
 njau4wAdaclQWr/5LBzTY0KHXRRb3N0PQb58ITKn/9Qy9kvrlmdhkf8psv+1+dXEWL4K
 QGsaTweqyAf6OVUt755aGgOiB6hvItVBV+F92TIDQj0fxHpHL1BK8Vh5hO2DuNaD1DU3
 szo3P3WJ6ipsAOKb3Ap0D7xejjgthS5qOMFAhDkPtX4ZhqGiE9aZ1q2y4maMlbLXAIdr
 3i8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkqjFOv5fc0jCMjEU6x8cS5O5CfTY5SStfy/NIR3MRAtkAbN7XVFA2kH95IsGa4IqJXV24oTi4nNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYmklcwDuAgvMfvh118bwhB9Pu1+cWBfV31L3U73WBvElDxUy+
 d8ReNyOGV2SJtTAt2t5cjTR1B84+UdTf76APtFOXE9HGjgmqesw6Eh8OKA4TZRmqw8oTuh9Ulww
 uUZx1csepyk2OZQ45sYYgFoYCCD3D2yNXBGw5NP7B/d648MbL4gAdAlub5OwtFzMcmcu5CKo=
X-Gm-Gg: ASbGncuFfyMS7scXADKFqYoG0dgsiKB+V1JJfHPNfWb+uLrTs8u56lUHSt54z9IBtNo
 FHRyzfNtud1MD0ayjx0DBDZYuUlcn4Yu7sdyamjsIYP0ZKkSrG7cjcqqZy4Rn/fP0Zn886vUdP1
 raGavwhDh2htau8nBxZBOo985KM+tpZgCk+bAgDIasxlgJAaaTJxIS5Zww4ai+UcBLS+ze6PwXS
 Mxv0xce8mI1CLwFLZuObRAhz9jENPGl/Dn5zun28WBSUKvQFiHgwAnKmNiqFqLUcsde+6MIVeNM
 j0oScd/s+HVNZBsTVeChfWEMd3JV+Zsm4E9Z5PGinS9U5d0pX3dsM23nI39AMkObKLaJRjYBER1
 W2H75fwCA8RxMpMBygTOh+dP6qLUPoCTokh4gNupIv+RbZzpyWRsj
X-Received: by 2002:a05:6214:1c85:b0:709:22e8:af63 with SMTP id
 6a1803df08f44-70d770fea50mr922736d6.43.1755629862513; 
 Tue, 19 Aug 2025 11:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKM9kPLVNwAU+bvUfA+7/m/OHAH6NtrmF/qIQAh9YPaU7rN8LrKKEiWT6K2FNQ1P8YaY/sGQ==
X-Received: by 2002:a05:6214:1c85:b0:709:22e8:af63 with SMTP id
 6a1803df08f44-70d770fea50mr922136d6.43.1755629861896; 
 Tue, 19 Aug 2025 11:57:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:32 +0300
Subject: [PATCH v2 3/8] drm/bridge: ite-it6263: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-3-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=juDAsWub75mHxwaDcxpjH5487zukYFMn1kp/7OjeF0c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkb8nOT8FASvsz3bMJPIraDMeMAkHyPHsS3Q
 Xv/SOD/116JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1aLtB/9MqLp+3iH3JT+lENH5R0C1gr4ued94BGnwQe1nEDKXwvO/EuCNITfHqWdOnakv9+TLs5C
 sYMtHIxsmUUWmkXrom0z3ihAtphZhlfkAZYvx06wQnjz0ipG3VEMTs0PgzYqbbg0cmTH4+OGuXD
 FIww+if45ZCZfnDtDfviMT/LPQpva3PA++LXedI3Mn2QncxY1FIrNrMGRrz3C0XkpWjYCpN/cKH
 KKlR0dDwoP9hRAz95mZs8t3XIgpaovsWwYsRm4kyFAAEKEp/8cZgJN8cpwrRu+5P9B/7OtZmN7F
 RQpSbXy8k9NYU0pz0jhxxwgWauZriRfjrQJ+0sQVOX3wOA5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BJjM_DDdOA5q4bLdKJOyxdE9QzeiQiKN
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c927 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=0nAs0j3DZZh6uBALfPUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX40dvtopm9HLh
 23q3zB62hETFhs68iCZrWG7EmEdORis62IBfFkcxmi7nXi4Ask34LXEOMLDZFci2vzAfPCkvMfA
 CRbAhCOiHI2C9Jx3a7pjTSCEVoHOfMQ1FQ9UzH9gokr7xcmZIXv1QmhagwJj/5bh9J0sHkk+g6N
 EVJS9glwthddwrhnwiF2SopGD9uHQ5kM0HaaaVfcCSGWiC5z9flwhFXWYbqhluyNItkMpbymJXp
 wVUhVkpeLLhmZKMJg6FZnAlSPX/41jHoypzcqnla3EmJb1EagCLA5V2wf656HZxW/z3l+R2pH0g
 WNXsZORbiwjcJUK5N15bI9gJsKcoXC7fPO6LnhD4RCTVzOfmdpbXsRMucZZke3LeYMH3wo0VUi9
 fWSKRdLw
X-Proofpoint-ORIG-GUID: BJjM_DDdOA5q4bLdKJOyxdE9QzeiQiKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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
 drivers/gpu/drm/bridge/ite-it6263.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.2

