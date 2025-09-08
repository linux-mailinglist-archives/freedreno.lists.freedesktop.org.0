Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CCAB4870C
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD72510E48C;
	Mon,  8 Sep 2025 08:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoVmBKWL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7D710E48C
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MqltI016905
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xqC7Zy6ivxrAZNOluQq2nuWFwYW/k4m65npdWDnVVQ8=; b=hoVmBKWLwzy1eYqU
 v0eb9D8MOdTyHaLmDMzqaIxahQ+ODRYx04pYNp+aB1tl21xhPOSUdVmFieXf9WEy
 r8w5lnPmbJ3+dW51NiavAI+5paOGVSVVfmGaIHX4zm3YXl3vKJhtlBFdZ8Yqs/b3
 KZDWFY2asSMQsT/+QvfcF4MsM4qIBEqA9yzDmZSiGQqx4xAIqQpWkhQl9x0kbcJm
 h1ty7WyiUxb82GdmddRrAF3X3hiO9LmELDLBT2mF9Y07Twkj+x0k/2znsho5KZXh
 Zh7RzQE5pXYn5NDr8gE7jT39DBpnjxaHC9Zm+Z3tBLwXrYOgwp34tEraMn6jZhY5
 GzGIfw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfuqxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7722ef6c864so3894383b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320104; x=1757924904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqC7Zy6ivxrAZNOluQq2nuWFwYW/k4m65npdWDnVVQ8=;
 b=tMP0vbswrccx0k/hTCVvHtzA+jc8zazuB/TN18GTPWC0AjmY78uuELX1L9esgsmwVS
 aIgmryNpAo65f8j+nfdE2cxHrqJLpSiRTC0+YNHFQww0fteR7kyFkUTrVfctjlO2xvh1
 DNeDpomYNeFqirn0FTJOSmoD1E+fVHE+csrPp1YOZipXnxdqCYCEeeGBXInvpV9qvZM5
 K8F6u7gpked67r5mfxgQVWR+UAnBQKex9zrv5AhzmX8s6I8KTxoJFyhM5AZsYMFVDENF
 aagA/Vm/xgbvcV/HDwfLOSU42Fuqg4qkr6dIybc3UWe+JhtJRP3EdL8a+KmhRy/K0DgU
 9vJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmAufZ/5b8uVzknszPj5pNkJEy85tN6ar6kpH8moCT4k0ZUvNAZgFqVvv9qXdTLok0CF3SjXlhzz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBODZp9c0c4MYn6B7gU5kQJrSAEO8n+1zRXVx5QsuOriR4zPho
 gB9oYiSZK9SD+W8dfC+GtRU1J2GNOk2Y9fIfFcI32b+jKRnMEv7AEh/5jrAD38aA9+uMYvsSu4R
 mAy4H3mImbIJVfSKOG3RaOoTpZsgZYILHyozHIc3JDajG1yypMeAAtSkSLk/+GfW2Z4MEXd0=
X-Gm-Gg: ASbGncsXK3JrDyP8CIQpL7T/ezk6vzyynsnNAotb1d3q1L6VLSvy55yry4nZ7tvfDyh
 SE5lT/sYwBAmxYqvBLr+TM60R3xlmLBKflaymSzef9Imk9cB+tK9wCeOY8Q5kKKRFwEXjV6CuxF
 S1NHrh4KQiaEOjYHNabhZwV7Mdn0iTKYSZckeZD1w+FxSJTb7KjgyExutxw36o6LmAvjAoqGytS
 i+Uy1GOs32i1uMtxxxsfamFmxMJoF0NNGiYKLz1Nr/dY5LymSnaZQFpUGzYnBHNGRPzu74m68Or
 o/nGIHywNt7nnL91bsZUh91HKb4omHOFEDlFsyBeQ/3Is5QonFTy6tYZYCns2mcK
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-7742dd10e6emr8094343b3a.7.1757320103569; 
 Mon, 08 Sep 2025 01:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVxoyp2PRB+QVncUti3N2Wj7nrXH65ckYK0eniIMm9C8JT1Cyw/QQPJ8BNF4g/yzey4I9VCA==
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-7742dd10e6emr8094308b3a.7.1757320102764; 
 Mon, 08 Sep 2025 01:28:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:07 +0530
