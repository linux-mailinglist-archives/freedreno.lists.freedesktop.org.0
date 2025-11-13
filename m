Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F599C5A96B
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F36A10E978;
	Thu, 13 Nov 2025 23:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw1OiDK8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3EgLFB4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1310E970
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb8J31695158
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=; b=Mw1OiDK8Pb6bZsSH
 U48pTdy7ZWEep5GJH9OoWz9Hpxw2o+SrVtEoP8ZRtlXT29kz96EScAXt9JJiJI5F
 JVdLi5ep4JNn95nwAchEfJV7F0+Ep2XmrKSqdNNpWdj8vys2fqAQe9EelG+YuFeI
 VYY6U02sQkmLbQzM4165psOQDZFwotTZhm2wiWEddV6XbWAy1kqVoWlbPdtJm6n5
 CZrgEbCC3QlKd8+T3YrCr5npm9pXgCuKZ73KsYoegpRq4LD/+JYzVIUGVKaF1p7c
 twUP2t5ls0dTnHTJFpCh6SQeal6vQOOdWGdeiuO5+LPqqKooGN6dFiVGXhOzU9Dk
 G+JSRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g04d3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297f587dc2eso17575905ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076691; x=1763681491;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=;
 b=f3EgLFB4LcVkzoK4Q0jnOb0N+eLKg3awTYu1CWdN1IFQV+97QQdWgjFGcr3zucn5xn
 OtZwA27PC0eOF5d/0BAcnri+ADW+6OI27NjP8e5lYxP/PsVeEaxkvAJFUFHSFvqpAyqd
 fbXKrWLUdohamVZTABH+6JYHa3YjD2JyK1yrGbuHPfQkZbyutnJdHV4mK9oK74VE417K
 f+xW5TVyOFK/nG7PJ+Q3o9HQloWgPEwLeGjOW55rnniKD7x27zkgrAuTRI7rCztOh86i
 CJqc2S4wCLtGyvS5u3WObeGOanR7YVS00EFfNOaXIJM7sBigNZ5w1sbb5YinhiUyXUbE
 XthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076691; x=1763681491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=;
 b=hjrGwMSnGHL/nv8AoNjB+jRstskhaBUy+e7rzMdXkdzct3Q10mD9K1Z+p4+iFN5qYc
 QhW4IeXhpSc1mazOVC942NsqhKhJbSzX5uDAr91K8bupWg9iofU+WQ8s8ybHEPc1Cl+C
 alhrT16bZH7pOVCCSfDDo688xAjJA1NX8q9MPmbnxlpoVngoE1YAI7r+9X3Q3PvrKNCr
 R0TiooWAXetwvZ0WjIWlKRmgSe8+LpyIusT9AYQojsHvLrPbAJ7Hn7h+9ryyy3NiUiC7
 PojJCc4hqC1a8sljQZz7UCf8/VCnUmG+UDzTdJ1B8cMOJ8njtPb/4yaVemWeqpnf8BmC
 WNtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX9fAHtpYYjKyUAicaoRKZlvAbCecM2mfA7CzRQwPvpAJeSYz75wH7rGgTdWXKt7TmQY0HTVJkylk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHZ+wv0MamXANbpG1a2cLRyYGkGt7hmEXWotxgaM8tV//ejq/y
 pQ1HCY0Cpb7S0A2V0oqhtoJD4lwSk03Ra60JPzUYVfLm+1500CpN9Q3+BY5MHOceVWXd++9+1zL
 OVualG8aeZJ7t56ancBRlShTxdFtPd2QN25sY+Gx3uf6CvL/dnSCpqmayhvCGj97UWk8hDNU=
X-Gm-Gg: ASbGncuaCzbmKDSyyu6aiHK96n/5kP+DT99WZNj7MTxhpx2qx2pL4l5t85Q7N79PuIE
 fe/yx6VenttjMpmX2LZcOFFbbz/KfLrt7e5Ws8W+inbgJoPnBbDJjD+egXtrK0uL8fvTKQxvzv+
 cenLlV0JYaL+Q/Tisjyub8hr0w1RWu4GX++StpO+4pzGYl15wpI/ohS/jhUm3HQ18ejzS76JX8h
 nZjTxfP7i9pD9oygrMTdI/Ras/bGPD3q+U61AzPkvRh6npHvSJtFtsOe/S59/cpXvpCNrpAL2Nj
 7d39RKkPTtW70PpqFBeTl+pMtGewQkCDOYgQytSY+5TB4y17NdSmBi+T3os8e/kYwMwjY9olWVw
 By5RXSCROv1oWUioipA+43gI=
