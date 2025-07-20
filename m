Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733DB0B5EB
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CC010E450;
	Sun, 20 Jul 2025 12:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpSL+t0X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC510E379
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KACh7v017430
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=; b=kpSL+t0X+VTqmfqT
 c2f0IZ+qkOAgDrsZGF2kMOPsNS02qyarYBl8Om2IgKbrlukyqREtOzxwtG1kuNaI
 Y4UDj4OcL2N9UA6z5m9rjL1v5Ay6wpWc8AEUcVGg1O4GUzuQidhAx14aMR5+FbDn
 c0sDFBnF76FuJL2/VHY2lf/YMDJSTkcQy3o6UURWUHTpLTkk0UTfk5Rk0HovbtY4
 3r14Yy6zkk1Ec25pLmiSZjOWEoPi8lFhjf1y/CvrrXeOJwcvmN1GDCN73Lk4ztu2
 gCziGNMme/dvqeFmvrc42redOInDPL9nF+eWrNULzfzW1c1SkEONW7i7Jg8sRt1C
 1KSjfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ta5nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-75494e5417bso3299178b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013863; x=1753618663;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=;
 b=MG6mehkeGkJBCQ7huCpMwDmVDFsy55XyV29Au9qM3MHZtQbltSrVOR2dBH0m53+G1B
 cQF0X086+kaPQzWTHT5czb4XUOwZDyeDGEA3q1iRZSDAiRgMY4Jur2tF82b+7O4rPsnQ
 wx74cXhoQRd9xJ6XutM5kjAsf4Zr3zXTUYOnQTMEYOQ4uFOFRTpmj3mY7d1rnowtlBTD
 GD8FyltGOB/JJsRai9SwcOlWD1GI3Zkf9zwMoVow+QtFV5zO/1zuQLypn40wrWnMqk8Z
 J0L8+JvpO8Crh/BJLjwg1glYaSvqgXtxddNLIKX4puJfX0O7XFzV3yNnAlY3VeBMPyHc
 Gx9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV5vEPh5i7L8VnFiuvMgziB/wiZdDL92cvyUf/8VuRfLuf8yXAMEZaHzRCjv2uj8fD6J97Z7pIqqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6o9o7ILRChDvhPFLi3svkR+UGvzLG72vi1GoC1Wn0gNnSsmj0
 l2euz4PrsfLZZDQlAnsRgcUTXETc9bmukWELzQBET5w8vBFAQvOMLA3G7xnIyMMg5Zf7Z1nIjrN
 oA3TlruNHBA1MVWzzdS3p/w6hxF5Xiu/bTk1ve524KNi7My7kD+PEaFpBUh//ZzCoxN7Hn5U=
X-Gm-Gg: ASbGncsYw/3Bdvnyb9tblHolYW3+gRM78aVbbm++0q1+5xK5fmRE3kkDAf3n1nxFwue
 gao9y0XBoHEYroCoOekLnLK+/lq3VzsRzqEB0CLldY30Qi5zHA1H2hEif6I39wJrecAwEU/ZG4m
 uTdABLe8NzhG7s7apwL8xVHSAJ1a1rP6QOzOeDLKcPE3WNxH4ZhncbKKLWA4B5eGP1+Ksg4X3+E
 ZA3WwMW1rFUVZSNVbsvZX3YAm27L/fOtTWA2hmWH6rtNggJzaey55rO5eMW4bDzo9qaH7RaXdcM
 hxPTOn+RjEGsGT5bfyozXRMODm87ZdZczZPx//yLn/XepLxLiauVkx2HLIfb3cnM
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id
 d2e1a72fcca58-759678986ecmr12599038b3a.1.1753013862981; 
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmonQVHr4Bjv8W5fko1GeaHvzAIAD8dQNVPtEbw4P9/DZLSf2HcJy5PQKUDsuSf2r4OOuJdg==
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id
 d2e1a72fcca58-759678986ecmr12599015b3a.1.1753013862475; 
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:14 +0530
Subject: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1726;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UufTwoFz7ovGUA5R50wL9c78uLvl6377i+fkOk6Jefs=;
 b=CiVkKyycAjZFKjOMucGztI9T7mQEvFBYqWl/BB9hRnOWHJ1sN/2PxQHpgp6pXN3QaATDYWvrR
 h4znFJ38/PUBWDMBMqYvqyGNY0QXINe0yb2jEOge8498e2dGzdryR8t
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX9XNgqQUh/zfr
 pjD21W/vLKgCVR4n4ymKgu2LtvEr7dGH7QFjpnfbfSYRlUWY+8XvT0A5BFRGcy4SKzEPIH9OaDZ
 dT23cNjbQC/AQA6OLvKDgdnn11NVHyUrV6yAM2+SHERNf9St7RKJR74VfB37Jee7I52xPbt+NT3
 faALrSesgvwPpaPgdQczD0cqeR8QmaE6twCcJVj06QCefoVFMKKlSIRLEWWMBOV9fl5Q9jY8gzX
 DNf4ALAnpUYerW634l2mULPgQNcC9ygdkvXEyzuGa5OMM2lPRuNyT20ptu96jGJDVjnOnZMTZeo
 7SNFn9nxO3swbRnQWekDm3vfkXO4TMxDUUlgFS3GBKdx4tJvJUeopO2Xes+q0/YyRUudJVT8w1S
 mc5HHOJeVsef+XaJkXk6H9PiE+RM9SehjyhAUUYwsfj8C9G/UsZGpkl6bP9cLciYxEWKCpwp
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687cde68 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q_N0S3AoeJwl-lDGPIgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: n3B2hjYfXWbMn_UcB7_ah4EBYjTI5sP_
X-Proofpoint-ORIG-GUID: n3B2hjYfXWbMn_UcB7_ah4EBYjTI5sP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=687 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

From the hangcheck handler, KMD checks a few registers in GX
domain to see if the GPU made any progress. But it cannot access
those registers when IFPC is enabled. Since HW based hang detection
is pretty decent, lets rely on it instead of these registers when
IFPC is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
-	struct msm_cp_state cp_state = {
+	struct msm_cp_state cp_state;
+	bool progress;
+
+	/*
+	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
+	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
+	 * lie to the caller that there was progress.
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return true;
+
+	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
 	};
-	bool progress;
 
 	/*
 	 * Adjust the remaining data to account for what has already been

-- 
2.50.1

