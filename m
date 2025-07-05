Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B538FAF9DCF
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECA010E368;
	Sat,  5 Jul 2025 02:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZPoAGJe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AC910E372
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564NSqOT027687
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=; b=PZPoAGJeZGfCR9mV
 0iCVrfmV6+JUjcMK7WNrMx4fgYpz0bczAJwpKWzgq7bgImXr8IJ3M4su52r6V+6i
 zI40I032smCZgdpnDnPyoPAkPSekv6ozUYm3pXoLaVcEY1N+TLpk2AB55xbK3ODA
 s4pe5Dwk7qClY2n9DEkxPnlMVi42+KaMtoOfH4+UNbMrkQQv+FYyHzHQapk9nraj
 9lVPdZf7/6M0PwzrXZrLIIWwwd+bVluRMGl4fXmkYITtf89I56jQJwtmPqW9q7nJ
 BamITs8fRhiCuugMoxphAl02oN1yqz41+aMP5+PKpQrZXbQeePUjGevb9W3KlVHa
 PgbDdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9w7nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d09ed509aaso158764785a.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683667; x=1752288467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=;
 b=pzD5IouJ5DEI25WmmG6gcLnZ+1qsFa8p8PxT6iE2cHxW2d4DsK2hAKPZxMfHXtlVoz
 aTC8KAhAzHD/1wjaxxj7AzeN7Ux/s5RuLlBy6IwBG3daBaLYwLKf+7XYRgNL+CuXqyFF
 4aFirIE9B/7LSPC9WgBiQ45eNwwJgw2uwm8KgQvLwzZK/t1Ehxt8XEFfps4qArsiXPwT
 catfEKrzKGf9Ne43BmdRXOiH52eCoXP/pxEDq1yBPLU12VHqU4+8ndRjZ82mBgHExASG
 gISF9y5tt4CGNYmmXm10LMaA5+JbWIj0DCWk8xXj6AXyxLp29rxRC0lRy79KSXp1s3/v
 IpSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayG6sqWsE+XwNWfsNrlFvwxL0yEW12JxJpLJA/EoGYkt6byjjYVuo0c8fO9JKeQQnVHrpvhDrDXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybhWAh1vU1eipqg6ZrIkzaHx4CVQdIQN0EEXXyMX5+6JbPKSqe
 C0I0/8vzRYbElHztIeNvPdkXgeP45zekMgIzpIWwCA2MNyfrKSnsU5b+BCCd30Dr2YNDokY7foI
 ecoowWVb5txizW1RGg/b5CVcxviIAFGhPXNn/VFU2YUAvtp7fd0jFQjsStl8H/YywdLs/jP8=
X-Gm-Gg: ASbGncumcXVpje36NkIvkGl+RC86IhZJ3E5YBO4fzFtqBxWvoiMl9G6BaOtPfB95A8E
 bMoVv4MIT+3KPesz4O6qCuEm2/R1j3GuPcUkX60gZRK7ZI48jnxHd2DFveddBQMh+cw5LO/94P3
 vIox3YLJIpHiVR5xxQxOj3zbXIkXE4wpAVzMX3VfL1DNpH+Ic9jugC3vyPjJW/UgjaL1kxI0VO3
 99ftXtiIZKtaF3FxpPPwOSRQnT0tX8j49aNDmY1TUoyCBetskmybgyxg6waJgaFV6XDhSvYO1ui
 v7vAptvHzryIgBmLQpmFw5PrkkvBBbhzDSfgvDnuEuI7YyLMsYdeVxOSIklEbqvqO0HcVUyI7EP
 vYZjeD3bMoa+ZGx/Wp2g6FDqDicWWecd8VT4=
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id
 af79cd13be357-7d5ef0fe619mr170045885a.7.1751683667596; 
 Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYqdfjL7Rn1SxBAuEeKUyyr6SwsvudYw1VMr9DlWZRcvbzZcnGwoHupwmPfh/gZLRwrzYuQ==
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id
 af79cd13be357-7d5ef0fe619mr170043085a.7.1751683667029; 
 Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:30 +0300
Subject: [PATCH 09/12] drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DW4Sf0tr+opR2OUJSjiXEm6tu/MiyrcROuHNPuR3uTM=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9rmMP3gq4UEySExej8M9BSExYQdJGSXRnL
 CmDHN16TrqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1X4uB/dCXfk0D0p0vS2Zp6nbCLQR+AhoBVHk795IPjRAMJ4YsMi8FHpaPRmWJakqNpGevfXgrU9
 fUNyX8afIXDOs8j3pL9OQE3mQQY6183ogr4HfT4zBxV2ftowdVhu58xzAWkZYqFzh1s8ySi0/Ry
 fdjLfkM+LkJwpITKi6Kie51fZbQ4TgVXq7A26KdN86WN08U/QXqGCJwDSADvlNAnPebdXAgU6GC
 TAXimEsAJ4gkjUe4CZz0C88YNgS6cSS0Da73LQhaM+4yjq6nE1qAIzJNAqZXIAkT6+EE+paF9GE
 1u7rxzblO4O3zryC98asbDGHG2um+iTJcBlELR3F6MYhlzM=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68689254 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=uxSOIRPgPw5i5GT2uqUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TC6aJX2hRtPoy3kvZYE3zQh-ziiHQAxW
X-Proofpoint-GUID: TC6aJX2hRtPoy3kvZYE3zQh-ziiHQAxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX56pFuEFVe/aw
 /jBMpKZUGx7dKtW+ODxFfE4/IyZD1JLcsDZ49caCM4KpbF7PLMf6B+9/JH1Cq8rpAnkWYVlK//7
 JxKQnwuO1XxCYBmq++oH8+xDiCEM58uAyEDl5+i+Sf5yB4HYyr2lq/cZRnh6Q4CxJ+9lN4wtb69
 1XlgAeyLW3pRCHJiN+Us/qDfFlAThuHFlCzIQ0+LaIvFjZ8ZyUUHCFYE/943sJ70hGtg8GBiI0n
 kDxXlwGOpN7cBeWkCJsBhonl34VjSWEqdxlUnTRse2qDKZ5HeT2291CUANDsBvSzPXrb1domYNw
 OCoQdjqNWq+5o0qJncd2xmqcl6oOu8+M/Sb2i7xQAST33HnDvHaoE7SL02/SfhTVLpLm2GFC9ka
 h4VKnkyLBgljG250sHiS1JKtxXXwtduOtW9jHHPXXmIr4EG/CYIx1eTyG4Bk94zGnoealXZ/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 59c9427da7dda07b8e8ee3d070d2dfb3c165698e..195a6b7c4075eef40e7a5d0fee208168421cee35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,

-- 
2.39.5

