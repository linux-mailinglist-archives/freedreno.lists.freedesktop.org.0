Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCDB28EE1
	for <lists+freedreno@lfdr.de>; Sat, 16 Aug 2025 17:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41C10E389;
	Sat, 16 Aug 2025 15:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5IKICsx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38510E388
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GDeKtM020661
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=; b=R5IKICsxLv6COm9L
 PFZBk6sLP4uJR3A3VmpAMfp0N5eOTTrQoIkib5D+dYzFzDroTCmwNT6mTbwfFsaV
 X2jkvAKqoGclfm+vqCZlDyaZZ3futP8r88lBSkYl4SYqwzEGN9pqiEuSmJDnkrir
 7ltUcd+SwHraN5/tVW7PeCQj5tO2HGFn/JufUdzNJEpRzz6EiwiQaDCr1po3ah8h
 br8mCgAe4ipRPOkgnQK4hM+6YJ+VvbenEyGIH4sG7S3sd9+FZZoUGB4XVNM9k130
 toEuZ0l/whK3fJRWmEJ0pJJdoPbaAcWBHvI0oGZSZKD28mGs6f5stwEHkT4iI2wH
 5KDlfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2u8tyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f55836dso66260156d6.3
 for <freedreno@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357581; x=1755962381;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=;
 b=evUPce2MOVsN5qgiLioxFJu6hVtSD46SiNoMP51mbN0guBB3t5nWBVu4qHrSeTabSA
 teEc81l82pZ3APSHWcwqO2XrFRe5XgtAaU1O+DhDurO8Qjt8/hjlhPZsDHARBHULGTgq
 GJGzZtUYPcP9bGRe8CVMX2jYuLtT5b67zYTDdrrjGsA/HkBIoFGO5EC85/6FTYMjjBOg
 WIJKjKzPsLKO2J6OiANpymIJxsw/zqQz0UgUMDyVnvBPIeYKsNB0Gdn1h21Gv5jCw5fb
 E2b/NCf/VYLylSWmxY3WdfDVmeFFhV2WpkZirUNP49RP7qxy+eeS5hcxpn1q8FZEt5jj
 whXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUlnRgCAiIHPhxbjLRWg+09gCFDDvLiGMs+igJV8OovWqVwRVN+xe3at75TcgWbZocenX94vyZcnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRcl7mVzFi5McgVffW837kTREgXSgD+bbLEnNMkvJnvLOQO3fV
 4+QW+Z/Zlt9j9rjt7U6eN/7/Dv829TmPrbYbzv48ZBiPGAFzrIYXw/xLV1J0lUbc6te92cIYS8q
 uKCp9AanZTvvJbzI+92bECssqsIDsCsfwRm5o/WDqJHb+JguJNL4qynpffqVDmKiZL0JrCQc=
X-Gm-Gg: ASbGncs4oWiI8Ti5mLC+D11rMjcbDUDFSv7OfqUGtCyqP0r4SsCjtWY2EVNAOLpteff
 lAv5pKVgfIFIiUotFxToCgFYpB3Qv9dtmDSOLIaAxjmaZ/tzs3sAxEhuNBYQr6e9qR4sS/MQeaV
 qBiYi/2oxWLBnMegiF1Id8EVImCbOHmngvdmeW2Z+It+WKbMtMJ3+vm8rDBFMCOxQ7SGnOdU6MG
 eaof+qpCImo75v3w9jwyIFe9TbYkQlVH/KHw6iWn8z3DmESbGKjrI61AhLbFcmQJsyZuqVTBixB
 q9/Eimnn8YM0Ds2ZvSU+07R9FGvmP5Kz8Xd/EcjwvkupRgf3e3vwX6Bt35L1zKS22hQdcQsXV+/
 CkDXO8+4Q7X4zN9VrV/2BFPgv5PxS+JITWWM9pL63prwXNcloaFRH
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr81268046d6.14.1755357581451; 
 Sat, 16 Aug 2025 08:19:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3L7Kg33TAOFsNeJ8twbLfA/y9ftS7KG9iciVNPJsGz5y06ZwF8dOFeuocvcqoStELWJ+qEw==
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr81267506d6.14.1755357580964; 
 Sat, 16 Aug 2025 08:19:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:35 +0300
Subject: [PATCH v2 1/8] drm/amd/display: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-1-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIUvDNB5/Vq1AfaWJ5dhoQY3yskNwZSsVo+
 QLCjRWL1BWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1RTIB/4oPGhWfB4pdoc2YqsPw9ILKe6U6yn/zFh6rnIOtHWK7ys5g3xj+GRAcwBghHgjcQ6BzH1
 dehVbsEOedPhTFVaigfw2rPYmwG92pSk5kN5G2lc4oYNAsUF+DxFsfHK0loyjvrUkd2bFIT5jWh
 UtPLDKBtcuw/4M9zqa6ppMfgd1aVB1sibq2w7xnR7fuLjlHn6MugHO1j28LWmWWTpgTB0H5FYoE
 Olqr0/g4qa8uLRJbbDPzpY4QD0cdT0iKtnrU7KeeIMNItjD4P5bht0GvrFBxeS/39EluqjryGY8
 eMVdRGRldWpOy6kPBFf2IhPHsn6/CuNNAbV8yiIu6J63L7Wt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a0a18e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 3L4F3EZGJy9YgHXwLfpdhn5oFSM0MNa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX2S2lPAb0fpWR
 8x1Y8vf4snjr5PtIKQNpBQ8T1vtCkjLDQV+Y2GIGy1o1V+1BIY6Jc7ZnkEV32dM+3445bx8SgA/
 ihKuuP9snwjZPlzNe+saLJ1sQOEwsmPVVK3ImCqu6CkVJh7iyqO50MFGXknzzNt53+jTt1a8CrY
 ST5gV5u/JYvO+aCOAl1IJVLQeblA5vMGY9IzRCSRoT7q2n85Ws+qQuKCBIqRv33uKlsUI2ZDO6X
 PG3YuuIBHtx0G3oqVLgOrL3Ky4dTZiZFBswHGKveWGaB+2+xDDEhdLSXlzslVK/jDLaMJwViUxF
 /BUB0b+dIV+537vTVVZbMSqVOTadateky9CetT+iz/gRG8d2kfrvzN9RHP60s19ch01hORJdk2Z
 sAra0tUX
X-Proofpoint-GUID: 3L4F3EZGJy9YgHXwLfpdhn5oFSM0MNa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268da41f576624c50ef0c76ede67414..0c9d347b1efc804a28fb3095df94e543a19e4159 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10006,7 +10006,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc878ef6916782ff9fde847813938461..80c37487ca77c0494eaf769c5b9a3c53486aa52d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.2

