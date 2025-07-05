Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EDAF9DC8
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD66810E363;
	Sat,  5 Jul 2025 02:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU8lhkVj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2660F10E368
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564NUYf8031270
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oZtASNSKNmQD1TnWT9EC/LsaR2+X6zAje3f7Jf4pays=; b=NU8lhkVjp4lPN3jh
 blozh4p8oAwEgrkAs+6KkMBJUUDw41vBRZPEuyImeCpC8TZB3Yrg+v98bPfyrF5G
 B+heNsixEK4b4eInAw+8sAbW4ueWGpNU6+wyzbF7QYrCnOvm+eehhKmDQnk8v7+1
 yEKY52+lOLG7udLX2Th1DCHAmiaMOY75gCoxgRIu/gNwBzA3VM8ruBKGTYc0fopK
 XXFqbF3IPMDcI44q2ViPe192FkuchbuFfXs+gkIRafTfB7Lo6U7j1JwZxJo0dIiV
 j73tQcBVKM3oJEFqLGc+CCBpYcerAtjRRnZWXj2TG/kDgaSYdQTQbOdpbJatsZr8
 oeU6Tg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w1mku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fad2a25b65so23304236d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683662; x=1752288462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZtASNSKNmQD1TnWT9EC/LsaR2+X6zAje3f7Jf4pays=;
 b=qdTa4AM1PjoisxuUl5xV3AhQdxS5Loh3Nf7yr5xvHM+pMtwPIte4Zg9kKKUvXPB782
 rLoPeJHMPLX5A0h8PYSL5QQ+nJVePBNxH+pY07EVMzNh/vCv5cN9gXLZh1U0mlaBtG/c
 qgck96F1lF8NzmX9CT+QFRve4zCEiXf85/SAIbp+F3z1NayBMCyQ/eKXDMEOmgM/FGqv
 AgtOGcyXVWTegBup8p5cP3O3JDd72x1WPuNpg+OJ3/l2LspBJthlk0vUwcbWn8sX4p6l
 HqBtHVrK8Zm0VDAINQI6fM39nOhgoR2vcFI0901v00ASxGRyAQCvVA4/ofjJN0V3OjEf
 ZwbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmiKY4hqqQ48Ei5oVDXutvmXO6HI4i6aM3SE6Sc9c1egUF4rWqq1r4NmGbf92BQ6ue7XcDtLEVTN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM0QwnUW7Ijpb2JDq7dRiluPE9Yb4QCMi/aJdn1QeCk/PaymCv
 JZ1XwMrdIbJ5fIGp8KnrgM/o7EAz7tZQig+yRZXLiqGaDi34JSIVmh9FuugE+shiyOrvZ1e5TO9
 UOXrW8+AzUZpKtBOtI6dboZ5v3pJCBUczRgYlKFmfVKf3TVBB2GK0YYmRGSYz/GJu+im5naU=
X-Gm-Gg: ASbGncvp6USNAgg1UfLphywUBL0qckVI5tyvCviPoPnfuSmsnbo6C0LZ2uRcqATZ0/z
 nkfHk8gTjhjzWNpH3ANyHQCHQHeiaN11U3/f0GvRX8PraI5Fg4Ah3XEwHRt5Pq5to4fLBfO2fRg
 LctksXEgGUnQfjr4Evqyym1guq2ZLuFTpm7jWtA/onOhrlw+t9Lu3eo6M9WB8I7Z/BCPceISq0h
 dhVsb9Z/zQTLYRPfaoc1cHA+7+6gHqJb0PzCdwsDNnqx3VQBypBX7y8yH3YF0Gm8dDWF18dQSDR
 6kZlNt9/LoWWygn5pbbj0AjV/JV9ANQrkU1uhlIfppn957moIzIPUTm44xgKwXyQa/lfHM7QCTg
 4/s6PIkmpvcIJPxTmCvDj0NUyKcxBzkBo64A=
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id
 af79cd13be357-7d5df0f57a1mr642847685a.23.1751683661935; 
 Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdbuHlLJELfruSS+SxxynLXNdqJY020a17c77f5wQOJdlZWvZKI1XK3A3BOmEPeNcBY+YCVg==
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id
 af79cd13be357-7d5df0f57a1mr642844985a.23.1751683661501; 
 Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:27 +0300
