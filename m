Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD4B2CDEC
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850BA10E677;
	Tue, 19 Aug 2025 20:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjU+1JJl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68B10E670
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHrCD6008318
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=; b=SjU+1JJlEMN5h9Lq
 moBhgBbX7sVHFtLKHhg1uDJF+cObpbBG1wEVxbYP1yKWK8vYKsKnNLAl/eBnBC+o
 h77RKV8DW2ANEg1sBVNkx0PbDgc3asTaQv9UeGnJNHu4QnWT8RFv+T9xJRyeL+PE
 RBX27Qu3PLDQBXT7lfmo6AiRpdwuTsz0CikBraO/amPvw4feNj5Xb7/foe/kDxJ4
 VuP07j7pin7nS5EGCHJRGDDmTM/T/PSRgnQ3kusPhpsd8NlNT8qfCvXS+5YrXzdX
 EEFT7I3RhLOKpPQaW9oEhkt1UWrykB63FA4/onp3niGnghnM4488Hl5m2ojMXfII
 OtRueQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99sveq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a927f4090so131306776d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635588; x=1756240388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=;
 b=VSpqBz8lvopetqyxVeoGANYAbQnWkuaB77pcY02Y/XBlDRPlAnPs40J4LrLIumbIIO
 5Rub8WOMDBHLQC0RLEXn1cOVzrmWTS/JHG6eHOg769+qDQYQvMyNFiROUiO/4/u5QyYC
 EWheYWARSnYLVXffpOnl1nlGIqMc6LhzXf6F7SbbMB0RoCpiLUVDPP6tepEKZIj/m8Ga
 J+82zNg+XvVdg8vE5Em+QsNqurAAVPbH0ACajc46ekop0erplWchSoBQtfcd/uYH3Ro5
 Lg9kYcRbxbkpc4QDlzzsbmKE91lBkmUZWu+/zUiKX2oC+pnydvy1ZnoYPik/b5gX2Cgc
 +0zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuh8+pJdP1RuODxInwwWoJ+GBCargn6QaGh6vlXYTX1zat0S3ZpLTZye6wyELH0s+dEGVaUXISChw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcnJ14vXHzmYAY/r5Z0YapKLkUJ7NMKzQlpswBlTz6+xmLX1Z9
 s+gkRQznZ7kK3FYR/eZUcEFMCui/98dAhb6IywTuhIqjLzRl2swQZyiYp6mTTk+YCHfG7ZVcYkj
 rhfv0aF8kT6UlCQYEKJtS0Sr38c9DnyjBjny4SiSckqABYEpmVjsBxfKqLr8bdjS8ZWpWGtDSfe
 zs2e8=
X-Gm-Gg: ASbGnctXAYvBaJttI3l5xu4UkslvkqmCaw4LRgHhZTB+T0xkPmEJ5ewxY87i9BjRlfO
 sEilp6A62ctXcQac2yDJo2oGdx6Cv6YrXrV88ve1cK4+VQ/KlCAzWYQooBPxiPFjPv9uPZ6nCoF
 +9+qtfYwLmM49t0tUJViE38JcHOozr6K0+2Vc+ocJuqrtai4PIUudi/npLntro2Hzm30c5a8tYa
 JpMLBKL+soDqYRGDS7Yx2EZA2ko7eo4HN0lhj5PstCoovWBvhA/dqBJg2Qvimhq7bZ5dGu9fHlY
 iduuOLoW5ftX94dXu0gQ3+gD7DL1sfQWxka5962s/rve7GoQyl0z2rSdXO8dv8Vkb4mY3iXDhGq
 jg7kr9NrGSa3UIKaomJGteOQTkAdgkjZ9O0vWMxaclfl8GnWHI7ZL
X-Received: by 2002:a05:6214:d42:b0:707:4cba:124c with SMTP id
 6a1803df08f44-70d76fcc6d0mr3925306d6.15.1755635587388; 
 Tue, 19 Aug 2025 13:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXbzwbtPTMthExC2v/jPPGR0U6e77awEra/VfApnsoPxFWnQVPM0TA/4e3XCxu/atusvWn1w==
X-Received: by 2002:a05:6214:d42:b0:707:4cba:124c with SMTP id
 6a1803df08f44-70d76fcc6d0mr3924596d6.15.1755635586630; 
 Tue, 19 Aug 2025 13:33:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:56 +0300
Subject: [PATCH v3 2/8] drm/komeda: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-2-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
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
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98pXeI0YI5rMMU0cfAZCQzyHd5SV6fCosRp
 2k4DpPn0m6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1apAB/9Wed3uT8K4J7VbxZQYRdgbqkXEWuchv9h23rqen6qeVxtKb3hxBGlgSJGYV9xreUNSJnt
 kycaE7r7dHO6njLoIlrsEUjSpp8QhzDrdB3TkUHQI/qXhPZRO6jFnnNiIze3++SQeVxeLeQq2PZ
 2rFLFqfPI2FY5msigg2DlqPrvKPoUNuVNS7pdu0UY/CvuGxBWQi4zhvckEkyL9Hux8vTpJPyf/i
 6rhXGOI0GDWURVYOezbaytNWfpchR77qNdCUgqGdCF3fhHq8AI+avLEXbs+dyFKUqhzUgbLepqT
 7umscLV59LLEPrJSAUSBGxAHsDU9svqZIx/JOZbeay4TJd/a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vGC6H2R6Lfsrw6tj9PA5CUQgcr1Wxtjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXxP8v35p9O3sn
 9JjP+H24/P/dSZh4DKwpP3IQtkybltYAS5XfE2ETE+nM5C8eTsEjQHS6Lxrxjaflcey+ud7n5ND
 eZNOnVgCTsJ58NkKC9zRPw3gmlJS/WbXTkLak7A36LqgMkvCqTombgc9zoiphjF90BMj6sD6mr4
 2n+EEyf9JV8n5IicDQ1zj60k54FfCqqCGXmG/INtxgqs7xyWcnVES/XVUWczCVErzs/NkHIGQVd
 NEZL3dcnfYfi+fZZ1tEHfL4ofpsqEVYpQRt3wNsbgXMLlUSMg9lx+TWhY5HBnTJ/pRJpyMZe7vG
 98K2cPdyFFc5P7YkEM+442Wqm5OOSGS35efVVmVl+G+UD/zeCSuuRB4eC+PqPbF5PcR8lMIuLpP
 5y6FQqrF
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a4df85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: vGC6H2R6Lfsrw6tj9PA5CUQgcr1Wxtjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..bcc53d4015f1f27181e977272cdcfa35e970fa62 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.2