X-Received: by 2002:a17:903:196b:b0:267:f7bc:673c with SMTP id
 d9443c01a7336-2986a752a74mr7180405ad.44.1763076691210; 
 Thu, 13 Nov 2025 15:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv4VMp31p4xpUkl+cBSArUnMXmzuRTp0dA9/uwzoA+kOnP7j0EiVv6LoBQ7lgxDaAp9pqADQ==
X-Received: by 2002:a17:903:196b:b0:267:f7bc:673c with SMTP id
 d9443c01a7336-2986a752a74mr7179955ad.44.1763076690622; 
 Thu, 13 Nov 2025 15:31:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:30 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:11 +0530
Subject: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=3021;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vDNLN4cN0PzKe93m1lQLnQLp8oN4RHAbHPt0ChRj+xE=;
 b=oJOTsEuxiDw0mQjFV7awI5cZuJCQsXd3sW7WigV/GBEJYyROma0U3lQegB886iKXDxyIF1K3o
 IWStbmFNJp/AvJ5rOnPtVqvIVQxAAU8dt6hkQjz5F8562Nh4A9cfeCw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: DkaMTgdWUJCr0tMlxZ5P9FXUHnrk2zGK
X-Proofpoint-ORIG-GUID: DkaMTgdWUJCr0tMlxZ5P9FXUHnrk2zGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX7NmOfgdonlph
 AA+Isjd2ONfCpMSGMBCMIcl3+aQc4m6ylrHnwe+k2BuXCOhD/sA1xeMIocO7wJ/k5GzXr0t9g8c
 KzUFzDf+NQ/TfFXHOB1j7rwoThk4CTd8MzT+D+WV0WS65IhAXHqa4ouhX1az9aYv1j9xRQVCdfX
 tAyT2fLYxRs3ljCV6XQsh00ONdUt19dFPj4rnhLuVj06jEROZwhvhYygeEP8npTFV5s44aR00EH
 sD2K+MnKc+2qTBfbtrWx/bY+w0Pudc9KtAN6MYb9sk311gteOwAnsd93qpIxAOq1qCIYlsswOnO
 8tbFDfTOAIcfWVQLsLnaaK6cBopMk3bjXmtdoCeaTBZwZrsfxAPvhosjd8KHEpqNuBxcQkQ+iip
 aA9UCt9ARyK/+UzpKi4vOnuowOnR0w==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=69166a54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rHWH_X82z2bqsOHW_PQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
in Raytracing related workloads. Add support for loading the AQE firmware
and initialize the necessary registers.

Since AQE engine has dependency on preemption context records, expose
Raytracing support to userspace only when preemption is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 20dbdad6e2e8..ef79f4cfb80b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		}
 	}
 
+	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
+		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
+			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
+
+		if (IS_ERR(a6xx_gpu->aqe_bo)) {
+			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
+
+			a6xx_gpu->aqe_bo = NULL;
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Could not allocate AQE ucode: %d\n", ret);
+
+			return ret;
+		}
+
+		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
+	}
+
 	/*
 	 * Expanded APRIV and targets that support WHERE_AM_I both need a
 	 * privileged buffer to store the RPTR shadow
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6218b0b9732..3a054fcdeb4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -59,6 +59,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index cf11135f46d3..78b38b52da91 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -631,6 +631,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 155d58751ba3..edf1f6624c31 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -27,6 +27,7 @@ enum {
 	ADRENO_FW_PFP = 1,
 	ADRENO_FW_GMU = 1, /* a6xx */
 	ADRENO_FW_GPMU = 2,
+	ADRENO_FW_AQE = 3,
 	ADRENO_FW_MAX,
 };
 

-- 
2.51.0

