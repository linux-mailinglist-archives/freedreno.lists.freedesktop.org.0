Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C690EB182CA
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 15:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F110E870;
	Fri,  1 Aug 2025 13:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj6cMkpQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974010E871
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jkZC025585
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mLmvIm7aiVxs6oMFsxxhFeeRx+tZKZlR89XtVnuV08M=; b=bj6cMkpQ1CVvcSbF
 fWDc1EgzCf9Uy42mi859BDmHxMGZLuGWKQ0511T+iMZFf3FBw34+kmvRM9ZwZ2T+
 hqSiWO0SElelynghmVxziCRovCRsIoOp0DPCMhhygCXadGqFTBMY31fmCzil56hn
 TwN1uWP4dvOa9eW9/rLfqx5Hxzi1t9g/fc+EQhci4F7kHScRoMm18OgCxPA/IMJJ
 Sn+1TZEAkO1SA4NpsS9qT97FYO17Vd89PNXRC1ZFsXpnqbmMpUiqBr4iute12eU/
 HjisHaG7kQRnXCTRalQhsczTLaXyaZfligHAJKqA1HEeCralZm5qQxCRbtItymku
 3B47hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g4fp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab60125e3dso20315801cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056287; x=1754661087;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLmvIm7aiVxs6oMFsxxhFeeRx+tZKZlR89XtVnuV08M=;
 b=bHf3873AQfMr+Vs09+SI7Nhmctqc9PnKJ6BE+OOMpFH0OTIl5iCVpKuaKbmdUk0SIv
 iKNLsiavg+JBU08tuVpDpdKAJzUtvXXH9CClFNxkNK9nQyPJbUlXoeONri6TY3RCYxVQ
 aKb8v2teiAVSow0ucy/kPb+ZCrGMmI+atXcd1NiTqOW0hgIgrWH4dwTgV3qtX/0/ocoT
 S+xZGRwyP/0Ma8YJyoTvXWe6cpD+52eb/om2rseaWn94QEiJc0kRWl3J4a/9Z2tSQJUw
 iwPpvHtLL71771PJA7Kzf19td12GF4o1YkV7OUHg4Sjzc+XPhK5l8JTmpvK9vSaLguMC
 zAFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxKk70TvQbuGVdhD9MClkTPqdHPckW+J2CMJQpiYLvMyW9iVbr1wO4+PfXJmi+4AwvwiigqCxcknk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmrPcBFCTbkGqG/VKR0C7jOi1Yi/iO2ngCLUSDHCpz5DjWMzCT
 dLphgILp1Aq6gWhrWz+1MREejXK6x+6r/xAtr52lmvGLVD3Mrs0k7XwsoqtVVRDwnYTHAyj/bwd
 XGoh0O1eGdVxxvoGEhk1NYnFw6Xxmfmtx+xaUqayHjlU2teoJQDaaGWRt1cPABj+zoUYeP24=
X-Gm-Gg: ASbGnct7rYodSS0XrSsQMhHmbr8+1t8blU+fCeKpKO27VWJShna7XKH1k+3kEIborZI
 pYwm8KFyuC+/ly9Xv9BCOzgjR4LIPXsiUyC509dPBPgXtSg8ytaTT5f1b+bysBJ0yTbszLcXeKi
 ZcifS3i2EYDoidYgiwUElKuqzi0vdUjmkAf5vtmF1pJDGEEMtXNIO/zunwMMu6whq51RvWevXIM
 i72vZmUS6/o5eKFmKGkDkJwHOwg3Ono+DFR3k0edFIUm03WX7c/7CRjEdYUNCm5jb/sySLHpSRQ
 IPSc6AnNJcncJiPLU8VnOCESi5Afxpf/HX0fwJfFY5LYgbMx+0VRqiWstWzdiPBEyXjOSz+EKSj
 zOdWiF+fudZGYI0mIrgOSB86JUsxq7kzzz5RH4Mw5XHWSH8eK6nZg
X-Received: by 2002:ac8:7f0d:0:b0:4ae:cc29:829b with SMTP id
 d75a77b69052e-4aefc3aa90amr71546841cf.60.1754056287136; 
 Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2viD7HCKu6xS/QJRV2/S6eN0H8AL2SA3fKo1xo5upDmFhtIUjZt51hysctMnmpx05ndtrSQ==
X-Received: by 2002:ac8:7f0d:0:b0:4ae:cc29:829b with SMTP id
 d75a77b69052e-4aefc3aa90amr71546121cf.60.1754056286612; 
 Fri, 01 Aug 2025 06:51:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:14 +0300
Subject: [PATCH 6/8] drm/vc4: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-6-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NBwFx/yH904VfCprkWLv97gvBydY/VJ1MCw22/7DCtU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTWODg7Z0I052lkDGy5sp+gbJXRPPW3+xXz
 I8SasIVGkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1WY8B/42eKCXBjQZniwEwDivu+L77h8KSZkeqYYq+el8I39V5l9aHEmdvGRms2n+efNwV1ck0rj
 Jy1a9Cv67p7eEXrs8o1zTP+BGa3sKhKTs4lvZWHx3d6YjAcJr2Zg3df9INQWC7IsATuDKgfbA2E
 JhHLnz8c+tuCb07y0uqnRTHGpLB3UcVli5DjTVGH5gGQPYpegIYqh/FVxuacRujIWIvOW4qRCT8
 +FnwXJAsYkPA9arYZIm2kX8awv2FHs2ZTSNfz1ht3uGAjMo4BD1uCkmrqpvMEoLyEzE8gjHsSP8
 5aOgtKUcrk2v0+9aBgHAKiILYunQCCOJCo28SHY+jdKL58YA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688cc660 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yMBfQ5tzdsisd4Yxg1ppBiWRE0dong3g
X-Proofpoint-GUID: yMBfQ5tzdsisd4Yxg1ppBiWRE0dong3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX4xtpEdu7RjYI
 2VFjyRND33TLjJKpx1Ik2UnFWKSr8VILV9BJZBpbjCVyEE94eipizI8WSn6p+5+7UpUBqnXkkoS
 IA2QITCq8wAqGK35dkMI101LSzXcwbQs7PlLKJRxN9qepKc2DzzRryk92JNMVFVprr3yAuFZ5Jd
 SQ29Qo+OEa/wdxCQPqtDsIswR0Lk/c+qGgxqwvC638K4pf0GBYrSWra8VeubQey/4K3LFIszqEh
 BwazhMlS55Mc42nmmNq+Csig7RmmoWmPsdlPPOh34Q/Os+Ywa/0/zYTlYBeCATC2HpHLzKvQbUV
 a0OV2WtQy9k4XY6IeAVYRW7l8zhssAxpEbtd2VWr6h+f5URGWg5aHOCLq+5xqwf0YDfE9dNlCh6
 y0zbNnq/bT8m9apHUj6Pj/bseiBf7TlpPWY+Tq4xqDDEIwOYM1ahcAWk2VZN/lg5SSlrW4/i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=927 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47861ced226a4f64661f545e21ddb5..fef4e4ee47cf41d40de47c5201f0349dc36c56bd 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -377,7 +377,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -601,10 +600,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.39.5

