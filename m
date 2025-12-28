Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1FCE53D9
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828E311AF7D;
	Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv2gwtYh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y59afORV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BF611AFB2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSDAROg3110732
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=; b=Tv2gwtYhe9LuT/vl
 Ms24ndeqFrDVwYDolDRONk7c6Ce4NYzZY8Odkhnhs4DIf3Pim/yu/lou2Jp0JKmZ
 2yaxQGEz/r6vwzHWz6ytkOIi+qi4rvffeaGBLT9ADJwpNFjeXTK258jJB/lGrWUO
 30uFqgIcU/KBgho1EeT4RkrkVk+lH0gpB532i8rnllVykUX5Zv9/bZdk5MgHm5Ma
 vp/lyrEguZzkTs56kUHRgtkxJ0wMJbxrGtZ0Wc3bb02VnB8kJwRh46BV06xX3Yrw
 3wC3Sgxa5rU8a9wwL2/VCOBu2tZcI0QZ7gZl2F5HGIgDaRYYWdclCS/IsA3UYs0O
 BgSO0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtgb2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee16731ceaso169290411cf.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942509; x=1767547309;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
 b=Y59afORViB0lw7GYRtdrda/t++K8XeH2+AV1yt74KRzOtzmkhyWNlkB1SQZbSEj6yf
 3eQZeN9hoTXxuHJpkmmRLgqoMTk06peTf29xRN93wpHW3gC2R/LnzXj76qbqeaCN5r33
 6yUnCVLIwA0fVoBr//FdjvpqgppVujkK8bqolYFCVDxXA9uET9kyF7E/Z56xxmuNDPdJ
 qyQeUgU2U3mOlrzruNEntoMo4gFXHD5TIviFNVovRna4yNjn8KaNbGXZ0FS9QMbIS0c+
 MkRgPQQWZ21M0sVFSDKEmIU1/O52+ytU4JftTdyul8/PaZVdT554KkkCg6ht9l+tI/C0
 kpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942509; x=1767547309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
 b=Vgmo/d++IlEONSjIftpWfgliUqfmGVYlAiCdbVZ6iY1W4Jhjayv+gbC3ViAdx6eC8z
 SlMI8ao7octra3uOpgx5pnjq0+NI5rPKNvXCzzKfypvyHxi0CEyaUwK7fSr7iYiUIBqK
 xBzILqEF4Xk2JOXVBcW+rDMwtIVLHp2MjjhTqkDptocmJkyiwPJmUvIT9hRdOoZVSih1
 /qF9vt0loRArECz5ZAKU44XDfm6kfR3bW6LAkRfWGjjoDiddUnUa4sH7R7H7QV0ODsXF
 4pjSWRNzbC575v/eeuTwW5+DsNqx8R4r2sgCu4HyWUqT7NobuH+IEa0utwReSGvXrbgx
 ieJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcxWnWBRPZfJ3tIwGttsSzh7FgFOfFGXtAdA8rYNCTMiATPMgMugWMoFtmTis6vBK8mPr6Osz4JYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMoeNHXHK3DIaWnL/mhAtX7cvGUy9WlO8mmGjC9CvlKsU9ma27
 o5p7jvMqOnbcGvPMbFlJmIKZAQ3vH9hiPP7hdlUkQQou6cdiXbrR47V30xQOdO0eSQ7whqK4qKJ
 rujNZfSxEeKqSgaUMj5zgsE/avF5ynuq537QykQIfkxMPqjyA1vzPmysb12pEp/3krUk2wwY=
X-Gm-Gg: AY/fxX7aejqLpYuT6FHl1Q5RiLgEJkdUOh33AZ7m7zhWULycHUHZsMX/qnDrBV10A7p
 QGnsQ0eloArepEjvxz9xWKy4p+21VSF2bYpV63PEfzG3DVAYlG+MjDG3mqM9ZMjho6ro7pgDMA/
 ymP7BrCw3LrKnswHr1DddV6Nk55q7hwFIQFVQ2PS1JEB0bha5NlsrfVH2fJRpl+z0ESfTMnqUxw
 Hi42yTVZywPdC6bUtrWmQywo8GktfKs7XTaCzJhXjJZEL5fWMiC9wrmWbItpOYF9gWmRe0OMKy9
 4RYVneHwgTyJXCelXgWTzwykwP1eB/YQiIOW0B75U2iFRvAyebIBZz9ZiDUIPUYPspfRlAC5qCJ
 nXozrEXxmW8S/qtwTSfzwAL4UUNZ5Sl/n+dEH1WbAmqtPjUVAn7JDsVwdYYHM817Qg4OzvImULG
 20hOePgvOlJc8Y3zvnkQyoQ0I=
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id
 d75a77b69052e-4f4abcf6bd4mr375254071cf.30.1766942509433; 
 Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFrvQBeWUWGNN3K4NBz/4O0OOqfjaG3q3yoWI/L8raTZ69fCS8BqISuUrv8qLP6Fu5J6f5g==
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id
 d75a77b69052e-4f4abcf6bd4mr375253831cf.30.1766942509004; 
 Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:37 +0200
Subject: [PATCH v4 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-5-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgulKVA3M8710WTzVthwCt77+n/UqL+imglvP1WFdvU
 tLLKu5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkezUHw3y7U6W/2AzlY/ga
 czVnPbq2vnf5299Hzepef3uYO7m4ILF8Xvi89I8fTDLiL9jZ7msSvvcteEb+PRnLiywNT65wSjd
 9WTeTf62lRYW4XqEY+45Kz0s7luTnK05+bSO9I7brv3u4i0bg35NH9VqXHJhjoel9Z9p/rWeb67
 +tzj3Zfe1rrcfTwmPrWIX7fvmruEtodQk2Nex6ergx8JPxukwBbtX6s44LXyZtNJSUcMnwsNxXM
 +uVmOy66LWbXgetvPBps3TSps/7bZiFLkc++/Gr7uvXasdZuzsrzVMv650XsZ1VEmztkizw/8mT
 /bwfuevOfPPw4n9Sa1EW36xWF3eYq/xlwsvVkVcsC03SAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX4z5mcqhKx9G4
 6aQsyphUm8QnysiJemsMU8L0XY2QejX5007viHJ/RgsFn6HnoXNw0vFPJZAPGBSXm5ALw2fakVW
 sqKeSjy/IyTEaRZNWdo4EEToLk9hXqy+O03IgDLQlstuGjjAzhcABm5AMDNp0DcwezyB7WTah6n
 +HBwSiIVY4xoy4pCoQiXO/qCg+Zz+x3RY2SN97ViEIwbUoa69QRMPci8l6/aWuvmKUqojdBVLAA
 otCitIbTJX5vCZ8746/gVbKwicBM+ivtE+Xk03NqhOyZ5W34EBgNmwC5oXdGY/sdTK4NF2+iCkZ
 5R1xdjYWNCMSN+himGYS3+LTZdjQJzpQGibv0y4gfqkvuQ+K8yif9AAtRuDT7WKNdFaWAqF+Xhs
 h1aF5PK/RWzgwaIGqeRNfo0XrhmDvv6l+X1o4mPpeYX0onX5vFnl56zNxfnsixAP1aA6U6Ue8rG
 1V62UCLWZAjnIo0QJgg==
X-Proofpoint-ORIG-GUID: Z5wAcoTt9mwzwkZcJCJpF7aGvBqmazlj
X-Proofpoint-GUID: Z5wAcoTt9mwzwkZcJCJpF7aGvBqmazlj
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae2..64cea20d00b3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3

