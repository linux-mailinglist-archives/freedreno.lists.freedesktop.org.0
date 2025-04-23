Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65DBA99A3F
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BC810E703;
	Wed, 23 Apr 2025 21:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1nudbFI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768710E6F6
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANjZa007715
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=; b=i1nudbFITywtFoJT
 pjqWvw17B4rb3NJb9k8YkMX35vF66nelsxDIPIaKlrhG364AkA94ieT1ShEGqBZZ
 Ze1KeEFN/2VoQBLtj+jS3SS3MXHAWR/C6VHGyLyqBaokfhkMhFns/OEMj1rAHZdh
 g2Szjm8S+ESi6IDRzeWcXRze3lLNnsVh28/J32jqD19xfVk/toqCdC5ZCzwRdXdj
 T/53rmywi8E53sHN1xb4auVNffhtSUr92ZyyB6ket3nF8uCvvyZFY3TL4R+B9Tb7
 xOG9WP+dbHYa+bc8QM2vy3Q2Qc4n5zn4cvNhNF60efjos8x8bBYDa5YH3FTaPhZr
 dG5Ekw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bdth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c793d573b2so52988785a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442686; x=1746047486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=;
 b=NTOPqbwSMyi7IZ+en/iI9pzLSc8kGCRt91Jtv5AdjNH0KT1oKJg/6ADUVufTW+22i5
 1HSlnND/rHaRtT8jJHQtNJassF+XgvBKEwJUpMIZ8ZirKEFmfzopbOhHV/RZP8EzksQ9
 /eSNEnbwBOPkleKfcOCAX6Zff8FlljEuuOktxlkkWuvWxnyTH6TLA0zRx2oueM71/N+U
 ZG/fZwpZ7LysWfP/xTB5tXXy1i01xPgi5bUu2E5AlCJPbGaOrdopVyxHHuI2WdUKbFfq
 5L8wr0ebA8+V/62MwsBjyBbghMUeWhAxi5XiVk6W00Fw875giFqvqtESm59+D1JJbc3Y
 SmdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnZihgWjFJDdPfkdLmf1RgVDKq7X9KqZJO7iBCYEYCtG104OL1nGvUceIkUkRau1t6NQJgv1SZ3so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOtTFcOANRnhaCMK+Aoubaw4aZvmL2uoTKEz4WFVWpkiijykXf
 9fnlMhSicdlSsbogvULpX2qxlB5AyfIZ0T1vCiQRYpLpGIUqleOoxIbq6+8Vl67D7vtwIl8tHjH
 VUFUA271dr6pSt6Mja+qMpzPVYheHUog0+aR/Rr+aAyLQQgGAPMwrROLK+ZzUINp1kSE=
X-Gm-Gg: ASbGncvjrszolJRhG4eCx3/6t7zvfI1+o2YeqHgPzyabufba6m7jnSuV/r4neap4jmX
 8+SI1bbUY7vG0k6ZTBguxvd6VnNNejji8lA64WQ4PFoIRZCggyex4ZjO7NzEGVDfo5ZQ1kZYdk9
 08R1AkndqvwqFn7XOB4jc0o0W1TWk5+abSykffjQ6gKpgWh4BTjeoUU9P/1jMn6p3JzYkOEGSWi
 MmuK19G5lB2YxweHIq/5botAAayLO8mo/1LIWJzwU1BVcxis0sM4gFOFOhpcoYLA9IhbIQ4M611
 Q8Aq+wRiYHOyTsJBvUi/4uDaswFmCPnDA1gXfGkS9kaZNfy/xgb/0m6YQB6wZ+euFOPzZ6WkIA2
 PIaFKM12vXrNfVMffE2StgNPd
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c956ea98b4mr47852585a.1.1745442685993; 
 Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiCLzMjle0UO/afRLR2+FdbfmRTBHY4/qAev7T6DsOdXSopPHAINyFixXVJzXLX325cROSg==
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c956ea98b4mr47850385a.1.1745442685607; 
 Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:25 +0300
Subject: [PATCH v2 29/33] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-29-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcurOQwmw4mipyLk4xtDigIfZZRv3wsszemX
 9hk31N/tM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1ataCACp7q5C2z1OKTIZTteRTOMWwwrni7zhoxTCOn6yAO8b5EEyhXosAsxOTWTVc30mVVcdep/
 2vIpet/BP0REXC+2ZMtja6f+BagsNXHyjhCR7hkTZDti+d+ME2kprZUzJkEB0O8Wc1ZvVDPpXlT
 nOGKpWe25Zm0CSa1pLNT3R3tr3CEn6TA5r+1/KbeQMOyN+7BHEOcPl59Knnw6J79hU8H1/myYS2
 X8MaQQzNhWqbewDxhXC8MK1AoY1qUmbY7CsDOzD5aCgvEP9e9ahwcwrb9b0Q75Rq7WKvQ/HOxkZ
 uZIH5aQdmH3Am7P9XclOpul6PuwPWz3R4Bz9L/c3sqXgVyZE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX7Vn1XFX40AsL
 hkpXv6tGOtv4ss3X85vUBNln0Jd85mLzAiNKk1LPQ7tFzCawbtyuocqRscFNNkzky8Uhn3BuCYg
 3i3s3w5brmqeu4LdZaSVGBr7oKTo6ILFuoLRbMY3RY0rX0EPIda7V13xhQjw9aBHiaHoxHC2Oin
 RrWeyXJqqQ2N4uTHZPVKAEzG5jexGwbeJBpKEmXh9CsqjDWQWG4UlabpiqWkJ/8xBE4Fn+nf69S
 gwW/vjnXptg1AH0rroDPxicOuRUqOxKXtJ0gnnacq0UCHQWvwmH2hgrQmi/HKh8wCQFdv5r64VT
 mPutB0jlWA05AvQFAr+uMzMRSR4ZklLH+1w3UP4PV9E5wporD9p4yD7pzSdqVy9N+HTviHt6TpR
 3lMzVzIDJB0SHhvo8lyVT3dgaTvTPyY1REI4Y+yRhusHOCBkcmSIDep2gcrdzEI9y9RObC4n
X-Proofpoint-GUID: 7x4ARq_yH2X10oVMoIUdmiK-_c-aZBTx
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809577e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7x4ARq_yH2X10oVMoIUdmiK-_c-aZBTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=932
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

