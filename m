Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B9B44AC7
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA6910EAFF;
	Fri,  5 Sep 2025 00:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvY1ggft";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1C10EAFF
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JKW27024707
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OL3LAbXldIQiGj9Ib++uS3oFdqJcW9ykoQXFxLINnAY=; b=TvY1ggftz6BE32OF
 Nclb6oOybWq8wGRnqMeXd5+pOSnQSq29FyZOgA38F8lQq9YOzxGK9leBkRuXhtx9
 nWJpu1WJsorwZcDYUCBHJn+hsArsh996XcT6BFeFYZjWC/N7PZcmyZWHODp/C/yu
 kVU/4lh0qrlcglAqvjViUrNYnS4g0q8tHXakx5nFIgEA8b2qy/EE0+kly5QiFbN4
 1+wq64JE0FSbZ3zinKawRbdPu9y2gzI27SDPBINYNF1XRHPdNCrnInRHtoiTw83P
 6mN8P2cyD0L6Qi1yAiEKP2GVqWMpfTCHETYWWQFT1hSEwPaJ14MdjBBxGoVPzeuG
 2v7pog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs4jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-725d32eaa99so38366366d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032727; x=1757637527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OL3LAbXldIQiGj9Ib++uS3oFdqJcW9ykoQXFxLINnAY=;
 b=QPpQqFf1rj7obI+O+dP+OkQjzlTAxEVRNWOeGTvNbK8OZJYrBixstVNxlHH5T54OCe
 3XPvmW/F3MyHXoBKSprNeeTKVPo5i72C6HtEQuSYArnwlLmjxUchvhIqSVYgjbDjdtfL
 YQqEwZxsoC0ioz6qv+SrPh1Avdvxr4V0Pp6rfLuu4dqx8VwM1uCpHMbr2A/e8p1T6bER
 zeLoRx4rnnoGFgm88+7fzXYgspLvZG69+XFGOWChMjJ8Kn9VzmRfZ8VLnOv/kxO64Pe3
 cKAroXEyXdQMxAFJ2LcfO9QHZ1q+dHvSJ7EOWwjP5LumgteOemJ3Ax3xGRwsSNkoqOBj
 A95Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQcMkyji4EVKsHDmCExeglvOFXUD37VLtQFQSsSXRt1UgWCTCQ4eTKKfk2Rv35vUniKkeDmqURwQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBhEUaX9c+310X6n8kB3X2VzTbQQV+08ec7D9mWEQaciMxmJgk
 SPqQheRQDX8zWA0dvaU5Aro3NOOrBSPZU8OshNOzl1EzGZJceXENOFBHjBiEzSfdrAFFOis5wK6
 USDxx2xi/OADO6TJlFoUIqIo46+i4gPQWkYhNGRq19XWoMGMfYspCukSvfKfuQavsI2hFpfw=
X-Gm-Gg: ASbGncsGbqvaFu4RNecYw9QFVNX64J2Q5tsB5ORYx/7nR/DmItZT0c7FvHmfcjEatQL
 UD5VB9Hc2JqWB334drx3O+gOoAdV3/kbUaRpwswbEdYXtbmpdAAt9kyXzOQt8urnIMupdGtfGxC
 AhGohcKCyeBmenKq7fmpLkTp6HUhDeYEooTvpnWgew/EE0oUmzFNimwc13WHnt6GPADzLZqgrhm
 nPeReMx+TutsdkPc/xPipFz6eqEF5jFrDzlrqVFLe5X9CHuz4qmF9AWaNVifhjtzhTbR2RgP85p
 Fn0hyTalBKbvbfnyIafxqcPMV5jI1bUYH7c2a5l5q4ssXcM0Mxb7nG7//9dQ6J20fZX1mKIOMyz
 d2UqFuWaFcWBl1whGPNFuWjmL0mOaJJPQpmsP0NvDZB77fMet/okh
X-Received: by 2002:ad4:5de2:0:b0:72a:e803:f76b with SMTP id
 6a1803df08f44-72ae804018bmr42147386d6.19.1757032726805; 
 Thu, 04 Sep 2025 17:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz8kxuYrUIpJzDp5rGUNwTXMjhxk0pkTF+4eceBdshBoWIPLL5cOkNdB9Lv+VDrEIdNsLHYw==
X-Received: by 2002:ad4:5de2:0:b0:72a:e803:f76b with SMTP id
 6a1803df08f44-72ae804018bmr42147166d6.19.1757032726379; 
 Thu, 04 Sep 2025 17:38:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:32 +0300
Subject: [PATCH v2 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-3-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ec6ILQ/MERXTAPVK3p0IrR1LWDecA4ARKM5wLiwsDmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJsVz89rmAldH1rvVO9fcAm9fkaFPz4TZ4b
 h8z8b7SOguJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1WvgCACXS/BhzzYc3B/78wRyweVo/RuimjNRjDQ8SH5WQpgAK97Wvg8F+TM+rq07OMry/GVn/yZ
 wdUGy7Gl+qtr+fDWVTYxcjn+EP3zZJ4DF68kHQbUKTgVDOl/KzUEkAbCw4q6iWSGRvEr3lckISG
 4Z5r3m5cKAGaAa6LYo0YJ5Ubf9GzcBdqDYwyEGdXd2r9I+9quStGAZunzNLfEOa4X3E4DX6Ezcy
 dMDYlR22YeK3qILhYjxFKCXt1V9f4wsGGsT7P6ZqIMxdkrn3e2i1vkJZsdkdJ5yJAexgq4lZ8YB
 YCIx9U6R+SZpEKikmaphLXrwYXcbfsYvmlt7eI//R9DqDESt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX2VUSxGGY72nV
 Hez8neL958g98ckXJDPTaklO3G6PQGigYalincwhVmJV+Ylxv6cDgBiz7kMK/JmI7MaUZc41zxV
 xq/xfTezEYVjSgklAv+4FdinZxDsFU6GIsXk+WwWpXtJh2V5JJxPk16XBRCAGPfsCbW2aM++hcn
 zH7gFBm1Bxa1FdvrGhQFNcCtm+r9DIAS0J68DmxT4+fWwasdiodGaJNWI+TfwB4zfKXhNNdAqSA
 EVG8k3q7DsHivAgHfytNBRrwwI8ENl/f8r/StvQgxHCdA/iBFoZ69KF9fPqft5wrrwavWQ7RrZO
 sFngxb0Ea5hbbjDo2L3i6UtJEsD5eT9GJjF7mMnj1sVLZXh/vzzUqhdNORXF+YBZHkDvpHITzth
 5hqjHuW2
X-Proofpoint-ORIG-GUID: 7f4P4UtL6mQMFdPVTB53nVNawQBXJIm7
X-Proofpoint-GUID: 7f4P4UtL6mQMFdPVTB53nVNawQBXJIm7
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba3118 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

All interleaved compressed RGB formats use only 2 planes,
MDP_FETCH_LINEAR and MDP_TILE_HEIGHT_UBWC. Specify num_planes,
fetch_mode and tile_height directly in the macro and remove unused
parameters.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 26be35572fd2ee7456401aa525cc36025bc52ee4..09a5bffd838b8a4fd3c22622e82dcf9fb99b5117 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -87,7 +87,7 @@ bp, flg)                                                                  \
 }
 
 #define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg, fm, np, th)                                               \
+alpha, bp, flg)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -100,10 +100,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
 #define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
@@ -487,14 +487,12 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
@@ -503,38 +501,32 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
@@ -543,8 +535,7 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.47.2

