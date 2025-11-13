Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E85C5A911
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5134010E96B;
	Thu, 13 Nov 2025 23:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImtBloQj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMb5ltZ/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AD910E969
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbJtk1486313
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=; b=ImtBloQjs3VbC6QK
 +PNa3ucCYR4LChcWkDL/0pay7FCkI0Fitv0oEgepxh7a/E3b6ekwOE+DGRXVibez
 X7soR84lC1lKKXaCC2LPLCF9klr0oQeh7LByi5aTu6q+Ism8XJZPw2J/w9lWfy6S
 dQsLilzzvYJ7gnyNxXYr6Y180sB04B6Psjr94kBYn1woDUMeaG+bqj8l3LJ8kGs6
 Aai/RoKT1uX97Gqtp4lvZVVW2tE3qAUjybkZz3hWqpP9cIhgNMcxdbY+LKtoliYT
 aI93A+BVCxjvtZMd46+GH/lXu9lnC4+DJO58L1Is55xfTOpguZfkgGeG75LJI0DO
 +gSemw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cg459-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b6ce1b57b9cso1348384a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076630; x=1763681430;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
 b=RMb5ltZ/sv7YCqST69xFaGOYTKZAF7HxcqJV1MIj/RFoxmvvQMw4aTythb5ZdzBCt1
 VUBJBF6JxB6WbFy3oENmcya7nA3mXA66sB3ANx+J0Q+OPNncIj2F0VgUA7WiPRjYTg1z
 ntcq3KVEHBriBiWdduTVyxSZuHRz0GSEAwB3QFbS1Gl0hGZER5nxZgWSkITmoxQ+QxZ3
 J/wOSLD4cN5R1J9Z9TJtYKRzXbLOQCIQ+1qJy15aiadut7pKpltfNUT+aVfXDnS1KFfy
 M7Daf/WY6AvUKJimE961ZwGZKaxC29TLfmBuHaePqMh+kzgpuY7s13+O2UBmECAcXhmw
 8BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076630; x=1763681430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
 b=aJB0+WxWRd4DuQmmRpGYKz8M3ICPDy41e/71WT9tGl3gqW7vlz4QJwxrWjolRxfkXW
 N/CPMd05AtOrdBkqPQ6ftTrip38Tb9qTYaEfhkp+UyWCMo/8KWoZFgtWRYYJb0I1h4bx
 Dup2PCpE0TFxpq24wVV/T3uXu+4tORsASfpTs1Z21vnvM+Qzv0kw+vEK7giY3ttBPeOI
 432cDbFQZrMRduM8t1RgqT1lPYyMD8GR6ins5BpMatNngvNZzf4HOKFoXliQTLKld/gP
 1bmlaQ0U8kqnlEpac86pBKzM2rlikrTjJpLsHYN4bgLnob3BpZY3mRyvKP7FchiOQyGh
 6GSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNlyMnC1DcFGRMjksB2xdyL1NfPEKnU2u55BspJaSdv53wikWcRG24kA+KbkuirLdFm9QD92F8ssw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHGeHe7ZuK3FoIP5FLFRFKcw2/KwWNY+b/hvRvBPISADSv0w8G
 zPxvF19ZtLGHymhvySzC42XZryyGvStf1akmEiror3iz0/8qn7U4OOdKz0lh05mVQWDbVAKf6o+
 jMIEN6H3Rd7VS3O4KhjwnqWPifhRow/r4NSxOYIr+0HJhhKGuEmP8wfiYFKlEZiQHOvsk+la5AG
 ZDnog=
X-Gm-Gg: ASbGncuQrAQsKdEhILY3DMNfU1ha3bx31/QPtTkLAoPflYl7T/fv4B4MhsxoHr/TOKJ
 qdiq+DWc4HPoMuq2KPngDr+5+dWpUO3+UfKqIA7NO+IYqNtexqb6jGO80aREWqNHdOGhgR/SLs4
 pOR0FdI4/ftDO/xwqD/f8g4pafAYKacjgJNFSWnkRRJ2xT53WBGHlIB0ThWr7AI2xZxiik09pyL
 +FxPXzccN1VB67S0sWr83Rhcw4tcDK58yeAAJC5uDS9XyByqvnRAOtVt2Nh+6Jgkp371DOMk8Td
 YSzf/QJJH6WoeqHnPtER+zFihO+uV+SRrsshtbu/kUeFJBO7BVqzhkobYiuiYdx90XnvsRvLY5R
 ZAD1ugNo/QmdW6i5RPI0qfdc=
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id
 adf61e73a8af0-35ba2c7f49fmr1558603637.51.1763076630338; 
 Thu, 13 Nov 2025 15:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF7D8yPEUPkp+NbY22BN0Y1kfgJd40q6G3P0giPrxIE2bqHGm6311EF07g9YkzAqUjbYGJXQ==
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id
 adf61e73a8af0-35ba2c7f49fmr1558536637.51.1763076629730; 
 Thu, 13 Nov 2025 15:30:29 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:30:29 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:03 +0530
Subject: [PATCH v3 06/20] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-6-92300c7ec8ff@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=3572;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IGpokplXYyShZVLotE0neZI18HJLZ3KUnvDyUGOCvso=;
 b=NVUVcDEzAp6sPGf+/YDVc97AOPQtMk6i7AKTEir8UVywiJ16mJrlqBXgy1BYJHHWn73Ng1nrJ
 TotY0EkaIRQAalvppoalIedeEivFRiO8/utpOvZ946ECcbG8esPdnuq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: OjQF-BryScEimy6LMyW9yhBpaTvhWE56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX2Y/WOeDSW//y
 KKG+K93lLk/xx+UxHNUMEhPFWGfEhpWsJ8zjr3hoDO08mYKwRenZE1QQgj7LweiOrdAAmyJxwLv
 /ujsUHdplwXzwHY6bfjKZ8kBFkuRqFCMGNb5ucma53LSDGMko3E08T5pjIawfQaN2dCwMbXfEKx
 SlIALaQg21YCPGfZtugXJwu+OLnGOxALZB5LEYVV8/NF2XosaYjybEa7re2cw3QapF+PWHShjN6
 8rBIfYe3Ln42dJ1iQ6vEony2fhIESSfUdn5DqlPyNuyhJUqEkIodhXQQVY2Wdh6VOP79jp7Q5QX
 A/2V9yRuLnVqdfQzRej6p2zzYTn6w73n48q3SSGo6/F2hJhSvw4pcjc40unZ86DeOZDgErh5mSb
 rHmRWSoJtfLK6wQj9U93K5ZRuKVtvg==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69166a17 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: OjQF-BryScEimy6LMyW9yhBpaTvhWE56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
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

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e9a0ee1262cc..9c6af226b076 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1580,7 +1580,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2291,7 +2291,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2659,6 +2659,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2689,6 +2690,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2721,4 +2723,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2c8b38eae7b6..19a1a1f699bc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,6 +77,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0