Subject: [PATCH 06/12] drm/msm/disp: pull in common YUV format parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10545;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W+WRtGTmctGrtw3/m66JfBKmA9pR1W/PsjD+devdzIU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9lSJypmT/pVMDGKaKDEoyU5tP54H8Fnpex
 IMJ/07rxIWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1eukB/4vqUjqu0wnNFoF2VUO1FFVEqefOHJ8Tu3Xc9DodXc73Z4W/nw7FwIF0PzFWKkCZAMKPAG
 qwtbubcPasPJV3bbffZReb1cAwP74H78S3Ir5PLC97oebpFBVXrKSo/nF+uPOhcK1VW1CgvvjIo
 0iPSo88/Z0WEjJ7cc9M2PFGJ0LaBH9O9qTyVvzsi5TY1vogEJJN2MqN8ul/988WCQ37+mlBVmQz
 Pr/00/P3e8AMK1okAn74MR7DlAzfJLJwTJ4Zhe3Z/cmxJHP4EzywkBl1ddg+y45ljEizXMq+5Dx
 aq7icbiFI+TG4YNT+u19u709MEAcLtcQCjobzMuaoaMcwc9q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX9Gw9ASWwiTZK
 ZPu4RLSZzkpZL4ldGXFlncgEtxP6HEvOeZf6fYycpFB5CZ60VSNZ58kI/iHJiCVioEBnJYPO3Ym
 hd7kCLqoN5jPd/mJzHJRSxzzpmkbkB9aJWMXiIrzVT1i0GxYNu+B12iMHdvwLAC8NI5YCWbsN5n
 7jm+GbKWPn6IhP+Fy6mdvmgYKdCTJ/TnDQyz5EpW5dMooL0hvSpIIzZRYxpxuejEjDjYqzkR8af
 X16c0UYUdWuSGQLkAPLraVIBhkyfAGc/r5gQt+sRL0KsnYxXnN+7VgsVJ0oXHS/LmmmkHgS0RC1
 R4ozF8aVi2AukuYL98Y+8/a/L++EkSC9rY11Mrd+myFAABaITESdXrFjFgp9H1Tf8O0wRznwDn+
 zEwnq5Ylj4ckLbjMXxLt0ZMaKn3xzpfC8FGbdGM9aqVHhQ+dH0wz1QrXZwpYO+LNBWjzy/S5
X-Proofpoint-GUID: AovwpbA7J7cUcVgZL0zQzOnCKL58ES_U
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=6868924f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J-CC3KfA7NYzMh5jGAsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: AovwpbA7J7cUcVgZL0zQzOnCKL58ES_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
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

Pull common params of YUV formats into corresponding macro definitions,
simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
-#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
-alpha, chroma, count, bp, flg, fm, np)                                    \
+#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_count = count,                                            \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
+#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
+#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
-flg, fm, np)                                                      \
+#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 3,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
 
 	/* 2 plane YUV */
 	PSEUDO_YUV_FMT(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV21,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV16,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT(NV61,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	/* 1 plane YUV */
-	INTERLEAVED_YUV_FMT(VYUY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(VYUY, 2,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(UYVY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(UYVY, 2,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YUYV,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YUYV, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YVYU,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YVYU, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
 	/* 3 plane YUV */
-	PLANAR_YUV_FMT(YUV420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YUV420, 1,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 
-	PLANAR_YUV_FMT(YVU420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YVU420, 1,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 };
 
 /*

-- 
2.39.5

