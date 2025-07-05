Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B5AF9DC7
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E2010E36F;
	Sat,  5 Jul 2025 02:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTmFW+gh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140BF10E36C
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564M5OGK011258
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=; b=XTmFW+ghyDk7TLHR
 epoaKIjmPjSlcE98Sdc45wgMqA5lYHidLTU2MCMNSRcI3CWmdxj5Ywi7xPOZk0Xz
 jjSXqopd1aFXrR1Du+A/37IIfEylbUQcuoe3xe1ciwZfPj09X7rn2QVujh/V3ixB
 ciBLJllh8BwgcyUsj6rSMsB4wqL0N+5CVdPGj12gz3k259m1L2RbQWjMO/fAQY9+
 pT/fhplQJ6YXJhcWAZ31rHDfjXlzM0yDHRFwyaLjEJjoalOkKYLcGR08SV8+RxTL
 SYA7CEJxZ3AuAd2dxsuILB81fbRAWB5IvF6vgAszpYCCSPFxGHlRGzo/ve6t6s7/
 eTT3xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802cx0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d45e0dbee2so227063885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683660; x=1752288460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=;
 b=I8/ClBFDKcnjXCYSbLj2phLm0q/AVTW6RxUF7NDPhJ1QNnz5Nha/YFI4U4OjskdP79
 Aq0j86HHXDoGJKLO1/o0XAdHNUxp3emdjpbNaRZEgxZ2+yRsL4tuiXpoyIBkApKyp39M
 IVJSDJQG2Obt+2RWs26SxUaXiQLUWZTmYlYeD2SqZNrOcnVVzNIQgPhk4hXg+azXEiJs
 +ohevKtvZI2O1uhi47mljUZoOwurBPdTcxZXc/bVoml8wtXDFjT6kSRefaS8hCCYXP5+
 gLDvk1fo37T6x5PgD4v2LE7lIEIciLwVJhO8QGBgnnyL4bTVepM3FUNwAyNwhMaEpbQE
 AnWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpZbV4YZGNz4UH/3YqrvsUOSXF67bVnyRJCxfw5HU/XEYYon563ccdMenpZbMQexxrZnNCh7ZGjYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTkRevSnNpRAmNunaYjToKRzLADlLfM4p+mj92X2+zzJiCpwg3
 r0NrtDy33erOqNENC3jMEBwh32kcD27j7wA+BNioPdCA6N+m+VzO3byoX/QUW0n0f4bZgO324Qg
 KoxpvbJQu/SWKP1LwBCJvlrO1S3IEG5sZfLe/bA5w/4F6Akqogb6i8IwfvSmxZeaYaTi9U34=
X-Gm-Gg: ASbGnct2/NCIw31l4H3JT9+WF/D0KP4uibqbTnQ4FKi1fghkn0beXROgCvimDtfqtSS
 N+eKy+5GIbdKYXc5XPsITBPCrMpMeZx9eDJSucWWiBMs883WzjO4ATaaRZjG8xpZPTd+kMmD7Cm
 tDfFLRfyHIQQ6DXuyLK41q/36HXUDnT185FlTLfLzCV58eJJFTVAMzJ4tG5iATFr6bvMr7e9gU9
 3URzH8qdfpfGKN1YSvGKCBoH1S+NWwZ4O9XiZpMfRCQYFb85/4RgD0YrX2+DQgt3e9A8oROQUNy
 TacTpTzqzbQNFvA68EcWbPPGnVzwh1L5sN2slNL9TI1ntkRNEk5g7FN6V2IiEeauUkq7TDXmiRM
 BPC6wbYH/a2ZKW1sfGDbA8QgZQBgHKZ7jvkw=
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id
 af79cd13be357-7d5f14ee3dfmr154598285a.36.1751683660171; 
 Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvQf4vFSIOxg2wCCgnwprnE70FE9+wlp5S+oMHsCgXpl0NmhjkZssFI2yJpD1cnIfQXIJRIg==
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id
 af79cd13be357-7d5f14ee3dfmr154596085a.36.1751683659694; 
 Fri, 04 Jul 2025 19:47:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:26 +0300
Subject: [PATCH 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9162;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sb1qbqPfpeBQHLvvRmH0mQcObhTRza3WiqOCZtRU5nY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9MF4P/GQytOow2EvJc/dGCvpDmGBAcsCKz
 VgdwTRSziSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1YG6B/9NAUZAdE6RbK9jU9oBkFgimA+ochP46ux+4OOAmEWItMSqNpDYWKjtf2Z7deovMGT+XnP
 P6uHBhPbAcoEMPKHH99+toNYXPokrDxj7u90XdOYRISCQMi9njwA1fcZWuLU0gXzhfLGVXNeCl0
 r2oFIDpCN6uL0ASgXi45Sexgb3KgULqT+rKlOZ488hxu7nsO+aTt4QLVdr33B20pB3Luj/WM1/5
 MCLhA5THVwT5ZB8ywcaPv+2s2IqG5xQCZFQtox7mtY72xQO0sTxNlwMSmh3R/HZWnH1KRB+z0Ow
 or4GHQUvjsrEkJ6ceq7A4mdQSRxx6wqDa00VlUDk/WKIlTcH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -94DjEynIf55BGYR5Yqzc4gys2EUjMpx
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6868924d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=BVuc22GF84-4pAHDYacA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -94DjEynIf55BGYR5Yqzc4gys2EUjMpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX1KvGQJ0Ph7Tv
 48INK4MjJ4FnvZk9K4aR/Ei6doiePAjTvInFGNLsFaF8UeeSLjSbcFjmgYWMVhrREMboSzuRUvc
 yQxvlnh4DEsP1QroMKb394IU0s066E1ExFqcK5Fn2Mu91MvgEi2N8YLoKHaBGQjQRLRl0f35Z/b
 iCJPrm2XQkL5TEO1xjoXFh+9iTva8JSs3jTGu+22so/amwftIRs5zaiu681qG2CBfX+Oy88HmcK
 dItDeCS11wNCFaSz3lQAC9ya1cIe4LAQzN1ygUZEN2jDvbuXK2wRolnphll5naQERIaVTBHwNv1
 QchdZelYksmrrmuP1oCvhRLWTTw0tbjffNaSF0q5HGlI+NFvSRxWAhI+kGW6hSRCrjvrG4ofU33
 4ieJLT0UWTvlaRwSM7cyAgozlatF/pI/QSFXG7NBfHhxPk0QIJqwOAHx71ey1B8MedC34LbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg)                                               \
+#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
 	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
@@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
  * the data will be passed by user-space.
  */
 static const struct msm_format mdp_formats_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
+	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.39.5

