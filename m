Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB39B48701
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE42A10E484;
	Mon,  8 Sep 2025 08:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnHMSviT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC89710E484
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NW32m012162
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=; b=BnHMSviTEesJu1Az
 snAreBs3+0WgA3WFrF2l5dpD/ZKSciieP5EARfjD5pZAErEWC0Cdnd8/iI6ppJ9L
 ZekdmBqXOEZ1tr4bC+XBZOD3ULLsieH3UOnLnCODkhtZNRsMciNoZySZn9sgynul
 fOT+ug0FK7Jr8FTvur3X5xt6B3ANZcfJ3P6joY9EC5CmnlIaZUI+4X6vZJgZ2LwE
 FO3kIWDfwt6YEY04F3raSr7TQZ57mj01I/RG8KfjK2pzh3uvBiznnzDTLYvEKiX/
 EIbzbuFUs/MNNBAT1WRUQmcnHrd5PuPo8tEQ/L3lOp3LxDjMwJ2LqibBHY5Yeal6
 qlqhQg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc20a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77260b29516so9991861b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320081; x=1757924881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZyO3Nq93Bf/xQ1FnubJPlIMWCRx8r4Toxq5+4c0O5k=;
 b=oesImcCbGQLbVMdA88hfcUs8+v4rKcJDaiX9Ozzu303GG5a9kfdZ6hUDZOjRwNOJmd
 Lp0sXgoVY63Q+jZOIFuQRjgqHo26wafAvzSMjfsa1OQHhVFYvZ5NkeS44uVB0379B9xA
 YvvaLeaDdQn4lAS6lLBv5qSy62EWWzpFGqIf2S1mtPmdS+6kNKly9i0NLr249w4kRAid
 g4zbpwQOByb0fO7dkO2Ui8TG1lfXHPlwKUEuHtTkdz+vLmjav3Zi1Xl1n9wFGPuBh1sO
 KCJK0k8zS6zH8YMj/9jY+6WiL02t4l8SL2X5NOcXIJA+Qjd3S1B3XY5Tw2UHZ4Q39922
 zmiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU29mjdSHppySZUvO5I+CKn3VHyckC80UsbGRWx/gby1OgDmmLkcs357V6VEchVpybv8IQDUV8FwoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJgFM/fxrUobm7SSXVwWDQZTp4KtjMrWBk5wXczsVCRTyPK4Dx
 fzv55xU3orPPZ1gKcxygDNlbWzIjeSw8N3VN4PX5HvGAZ2Gu1wZWbcgc5X9SenurE0z6vIro+RE
 GIZtnEzZ7ZW3MKv9keaNA/DflhPSkVoKDbcFrrq3lUPpyJM6+OfcOu0+7S7vJapWaOcmhPjQ=
X-Gm-Gg: ASbGnctmIhH0729EJwmpV2dfcZCgejJgc6xFmCbKbW9aBT2BHLdNu96Eq+g/Cea9H5O
 Fa1bKkbjLRTcB/aqXMScE2UwKH0oVXtGZdPPDMUBs+3ga93xsnUEsNo6LTiS8W9PcdgAdRGUHsi
 LiaACsQifzyO47wHqpRL704LKycWyJcGa6+TEynhIcAsoLGP68w1PjVx88Zvd8oVkQzIaAaWr9v
 4NbUkShqoY/oUQwWrZKUlFdD1sRFb3Kb25HMSq5rv3E8LajV2sbYtlKUGrC8K8L2d4MK709h3V7
 NX47+1v4mwv03uJQFt52PkZpI42l2z2Csz9cLyBFz0v+hGMBIwEPyu4FQJ0+H/oZ
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id
 d2e1a72fcca58-7742def5affmr9598653b3a.18.1757320081371; 
 Mon, 08 Sep 2025 01:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA/YHKsqfgyAor24HUBSKnNnWTsB78uSq0VADVG8FDB/BKgowEMs4Q/v/ZpMOJN0/Ze4YAVw==
X-Received: by 2002:a05:6a00:1489:b0:774:20a0:dd65 with SMTP id
 d2e1a72fcca58-7742def5affmr9598614b3a.18.1757320080912; 
 Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:02 +0530
Subject: [PATCH v2 09/16] drm/msm/a6xx: Switch to GMU AO counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-9-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BnBwOePYgAk3DH3Xs1s99xX8yvtkGViS+FKVC0Tm+Fs=;
 b=J31mz5s4viqszzEmkcEfZjUtCxH2Yw01ajJbFJ25U/VAJMLlEvOdpS0BogFIDeLhaY3SaHt1M
 MwcJWKugZ1QB2hkmvF0EeEVLF3Hs0+joMGgptu4DLTNtzaUEzS9JIkk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be9392 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 4YCaSWO7z5OHR-YZnFrZzHrM26gtdLzM
X-Proofpoint-ORIG-GUID: 4YCaSWO7z5OHR-YZnFrZzHrM26gtdLzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX7NRXbMmbZPnd
 wq6HQFsvjepTMgTP5rcgjoRSdimJrNHWZON0uKtLRSTR2AJ5okwoTjBWRlv8EhMQlmvFrOR3ijS
 nzQu9TXSYi4tK77at3ltjO6uC415rrNRe/dyS8HnrLP13savihNeGztkvR9qtnhTeKOkVEdPCX8
 CzgQQ5kekR0EoZYF/TYYc5VdyaxwLK0hUXynZMRsSz+ay18Fr9ZELvLOJRwO00XeriyMjVPj3VF
 PXp6UzecmrZna4LB+O827TuKLyVYMmiG7BUwOOQhQ3lheEyMFhVmFZi0XWlbznxpVxegFoVcaRh
 QG9ELJm9zxLVyX/4sa9bSaILCqJJTZyxI6tJo2tb3tXaUfpbeUQeDhTYw1oX42G8DsgDyS8SQGN
 IIRLrCap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

CP_ALWAYS_ON counter falls under GX domain which is collapsed during
IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
not impacted by IFPC. Both counters are clocked by same xo clock source.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33a26bbd245ff49784bf1219a584936b4caa62b6..c64c84affa6821f79ea74b80b2f2014df38ec918 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,19 @@
 
 #define GPU_PAS_ID 13
 
+static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
+{
+	u64 count_hi, count_lo, temp;
+
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (unlikely(count_hi != temp));
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -376,8 +389,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -577,8 +589,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2265,16 +2276,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+	*value = read_gmu_ao_counter(a6xx_gpu);
 
 	return 0;
 }

-- 
2.50.1

