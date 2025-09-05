Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E625DB44ACC
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AC610E290;
	Fri,  5 Sep 2025 00:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6+8D8YC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D06E10E290
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IbHDV024727
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JIDrCu3rz5oiUxwp15VOp/6eIHgk9Q1mb18i7DMZfyQ=; b=D6+8D8YCEmhw1rw0
 3FTiz+fRA3CUHuOH521j+Tcfqpa1lQy7GyV/3ZWoWgPwnBhonkPXPJmBRymxjROB
 W2CPAY8RJq8whLAXL0++6RJZdqjjEpgQa9rw0SrjHJ5My+h8gjW7KnZdoI13S/4M
 fTcL8NBXVA41er0ML+XvtYGt2ElAnfdPmq52wRg3oit+2mU+QSD5XWaDqtUX7xKO
 KnFuvkO1qfWCWDax4Hi2QaA9iUHF5YgWPjcVJ3THFnCCtQp197Jubm9XXEoM98kT
 DnOV/a4vSBGNhSLwCs1jnZd9cczmGUF3uiKVyB89xBmjX+VzZhPhDDcJsZyMZ0i3
 Vb5s6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs4k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-806f812a0aaso360838085a.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032734; x=1757637534;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIDrCu3rz5oiUxwp15VOp/6eIHgk9Q1mb18i7DMZfyQ=;
 b=GGRVAxUnSEROWT/ABQtaj9kG9JQiZuljDziWc4cbLeng6mhdK8dZKHtaV5WSMsLspg
 chT26ZJ/c6iy7IIqN9Y+jd5iK4uunoOUr09Rub0Wt09IV2ugBGcNbAM/AWQbEvYDJswp
 dEId9xpZ3+9uiyeBzhHUp3Wk/EqnZxlxvO5PxzLTKCK5v5Qwqn5t0clmmv3hr5kxxybU
 zjiiFRcwufoyiscKV8dPsQspdqucmZbIJ22tqqbIDY71j3iI/0Ft4cYgT/tVtdCFkgzC
 3u1zMcTXoVPDEpEEwZGMDDdSjKZbvjZ6R+5wCapnajHx24AwcVRNpLAI+UBxMdTxqAHt
 PzuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt2pdDCp9Ip2LtKKtfiC/b3YywVcZINWWsBgL12Z/rrixaHP8hvDQo5wrR/bQJbZaA6R/gdM876pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/4tmyuSc3MAmo/L5wdxkJZTOzQPJOH9gXhVLBISZLmILxa9UB
 1f0jnSderQchwFjdYyE3vinURrlZ54mTx0SW9PS4Q8iFlB4vus+VDdluObzg/U9u/sZI2y6owpx
 lvFL7C8XyXa8gVaMYdquFsCs3zHAGtFBOXFuotFdWszPO8OODneYpEoRFUd/9qR/a17ZVDH4=
X-Gm-Gg: ASbGncuRwY6Ksbv40I0LSnqHM8KpS5FieC981A0c1+b79F8fUl79f7/W62R4E89OOCP
 z222YI2oPf9AtaQw15ZSiPJkrGLteXijnJoVkrZgCesZnfUzjuU3p+Vqd0ixr9PuPq8UaQgqMZP
 TKIin0dkMdEyDQ8j4bZiLFbv0KCqUFuU6fluD8nJS9pV8ChiTp3e3gSos8j5Tee6p71np+qTQAP
 Xl+ZLZgUNk52iG9D25pN9dcmH6ulY3NgmZgsCLsj0v6d9FE1xdksbWm89G9Z/nUx3rbxJpxuKUD
 HYmzLiWuuUxCgm9u+Q9SQXQZtQ8o5hXaUsfZnSSzJg8h0Q6uPnpptgI8njYr8pa1vqwoGCFOdfF
 +aeg+M94da4JgN3iJcwhGvxPW4O93KcAlHkMcQSkf2wCFvSFq6/zd
X-Received: by 2002:a05:6214:5284:b0:721:7625:6774 with SMTP id
 6a1803df08f44-72176256887mr135292346d6.43.1757032734125; 
 Thu, 04 Sep 2025 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd/mdUQO5LjKZ+0i7o36FLPM0QePyQdli/3eJe/UNzTN7MWLWoX13dNBKVLGie1h1y0MDqg==
X-Received: by 2002:a05:6214:5284:b0:721:7625:6774 with SMTP id
 6a1803df08f44-72176256887mr135292086d6.43.1757032733634; 
 Thu, 04 Sep 2025 17:38:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:34 +0300
Subject: [PATCH v2 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-5-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Q5DBCw+1k2q8jQmkOcZzq3I92Gkam7S2gIJxMUuwQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJVK2wMShAjtYorSRjgTypvUqLRyv+c+ybr
 a6CUVljzBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1XKxB/9Rc+okPSHTJdQhhNaJOp2jdtSWTyt9th30Q4qhakFG6fKRJwYCu6663PtVE3xwGWhtez7
 IIoR4rSmkfUI1GdTnU/z1BwTlqmKgMqJ/SPNM7FVIzt7JkRyeSL8/x07dTxw98IeGKmhhtFHY0a
 kv+iRMEWGIQaylZAKyl83pUbznMRNQADI1m9FOf4lAS6xYau9fBAAV0rP/x0bHAdY0oM1ZvL44R
 1mZr0eY1E8ymOxqY5S5CB4mapeujvS0nsTrjQIXq2zGDljmxwvw8MR6W/mU5mE+gcTPPf+wEe/f
 cICytv/ZtR1SN72w/1gebwZqNiURQ3JtfZsHPlINz2WoC7KE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX5O+XKi9zLQnL
 bBHCGy80lTY4LxMODUK+pS4SxSQIFQp/f/YKv0x+gJ93HjV+Z36y+AVyuyPQp1U173fBghGAb1l
 2nNfxRs0APIeBPnN76NbMZJe9ymiPUxVwdmb7YVZpGXevvmIzeGcoejsJEwO0I604bX05eI38ki
 r4m55TULnrZJn/8LslGJfrfv3kHSLNF+fER+tezOnXEABPg9oknZAD5BUFjaVfw9IRL84oMv4+0
 QmCfPfGX0obTTuDYVrM22/pBzINkt0qrQJWaiv81LR4Z9H7jXY/qmgm1tISZiVnBt8c5qvaa4Hs
 M9Ae5hyfCXpIEvVnN8qS/YWJmglxUm7MGOOxxGUJLsHlaxAOyyj7fV4F6Hn/aHrAeejA24IxaOb
 L/KWUxrX
X-Proofpoint-ORIG-GUID: B8qRRfXowxo-4pD4D5WB0-6N2RdIrBLg
X-Proofpoint-GUID: B8qRRfXowxo-4pD4D5WB0-6N2RdIrBLg
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba311f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bDeApkG1lX2_c04m800A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
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

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
2.47.2

