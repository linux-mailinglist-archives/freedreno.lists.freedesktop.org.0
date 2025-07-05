Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E5AF9DCA
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5175E10E36D;
	Sat,  5 Jul 2025 02:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE30fd7f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71110E366
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650P2xI014927
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=; b=bE30fd7fNT1EQ728
 mx1VRIfChUrqBb9fDLkhcfaFEMq5OsGiWcweJYEVc9BynSVTExFOdNQpxvl0nhEx
 huhS+7Y1215Qnh61TcYytp1PEYFg3Le12WowqqKAy8c2gXOiu80Jx0weg7dcI5hJ
 oQV8js6mk4x84gNc0bvRLZT2N/yYmB6LtM29GoZjxoVaUmFglmT7wcIkY3DG1qtk
 DxGuTsqXcte8+NFYwho22nIJJKhDroiiH3USR3I5hW4sL1dKqLcawl7RglK/S4x9
 WrhOdvqeuH2DN1wKN+59jV8OJgnj8xbKfBBMmg69xQsZtVjYbMIG6PYsin/CTKwO
 3LtyUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb3487d422so20091136d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683663; x=1752288463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=;
 b=XmxPOcei4J33HAgjDJSbn+nT3ZzJyQ6LRGVS5XJj/02zH4Wm/WAxAUFzbzwTB5MPHO
 ZBxGtmFpOMmSA9D/Yw3A4etdSpbpOE/e+aymGQKjGWynyPMiafFKxmQnZMMhJAOsLiX+
 XOb/56YmD6YYFqjOH0IHS+EVWscuqNYYaw55UDFw/LlX3ySCjvvifTKtTvV6unzdWaFq
 YCntqZaz6sxBt0JR+CnEP9zkpVLpET9oa6LYEcKnqWDZ20MMuOoWuXKjkAx7uZi1fEe1
 Ep4oFBir/Dfmm1yoi8I4vBdzi/GCMGLomN9UONlWK4coi0hoVdhCfh2V2m+OH1K5gxEP
 G8jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhrwdDUaP/CbXscCDevsFCb46ezSuVSm6VzXhCcqtcwwIMoqEOgNrX87k8Xk/3IFpZk91E3c5jKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJebof6QExorapm/M3h/GtzDIMK8HqXrnZcHPwdkfHwOrKBbk3
 FLcNVzzdx0j4TMyu88JAcoT93hOHrgshZ3D3bpJUONZGF5PhpIIovN4dV6d27fjOnKFrU3YSns8
 3ImbBN3xrNN2jB4c3GWPpIWtrw6QCWncJId3+s+BjKPvYG+F6ZHCfQ1azHHZNfjHJ1e+IRuAj8T
 rNaCUNNA==
X-Gm-Gg: ASbGncsduewsizxOaml+IaX1FolLzW8ix1nro70o6q8WxVrJ/uznOCxBgj/XWwZdMMp
 35NsDtjp+w3+fE8SVkzn2WQjiCLX38qBZWazvwYT7Nafi8R6uFQ0tv/RiG3Ur3S5ShP+aqZsKul
 ahkAz3WKV7saqZ7kTFpcJEAb/NNO8y86wJYX9BNZ7m9rmlQmkZ3nivagb2g9Z6AbpgGopopScjM
 tsTHrAUkQF8OmkvAh6as1isJKBKyrs7dB7hjdTdBrQwaTbEyeRGuE1rWeiVJE7lF0awbPOCFZjq
 7qgfHW5xyRqMGbXpjdKxoB8L1ZPjQgL3L8B+W/VlspjGzSLoddA2s7GowFYJupdGXZ31xn6F5Pq
 FXc3terczrRsRuNjtWQM0hBXPTD1Tcns3g2g=
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id
 6a1803df08f44-702c8bc0d61mr59982406d6.24.1751683663510; 
 Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhsBwDPbjwXmMNVNZnztP2icDidDytd6L4/eciNVoQ94oT2wPJEDuuw5S3YagbqjaeFDqrEA==
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id
 6a1803df08f44-702c8bc0d61mr59982236d6.24.1751683663082; 
 Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:28 +0300
Subject: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tBTRVQReAX9n9KrkvZb4yrkMs88kXRzSL6ZE6wG1jPw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bGJNv7nYwCLTtEXDvuV3MHGbXqX/+37yGTBafoY4WMT
 cGlRTadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIfAX7/7jnPW9kAh70PpKP
 nZOoLn+ritHDPvy9r11DBQPDbgP5U3nzK4/dT2VNUfRYv+3s0vgVPaf+TLoatcy54JJbuuLaXMO
 3vybJeXv77YkXaH/L8+JdxUPf63anXBMTki07xXff534bs2BySm/CA+9187hvej54Fz3vaN/hF+
 +56i3Xt7DuzwqyYs9b8pPjP089y4nYQOdo6b0aLa1t/Q9P57stZf7167rnXA//X4v688NaIxun3
 Oxl4+H+WiJcFHU6cqnJ4d6Gc3WMPF9+FP83Nl7wpPhsJWP6yqMKXKs/1jEceaVjesk3d6L987c7
 t9+1mpNVedbDsaX3Xoy8hbarFf8y2cOHBc2LVvx22pYLAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfXzPkh5anEj95H
 sXm/ZYYoWgURfwlXQmajp5q12hyeJrqRSqxH1j8iQID3FDeiAgwrL31L8bpOGuCZydaLiNGOIl+
 jes9fQ704RSoCp1hgXSHhe/msyrH1a7tMTgJCtZqudrp3304pmzkGOhFVQNPKwGCMaVqGLt80U4
 9pvZZbkv3b3U4W8LmKxyUhIFbHzkVduU8Eahf3CnionlijYSBl/akaMjn3mJaDI1SJqBBFRStyt
 tXxRhoDqQ0YVBzfpzzQGSKI660UjEmKArgRq/TzyTPhiPMy81002IxUUFXX7Fz9VnM/nikv7V15
 RUfCZugVi5gmUzb2U9RkCgn9OKK+Nc0rEn1AtjzSzIZV2dYi/lld1jS9oqG6qNQLuncoTr21sxD
 0Z6eKbPltI3d8ThTXwAwd+g6KyCnaLvIPndQN0lSEFlwjTSeXRHla23J7eKWeAW9jMuXUMy4
X-Proofpoint-GUID: gZWCL0-uDrZve8_jidRBCfzPMHqiwY-J
X-Proofpoint-ORIG-GUID: gZWCL0-uDrZve8_jidRBCfzPMHqiwY-J
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689250 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016
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
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
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
+		 MSM_FORMAT_FLAG_DX |                                     \
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
2.39.5

