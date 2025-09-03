Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50248B41C37
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 12:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAD410E745;
	Wed,  3 Sep 2025 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTApY0W9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183F10E745
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 10:51:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AEQn8012188
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 10:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LOqF21CE1uDjWwhsOc9+y9QDvjUZ79AdnXqgs80Rfxg=; b=TTApY0W982Io0a/7
 5WaFtnPrDL2iRHZskZUwbk3zX5R0GRvG/p9mg2JlJ9BGRXZuqmTm/BdsZs81vc7a
 Io/UD4DHRejY11M1LEYH4bnAJKb6/BM9PJXhSBGKzasnCKcq1/8/G4WnnAeUu0iP
 H7vvLfN0ihBYhFFRk3fc+Ac4h/J7xS7sUyn+RdZnubhvAqMMClm1cExtULUemQpS
 vubmHmFLT3LXFgKvFGq1rro70fGnwntv3iMRfJEjuQSasPXFdbotNbWZCb6K8zPQ
 hIU80hCaRWyESWQs7xls7AQJCZFvb4w9QXhONW/Wq/3J5RN33tH9N/DjTiUtHQ8Q
 fRASCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fk84y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 10:51:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ea01ed5d7cso694528985a.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896715; x=1757501515;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOqF21CE1uDjWwhsOc9+y9QDvjUZ79AdnXqgs80Rfxg=;
 b=MnCjsOV5UzlmSzRzOA8gNvEoSInjxqwi5XWnOqWdHmO0DMGjiB5QbJ16tKunzt2G5O
 OHBqmkqjQZzuA9PAbHpB5F++j7M63DsUiY1YapwGaXhB8NcYbhrNa538YEH0h4oUTHYj
 LH5JK3LXgCYH1aIhGT81odyiWl+Jd6d+W1I0t8GxUM6gx+Vq59clzqSgmydA+FWF6+qn
 OJap5LdjmYBw4SzN/+2A4R9zE364G5QtkBGbUlFwg7bI+vsO7lp76i6DEPh+yCsA6aCb
 OXcxprsTAkGqNXIB7b+Z2GyC9pe1QemKM1KvlYQTdHII3vN3khxHQ6dTzjoUaNz8f5pQ
 A2nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC5v37RZww0Ks1Xj25vAFpxpPyx9ijiNGe/abS82iQyh+MXkNJaXPpOshTGZIqK3I5NWbjgyrL6c4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ2BbkAV63jbHiEWPICFBQa2SK5AUOZw8JNni0Lv0mt+dAh9yb
 QXH+CwmCYMQQmG00ytBOHRCzA3v2RaPSmLG93SWc9mut01RN37ns/+oyCQcXZlbf7xm19kH+qwl
 xLqh1+TYbdzNckSL5t67CirlyB8upJlFalKphICF5fqlaZiMpv6/hYUcoLC/Gu921/qQmO8A=
X-Gm-Gg: ASbGncvff/+juu0N/whTdXIFjx8gT9I22LjfcLWPkiiT2cKzfBw8SD7J8ZJQ+uBg7fY
 E7kOfdvAZSuqWK/HjnYwWWbKH9Zj1YT1m2eUSsN0NE+MfpbKpb0e84cSAinghDyCd7MaYjV/r2s
 n5j4fswdXHHxXo8UuCMeNhf3WHjDKf2kszPNbYs8ZUPOsfGioE42pc342Dxdbc7R2pP4FH5ADfS
 pi8aeaUzWaBANtnncBAxBeP8TUOwqxXwgukCoYWBUXIudVM3YQBfisIvCLj/Cxys8H/B/wA6qYG
 TZKM2fDVj4DoE/xBJ1+4nXYg/WA3sq3YJY3pY2j2aw9E2ujP7xkQ3SSYKdOffiqs5IYkC3s7+Ml
 T42f/0KE613NgansvMZ5MTTbUBE2LnCSg7mSjdaywYYOlZo95G7M2
X-Received: by 2002:a05:6214:765:b0:709:e251:c29e with SMTP id
 6a1803df08f44-70fac6f8965mr187559226d6.10.1756896715397; 
 Wed, 03 Sep 2025 03:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpI7x7MnFeM18AkGfzBg+64o8SGEKu+2rsvamRjKqa+LRpXTTcPOES7lO8eSmbXmRIaaIuKQ==
X-Received: by 2002:a05:6214:765:b0:709:e251:c29e with SMTP id
 6a1803df08f44-70fac6f8965mr187558846d6.10.1756896714885; 
 Wed, 03 Sep 2025 03:51:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:49 +0300
Subject: [PATCH v2 1/4] drm/msm/mdp4: stop supporting no-IOMMU
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-1-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DOxzGa5ln47R7OKiLfYSQ6PXX1PmidXuqgERtNEvWGQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GCYkst6B7Vxs59unZZ9OWKVDoBqiuhqLC0
 Ad4ZcOrmJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1ZcgB/wIRfe3wD4L2wCQMTy+OxGPZlV6SmutRvWdRPLCSQp30ykvoaG1Ed+6wQruZao1GvSijCJ
 orcOb6USxUZZxw63Mfp1G+ybUU9Tj3tfzkG6fKuQSGwc6GyAwW8583XlCql0de54kaT3+Z+oYN0
 okuAymJbOPK6yEBncCgmM5y6SOrv9LsQyd2VcJYYZLAXt9cv3ojsX8+Y1SZ8BKMp6Vcaauelz7M
 EW1dHqy73TPNShxN5UdgVrL2iH6FND7OHToV5llWfafKG+xzR/L8NsgiyfSK+lL7JIQ/YlQM5xr
 ys3pID7GzsNL4GX6q0nLPx9t5Unu9DrwctpnWmwyAzpLutPL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXxV0lzP7EfyQu
 lgErbmzczmVIibh/ygHzCV/aJVY64cdfwNaP4jXeNnHYgxIESpAq7Pu0N5RTF4+i258CY5vkjiq
 sBVoqEnOO5TACcaDuJw5CmOwWORgXTYGzJNxkoo6QkQ7ThQ4igLSmMGUZjskcQAphgVjh4rCZsM
 NDXkb/noZGIeox2hwqBC/i5AINVElnyZYnHinoiUnHEzffCBUB44IwR57OzFmQuJwuzoosRq233
 p69JLXqH7NNjBmoIrki69JST27PXg3ny6tZdnFnBa/nzgV3enn3ylDNpWjnQT1phcL+41AqxQN7
 kS6i9NleLgXdZX3fp4WDdt0DNL0TSVmCJahyqK13vHK5B6hivC8YK7uy6JRXPZtQLdbbSw+QXAH
 56g6jHHJ
X-Proofpoint-ORIG-GUID: ghACWm8tZh425VMD7CG42MOKJZ3Loipp
X-Proofpoint-GUID: ghACWm8tZh425VMD7CG42MOKJZ3Loipp
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b81dcc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5Zp61nms7guAxvsrN5oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
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

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abdca4a7e24e5af8a7132456bfec129..4d1ea9b2619170335ab4d2a2ee46f31e785b2c02 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -463,9 +463,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mmu);
 		goto fail;
 	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		vm = NULL;
+		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
+		ret = -ENODEV;
+		goto fail;
 	} else {
 		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
 					0x1000, 0x100000000 - 0x1000,

-- 
2.47.2

