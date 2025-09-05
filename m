Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A31B44AD9
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594D210EB06;
	Fri,  5 Sep 2025 00:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnQUPug9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C4910EB0A
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HqExi031853
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8EjH8EYOYf6Ibi/w1G8pp80W80O6z33eMTmlaCldHU=; b=KnQUPug9g4rGxsL/
 OKld6uxirY72DHA3ut6TvCfSrh2uVUgP/DF3430+Kaeq/f8XbLevRhSEch15xJav
 wVO90HBXi4MOmrE/Yr7O6dKfPG+yZmeYD6ttTqWHmDI0a8WoyvsdyJbcZsbIMn7j
 DdrVoHdPrV9AYXaE29l+hT+GEJHMm46PgG2RVEkLZ8VgafLmaV5YDohD1P1MDijK
 3AJXE+F5M6HeNeV556iQS/3ZoBOACuc0CB8czsIB+95cScRwgwEAl4xZvgWmPsvK
 zl22BQxAgkZ5PNSw5Aj6iw+P23spV+GBEWLAKZMrLIh28j0/ChxUSkgyVXyMNZJN
 a+GdMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09bxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b32fe42b83so27278081cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032746; x=1757637546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8EjH8EYOYf6Ibi/w1G8pp80W80O6z33eMTmlaCldHU=;
 b=CFFLP5PTW13GmmcD9GXN+Oi+nZo8naz2Ff/odkaeavk75M1jTccl2maEp0+x5P07HX
 NZTbR4hfNiEQy7G0VABGxrFYQXx0JbR3juA7wzwviqsN6aw99w2jNqXPZ39ywkAkcBvc
 uDSYa+ddskhPG+fAUz9XP8BUdQd/T5Q8Ywo2np+65BNA6JTiXgPcdCzc9C1x96OVtiqn
 YC2DZ7r6gmCtQMzY+Wlr/WmwS3DEtXQODenaSIH0PBGY0McKui2LYQPJvf9LAXhLbFKR
 lC8F2ynpoJOpR+D7iGR/nrA4RjY3smeQVQXf7yoUJv97OAWLVWW3edvBDSQVvunh7odH
 mPkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzBJBqbolw+vUGu5C8Jgy/1HwWcFpmAm4dd1j/FALLUP30cclT3gUI/201rK1zDcVsj/n3lK4pmZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrFVubAmjN1Zss4xS8Xxt+d0sVVsa+GC1tKTGQmjRgvGYF0k7m
 q6dnsP2THjF5vQAqxantqfKodEEhu2lks/7lG2KdJdup6VYN9KlU9L3MS/yVSOeYi4XPyZaxxkZ
 Jk7BVingdowI12T5LdnmpLIHvW8Atrujkuldxjoq07dsZkSH8tm+RrNIFo7wdLB0YWc82rNY=
X-Gm-Gg: ASbGnctj8rjq3QsF0aQlNFFGQo9y7NhmIdz1hkKomwyRlLc1fJVq6x5GyPKP3xLpb6F
 7FCFdtao+KwWqIz8f8wbyBj5Op8kfT7DlGXIz3bydrchAJsNnaVF0LWotlhciIEGKsmuUSAac+i
 cjlAa+jyQ0zceI0jJmnotkfHQFXQ0P8GQcaOr+xAZoWvJ6W7EH8sm8b1hkvBT/q/FPR5vnAjpQW
 dXYRg92ZkO+6ORTmxiYiGQeTcA2PeV4Zms4SvX/brOO1aWYSzavS/Pz/kR69xj3CQtF7gkf4B2q
 /Y25YJfLABhhq3OD+p3CI/cuxfmIrDFiE/jrLiRxFO7PhIOfKHUkEEz4PtnY0sZp0YEbFBouXEp
 YtB/bTJ49dGRq/G40h8KLjN+GJGnwbQh6JhH+y+xeihNyuzHDHlRZ
X-Received: by 2002:a05:6214:e67:b0:720:b2a:adf0 with SMTP id
 6a1803df08f44-7200b2aaef8mr153541846d6.30.1757032745693; 
 Thu, 04 Sep 2025 17:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGoowjAXuDT2UR0GO7JfTqRgPHDKO8FPpYvARPsmaNuPqmFwTraj6C8Ro2V7Wsk95bjRBebg==
X-Received: by 2002:a05:6214:e67:b0:720:b2a:adf0 with SMTP id
 6a1803df08f44-7200b2aaef8mr153541576d6.30.1757032745183; 
 Thu, 04 Sep 2025 17:39:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:39:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:39 +0300
Subject: [PATCH v2 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-10-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JJPS5pGG6bUUAwzvEHOTMwsPtX9lNOMwzWPn5B80/n0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKQbRCY0g4KHf8n57GpKw1Y+ttJmoYzTX04
 YBzh1yOwoOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1QOgB/0Uu54pfB5QH+FHqAmhB9/t2x9w4aM6hKLwp8xBksHaiLzdkMLUxqbLmWuGq8Y5wAJ6FuK
 HQeTY82/twMeyWig5sNtz8pFwD0qRw9KAvoejcrCY6ZRSx9+vNhY/jPgncA3kAdp7Txi/H/GYaR
 r3MmM2z2Ws+I41CFom8UDJjGXS27O9BarmsTQJvLl7fbo1kYSQideKI7szGSqM2iUtI2OWpjwfe
 a2k2rGcvixt0CESANK5Tg2UiQBdua0jRWSD/MOTZIdJz4rkav3chetWRI43YtK4DszRU1cGdrdd
 mXcvkajnfIe0JIuQicrml0k2o+orUwUP5zvVKJgPwL9KI5p6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _LIRCvGdrpXs_WR9Oc0X1QmmdZD-_Laz
X-Proofpoint-ORIG-GUID: _LIRCvGdrpXs_WR9Oc0X1QmmdZD-_Laz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX4sDAHRpZ0bMu
 s8Xb2w9emWTM8lHQ0w/BamISMae1exoq+Drgda0g0LpB+BJTx1BUK+ErI8AbOQnb8RLNHUgeqHl
 YZH2+pcTWYdb+j6BLlV6MP3By8TtvB5HjPBUoF6LWhQ1Ai/Vc7QZAWqvq+o11Wla++WWaTc1GUa
 0HVxVrGhL0Y6jSNP8VIfJi4f2xsWyPnm1iKgaQzet2xOMuiHTWDHVD7W9zyE54D2b4TpBDXjyiI
 XUbYKYvocJjzdmjoPrxVtOVJ4Gy8zjOq9fJ1ZUL5XBFfbhqzlLfcQCthifVVDU2V33e4ykn7PxX
 0gSiKIR/vjaCgIiAJatP/E5PAnX+uMXCAU/X8IjiBFWbplkDzd+P4v7gpRxqSWHS5hvFXwPNbhx
 pOPeVw4A
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba312a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b950bc827a36c231bcd4a9374e58cde6b41230bf..191d1f2a0cef7ed69342eceb35df0c3e99a0c373 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.47.2

