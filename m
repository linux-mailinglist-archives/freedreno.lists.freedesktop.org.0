Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF7B5002B
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EBD10E7A4;
	Tue,  9 Sep 2025 14:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOVxT9wR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7217210E7A7
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M2AN002301
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=; b=LOVxT9wRqIMsdtxq
 cndOMoifYWVHpZc62EvmN7rj0LDQWAcqL3g7/Sl4DM4EXUog/Mxwe/VyUg0QzT2B
 z3MXkIFFVU1vvUsjuf2Q8uF46tuSQ2B8hUQoQZTMElD1fpy5TVBv6EfWoGO/86o4
 0adpamYkKQP5nECPo7ebms3B9bJmH3QuhNBuSAmhzI6LviBqhrZEuxVnF3eTVh87
 DvvYXvQ/4JxGujIctjPv2XB+Yo/1U1cQGa8IO9F894uEnE378XvCuYToH0angsNJ
 qOnafF9a54OBsWShEhA+PnaZ3Cs8DU0kqPeHqfR+38PTVJvvh+jNfOHZqhyzY7sU
 ii+zMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0e0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7296c012f6bso116936086d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429555; x=1758034355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=;
 b=jupoCQwxRbX5S7kTfI8atK+kaEfUiesTSTT/p/GBB+V6DNVdsdHnClqfx6oMeOCQk7
 6Rha6NVwWnSfVigh31WsTfwkg6P/AId82f2865Kb5mjVgdemo1E+Olbi9MH7y6z9Xi8D
 A240jOo2r4NNgGjxQq4vvyYFoSbECmZ48t9KmZMnf5/JZ5Z82H0V4zKtXip4d8tjfxF8
 DonT7VP4h+Gx8qypOKBhCxZNUgy9dENW/xsnD3LcwtiydTmcE5GMNagKNURYdAzU6Bbf
 Gdv8zv9QZ3NIREXFOtXGaO+X60ZaoCyXv7+hTwm25U3yEnWwvOZlm2fUwRALQ3e1Y7Ww
 3Ehg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNnO5a9U/B7X+ShY6wUV7gJ9Z9cSSptuSCC8HNeJoaPfy7VhLdlS+BTYZigrQG9fqyyawjgEuLB7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx4QnAbVt63nDImRUjke0D1l7RNSLQ4zBLMReithAysLWk8+MJ
 fsOtSwIz6Wx2KfKQLTFtdzV0O1Xj5YweMjWQVg6mIKc0Y+4XQZf+YtpLjsu12OWOXhxslz3XkWU
 KtqH5oH3xX7idYQeugnlbTmsh7jzBzWTe4qcrE3NLk2JxlAcEfwaNtspN410ENfLJYdwL4A8=
X-Gm-Gg: ASbGncvClEEbu1Rv2Enm7yHPEKalGB9zYHmh8pe9h7pWeYN/URK6VlexHtOrTPqihD8
 Uw33BX0my7ltswvHo4pw5LzhW9hetQkI8FJAC3KZCVAM5aA7hvi0s9Es6qUdk7Ug8L6NGVahG4q
 TAlXqhaSMn8Ir3pA0LlpcFeOfxwjFCgkIFTkdL7Nc2j4b9NgZFMzuhZ1Wix9Yg9opwDtCJ5kF8H
 xucP9FTJDWdOdR+Q50WT8EZzMu4Fr88zhv6V2+FQQ+2P9tVltKfWkSzDr9Mp7sBLhUoIKzb6dZi
 sINSmOANqcgxcZ1n/eAmvABel7Nfx7Exr/Byc9AEFGr5jXaFAv73blxTcFdC+D7rycuGh+M23Bh
 6OWM9pjRq7nP8cJOkKsd62gJC/OLLdEpyHbpM1UXSeTv4460bxR7y
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id
 6a1803df08f44-739203491camr137707126d6.28.1757429555438; 
 Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvay4HegD7TczvnDmBbJppLQ/NXiZM/9CH2gAkzzaVEPN2RKdPsH+OPvsw7n0MbNu3XwLaHw==
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id
 6a1803df08f44-739203491camr137706716d6.28.1757429554861; 
 Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:07 +0300
Subject: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCdbmTwssKDcXNKgdZbInJ/IsWBy3ZWBjV1zBKp4r0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bLgmA9Afor/SCSMBp6lvcMJNLH+y+3RLsg
 Edds4lkZH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1bQjB/wIC+5fSLnstfGoZMGUfVuruiseL2SNqJJstUfTxGaowQkInoHQfnrNqiPYpowcSvPCRNl
 UHnaRFcqNgqF2eWsCXtVaCx10y4Xj3MtGesm0e5fNl/X47wnuZX1RlKVA+7gTnlshcZ1F1PyHq7
 4O3HqSqvwF+066FKwZL94tPSzVrV5ca4n9uB3H4tEJ1CodYONpSf5XEXIbVmBHdBZz6F5Gns117
 nYTWg54k1WItlRdXqTB1OhJ/BoctGr79fhRFb8LTSDBfGG/G7xLshm7FznkSl5DmrmqCsv9fJqw
 58UPBF9WUpSazqCvVhovhZ2tXkAQKvB4Xu+5lsWd/6WbhhXH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MloRMBY2LiHJkEIuLIIih2HZiGyVL90n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX1Ll8kkaqKCRZ
 8EiJsGELOwx1EBri2Zzml5YEPFUNC33rQVUkSRamIR/YVP/bzs8r3tbgNocrC8mQVn+AQf0FdwF
 1eJtIm7amSqoTjzPvFrdsJxsrEWUGszdIJKeMXJrGAVWg/D6sxEOL7KQfqHU41bLLqz9Sxq9ySQ
 Uyf76cpWNIEw/9o4Tn2HcFl8Yv0PchQ5NR1zc8ypylIqdkay6Tq8YC/2wSvQKw7idOUKWuegwll
 9sSzcve4dqQXWZk6ppuc7ywc5ZmHfU8IN8UbOVZwVxIdt9yGXKOdvfCHbwLFs3d7xaVBFm294ZN
 5kGCy0tTvbcV8DYzKcRTRiB5znd/bQvUtCKSeiXSfK4o5UQXfewVNxNXW7NrIV9/fPQsJTdmNRA
 noXyCwcw
X-Proofpoint-GUID: MloRMBY2LiHJkEIuLIIih2HZiGyVL90n
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f34 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=NnPSNIktjdB4Ge1gQTIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb40e7f369d810350 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI connector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.3

