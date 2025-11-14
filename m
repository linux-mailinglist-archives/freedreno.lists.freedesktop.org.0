Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5AC5B33C
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BFA10E9AB;
	Fri, 14 Nov 2025 03:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vh92We77";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPjoAlAW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC3510E045
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb0FP1428363
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=; b=Vh92We77N5QIZHvZ
 NSao/Oy+WO94liaviIJC0pRX3Xx3TyKoYy7fy5qnJW0vqCtzZmfa+8PWoomln5yn
 gKlMZiZIS5yqnS55dKwqrx9Aehv2ApAnG2ynFpuWfkHgb21G5ajI9+QTbKqLalZ3
 3ifz+7tsUJu0n0lW7ZOAjt8uROEykG2AMU0GfR0JMIMh+Xd9SSRu6NHXLQG52J6S
 C0PabpzE5bmA/SJYouqWnj2XWZdT1oJTQ8ElsLotJe8VV0BNF13VMYAI7jWPfYvh
 73BNzzad8KWg+rxtheUFcWRzbhDkDR3EmpM98pBVLH1sNpNJs1ftVaqnWb0+9ak4
 ej0q4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0p6g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-882529130acso39393136d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091846; x=1763696646;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=;
 b=EPjoAlAWDIAU1QV4b42IB+56SLV8um1PmH1afT89401C/G9ys246XiFnbK2W5WJMvT
 KZqARWujJoPxjNfHJY+zabrPkzD4KDHLyqmYU2qSVAWF/aTLfNYlcEVGhFqsyAxEniry
 FSTgq02GTuE1jOtE8bXpa7zMSScWifsMb2/is6Krmd0CKRSWJ2z9alOurWDtPufScJc3
 oQAlB0/40zLD4lY81NgIuzw9L0FKZNnj2BZEVswVS0m4jIHdMuYwtVgPyhM1RUMDYQvn
 OBnMOy0DTyO4CiJ63RhELv/1s2ewZT08tzy6Dg1eVzyvbpw0/0WDuoifGsB6vPSlHbs0
 KI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091846; x=1763696646;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=;
 b=h6al9CIhlOI1oQoZ1EKEealvyz4haeSoJJfOo9xXjXMfVkUMnqGWOdOfEkE1U4s+/f
 XsnSyH3PjGZZbLQTTKdyN3VZ847VW2aihqURA/MxRjA334mJp4S3bLr6WtMFZRdgPtlp
 RkGUH19eB14FGkPA3dmLGHmrP7n5Ixmq+ynrLIuZHQwMpmnU4MjbVBhUVDUeBkX2ZzzA
 1aB/RyUlANQuEWnWV2pG6wXQ+2bZqvCJPScwvWTQtHlZ3LQaT3GWhe8GrcqirhJC3kEB
 GQq3UuLcQpaBZvpE2CrF0wmT1heyFTS9hYjCZNrN9bEeAXntmrlCQWbmc3G3Z1Ow7gdR
 mMTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNSRuUKor1Ni1NHPMzVNy+kCMgZV7QwCA7HXGMvats6QoveGr9xd6jWWJ63g7V3gj9GkMkvmMjQhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFxw0ijb2A4pS1RhUJM6WIgQF2kfD7ELKUKkKMPQ0oZ4TnmdB0
 e1/tJK/a65L11GcqfcvibNtzdOVod04mwfYh3xkZmDy2ZjBvHPMBWbXgOpr6sTHrB/oC6wHyNuE
 J6TeyKt70NJ56L5N5yUNx2s2opMFy8dKc9X4mzNTW86ictbLdyJ6pQ1KNhgH8LA18t1uYjoM=
X-Gm-Gg: ASbGnctCvALvuQnuX6Yqmtfl1P8pf+Zug0q2W98L91Hnk131oqi1YilrsL5luwtssEA
 TKCagC6+G6HJAfaAdMHmDZthLi4ahRmCYl9i4pnZmaX2BmJajKe20t5Jm5++PGKH0U95/AsoLG+
 TrYn0KsM1TM9Mb8M8Wk8x3HogSgsoEp0JlB+lpq5nWtufHz6k7ZKE9J+Nxvt12T3QcSRnn9GmrF
 kmT7SMcXLQpxrUyitZQ8MXdsLnJe8d+zJLCSrfHN+EUZItaGbwuqABssFQNUjSVbsgAvBrmjD2n
 8Os8za9i/1M7SM+wQXui13YE2URmPPkrswO/emF2Y1xr9pBXVmxB1kF7mj8UwCGdVhhgK0i0jJT
 voXorj+s6oG4ZfQNMB3LgG+3yW0BwINgizUvVauXf9Dq5h9gTgfM+jYfJLjIZDU/fJzqTOYjhwW
 Wbp5a1Jsk38LLw
