Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1534C5B2FB
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D210E068;
	Fri, 14 Nov 2025 03:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcJFBhbU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXwDEeR8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C1510E122
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb3Cx1692449
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=; b=ZcJFBhbUwSUamuzu
 ws1VbCuoyw3lCbYUFQr2z7CzAfy/kO743QgEef5SujQxgozDudmh15SEuDJjpXet
 hGPnUDW9PYbJwhiRlyDC0XpJGwu0jkLg++Dj1LTcU5dRPr2KX0JVBM4KeDSsGYo7
 g30vIZUQdT6GfaOLEYuZN9zSgdxNjV1fbBWDLY/Dj9HU3dy+k8ChmtLKAPsZO1O3
 CApPb+Xfrf2Qc1Jxu2fDf3WgCIoFYKm7S4tw1+0rdHhw57Qf0RR7mnykKiADble3
 yLe9PYoztGrUvSZFKEO2TOHGNqyonuPKWFmfOtU/mmxLKDJI4Cd9Mk5wnYV64bjf
 YJeQIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0phc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e884663b25so39323911cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091822; x=1763696622;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=;
 b=iXwDEeR8eeDrSffbHgZ1nEsKnIRhVbg/giqYQxgA85d9UQaZs6XjlEXT/zmTx2ftGl
 7o+uIyguYkktzYjzPuYjpktfk6yctp1rFfkDcesDqNGTu6xs7wnEH4HdTaQPuhFG3dpK
 lsheol51phuNgYxzO41m9Z0gzE2dRNLPulBZnb97VxEef1yma2eDGpq02/rou9dwwO8O
 MJ8H5yl7e+sLGG9dn34wISZYV8lsi6m+jxuNIcIwGblMWmdif1+mRLOMd8wt6jb74jNu
 qC40q8aQUWcFhCO9WufZzyiT1TQHD0LJFUg2Z6/qAv5wVPrcGl9UNf9Dh+aaHtxdzRI1
 MOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091822; x=1763696622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=;
 b=Di33Dcmln4qfNYgTj+ahG+mH+Tw60fb/bnhCrghF7ESOapm5Q6fWfdMTL1nMpbosQd
 NuehnhY+wU43RmKF3RG9ppjWW82pLR2Ek7SW+aCj7ZXVltysjgPJUI1pzQHwJiCYXSdk
 84UKBrkO3xdBrRXQIGM5C9pAkbgqsLJNXVO6sIltVufTJ9/DMfwRzKD3pmAbFlhkqxDf
 grqGfLXqZAEk6w72ME2/pHCsFw8c5XP7oxSakS/6KhmyJGCuGs+popTTYZJlncocO2ny
 mEDmKI9f8n1mU/91Fa73YG3t2EQkmmCKkLvEN8Y800yXBsytuRQcZZQb/U+ahNDqgcb9
 y6ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgbQ4eOTkUudHNzP17FzU6RpJ6YvtQvLEFSwv5kfI/HEF/D8GPDXXLMmZ2xn86PKrrUoEr/BU1Nmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr3S1GZyaD7+p+xQfns1CzjjMyErzekWkYph8/VHeORS6iwAg1
 hPUWlBZL1Rg4L4QpEODOG7OCwJapMhhGO6JPINxYJL8ZYuCipKKOo0L6szAYOgtkZYNLMKR6PNn
 syoLh2m8U8nwkyU5VU+WU1WEN4KucgSqtnl8N10rzKV8+/72zjFuvDmdGRvbmTE0zRAvi4OQ=
