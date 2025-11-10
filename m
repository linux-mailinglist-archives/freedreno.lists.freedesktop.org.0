Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8792C48065
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13FC10E483;
	Mon, 10 Nov 2025 16:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfloY2Uc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yal4idhK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A5D10E46E
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFhoqs3985681
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=; b=NfloY2UcabBEHbGh
 fl9Eps4ZBX7fNEkkBh8BEYS+32vOxrIK2m6yXUnyWDwM+rERBerTUbwIy0uBH/SL
 u/3DOWkDZeUjVkRKjme4f50ly78gXxUsNDnxiJV+ILo/qTdHLAmqpVtQ0P87xvIc
 ZFH9bvL+B39iKMvKb4P0QavNQ2z/VPkJSrxjl/EZq92g2HwjDzSWFkmwDpxDZSzo
 ZZLF+B6RrkPZLbAZgLbUssgeTb+j8BWwv3up7KXy/9GrwZPlU8z0twkUmiExaCpV
 8RjBZJYAZtzr3kDYlgmwAZDngc/mHntvaZ4GGSo5eIOo2vKfCzjvu/0JD2CBbaAw
 Cunn5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqg6tx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-341616a6fb7so4105517a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792778; x=1763397578;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
 b=Yal4idhKRnNkIuMbeLG8GjlQC7GX/0W51VT3jKu7GNXQgDXfHJmwAATfEO7QjQDvLZ
 j7hVxaO9eNPEJH7Xe+yJjM8MmwzP9Bn4eEkJdFLtSGDxFHthzQY3M4lkrEXlEQ+PjXkn
 S+wvhyvuDvxoQm3IvjEqyDLkdTpoylDEbmwz0C3GXOgpC4RGz6ncSFqUlFLKBVwtVLV2
 yZ/oqPLWqEnwnQNDVvMCgkYcRZxjQ+eVHZBvtyOLem47WyI/BJcqygCK0E1+SFjlJsCa
 0JSyqhyRINbNYh8AUOvYQR5N37f3CVcQSxRvS+KXeyQeEWiQMkiK3XPNXiyUAsklx5Vk
 PRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792778; x=1763397578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
 b=IRyLDo70PPsuMUNYWQjceGxxY9a0KLJ4rBoBJLt1xnfXtUrCFcpn4RQqYGYLQ4ORbM
 KzLltUGE4ErPkO0yavHITmFxEOYwRTkCG6kEcvlaj0c8pSf4ghk/l46UXh/OY8GNI7KH
 3SdiK954/z1omR24yLrksMfLA3nI3gEqdU61t3nz6nYMqu7kTzwUdfPvhw0w0QUwa1qi
 gTqZHPgVV++rEWV0TO7NrL3HFSeyaM5ywx+FfHf034pyK12sZfWs/j6WXxJAFN0CBM4B
 ou4jYNMYwjmsG/rM3/TeITRDkERaJJRdohHQFtWEtmQTkluRqDsorlNy/qjI8YELoUWS
 o/sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWevBWQ3RFeK+nr0MnxWkdDH+k/Vcd2KFfC20FOzNtUGsFXS+Gcfro98KARSh43wt8rVRj81FMqipE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkh/pk8WBYUgr/A/wxVu1QdO8VprfjhoBe+ojiJZq14Fy3EgoW
 yFvlm8VRKPslDB9qbN8Bo68cr3BAdh7ao+y9GTHt+XKDRJbErCGalYBHLS37znlU4f3jTdIBtZ3
 Fk+Gq8K9C4U0/BrDijTkTsg0a6gEc4yiY5PP2QdzoFPH8wKTDIjUaceH4WtXVW6sbkoXz71M=
X-Gm-Gg: ASbGncsvzjeSnZ2Uyuk1Btp2gRGLQRsPwRBnocvbbdb7jwLYlI1ajmDfEue2u6nViEs
 t3kQ3sxEPP8Ag/V4HjDStIKlL3Gm2eUkGlzqvcj7LhXcx5XwhBMJ47Ljg3tQhdnbOnwt3BG0m3w
 jmrZd1xZ28LPRZZTc8vdto5eovib1EP/JiJMxINUTXYcEDOIYi0C2meZCJtl/joLVkoMP0YM7z8
 rllASXx4HL2+9TAvQK5BNRECWsj967zfU7BQMNIojqp/pM4hwBTB/qrRRzWPHVKZp/rq5M5O/Dn
 DXLA5T3YHO1GC0DgpWJW60haUFvzr0J85OCJwRTdnTTHgQl5Vv2cud5WO+vkY4niycqpc/QwM5u
 VvIEPPMFKn4uWPQupUW5VzMQ=
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3436cbc74d5mr10535185a91.33.1762792778269; 
 Mon, 10 Nov 2025 08:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKuivtP5bPOxg4eqYPpqCiRonwpKyitk9efo7oMRmT6OqAejXcK+KdVc51LUlDkH4mfwy14w==
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3436cbc74d5mr10535152a91.33.1762792777713; 
 Mon, 10 Nov 2025 08:39:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:17 +0530
Subject: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LWOc612J9bhiyGK31kvlUfk/uc8PZDAIZt+/ViUR8y4=;
 b=Dyz4d2Rpgtz4n2FITe1odQAEtosB0h0Bg9zoRd3AwbZUYYMJMDaf74l7QdElyyEqfnmryp4KJ
 0My+qrkFhbTAtvi+hF5ODj3d82ls447n7pfXlXg7IJLPvV878p2Eal8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX6Vq0wcrk1Jig
 eQ/airIj2FEtySmp0lAxZOJIm9+NxAWzAT+UYxaOHSRvvkt+gt7OYoxEV79sm3AYQp2HGr7rPr+
 c4WiMxuJ2fggOsu9DRJI+I2wnLmGeOf8S/fKmEkTfdmB8+uZZh6pbv+2ybpeEIzoQUCj/j6hp2+
 0RWzjic5OWEkC6wFUVlAi/xTqj5i2MhwhVEz7HhCDtwzJt8E1Lnc6iBg+Jp2CQwlNDSP3BmSBjK
 JWHr/5FUAheERHvNIowlJjYrqXf1/ioW53Hm7pGwp9aw15b5dY/3+GGRHKYHZy6XsuSlROSuvMi
 Xp96K3EKTizoLYIrKQA2J/kwGGRVFa75/CbEOdEAO5PJ88trdRjqbDKj9N3EamWp1kDLYegoT60
 U0OVMZOaD2hX/DMmqLhW+HXmlSjCGA==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=6912154b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EsPIyQH0hXBI3kk1u0f1l3m7P4dkMhrH
X-Proofpoint-GUID: EsPIyQH0hXBI3kk1u0f1l3m7P4dkMhrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 112ef7ea320f..8597d7adf2f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1519,13 +1519,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1536,13 +1537,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1610,15 +1605,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0

