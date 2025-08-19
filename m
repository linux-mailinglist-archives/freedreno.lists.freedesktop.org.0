Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF2B2CDED
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6A10E679;
	Tue, 19 Aug 2025 20:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOw0gzB0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC410E675
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH5MKD027047
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=; b=AOw0gzB094/vDr2i
 z2iu5TdlCo6XWCCXSc9Y0sx5QYAEBOj1Azj739aDVgO52hmdX14GEtx/lMzHirDa
 w1ezg4r0DxiL/qIciNJH3n5aTX3CoKP2nfgy8tk4eJqbugDVkykePpOIvQaoptGI
 2JEZXFIyPvo4sKDhJqO0WP6xr5NZMRc6A+lpA98BwggLLtDobFKxkFWDIQxkVUEp
 IBjWiR9zFKHh76Gc8LCRf50emHPMZYvDxkLMGt5nrky7vpmZ2Q3ceWRMHPg9ros4
 iOXelJWmZz5EWkLA5FJiVpzvf4jQ7fMquaDN/NI8Nv99ajmqB6dDZIpjqChu8qY5
 OnHvGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhvrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88de16c0so131157596d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635589; x=1756240389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=;
 b=c1cVa7vKw2pa7fI0Toiqg+FXaRDSs7fd0G/xrBMap9IXo8b0EEHfRa/DvLFCmORtmK
 /mEj/6rtQ22Z3KWFUMaSWk5FQgDTo4BXGxRPemoqpjG0G8ScbXbSpXhhfoCUC0pQj70j
 6tQc4rpXc6Ujobz8bRNxi+znGLmfQEiLJSm8fubQp6qbaXYln4PvBLUbo7viJl12g02L
 ywy/WLRYbFxN8PxNPdk5BK9efNfjhzEv4dWE3wDj6HznLRKvp4A9wfp1grvw1mT/DhRs
 gfv4dAXPyKYWx7tgXlqG5WV2MqsFq/CsXRh+WuEVol3OgtmbdURVSe+S4aL94H9RPnuq
 /4NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFhccIt2nLGequVshQpPqIcgUiaya8lRZPPD5XvYy8EjXBE0bnLHEJRzfBxnSy2gcRW//76jTdxfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3DFq8wcqxt7ikdeKC4G5QYssyp8s9bWqXd3kXtGZYS5eFlpJY
 jyM9JuHgv3AEEmhFdQjB6vUNLDFBiIItObjpTMlGoajjneK+iRDdZzrHtA5nrTfw8iSyKOiVfM/
 YrToSE6th/PdmsCNH4VgoWyEcdGtmebrEGh/LMdf/td93K98pu7iDG2AjWTAXJoGdUofr9Hl/I+
 E55qI=
X-Gm-Gg: ASbGncvoMhHa58iKedPHNwtzuUo9QajpbGf55Awm6VgVXh1NOlrVPwGnvf8iL31Xo6+
 ojGR6pkINYC2QDef4HOw7dRsAvaDneEV/2RqotZqVulYplVooupQE7evkb03kATZezlJNfko1G1
 n+hHJ+5+T9w6S9yr6D3wmPXQLmD1WzCtitP0BRrwpMtaZHgZo6pDzAxf9h5bSvJ+MZrwsoxkS7w
 BgSM3GVZN9jE/rnfhztcdwGPzRZMpUhE+xfgxeMsnjKrRcl0d5AWiznPxnv/X9pTmuAOjr7uKPj
 fFeUAH2mdC2/JKN0A/gxcX9xhLTYJ7S6+7mRBCjEeq8cR0nsgoZWyaGyOjYLNM5ZnBoMLgK+tXU
 6/o2a9b5dbc6iS+COHXiIjdhCdWdsham7KYF/MeFY5FKOSRpU/8cs
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id
 6a1803df08f44-70d76f5c35dmr5036676d6.7.1755635589136; 
 Tue, 19 Aug 2025 13:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGNkRtmHZj2kwRc4y9joiW0/IdD954hX+cZa8EJqfg+DQk+Kuir2C5bEakrVSMmh74F9NL6w==
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id
 6a1803df08f44-70d76f5c35dmr5036196d6.7.1755635588384; 
 Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:57 +0300
Subject: [PATCH v3 3/8] drm/mali: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-3-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98jRiShnU+tPqXA3NgCQCoCCCxsblmO85Nn
 1h8us24U1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1c51B/sErwvDMVP76IuxwrizrFdDwWxd1TIobv+DiOASR+c4gjQ1luTuJnSzftykasC1wY/qv/I
 egdxs5YNWQ+6aqMuw6GyB/W1jqi3zuaSvJl9Jf5djSqI167jMOYFXvbT+RTwSJVcNVX1EccXB2G
 0u/wRJ7ySKBTSxN9gLAXZ6cE23vdGrPt0nYKZ2vSMkVtFFc4V1WVsVbd7Fhq1aVn6g58KMBSWZU
 I/9zSRkIaFzUE0OGTsMAFXrCVM8V9ipB+YFoC+9NWZbMjSQD8zOMmyM/Zaa847DFNIzpziBw0Nf
 Motkscyd5Lwe6ogpT2PUjhdWq74CwRV6cUefxzNnte9KyU+3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nN9AO5EyimZbhEyVma9E_n4uZ-CppSum
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4df86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: nN9AO5EyimZbhEyVma9E_n4uZ-CppSum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX05eR+Eg+oiMj
 rUNEAipjiBXRJvbIwT2t/6j5stsygydRgAkX5GbaMLkYrjLxyzUGFP7mpk7Fvnx8IauTQ5lEr7k
 ee72vRs5yeR9zY0voCNk0fWkoahWnqmMU/P+CnFst736CCyxBwV/TKkzPeG8X+4pfaqCYU1SitB
 eHw/nE80Wy19fETQgV16xzhTzcULFxiqOR90ZTxqcAu2lZlBLmZjSR4F/OWwNfPsBlBtrAbj43u
 iMkSGrJNnXuYkyHF3XBhgyQSpvf5Lw513OujhNt2a9dROgfqQtmXDmBjTqJE3nV/D3DRFGT6ruY
 yYogxOCcCokWu/6QD97+I5QNdYae5apdv3PbZ7QTO4GHNa1N8Uqhol5KGUohrGY2F8bDDn6YtOS
 x4zp0lVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
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

