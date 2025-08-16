Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29BB28EE6
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 17:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C6610E38B;
	Sat, 16 Aug 2025 15:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWH33GE8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F11E10E38F
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3B8OC021731
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=; b=SWH33GE86FDLtZn0
 dlY2V3vW68TyhRFxU3mWsuoXo5/BnJWF5A8g7rb31wtBSSgn8cg6KL5ZogKpnyGv
 DoJoL2hzrBQh6fo0p1Q5hgYRdirAyUYrplnXJAuK/M9H5XIPDUQYxtwkxnTsBXzT
 cFB0IekECrC/H88ibrAS3CdJ0LMrRmUzj4JZtvfv3TpSac8n0sZuVDbd6OIpiIWB
 QmR08bWLoxlk+HnulcTh069TEcAe/OEfEhE/R8cVTdy5Khth0UKjizF4FomlhhTE
 0dcTTKMonlm4gmzh1voCqRRnQ2I9d7w75l8kM3jV61DmsysULKlLYGmIi7fiSZie
 uVL/tg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8v2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a88dae248so58946866d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357586; x=1755962386;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=;
 b=FWjqhXJPMzOPSHTBGClqDr80afSEz88YcltQpM46KKg7L7YujbrHUGGkQiP0cm11Ho
 a3vuZir1IQR5xAouynkELFXeDflZY+chqCBmcT2clwR+OnDMCxiHBpVlipq6gXI1e7LC
 /urq2KG2vihUkDkMDfm6ZJRU5KcZrAlHZWzP5QR8sS7SU+gEFXU5c9oV7L7POepJ5WLk
 O0EKJbkPy5ODuR3gA96nRTV9nfrvPhpFT25r6n3O21uEgyTW85n7rhkPFKtHQBb6+1Pr
 aiSCMXakeh3I/pQjUfL0pVFztLtsWgCNSHcIaPpQWyXio3RYFUCMbuNJ+WzrT9EMjf0I
 umlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcIRNiRydRe+TWrJdustq7ns6nMdcxP6Ts2lK1IA37DfG4AomGLVllaeWPQsIEOuVp3xzcabRXEjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmnbwgtJ+CB4c77iPF2Oxuwlycd1BLOEarMvg65pC3iIN7j/E6
 3LBYjhFzhU6h91YRUQ5/r4fgwmSEE+RRLh37E6txVQVN03TQDw2a9lXuaWTMeGAsKl2TLrqD5ZZ
 g8v9m8ZjXeG4gjHVVZTVmBlDsqX/dRWYi+/Bjk1CYBI4pTeXXvHwQjd1tcGz1LiTIPLmpJMQ=
X-Gm-Gg: ASbGncsVJ85IdSR6SH1QRyf3xEUtIIZ5aoFLNpMuMnqIP3e/XL7COJRY2sPM9wGUrvg
 M9iDm10nCcdS0NP0HPj0+mXLZlOxK7aazMzHvKsQLA3EPTn6n5I70S9b3uy5v37eXKLm6VTjzX2
 uaUG1GMS5SEHBQJ7qyYnrp/Ef9wXZIGTYRcuZj6eArNPzB8ay79La5bQ1ksiaNKhnOvLyc2Fdib
 MeqgqFSKC1EKZ5aV1jjYd436oRlROqgPozZbsHpFJNhDi26i77JVYwwBGsbkN5BdbqmVIj7pEqQ
 PT8ILuTQAD/II6kn4lr1AUGjGmofzoHqWOi4jAPZhKBInEwTVs0l4F5GrKedoRM0qo1uaC4n89A
 aWQLsyVZo4AOEwPDN2ANxtgjknXJQ1qfLMU1bsRbvxqzNDe7IHhgj
X-Received: by 2002:ad4:5c4d:0:b0:707:89e:20a0 with SMTP id
 6a1803df08f44-70b97e5f8b6mr121342506d6.22.1755357585878; 
 Sat, 16 Aug 2025 08:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYKtw8girfWWYEqO/Ggcji51+kihQkK91jR/jljS3mVOG35hIp3DD0cbbL9nG5EcyplDI8JA==
X-Received: by 2002:ad4:5c4d:0:b0:707:89e:20a0 with SMTP id
 6a1803df08f44-70b97e5f8b6mr121342146d6.22.1755357585415; 
 Sat, 16 Aug 2025 08:19:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:37 +0300
Subject: [PATCH v2 3/8] drm/mali: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-3-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIYX6MbbfX0q4CqCoZNIiZx1UDb6oAqdBYr
 e0GtlGtu66JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1XFKB/0X/ib5lIagcGHFFApfOPY+gYbqF8flWf58m5QwtwRW5JbZgubNJhn8ewnog9DlDUs1iQ2
 8AZd4JZE8uJ39gfaok+MTfL+tqc65sbijJoCKgvz9+dlMkRxi1rkg6W8XBAj/Ql5xi4QJdIrHuc
 6v09zB7eIG7Lmmyxvy7H+l2SX3npPoNX/1kWEBUcDdZMEz+kNRYaS2C67tip/1O53yvNISFiR9v
 DZc/rM1UzRP81nWh7ilpYyfA7hjUAMeNnYJR+EKl0Ma4t7O6c/ABqTgZmtecludu7wNZwZhCZBX
 S77fnkUHzj74L0sc6kM/VDZNgmgTj+Q8ATzzUHygv8oFDR+G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OpIMyShlliQsaD1rcqQcOv9Rle1cURjR
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a0a192 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: OpIMyShlliQsaD1rcqQcOv9Rle1cURjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX1dK82owfhq4P
 +8yWvF1iPe+C39LNxCPzWM8c9dCoKvLo6ynMaRYkajUT+ahErg76Gk2o/iV6olSBTiV44NsMr9D
 sHeFqEAjp0HbI3rHjTsm6WqHjx6CxFC3/dDTEyWzLGb75Ymjaa4p26wlEoSYrd0b4mfHexojNGr
 wHhYbcJp8RRyjKaCWpbAjgxJmFS2XCr0vzfqHUKROyxExSNqqTGXHxuifk0LGqZdz38Wgpq8byZ
 eL0WzYGfwp7T4OWah/iaCEK/5Yd4XklAlHa7NXgdGYC0RJssmljXLjcv5erZGC3rIk8b7B5NFpy
 cC12UuVGY+lwPR1hzdHimmc/ArJw5SjQF+B7hje+rPhmvv1CQcfy1BNor6a8D4TAaO54YXNpKXv
 XmyXZD1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..80f7f3474c4494554c6b6fb392e7f396b3b49c83 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.2

