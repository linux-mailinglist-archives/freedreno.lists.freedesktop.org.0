Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DCAFA08C
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 16:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCD110E22B;
	Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMwVlEF3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E369510E226
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565AfDDs017389
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Nk90VOiEFug
 0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=; b=EMwVlEF3LV1v+XqxGnc0prQi2ce
 POIJRSVXse1eRxSZLHLYXK4uhri57YWRiws8HBkYAgd/otBUdtDpq975Qs5VnOT/
 22aWWmtroGWckkzEUr9q9AS05TrBHqJSiuqwbOUDxcVDfHaLsCZTJDwUIORNXBwO
 wqrBt5BAYEf/IzKlQsPcsZUiNJwNh/qF+Gpav1WT+T0WUIBi99bH1EOn+5da9zHO
 ntWFIGsIxMauQVN7I/L1zLIXjimxjFHQfJddcYFvXM/IqwurSbUI8mEie+IS8kIV
 JCFAoYXcH7L6SYK5PddG9ue5MMUt4eZS4nTZ3RlIGR9FsSSQmHevh+L47Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv971714-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234b133b428so14009465ad.3
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727168; x=1752331968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nk90VOiEFug0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=;
 b=uAx2T7jMNok5TXsmQmrThj+y9SxXrhq+WSmpc5JLwhk0fAvx2rjfVYKbwkVdE2qsgs
 Z5nMQm7Ih7qY4gTwMzi/8a/gnW8j06/rN/zcLGmtjEGH+0mwg9umw8psnTbxgwTxBmCz
 SmoWnfuFMit0kcPBQ3KvJm+5VU4NX16PDo6kPDk91QMpHV1IHJ4nasXUvAYLVMRloOKK
 MKw55ppIxkL5ETrD3ViuxoHaBKXNKwRbB33wHWaviM6owzOmc7yivBqcdjwhViQvZdar
 IDsoAQfWzhPUnIqEM07JWbY3mJf7zGjfRRLFWdKUVVWN1yo2BYyAh7mg+Je4QQqosBAZ
 BXtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTQRExuyI0JOcSwQyrnJSOwzkC9Q49NymWcWyeu84qjjUukmuZqJdAgq3GKEz/ymglstiZ2FEGYp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMsdAt/LPs3QkRpn1MexjO5FrzUzrrASUR2hJeZau7ZsJAVwyJ
 OQYPLVsGKV4cIHX3pVdlUeGrOEkP7WqEQEtKGejJguw4frqmyh3FcJmYgIMzXKVh+LNRb+IUffM
 cYlodJ6Ewm7+pERU0OQ3l1OOZVUZuyXkwRG/dXIeIIR6GhxO4zKKui0P77pq7H7S6/YLDEuk=
X-Gm-Gg: ASbGncuts78q2O7NX2ml/lVsNVnHqUVJlTSjUQ65ZqK5gOnGfN4nWBgVH1rxjUuyT/a
 5AlLVz4JH3XfuMcRnqwEg1rAoVnGg3VbGaMQSOoHVgLeaEjQt5nWKpgs4tYuEqWbjZxqj8Dh/Yj
 +Co3qx9KV4iZ9yfTq5yzBsjSddmN49t5QaLSj5RwTde4+6sVosKmbttL9MBlHYBxtGEkV8yENWn
 K/AEuKocGiUJD21y4BZsbIYDXMaugFTnAdoflPBc7Lsc3LSE+b+nB/3fOPEomNb8GdrBlR+qDc3
 lldAeakTbFv4vkc9M3fsRGrfTXCR7iQqBA==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23c90fcbe60mr34277715ad.12.1751727168475; 
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGecKCCmRq5wXE4HczwKGdy/aWs+wh50ypGWsS+hlioJO5FRxk3SoGiY7wXQgs9u1NiDjqw0w==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23c90fcbe60mr34277465ad.12.1751727168075; 
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a38fsm43137835ad.4.2025.07.05.07.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Clean up split driver features
Date: Sat,  5 Jul 2025 07:52:40 -0700
Message-ID: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=68693c41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=udmpUeRRehRK9BJah1YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX82rZnQoM+fb2
 ed/Mg8pNSEvT+d9bmE8axRILDTTfffrZP0hEDDQ14mCIsocAz7n3sFCdo+nXV9NKqsQhADanTXq
 CulgOoGTLW1Sj4OWf53EBm8VaL75aI0hWtrMCaIGkFpB5wMqKmHwC6hEX4/mTNSHeR9kgVOqa5T
 Thd06hnsl1mPNEqQV319QmkPrUTE21NuvsffD5MeOEFCwN1XTn2ht4sx1qWkrbIg1b5AMNr/L9Q
 xvHzyUQ/3Y88Ssziay7gdliYnY2XGpzBzxv8HylO00lC9qWFzeaNNZzdgqrq9VQQophoPLs8QTb
 +6/kGPFrfYY76ZcWFSvnyhsZjlZ74C0vYk2MVZeiNbG7rJWnyrSDtVXv9/tGJ1P4DCGTtuY7uyU
 ITxt/2M4mHi0v/mzcUQSRVXh5KuDxpiyxt0oQaKo7ayqqj9rm36+mDdRYopAFAptAsGRI2in
X-Proofpoint-GUID: cu3jFh53ddLS3rtGfGpoBgERJBS4DuPW
X-Proofpoint-ORIG-GUID: cu3jFh53ddLS3rtGfGpoBgERJBS4DuPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050097
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

Avoid the possibility of missing features between the split and unified
drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
in the drm_driver initializations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6efc5b9933b..5695de1bbae2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -816,14 +816,21 @@ static const struct file_operations fops = {
 	.show_fdinfo = drm_show_fdinfo,
 };
 
+#define DRIVER_FEATURES_GPU ( \
+		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
+		DRIVER_RENDER | \
+		DRIVER_SYNCOBJ_TIMELINE | \
+		0 )
+
+#define DRIVER_FEATURES_KMS ( \
+		DRIVER_GEM | \
+		DRIVER_ATOMIC | \
+		DRIVER_MODESET | \
+		0 )
+
 static const struct drm_driver msm_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -846,9 +853,7 @@ static const struct drm_driver msm_driver = {
 };
 
 static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET,
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -870,11 +875,7 @@ static const struct drm_driver msm_kms_driver = {
 };
 
 static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-- 
2.50.0