X-Gm-Gg: ASbGncv2d9UMZ3x5qxMrtWVg+T1KUwB3HbK4yV/GqV3/JnnxEDgLZuSzVIuxXCVKTiW
 i2XyomE0Afed8DjTaI/E9iqEQu7+GHdVbbHZH0tPFoDodbzrpQYgos+xZcIGlfxiIlsARMGRmau
 XE8PmEgLnCfvAUbybcNgSZ4RW4lQkUpT1SYlPB8qCf/8qt+5to9BrSNODnhVifgT0tmKfGsVw8r
 pJwLZWujuqddsPgDl3Hs2VDkJ/Y5kMfl/4zo+qTkp0/6CplXg5SQghGBockrs8Ko6WniWhOXgfR
 4+INyYoqw3m866WZvEqU0SZJPkK699QzRjFqg5+WUDWcQ8Pd3VCMTBW/ZByNpajBLzLnsXOOQz4
 b6UTKjgASJPvSVZIvg0KGQ5uDOmMSCg8kGlS6/9gAbRh7raBI2jD2fmdcf/nEaS1J93ZQ+SzV0y
 F5iWXWJ4mzE1P0
X-Received: by 2002:ac8:5d46:0:b0:4ed:e13c:6b54 with SMTP id
 d75a77b69052e-4edf212fdafmr29357251cf.46.1763091822440; 
 Thu, 13 Nov 2025 19:43:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrnYyrrw/7//b7AdS9zWApmm85oAXtzlXC/36/x/HEP8K0mvRzaKRwjGLIPrKGbQFI2YpdUQ==
X-Received: by 2002:ac8:5d46:0:b0:4ed:e13c:6b54 with SMTP id
 d75a77b69052e-4edf212fdafmr29357071cf.46.1763091822004; 
 Thu, 13 Nov 2025 19:43:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:29 +0200
Subject: [PATCH v3 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-2-cae312379d49@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qo+0mdHe4wTEzglRW9VqAiidH3uCrmPm+bJorIxSg/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVlWDURCdBZugAM72XnjM82wZ4YNRzin6c9k
 SNO1FYbxB2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1XLhB/9/0ku58ocOHJtMSF+QHyANj8tpI/X+lUJdTs7TAe9T/mHwoxnc82bfVAXYm7Ao2XeJDCS
 yfJ55iShKA81iRulzuzqg8cJPmcvxhSPU1mYIZGKR6Zp6q4bAECfIrnFt0zzFw4fqNu8NUSlDbY
 1IOIns48mzMzig4+YjVHHzcvFQ+zVpB8W9tkLwLGn4crLurQC8KgeCk1WF838CW3cZliR/vgP7a
 91euuavIkP0E2Z0Eq3130KuGYhElz5XaRAJO3lo/N7PXwzgQ08LvwUJLI3/8Mci/O5YW6P4hM0N
 NkRG9TgUj/VpIkjhk/kmXKSoM6219P4m9FEMn9x577X75Zs6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -xqwDf5MM7XeCTi1InvV-XXCgg_7qcfG
X-Proofpoint-ORIG-GUID: -xqwDf5MM7XeCTi1InvV-XXCgg_7qcfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX6By+XToQdCBf
 /kvuyG1gmLEmKRnOvQGPfqbsmXJv7dlKjNEtDUofP4MO1l6AP9UxUvdDkyeG1uTVUdOFzz1TBJG
 xiUuy6ZTmS0c6xgfCIGBK5d0yy5MOArr8ScXeGoBel6+LLAiOFU0LTUxsMWRHDdRCrwplOfJpd/
 hr2/F3lh/cjwVDmHuS/z1sS1JiLEYfsQ5+Er4jJkWevYfHQ475pBJUtIzgnZRPdKyeoA/b1cBk2
 gvfuHRCIhqqPPqQyf0HiaPeMSqJCxIfbXEjP1jGE0IZtSuEqlmd60S3EFaSxnFhVCBnyPAVVvAH
 KUhpRCKH4GuG9uZZVZGNHDpERILkF2mo9XnPf0SNuaqLNPGetzxLTNDCzp1OXAdsf0PiGsdRllg
 YIKKNXfRSACTP8tOUwfoioXU7zDyIQ==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a56f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uYEdUiPHXpurYBtsK8sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
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

All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
Specify num_planes and fetch_mode directly in the macro and remove
unused parameters.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_NV12	8
 
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
+bp, flg)                                                                  \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGB888,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(BGR888,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.47.3

