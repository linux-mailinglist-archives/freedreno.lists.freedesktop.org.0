Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BAB0B5F3
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF1810E37D;
	Sun, 20 Jul 2025 12:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHXxt7mU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE3A10E372
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAiNLe009603
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UWJQ+n1U99z6vg+LqzHFMyrXqH+jKrP8tFTOzOc5ViM=; b=KHXxt7mU8ZFSUy67
 Zf9R3V6PuDpkQno2PMttYPtJIvhDRNHvURViUaB33z0x52k9IhAE97SHseV/2nI1
 MNjq7gS8u+z+KaSw/hnqac0U+xptRLB/LlxPjpAO8aXA8eWdA2kM8XRzjXP7S8jd
 9PlpzPrZgbIhfkZTTctpX9x1FVy7k3B/QaeXLtKyPA+8sQTQcsJkG/lzsntoNn+J
 7oUsSb6Zssadq5MpDMF234z4vgSWsOR8lcjAgMAF3XPzHJz7q5tVIrRe95SMUfXd
 vYTECSIKEEH/S/THtTXoj7dkjrEVrtV6vNmuAFJ3OyQ6UbXfIYaSM7FqZP0G8p1t
 p67eBA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044da66r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74928291bc3so2622750b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013871; x=1753618671;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWJQ+n1U99z6vg+LqzHFMyrXqH+jKrP8tFTOzOc5ViM=;
 b=CWdInDe7fDkTFEXE5/T+pknmsdbu+EDDUU5ZloRk/ii3EoU4XC7LnhvM0E4FL9qp95
 TbFPxDKCir6KbmLTIlycNl58nPQSyeSdnrij4iRU3QuNMoIST9Wbn5mew+FIH1TEGocC
 V8JeebVOrvBadlO7evIsi4Dbp1sz7GsoCaFH1/o9J46oATYEs1UFaC3lxEzdvErHUi/Y
 Pqn+MeJhANbpK8LrixPm+nf75fqX4Axm13YR2L7gdolJIfUbt80baHSBDpcZN0UBkGrl
 mJj82IjbMPllV7kDF72HDoZ2BgDC4YCCiRmgdPpX0w8BchAxasAT4m6HA2QK7hMVygDC
 gPgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVXQlpKq5hVjac/XuQycVYbEUyb32FSaicKuW3O/yjUzyAPw01RXGXay+rDm0c3R9EgVIpFQEPdk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVnTI01+hZ3xar6qIdeOYqrNQcJO/bZG6zfM86U6xfYJexkdIc
 GRmX8PK/RMepE3Sjd2KGo2P9Rp+w8JdHjwDHTp9z514G1bPscOoY25+WhqYJV7TzSJvdV26Q0in
 EeKz41S+jVDTXnaJ4W1lXhPA6bFeI59hn48bbyhO4Tpzujtzjl7AUsK8aoRc+oSagOailoAs=
X-Gm-Gg: ASbGncudIJwlsxQ2x6iLxupB1uA21gnTrYneRG4sJJeEcFegGfP/mrZI9wtVmjCmMxe
 60BAhVeFHYhXWH5jq9B6telUAhUNgp14l8/f6NPns4mIDdc4Ye1aD+2ELpTlCCF5VQAcoh0R9aP
 wa9EtRBdujZfrYqUQ4B5FiHqCT+giJ9c8wrbXlD0vgsbqBCuNTAzmf7/k2LlsL53UxR6C2jLh6d
 rGeNxwaWdqwnuwWfnRlBiX1qyKqsjFgUr0QeE1YnkIu4hpR9JIiP5QmzDPhQVt/Eom+08kTaIEe
 l/X/SXb6IRsFeQjYc+DaThROnNF//blENKDgMGjvZPTDoe/0m/q8DGXWxcQckZP7
X-Received: by 2002:a05:6a00:399c:b0:746:2ae9:fc42 with SMTP id
 d2e1a72fcca58-756e9fe7578mr26167300b3a.19.1753013871200; 
 Sun, 20 Jul 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+l4A7smw0c9HlD0mC00sBYcqAw4GpgryQHLdv3W8SOqKQPr2e1e00Rzpbvc6xSFgiHc+rnA==
X-Received: by 2002:a05:6a00:399c:b0:746:2ae9:fc42 with SMTP id
 d2e1a72fcca58-756e9fe7578mr26167270b3a.19.1753013870665; 
 Sun, 20 Jul 2025 05:17:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:50 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:16 +0530
Subject: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=4450;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OGBEtewb4kUxOHO/IHiUhci55B7Fyi2BTa9NjI4r3IE=;
 b=FCzsm/8Z4F/+PEosVnKUdSuiz5TzZLlRTwsfFqXlgVT0cWp3Rv1ethlB50wzGiSI9PhhBzY0i
 Tfg+BbradJTCttB92Yctv15WzNZ4ZHg+fBlggRBXpscyTOAXJqM5yg7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687cde70 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=yKEZsNg54XTt07RPwjwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: EUNWigVHt-SqrnbZBHk9Voxl2oF50Ozt
X-Proofpoint-ORIG-GUID: EUNWigVHt-SqrnbZBHk9Voxl2oF50Ozt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX1bijzyjvATlj
 qoxAiP2PT+JFHEpww21W2aSYa5rD/12+74ZeS6YgwSco0n5pSShXJZoo6gIunO9H/Mc7FZ8/iFY
 OtMfeMlDRnhwDULBZq3jrmXgFY19JBQVGxZEjhL4pGpFKu/gPOPRb27/zThRIJdiH2a8yj3Gju1
 7iPe489S00yUm7I8y/Ptuclgw6HhpSAR00QEH/T/ylDTWqhTNkZv8NhwxfqpVVXuvVVecSDmIRL
 DSowZFwbCQlOlHWebC72NmcSCGXfrYPqgcsJS9fhX1+S0zu1UUIOT2yf+R0ZqwH2mCx2Q1Ocssv
 VL7bib8MqjbfUgR8aj/M9lPFeiDURjOpSGzSOgACRwMVxEBVEV9aHg1s1/dPqkUB6eQ1yWCji+f
 o/YKhx6JFiVqnge+5GmkbkNb8LuCHcW0bvfxb2wChOwy7L0b1ZjKzlSzRDSmZdQGUeP5a7LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=657 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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
index ccdcf5fe4b4f3cd81d765754d00c132960a916a9..c17837013b613b53793db0e34bbc7e65f0eb06e7 100644
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
index b46fdd222913a46e01b984b90c4e63ae82f54e9f..54decb9908fe526ac7f150465034b03ba688aa6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1518,21 +1518,25 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
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
 
@@ -2394,6 +2398,13 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
index 341a72a674018258597aadefc9a45269b977e00e..cb846c1548ba4ea31a0ff0f23e98820388cb5ce0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1569,8 +1569,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
 		GFP_KERNEL);
-	bool stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
-			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
+	bool stalled;
 
 	if (!a6xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -1591,15 +1590,20 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
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

