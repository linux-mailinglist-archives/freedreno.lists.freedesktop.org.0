Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C3C5B30E
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39A10E9A1;
	Fri, 14 Nov 2025 03:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvqLUUJ6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8Yxo/Ks";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FC710E9A5
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMarLJ1582950
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=; b=nvqLUUJ6kfKXdIMF
 6b3xDMClSG5WRE4jbio45LQeQQAKk5TWGzeWqwX3JSiVcVMHuJSiHjsKc3L3NB+/
 WYU+QEOW220dI6UHBqTRIakYQRmFeJ4Nd0hVAhOz58BsOekDweq2JAhm7eFgRpI+
 kULvYU37XJkfxSagplxlTvVuMIz5qh1qRN5qyjPdENzh5+vXJTUp2h8pSWuIF2Aa
 7qBIGyj4JLK4uxpWfMfpQcJfRMErwAPiKyHZaIcsmVzP/OCskVuPpKuNuxtIXhY/
 TiY91S+GY+EvCkLIFYD0/EbuUE2Fpvp1Qw/ez+u29oQr45vaUiVaZlKHE0MLBg5f
 fOQZ0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frpx9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4edb3eeae67so53592521cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091835; x=1763696635;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
 b=H8Yxo/KsWuCgJps5h32fHMFnwYqXbPj2De9mWiSsRozpoOB3w389jjlS9VRW2V8y5o
 i8bsU6XA32N5yale9ZzqcRdmjL3boWnHXBkNXJQ7Wgzn6ZVRPjab9jE91T4evDmuZxWl
 awMr5Pr9qcjbK0pCvuE71bqLBxktc88jmV28Ft/CYjq4GZojAdEfbMitZrXptG7CHWV9
 WmjwTZqe/yyrA4Qt0tOZolrRDPtHYGP9o6WHdNS9gabvi34JkIGdjBn3CPkug4d1cShy
 mzPlbUFH4K4my7dtenMg6dOZR977ZfVqk1BKtaB4wzehwoV/HZ6kfNTTZbFJseM+0r2k
 QFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091835; x=1763696635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
 b=vY96J+sS55A4LsfoX7mXFxAghTv1LLGqna67zQQuiC6ukab3yWBGISaeZSdSYt25SQ
 pA0HvZAtoyR1TqaBQoWY/QneZ3D+pdivp//MiG9htof5MNWYRJVhWIQ9W1oa0BF0pmhT
 9KUF4Ct5UpTNpGj11Z+OA3Tju3U+oMrsQarunWqOXnRajLjUGx4RBlNBIgacZPE5Vg2A
 DgH3LedHckWUZX3W64yUMTpuREDJ+WLdIlIqJniIPeddh0XHwOc0FUZ0sIvxdFujnYQx
 DvKAhODej32QcBKQdVTEQDvxEsu1F0k6+Yg4PBTJ+PsIoV6E065TzF/yN6pLJuYPSA3E
 4czg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjd9DmkKksfAX401t8+jnp5JdU6suHtSDYe6WlFyPFdKgjMs/F2vlRv6SY8gy8t5bCXJ6SAgs9ICE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygKKu+4UEtB1tLUbGcKI+jNx4Qe0US0MJz/mzAjQWKS+JMfdjw
 kgMkq36jYqIQe9+iYNX8xKAJScRWJI8SKVtMjUoZTZi+OAY3y8kjs2Itm3JbG0jWUa1asd78L2T
 Umqht0gc5TZ7qQwIzyObBcXLlq/s9ustFqa+4Ok74UqEexqZFb6L2Ua9VNnshzyq5jGakerg=
X-Gm-Gg: ASbGncvy05UeJK4lwbYqOX/YR2IZEcL5UbXUTwpDq3QBmn7gpHcK2AIqx8Esj+9wSqZ
 mCDO06rtLflE9/yn6SY2lTsRhdUXQrqHHawyh3Zp7Q/cy45eqKmDZZ5y5Xv1wJgFV0KaZ/mRw/E
 UwKA7zGI5tp8UL6ZL4QQ8NnA0YkQVMlZveH7BprSCp0AqxN8gj0GEejVgM/BSV9MHl2hUUadysw
 tacbWe7nxZViZLOhGDQ5dLd9PiT7hKtmHJT26WgmUCahuSVSwsy1872Uw6qYVmG1mvQql1JUYV3
 YpNnYxiEUKlAjW8u0KPH/kgZE1MIsX1JppczC1mamkqDzTVnVbT210Zgnk0pjkMtmf3A1fN3EKI
 IGGCl/kFbMjSNVQXHvIojMTjocOzizrswp80r0iD5PAbnWGOUThVOWDe/UVxYPi599jBCffTy02
 TBrnsbCY3SegZz
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4edf212eb18mr28250511cf.61.1763091834645; 
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6pNRPl/T3C9NOLtp2Y6CMfEZudfE/w/zfWdDtkzq8zYUchFZXPbhnuWwt+klHR/h2SWE8bg==
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4edf212eb18mr28250301cf.61.1763091834093; 
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:34 +0200
Subject: [PATCH v3 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-7-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L3cuMpvZrODm9ou9XwGWI5E1+eCfCXPevZkiItqJ8xY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl75APmQT6bdKu3LUHVA6hbd0R/XuXy63Jy
 bscVZzzXs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1cJYB/9lV1mW14pxF9PQ0KzXjklHZYmd3qbDxVDzttICvyd9Gj70kU3WK1lZTd6Cn/AbVHWdO9K
 65ZwBhSYnio9gIv2rCj177tC7obYiDpX1XE3PmlICo0Pyap2pKiq8/RWxDRx7TfVEttBIq3cpT1
 ZDKJDBPQd9vDcAkHBkpplAQobz15rhGscDHe+9gzR6osDk55tVogMAzEqKXhaWvb1YsTkNbjhls
 HvNFXdSFzJ6Jx31rL5727eOpf2L8gI5Cb9ylgLkkG3u/BkgF1GEctjGqXcbWErWjfMU2VWHrkys
 u+ktZKtolAPEtBs8JgxqlNrdyKyeLA8Bo3J36vgCeovSXH7e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916a57b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: rahMERXnw0_Wr30YGFlKqZiGRCG8g-Qh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX2EoHZNYiPbKz
 4VTyv1s+cPnZooOW28I6e4Z4BXzZ7O1lraUyrZMQGeRwBsORiJY6WDZDhnYq2vQMKlf3RiY6Zn5
 hM77N/XCaoQ5SF7GZFKy20Kp3JrlGxVnAe+L+/NbOeG+Eg8x9Zss1/FwVT+V0GtwlYCymkM2jZd
 mlReGygQex8276kokTFkytGB/A8GTzReQC3WPkZRGcct7INHgxd13dEnSPZaMHQG5LAvKw4PZTF
 6HuxfTTHN4Y69YQKZyttrIOQQA/hBY3b4zK8k5p9a0LSgcSi/jvgnJSV+N14CAMhpPfN+4TSFn1
 pGgviTSOKliJg4UTOPh/AGvpf6W733oMaUrK3wTgKRJTywtIJWgoRCM75zvVUjZfaADUIlecqUd
 uYLVVS1lWNss2fMPJTyrdscW5DiMlw==
X-Proofpoint-ORIG-GUID: rahMERXnw0_Wr30YGFlKqZiGRCG8g-Qh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
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

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..5a1efbd99beeaf454f726e2824cb26d2bf31cf22 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
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
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV |                                    \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.47.3

