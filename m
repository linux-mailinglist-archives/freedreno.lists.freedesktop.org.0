Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3509B3FE6D
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 13:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44310E687;
	Tue,  2 Sep 2025 11:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjBZ8smv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8010E687
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AjxMN031556
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9Ecf2EnQwQu1LlRGQboGHCRDmSsyxJN4FsdN9WPMXtg=; b=jjBZ8smvY7EzlmxC
 vLwbTo+R9B1cZ29qygXVBlcbJtWwDCUVOz19v5dySma5+A3B9w21sgDfim6276Kn
 fzlJkMZ7jao9d22NjRllkIDf4DZvxtekR3zfOqWtLK2PT5dlhjQyST+1EAtJrN9z
 4LpgsRPBBZUmRLaWZHehbJ5njdJhmqYZArhY93o1Tf1euzb1F8nQORAdbBTZFp12
 AEr+MHCZEXCSw2AgSBAv8jxkrAJzUhEpl/OpsQfwxJddjddjfg54GeiUtRRwJ6sS
 IAYZ+Gutxpy11BUXbhsvgX22fBznE+JUEFt0hC5PFaaBFsGk3ECyyypeMhiKqM1c
 Cgwy7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw9cqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24456ebed7bso70583885ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813851; x=1757418651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ecf2EnQwQu1LlRGQboGHCRDmSsyxJN4FsdN9WPMXtg=;
 b=xJGm8qrlXI6Gl4IG2F7crs6dcEZESTTQiUB9Sn3VgKiY38mVC4o2f3QRDEd0dJAsgE
 ZEvfQ+ra4/LP9HEiSS5Ib8aN4sOIvhYQEXepKMx7cRTdCMwf/+LB4T0kLn9v7LPGYyex
 LeEjpq3rMa3fGIOvB21Q1LQ8BkCVOkomLUg7KgDtLrA8HIHaHrrWCHxNlZsYwWFPE7dV
 rXP+yUooS0KEPWbpP0qaBOyc09dQopg6Vksm2JfPANbQxUHjnDyDRvV+am0hVQ9K2lQZ
 ci5uNWRBEMXbt2xvu0urLJe7cphDaZphc3Stw7xYHJbYau1JmPlDo2n1WRMZnkuc3fsV
 ZABg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWptlkePFvWtOgAav/YQX5ltlu5IJu4LiIAs1Tmkvklzu5/DTZxugQNOoKcrcYIHcrMD7uid9JjeUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVIqtkmmZtbI/fbvwgDNPYoDiuiS+17snOTZE6KWMmsVXBjjB/
 kcIeoox94apYRoWQWVvsrNF5JM0vkDrqiwAobK3g+RgNpvjAs6sY4//B/jz3izYRSRKqlgnjqIr
 CXjbg9tqgXbGCIEC/Uqbjd0yXoGwEMJ+jo7Etsp5kayo3ZDKTVRODQXrs2+LKUwddlMWqhXKZZS
 LGRcY=
X-Gm-Gg: ASbGnctTWENL0IqUbay/W7TPaQcgq/sckE/UVFENWCgKX4L6AwvKEzxMlpg/CLIeTDr
 913OL0AVSQ9HjVRPOayhrBKnIe4UWXUSDN7RJpcaUoaa+T4LiUMMD5lMWt7qr48zy6sj084xGUD
 F293bscsREg7S01j5KtUiy2dUA0GAx5UiLlBMaE292Yroz0z6ELjTHrBpGiGhddDaRNmb5N9U4F
 YXCBdc6SDUxcPLxqBSpXBDgClJXbkSepoa+T3IbRiQWlcbVVoBlSQlRYXdnkTdyRumxyX1Ge4ZZ
 U3A0rGxupYXZ6F496XR5eraFYKJPZbhO0/Vy9FOckyXbg7DzXIARaHyn1WhHb3j+
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr150963185ad.27.1756813851556; 
 Tue, 02 Sep 2025 04:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe9tA9MOp9iJjbDEJjzynSMTlN4118IVJo0EM9iKkN4E39bGnaCYGlxUtOV+n/mB9jDr8Myw==
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr150962885ad.27.1756813851076; 
 Tue, 02 Sep 2025 04:50:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:50 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:01 +0530
Subject: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=1466;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=twGhxveDnx4sa4AY86Omvzu6sh4ndfEdD71Syjd0rOw=;
 b=9ysrXfc2HgE7q8Ud9ADJPJDqm3SHpwRv9C8hfpR3wt3KFdyZpE+MoLnjKe/XRgWoGg/qtW8Cw
 xWix1+PIdcwBtueU3gqiqKKj4HINkbU/zQsVGWnSrCRn7qlmE4rb5Sc
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXyZumOABq7FCc
 0T5rOo1Alhr9F4i5SD91xFXhbgbG4fp420b2MQ0cGpiIjTqv4ip8Ea5Cm07ljOj918FKYKWtKuE
 d8Nyo4updgjVnIUKTszdfHUp3FcilASVERCK+VhlGAZLSgta5gr02P5/mz6GJE4TbweozXX0od4
 YeFEYXbCFtAsJ8n7zb5Lk2wypRuV7Q0zJ/ld22jDXx5Awce/OCZXhoPkPumOMFUAs9hSrIPw/UW
 iPQK6+FRBDcNSNXVhtc48LCUktm4/CQmUL6kAPg9GSdofpZ2E/bpmp3gvopW5pWIEaE0lHqWtTu
 rz3KPHCH8YuziCt/dW8+y3ct03Qvgo/ROjCCFgWdMozmyF3IZK57DxFO8hJ1e3gsRW85k6RhL2d
 LGF2rB6L
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6da1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gF2G-XVBjaN319PmpW4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ijhD5K_BKcqKWeK_v7kJ0dZOH5grlfzh
X-Proofpoint-ORIG-GUID: ijhD5K_BKcqKWeK_v7kJ0dZOH5grlfzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

Current parser logic for GMU firmware assumes a dword aligned payload
size for every block. This is not true for all GMU firmwares. So, fix
this by using correct 'size' value in the calculation for the offset
for the next block's header.

Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
 	return true;
 }
 
+#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))
+
 static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -789,7 +791,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 	for (blk = (const struct block_header *) fw_image->data;
 	     (const u8*) blk < fw_image->data + fw_image->size;
-	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+	     blk = NEXT_BLK(blk)) {
 		if (blk->size == 0)
 			continue;
 

-- 
2.50.1

