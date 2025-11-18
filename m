Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F088C68519
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7B110E458;
	Tue, 18 Nov 2025 08:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/+a2tYa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gK+0JRIy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C0510E458
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fSqU2272088
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=; b=f/+a2tYaAlPmGDBQ
 3dzwibIQY+tUEYHZoY+WC4YuaO+r2P+oNELQgHGt1v0Q7A5GOykbNg68VAsBGJIK
 3CtVihFmJiL9s3XTzHMwvn78cDeUlyNE7SvMuoD+PwNtpR/ZJ/WWT/nYPAosWuZA
 betmw56hEufcJYABmTntbL0RWFXxdryouVIfucvEUMDwmqAFwxuYBmZCFU0bAdde
 O/46oxGTPjXd3WjkZ9mVlFRqdiIxmqi1m+8bTKZcodqmJZkcZ2eB0ru9+fc5FiuR
 GMO+6w/Rqbp45CzCnEAh0l1iPWxOwZbgO4qVrlm5RHhDllxyy0HUN7ImE26a7eUF
 GT4c7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgcbn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29809acd049so90945645ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455994; x=1764060794;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=;
 b=gK+0JRIyqxCre4lycE+PJlwd7tqctxsVSiizcSCfhGRAvhqy5tb7tZkzAcdoz5Z0dT
 YZKY04LqjVeFt5albeIvfhTHTOKI/5CIzrH7t0VkiqPfpnyCG08HNtlJ9cRl4jPcVRQ0
 oCZqS4Fp5UDvJARt+wWcr5sQ+LtkfxwUfvNQAgjzwF9GUZ8Am2mudTX4yVewlgNNgsD4
 pmzLzn44nWBKcimcxhHtQsCeVP3oPRUk4VEihNyf8kDcXP8vO7l6ywFyEyqu7ADzwfa/
 Pz2aalWRSGmVTtOvRS3Ww3hu6yRkTYeeFg0pLYKiri3DuFtm36ygjrnpswB9fsuvWGmM
 vLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455994; x=1764060794;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TMp7HNJ/zmdg927vlU51I3Qx46lV/WtDLm/uWh7mI/8=;
 b=ag6qT6EN76/Bl6CjIWvN3DtwsO13IecJR+JhLz4AvmOFbOHc7V3qRtmgtrUYOPXyv/
 0L7rH89bm8FFaGrhFTbogzssSR0uxDjsMu7J+I9zSBYujeGr4QSumCFu3Ox4Hujyj8KA
 gBn3BjDopUSWBtmC9DC++p5X6+0jTdZGTvf9K6woj5WxReqyYKM2Mxcjd1v8BMZC8mCh
 0cqJ3InIej7Zhzn0ozWNOaE3ohohPrINw91qCwAMce5kwM0fM2The/8AuMdJvrN2DBkK
 ug4ff3XFQYOH3EQ4Qk9l5pQF9xLCqRpo3JYm2UdARNqdLtkXh0UQSfmODlCHkMZoVjeS
 HrEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPcYovvABn3f9mqGuESmHTUSz7E93iuewAxsXFmqZAKDr/QJroAcV/Hfb9zqstUzbLdG7hK3eGrj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0bh3gZ/PEYQ80JlwzdLzw/P+huXSA/u9P5zdfy4+XjvgE38j2
 GZrcx+jeLd4h1aqv3BG/jymNIEIMgPLyicNG4lWI8QAImcJCAV4tbnipRnktNekvB8tDbsj3E7W
 DJ7g5ZTT9swJKxcCu1nNTVIFFjSWONjrViHMusL5lYEEbsEMpKk+LwFUl4lLfdDyRQcxXrO0=
X-Gm-Gg: ASbGncteWioBMmmtVdeKJ0vg6LUVtc/mJBbtQvk4Oqq7S5F75l6s/MgjK477WfVy2Dg
 IGCiblYrm1JEU43LpyCjIKti6n0JMahSsdCAWwIoinHRO9mGFMulUidrzYLwTrLg7A83ZXklYkH
 NTD7E50uQsg6Y8DHTGhP+BfnglSJ/hV9kig/wVfDNbG8UjNVBTSTbPNyD+X3MaYQolqLkgigmQO
 C3yDEWBNWbLC5tNQKlXQTfISaY1a/vh7Kjit7irE/yRyLN2deTiXS41y0wwK7/3QDNPrU3sO/fA
 aabV24sLj9P9QxASCJ3F15WcRJnmgyQcuFVaLIYyXTt38U/GW/FbQznkGnRBfhBdkOf5SYV/i/M
 zROg3rs+4RKGeaihCytP9xhM=
X-Received: by 2002:a17:902:f641:b0:295:9383:543 with SMTP id
 d9443c01a7336-2986a6f263fmr177242615ad.27.1763455994443; 
 Tue, 18 Nov 2025 00:53:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUkzxk34yLBaUiwOncHo2aD71jLBaEEhzYr/v3YEhhdmJO40Uy+Hz/k4WFRUhKYfUH+Zvrzg==
X-Received: by 2002:a17:902:f641:b0:295:9383:543 with SMTP id
 d9443c01a7336-2986a6f263fmr177242265ad.27.1763455993887; 
 Tue, 18 Nov 2025 00:53:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:42 +0530
Subject: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3403;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2qp5AoAo/qQVsE3tG8Ep9+XuoxJnnHFPRYeeaqd6Nqw=;
 b=pITi3Rkt3UiF+9XwRl45qofQch1DIPinzsKbn6E7GtKqqlpYXha4M9LbQiAib7Jj/UqLM0eJ3
 1HVGec8z5ImAEZ3+mtrH8YeYQrN6lFRF39+iy8ewiQ1oUFPO2bhFvCr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXxr5M380knBOW
 JIRzx0x92husaDiw4nwcaYTW/dvIWdhGDTGnY4+U5glvIVjDmmcecDxyd0sLrVhrLBm8fBGk4UL
 ULfuDbXuCV8Wk1WPuDSvAWSAVAfyekFpliJtsCMtJUiS7Q+jWRp59q2xcVHkIMT5+gwI3qRcbgE
 koSwtDTc+IJJaN7Cb1IYj47ZpFJCt6wr70poXnL93ctxn6sw9RnG2f94lNGBMkEw/GAmZ6Ed/Eu
 ousMoZGQGrqx0eP7FCRLsdB8yMXyvMmfbnKqjAPxCrLT36uR3m17poM+Zzt6uWM7p9M8Se1S82s
 d422L5mxtTP3WtOevgoeRuGG+D7cuZp3bhnEb/+LcW6inDR2nf/Z5HEDDTiMXatKg4emUq5YLEh
 sBTgIUdCcUq/Vkxrm8c6Keb11wcklA==
X-Proofpoint-ORIG-GUID: PgTnMJcX7Fm9EeBzt6Jd3A94tO78QQx6
X-Proofpoint-GUID: PgTnMJcX7Fm9EeBzt6Jd3A94tO78QQx6
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c33fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qCSIj6eo76QuOecuVwMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 810b64b909f5..9a643bcccdcf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
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
@@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
+	if (a6xx_gpu->aqe_bo) {
+		msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
+		drm_gem_object_put(a6xx_gpu->aqe_bo);
+	}
+
 	if (a6xx_gpu->shadow_bo) {
 		msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
 		drm_gem_object_put(a6xx_gpu->shadow_bo);
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
index c9cd7546024a..e011e80ceb50 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c496b63ffd41..0aca222c46bc 100644
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

