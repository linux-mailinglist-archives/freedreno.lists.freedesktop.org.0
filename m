Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE17B0B5E5
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6410E372;
	Sun, 20 Jul 2025 12:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJzyONwu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298CD10E36F
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5bpDX032452
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=; b=XJzyONwuCsAmdsVp
 uEWekU2mkMBk4NTwwSL9PejCmB3rrqq5cBzI1VJRBOZUvRCI7S4NmnHYRYAZVcOF
 8tk1Zt9QV2SlNNq1dKfGjLQc27saRaYg316BXpDQzXApdRMnwjYoV2U6srXv8B2j
 R7YBHu8tBMnwk4NiIYrTA8R1rIJliXww2wqFTZTNL/Eru1vy/S4obpD7b8jd8sgX
 9H9HfN4tu+vyvWQFWC30IQ1dIEP974jiM5kgPcmHP+FbTCD/aAFOhbzay/APWrjs
 ebsH8/tg1KAS653ZxrKu18MBlDMIZJtz7B1da/R5iOiCkYzFjrdsi68pUUJarbh+
 ZmtjKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rt791-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74d15d8dcd1so2457578b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013847; x=1753618647;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SthMOvj/tgeikoDF1DaOQafMj/mya3JcY+MR5c3vfhY=;
 b=DKOOnb+c/rA1/TdTABDcmrHDkHvOWMfu+3efq6qzvDTltQyL9BmmaEJUWseu+//YRF
 raQfHzFsScmfH0usPI/9iF7IfX9fasTsCbgOfXJACCCZkrRUDt+ClGRpLy3pFDOo9ZWT
 TSUorOK+lYszI45onM+Fw/yp67lYML7/173xHDJUAz/i5SkBLix25aeWtoG+dzhcex/B
 wksldHkyXkMIDX3MX5T69m7nZDnPUe/PBv0xTBHu8w3LaUmsbsNS6jhq0CF8A/NRKlf6
 Fh1nATUIzheVxD3ErZOqyYb2yVZLJ5W5SGvgvKOYNiqk230VVCYt2fW/6/m8uFFHobzp
 bKXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5koyqDAmXAuYcNeLIzFQBthbcWIqP7EW0CVVlib9YaWbBCA8BfkbPoGOEYnlB1c9hhwjWp7O4PyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq0OIbtp+7r/3HKDJIA2rhk3B1SLUkmbe377tfdjLMUg50YEKT
 xcPGlPlbT8w3MHt1i16bIelBX5IibunllaxW8g/3wD0IBZjRF2gZNJqHk14maIhfdSlYCzctAz9
 royt3bumdpf6hOf2aW3LPWAizwFyqsAbTYast4xp2x5eY2Tcl8UG+ZApFxlBZEEsRYjVH93Y=
X-Gm-Gg: ASbGncv6ZgvcHTewmb84KGji94Wp1M4nrRZkDmWTRt1BAUvD9HbHmloM6W4XyVbQ+f9
 +EETFYAhb/Tf23IEMt+de+9use9lqM89zX4LftodIP3bZn9Hsqej+ZWCAoLI3HQJo6XMLUW7bu9
 hButeS8FI9QF7dg3dKRxR3pIHCtA8OeduHIy/08rj22AyCJrQ1zGBNuD5fVkAiG7i5w+kqPLmOT
 EIi4rPrNAhpLpYiF9Gay40e6U4uoY8DvRtRbEibg3bKx/SRT8yfFZ1oyS6lF5S4xfq9AU/YqRwE
 OCwwfY88MgDsh2cXJP7CyhVg027o62Gog2KKUhanFWV4uCjzE25XEu9yjdnoBFuM
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id
 d2e1a72fcca58-757250806bbmr27254983b3a.11.1753013846860; 
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs1tuitviwC/J4/O6Bb16mbD1enJVUrTELkd81BeF8q+yHvYhQvPif6zen4HAAh/KoTrNivA==
X-Received: by 2002:a05:6a00:98d:b0:755:9110:c00c with SMTP id
 d2e1a72fcca58-757250806bbmr27254940b3a.11.1753013846439; 
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:10 +0530
Subject: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2596;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqJpkzMI0ES2mEy8nQuiLa2Vdj3zgdiMb0q9pTdHGtg=;
 b=dN5Ha5ZJ1vy2SWgzYUESebNz8sZiXP+h4UlpLjzQ6YYCuUUyAbxGHHl1x/rWbxhGlW5EP8351
 +4ZawQy9qRBAIE8eJ5Tx+2jrBUEsUpkB+yuxg9EPmPkcPOU7ILwLRhb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX+jmK6iiHYs+O
 TkSZCKuiJTfkCQ6lHVP2RZH/zL63XqVz2JG8Ag/ztswK+yd9gVVB8se2OqBto4OJVNdkvzR3aVN
 Eff8tCCkteXxv+Ibb20ieZVuPOsCRI9PJEHyc+JG+o1IPVIMTIIYVzdPxWRTVvSu1pmTgDOmd+B
 He99RmrZfGEOWnd9E6tRpuhOTMnJAgQsLYD6ZYu4B+fgEUCn0oVlxAX867+61faQhW5O10lCiyv
 pgKs9GU9n+wgor8yDCSG0SwacZOv/Oblexyro4xluaX0qH2VNx+VG0oyb7nFuCDi/41HESjE/mW
 MJMw0MJWQdDbkda1jPflDWp8QDparBX8ZJ6s3V4P14u5PuKCvkcfcE1lFSPApYXRO0InfMv7qMZ
 Lw0Lg+miRFovvWEGUfvsAGn2sU0O30WuiFFNc+HUXuY546r8E9RJfpMLP8MDUYtdG/OgGhJ5
X-Proofpoint-ORIG-GUID: s2aOkWtZ-bQi5yOSCL96c5IJw9rp4iiZ
X-Proofpoint-GUID: s2aOkWtZ-bQi5yOSCL96c5IJw9rp4iiZ
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687cde63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IO4KcYcNY2hykouNLhsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118
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
index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
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
+	} while (count_hi != temp);
+
+	return (count_hi << 32) | count_lo;
+}
+
 static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
 {
 	/* Success if !writedropped0/1 */
@@ -358,8 +371,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -559,8 +571,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
+	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2246,16 +2257,7 @@ static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
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