Subject: [PATCH v2 14/16] drm/msm/a6xx: Make crashstate capture IFPC safe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-14-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4450;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=RujJUh0j4TEd2cIlAXEv6xdDosDvLPvDu1U8gcvWuDk=;
 b=5wro+WXTeqUixun67HjZQHEfABVu5UwSfZexitnxpMZK1qDmqI4AcxqupwnbNFFAEV9nxDgAC
 ix3JnxBJNeeDvaqbrFlgfHPOoaTjF5SNLyOGy3hjlTLZwtzr6q1qA6P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: wDst2fSc5PUrFVbKAJ1-jH-zoIqFS_nU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX1CsbxU1H5/ze
 /9oOk0yK/TqjPqjkkdguYB5vIfoZU71fqL/mWhq/p9tGRqhzK6rYsHL4MwOADXZ7QPbVt2N5sWy
 mRWcrlRS8RsJtrKTwJaV0L/XLhVnDd8Vp9OAuRT88JLOPj8ofiaj2Qnzl430gc/J+jddkJpGgXr
 U26UVWIhQfODmcEl3NdRgEYOfunWuVtRs94hpohE2I1gvgSqFpHbEKEGlQFguR4ymB7RbEID3o2
 FjGGD7tffdlTnDZjCoKtsNHZgaCeATJPSoy9czzvGJiYeBHsKrXO9C0IGKBnQ7s8Ji/ls2WMBU/
 dIDIu79RH2eASkwJBULMfeu6Sb4aAAAPGJ84kcn5ITOxFV7uTKu4sNu3VKA/mKAE9QEmdSRI+xH
 FpWFa83d
X-Proofpoint-GUID: wDst2fSc5PUrFVbKAJ1-jH-zoIqFS_nU
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be93a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yKEZsNg54XTt07RPwjwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
add gx_is_on check before accessing any GX registers during crashstate
capture and recovery.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 27 +++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 10 +++++++---
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d76b6b766d4a644d342f62435892d54ebd7192e5..81076349d69c8c13e6c6b4e1c336c2d990ebda6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -101,6 +101,10 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 	if (!gmu->initialized)
 		return false;
 
+	/* If GMU is absent, then GX power domain is ON as long as GPU is in active state */
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return true;
+
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
 
 	if (adreno_is_a7xx(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b54c88fb27d57f81306163e699961803ff765bdb..76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1537,21 +1537,25 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	for (i = 0; i < 8; i++)
-		DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
+	if (a6xx_gmu_gx_is_on(&a6xx_gpu->gmu)) {
+		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
+		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-	if (hang_debug)
-		a6xx_dump(gpu);
+		for (i = 0; i < 8; i++)
+			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
+				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
+
+		if (hang_debug)
+			a6xx_dump(gpu);
+
+	}
 
 	/*
 	 * To handle recovery specific sequences during the rpm suspend we are
 	 * about to trigger
 	 */
-	a6xx_gpu->hung = true;
 
-	/* Halt SQE first */
-	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
+	a6xx_gpu->hung = true;
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
@@ -2412,6 +2416,13 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
 		return a6xx_gpu->shadow[ring->id];
 
+	/*
+	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
+	 * without 'whereami' support
+	 */
+	WARN_ONCE((to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC),
+		"Can't read CP_RB_RPTR register reliably\n");
+
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d5d1271fce611b60121b36f4b772d6f5e0093d2b..4c7f3c642f6ac0a397ac3b282966d25cd4488d3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1586,8 +1586,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
 		GFP_KERNEL);
-	bool stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
-			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
+	bool stalled;
 
 	if (!a6xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -1608,15 +1607,20 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
 
+	/* Halt SQE first */
+	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
+
 	/* Get the banks of indexed registers */
 	if (adreno_is_a7xx(adreno_gpu))
 		a7xx_get_indexed_registers(gpu, a6xx_state);
 	else
 		a6xx_get_indexed_registers(gpu, a6xx_state);
 
+	stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
+			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
 	/*
 	 * Try to initialize the crashdumper, if we are not dumping state
 	 * with the SMMU stalled.  The crashdumper needs memory access to

-- 
2.50.1

