Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925FCE53C1
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EE111AF01;
	Sun, 28 Dec 2025 17:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEwij8f4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxG+ml9g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AF411AF3C
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSEm7Ep3488749
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=; b=BEwij8f468punwq6
 urKJB9CgqrOEhjKjBPwBBQXG2Ilhu1me2Y8M2L+iFIkvhgwNJybHYhrBCyDkvzOp
 jVx5gZ00XNtkC7J/J7VguH7FjCj78ZFy2j+LVOhNLFfRYXYTgJ62udHdIwgIo3sr
 3221YP2zI1V5Au/JthDmcXGCuik8AcGoq9kLIAP5RwhdRtLDvAsp2zc/T8vqth+1
 eZtJvqyr0V+idOdxnbYqL2mGH3JXZ4lAuNnt09lwMr06yJ0lIQB3RdC93fqswMGB
 xXPfIvwWnEvqC4V8o1z544t+W/lrFu15e9AQzQWVPOQhTxXnDdZ4JsqLkdRg3Z+3
 lEga1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62jan-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a37ca7ffdso125395946d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942503; x=1767547303;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
 b=PxG+ml9gYY9X6Fzqh4dhEzICqDHHx3vCw29BaAvykondt52GH87lIrFYYahINhhHCX
 eT2LeWAxjz1I3t0yfE3DHt4EsfmWY25JwXfXeR9c8j9V2PFpsM2B1Mkb9++kRE8VGp9h
 U/OZ5AIkCcHEv5XsuxmEHgB7PyjElk+6xyB5L/PHBhinl75vdj5C/tn01rNJNTr4tGF8
 bMRqLJpMr4lu75bj9ZY0ISdJcM0A3vxDrKPxBvsHaJqVoGKTIb5p1UjmipjGIwCcKd3z
 Y2UO+/EjBgHLRNlBuJucH+ExgjoRRhpXENjAl8fTuu3T6s5IjM3z2zTfCH3TtQOO5C6/
 CsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942503; x=1767547303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
 b=vv8ZYc1xQxorE94O7r6O5nVD6MhDPWlg2xosRLa64XXa37qyTBlO5G5+9+Pq703pEd
 FEn3BwHDVKVtZhtFxrrpFnzDPtEGl4UhsYSOLJ19a7sROqst/7b8LdMfraBm8a5uCa4Z
 WTamNGceCi8UADmz7t9PUJMmyWaDy9R5st+Z6io7E7+cIRIlqUORFe0k6sJwXeNdey2r
 Hxq4F3g0tiMnFy5SJ4RUn1VLH/BX7yMeL0NkruA7/U75xjEFd/P691zJMNqF+sqVqvzt
 c0e2D3cdLSLrbPG1R98EesDW9/oAjibuwqeT9Tu3Y2gZnRPMy38f69Oe1w/4w0yEsv+E
 nX6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVyG93PW2UjjmJlk3nTKdMz+1+9chTPtD6Khe13a3jMNuqbAEwawbe7xPm6NEcg6nQ/6b2VQg3h9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCvqgtBJuzHlMAiL8EiPWYNjLLp9OI0mz1TRulilEvfIg1KcaB
 CtZ8+vTnCCGifb7DFOCdSyn2Ia7QrkjiMEBNKfuhSh1NTG8qN6jEKwlvb7sONNHlh0B9FpKboTn
 kcII/Ou73ltGJSALiEArhfiK0nroTm1LF6n4mymeMHbZj71rZ53y8Lvvzdc3oJnDLoUr6Ke0=
