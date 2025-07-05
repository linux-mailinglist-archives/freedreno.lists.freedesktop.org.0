Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE60AF9DCD
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638B210E36A;
	Sat,  5 Jul 2025 02:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQHeq+9u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A107510E158
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652C2ZZ028454
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=; b=EQHeq+9uUm4I+8kk
 MRNOz7ewTCu4jmPtca70FrKykBzCfHT5mjeHnXt/UynFLXCNGezgON4tXtkGnn7h
 7wgUwXOJHNVo1p4Rn/f26RFxtGmiDeGo1ToA7uzLMgkaCS6/Vr/zhau71UaZqrQw
 9C2OuCW8PJcvfxClT5xEgEjgSdqOh+/772BvuF2hAsqhhwsbxNoY0OKlv7Skn3/6
 I8bHkr63lbin0bIEQo2bo5IQOtLeCrtTljIO5J38mUeBRZz2jAP3IqG5B1CjxVNK
 AsWXCpq1SL9DOF49A/SuuVcs03Kk2OfBKGPmGIf7ErdXZ61XOLdSDPtOPJk0CXNf
 pGLdBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag13u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d0981315c8so104544985a.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683666; x=1752288466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=;
 b=S3IzKfECYJysEeGbiJO4vCp+ygLkPdT8buUc6XH6p0i76HQKy/GPtOrqKTNKIwLRA0
 wRzjLRD4Uy/SjSBHMfKrpqdkLd096xZ7W+g+4PXebdrsFy1Xlrn8BMMJ433HYQNbLYdV
 imV8BPJwo9xvpLiUzbMt1ZMCCjD2fDBGMtKWlZUqDN0yR1ZQlfm9MEppa76x5dpTwonQ
 ioYakMd1fCaBqxfburkh3ul4nNUzmhQYr/3V6xj/lOBru4a/pFdAIAD14ThTunBKFLeB
 lS12z9YaVA8brBY0gxVc1peEtJULT0AU1QJQkj9vNEO0bppWWiN5zTFS95k7zqgcV5tV
 vNsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpyiuqZHhO54/BjF1L2Bk4VminJ9SjRZ84PYu2L6ys6JUKI4PNmSwN9umKx1tvEV8PjSg0nuZP0fY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyexhdALoiruLDDEH50UYGAuEa4gSxMrzpstrk5VVnd+ASCeCFw
 Py+y6CeDNSGYBcm3acdik+uIW2Dtii1XyglZNo6IWA9ARVXC1PAgznOJvV65oD9xQTZ3uZM2joY
 tbGy9r9zHM+S4JdQLgr/OPlA9S2OhyDImwoL5kdypV0p7oeX2qPB7Ovh8PpVtq56RmZIpMAQ=
X-Gm-Gg: ASbGncsyJueo0gMWe5gfX3btWj/4l7mU1xm9Z3p7mLXCpvoBvRKfNDASGlOx+U1Us7k
 aKjEeQMZ0xTi4d2eqvvOHLLH+edYK4CZCjy2kM2Dyl1NJ9KZ1vSIHKScMPJvwR6EGeSGay7Loqe
 dadprdZ4abCflW8WdOnodG3TKltMD1GSpA6HuWs713SGYMZvc+NSB7cmAnsqEiTEXad9ioC1Lwy
 n3PaDU9Hq+ThUezde32PzthPaQGk9PYgt/uT8NVFTbiTytlduTEK/4RAJpt7fkF72BMFL6x9s4Q
 omBFTEzN6ZO+I9CQqK7w2CMMA8txSy+DqCNXpqYiV+PFK5+rXtfg1tTbQh46+RbkUiCV2IUJ4N2
 8YXaXi1H6kDsBElsDXbu9m+J4yx1unmSJLec=
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id
 af79cd13be357-7d5df11decbmr535125385a.23.1751683666024; 
 Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwtMlsGQ5e0xwgineScuK7LVo81xSUUNyI9wwOwhzVC0LLgubWDgPwYkzeO6ONeH2kkgrTw==
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id
 af79cd13be357-7d5df11decbmr535123585a.23.1751683665639; 
 Fri, 04 Jul 2025 19:47:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:29 +0300
Subject: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9LZKmNcw7tV7+z+ODXvY0qjWWZ8WxZuq4U
 lsCFURThMCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1W0MB/90ovalKVq+VIoaoxKU3yeK1DswGCM7wY5lnI2NRur9dWGNgY0nHwTqDBm7S8m9OP2iGfX
 LUaxcE43Btwkuu1QZ/Ql9T/kA2y9cwfK1mdQRkn29D6VLuHEyyFd997n1SloMJKaObGiNvEjmvU
 ODlS74FSwptlfcY4nHWVkX7pBMkCjOKl33Eot6m+qVWMgzwji/QrYdsrw3CfGP2EK/Chkk79NDx
 NhTrO0gaSwvDeSC/CESh8k+43yhRb8DalR3oAvzJvJ45qea6SJIBjmxEoh/RqPB8l2a6hiyYMvh
 7kWrLUljb0S50hVIc7pM+OM78+tPblfNSkIwVhsmrVpMx9Fh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX41j9DGnnltCK
 G/EDlX+2z+/+VNQPHXJo0Mc0LMpRkWXQzL9jmkEstgW9XSRoqwctV+8KHdgtplPafVbgQBpUo8O
 Q1m2g5XrDoz5gmVg/n5qQL02auTQGHXBpXsMlTqw/2eOlofT8IlaWOS01XpiHIr0lLaxCMoaUkV
 PcMnmFdkQIFhjuaN9D5fuVxX1siIAoQ7K7+KLDPlbXFn6q9HEeVaX7uA6hH21napyfSxS+G/ozC
 Amy/mdxdcj39jeSV5nd9Zd0a+NwB58QYCJcFbqgChqOa1px07rbJbTxcRGDB4M1R3uqreVqDpd4
 JCIR+SElN3Gr9KQ1z8JXghuQwzQZXVWSApfSuXbcw5UwAxKeUfgL9wTXHw6pHNsmslcFBfXY/zz
 7rO88GfHWCOEYy4YcMKMaJO1bgo+a2F1l//0/g/2aySRGbBo39PR1aJvG5ve13vvaaVOfgEN
X-Proofpoint-ORIG-GUID: 04JVC5POEJN90IMr-c9Zgph3WjLYJx95
X-Proofpoint-GUID: 04JVC5POEJN90IMr-c9Zgph3WjLYJx95
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689252 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dG_4ntQBwjiDuco-PWEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
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

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.39.5