X-Received: by 2002:a05:6214:1d2f:b0:880:448b:b893 with SMTP id
 6a1803df08f44-8829272e198mr23198636d6.50.1763091846302; 
 Thu, 13 Nov 2025 19:44:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqUJMLs+6jtwJBpg3Az+p+wGQJe71anyIqFLGvR3+H/KO+e/mxBtEGa6IBNBccwnLxdp6caQ==
X-Received: by 2002:a05:6214:1d2f:b0:880:448b:b893 with SMTP id
 6a1803df08f44-8829272e198mr23198396d6.50.1763091845851; 
 Thu, 13 Nov 2025 19:44:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:44:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:39 +0200
Subject: [PATCH v3 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-12-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VPbylyDBkCJtvEwxDI8LMWIjA3Hoqe2EHamYEMv9eSk=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmgyV/FfRFGvjtbKAqqM/dmHvibrPtN6W1A
 VggaMfW43aJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1X2aB/dJXBqXc0cvpTNEm+vU5/J7lvSCBS+lJkjb07vkK0rPSF7L/Ly2Lr7TWERkvw9uxbv4D4X
 ZsaJp6JkFKz9L6pwJOa2hgJpQRHrhWxLu91XedmKyDHfsMP7ynw1cyJckJNX+Gd+sslZihmIfIS
 w6kSykh0qR6PKbok4UcHqGUaO7fd3Q2okEjAu+1wvG+RyQsMhSGDCtUz3OC557KpGImUueLJAdF
 L1vaWNorBEtPqOD+aHvYdw9jrG753owQ00ylexKbFXf4x7PFc5PKngh3XXreO59x6qxcDbPprgY
 uKSVToE0MFlpz7Hd434PVIUWAvtPnbUjyOit0DRDmsg8e0E=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a586 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7bqH7Blup1pqkekdm3wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX8VKZ05s/3iK3
 oAgvjfbD59ymuq5MeJGquZE0BNcoBTtxqQzP4MRcEQGuqipFY1DlFFytFCws4LDyLyNKxR5wtqh
 hxI0wW8O33X4OFE0XY92eNk+osFK/jRbC+hpPuVctSyz4cFMdyDNeQ3K6hw7WSB1EvmTIAGGWKd
 OjFTIs1PAf1CJ2DABtWe1nRbWcUs6FDxnjLHZhByBa4eZ3EFAj45mplmYIVgILjNqav9bTf/wuv
 9o23VvI+O9PjkSrzl0z6ayOKQ6QdEf1kaJVioIiKvg1EnASDoX7yRU14FH38jW/8oH307hY+Bea
 MvqDrrRt5js0DSwLoloich5EuIYIegeeHOzokVUZzPdlGIMkaQVJ4MWwAhzKhwkFq+q2hWYd5SG
 NFxz7NaW2GamjZjf9y8EUrx6Byw/zg==
X-Proofpoint-ORIG-GUID: b3Je5HH62X_48J53mZUhe-m_z-7l7FpE
X-Proofpoint-GUID: b3Je5HH62X_48J53mZUhe-m_z-7l7FpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
msm_media_info.h. Replace them with the standard Linux macros,
round_up() and DIV_ROUND_UP() respectively.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 63 +++++++++++++----------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index da1870ce7680899759d09caa01050eeb9844a484..6e8883dbfad439a3b3f07b6fe9337820048fc2eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,16 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#ifndef MSM_MEDIA_ALIGN
-#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
-	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
-	(((__sz) + (__align) - 1) & (~((__align) - 1))))
-#endif
-
-#ifndef MSM_MEDIA_ROUNDUP
-#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
-#endif
-
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
 /*
@@ -78,56 +68,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 
 		if (MSM_FORMAT_IS_DX(fmt)) {
 			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				stride = MSM_MEDIA_ALIGN(fb->width, 192);
-				stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(fb->width, 192);
+				stride = round_up(stride * 4 / 3, 256);
 				y_tile_width = 48;
 			} else {
-				stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+				stride = round_up(fb->width * 2, 256);
 				y_tile_width = 32;
 			}
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+			sclines = round_up(fb->height, 16);
 			y_tile_height = 4;
 		} else {
-			stride = MSM_MEDIA_ALIGN(fb->width, 128);
+			stride = round_up(fb->width, 128);
 			y_tile_width = 32;
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+			sclines = round_up(fb->height, 32);
 			y_tile_height = 8;
 		}
 
 		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
+		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			return 0;
 
-		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
+		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
+		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
 
-		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
-		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
+		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
+		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
 
-		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
-		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
+		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	} else {
 		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
 
-		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
-		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
+		rgb_scanlines = round_up(fb->height, 16);
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
@@ -136,13 +127,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		/* uAPI leaves plane[1] empty and plane[2] as meta */
 		layout->num_planes += 1;
 
-		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
+		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
+		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
 
-		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
-		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
+		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
 
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 

-- 
2.47.3