X-Gm-Gg: AY/fxX7T88u9UEoTs1D5yrALIfoG6bnxLmzcbsNfJzl9vVkKT4NH0ST3a8EHXdd/jvG
 yjGv0vYE3tX13liG8Dr99klNPUXqLAT8CRRjPQfC/CjmKkksSrBXWRWOnliX8zKooXDfoa/NviJ
 AQao9zUp6eNZNY8CwqCc3T6W+VbFDVaYIIXrV6iCrDFv6QvZe2F1n4RZG56GokOwQiwvXtO6/TV
 Ew2HoViN4eAlk5Hk6wjtzqzwXrSm3vs/7b0J4ljSVJGbM/cPFh5L8QddHwjlHiu4OisdJHDNYdd
 pl/V/urZV5W/IJrwQFJxkhvWfjx00PXf4X9rl82UC0Au0yMM/F8KpmI78s3qlxUGKoFcnPD9f5+
 /Kv/i8rsrjloFcjD/8oluOgeYREV0nXrV+rfYUGs6fdun8K02crXBNDUQL2DY5gf42iMpEJOeNy
 kYL3UVCvNHEqfkMy4ZPL2OHjM=
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id
 6a1803df08f44-88d83793405mr311516546d6.40.1766942503360; 
 Sun, 28 Dec 2025 09:21:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5EUG88eN7xWHCQu1kB/Om4DasLN+n2uCUeGVvVxm3AjAOh3j8JLRR73QWpq6YGG91jGc5zw==
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id
 6a1803df08f44-88d83793405mr311516016d6.40.1766942502851; 
 Sun, 28 Dec 2025 09:21:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:34 +0200
Subject: [PATCH v4 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-2-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciqEro/DFsCfKaexLHG7KTjaJzdmaEO/86Q
 /tztctUKI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1ajxCACH793b0lsnrCbvP33cFhq6yL0q59eHuPMhmnMl4PbAf74U2q6vkmuhCLbqWCyjjympkm2
 F/QcVzF6/2fMsBgWaxsNYMVRtMEayNK7VupJM/1PgLNA0wAVIhFcD1nGQ9aAoIUL3hD0ssjtLSE
 9+AjggpuA2/LVew7AVfi28UvHarYVEjG/cdGTOH+shJS4pH7Uc7xY64PV2WAV7gcxdIF6LMqZF8
 zVkVffrU80TTqtUmnaNTLFzL5KTn2ydJbita7NEyIvP5RCWD2I94OLeJHb90rtbkm2B4OL7NFwl
 y1FdVeZNaoJYHJgm5XqKdUx1uN271EkIn8vhU3oofzZ79v+n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NzxzBnY-KUEaimXkjaFjngrZGtg__Pz9
X-Proofpoint-ORIG-GUID: NzxzBnY-KUEaimXkjaFjngrZGtg__Pz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX055CbCOkCj1L
 QVqc85Aoum4Oo7iQ06N59pP+RgjO+/KRMN0JGosjRydbY6HXH/7LEI2ZUKxQetEhJNTtcdP6VBY
 KcVh/xSutpvob/yIn6Np+ANCYnaoyJRlPChLRiOeLJUN6eO+sV+fDGnc3R4AEh7BJqXZdK2wuSv
 oc7vfn8GsT1NYaEHsQ575Gusi/f4gvbqYa0lUoysosCXm10aQhNV/WjfsTVrHfaRCOdmzB2G87e
 q2YVjiBK8cSIau2HKd9ekMxkMLeiytEOnzxwMmL1TayGV71Ty4HKSyTY+Xt6iKww1+5gb1RWUS1
 QI8vygFwjGQRty6NMV25j16Oz2pGo5Aq21qfB5rkxg56h34dtJPixZX+4K6Bmmry8j4nYcOmJw6
 pHNeZaAZWFFuXPeJ2UDwTUbKmGCE7Pqz4bRhaIRMPEEpDPFtyxj9vgjjYgq4OYUgkakq+MIgJF3
 HYoOHXf2iJp7/gzDXXg==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69516728 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8cP71iSYcfV9S7Y4u-4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158
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
index 740711ac1037..45b3c8f16b23 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10570,7 +10570,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..80c37487ca77 100644
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
2.47.3

