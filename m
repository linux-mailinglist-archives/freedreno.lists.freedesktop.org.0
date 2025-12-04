Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F6CA3C7D
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4F10E974;
	Thu,  4 Dec 2025 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0ytpIOR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+oL2mGm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6110E974
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AEqGs1042884
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=M0ytpIORLGdqjApB
 20VGEyKtaZ2OGYVEM/+D4Zuen664toCWCwharvhNSJo29UPUE6o0Zzo4r/1KFpIQ
 zTJPoGdY47+zDrcbptYbyazar4h3CaSZDn4TvEcsrefq5PUYaubQS0a1H0RGvxmd
 hWDOmO/3QaMCt2C/mLuEI7sSrpDQzOGGSZ3wiXIYbkloIywZsggcxCgdDQEPRLgH
 uorb4jWgx+Dyjh0y6Uk+AqN3oj5E1uqVM+f3Ds6I6DYCwi1ozVHdcal5iG/YOsG7
 miQRQnnvW3Dm/YYNQdzJgXC03F1TIkdgXjSUCxTKyNoroJar+pM6UrjJQ2GW9KHM
 8G9Asg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp0v5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-343daf0f488so1048362a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854545; x=1765459345;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=J+oL2mGm70F8Q4nbvWbIufNP8Q+payylBLWb4GVG2hj8veyw2379j8G8QSh6R3lW/e
 xHSdPTgXD0ZdvIZx5RMAoEG8dCjLQh3MG7JKUfUW1xKU5dWaCthr5B2Ge0Rqs5BNaKg2
 1ETbcEGWdQsriQjX8rbbUTxK35gGi2weXApF47SzohlPA/9OM2RgSW05v3WCC+RXTlh4
 1qM2n78YV08GswlpTHpA2BEqh+LYoOKl4jkPBcqHBn+QPqC73ocHxueKVL+6yoV0XVZt
 pdcroYoC8oKiMbFPjpoBCJh4zO4EyJmjoB27qJhZ2bPP7KQsRAhssZ6oZ75LeO5oxbOz
 ldWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854545; x=1765459345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=tQ2CdGjkI3DbYmTPvCASTKhaXf4KZ5PpHw7Gk6YaXPgMHZvTZrwhZn6MXNzqWLz1Vd
 TtA/2lQxN1K3xevyuhHH117zf1Etv1vyuH+bFYEbkQUFuYoGkOHY3sq0Xgk8NyX0U93k
 YtpwQT3+sgUPvEq9YWNVJzX7FgLnC2h7UFrj6UfKUYCx5xPh88Dw9v7MRtXnt4YJiBZt
 BeFqopSIvGAyVYlD1WEcGl4gb65wHLruYBCCebFIDyQPp4x7manKd/kJds8PWXauV946
 qkTaEzjB4HYM4DMhnF3R4cFkyQZ1C4aBbM0WcF6wNNv6HhJWaSGv92QeJ9G7WeOYdixt
 5FXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt+Pq6UaJkQUY77wuYemzTgA51RV/SwLR7MfjJKZKsEIkKDbMJH0zVLVWgH+B4JuJvI5oQG+bxqx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/VwCjhdPZ7PYRa02vIkwMDtxdXobwxVEjuyaLhvBRNyXtyxKk
 xOcLnIpPvbSp81prxFaEplrZjmAuSkD0YSNm8lZInSCj94L3NSlG02W5yT9EdNNfpXQZCLcfy1O
 8d0P68AFDlrdrY6gjtOqhva6ffgQPYAhP6EMl+DzUnHn0ejI4ID24Ns6icWA7MhpvUvLwMQM=
X-Gm-Gg: ASbGncuPevKjPLZRGRVfczKnhw+TdzRPsKZxjQx+IM1m8fM8xzTYK25k87cgfdn3PXS
 B60khH4Lcyyb3kVDKcGK4vZv9c425QvnH8QGHhao1bsx5MeADF+kkUfTcZqmveQUrBOomItXdiQ
 SVVfuHO3zIED3kGMWbExGJFGFwR4lYi/7nHyxtiW5CwLXFLHOq1z3L+HmJmyDmOAFGaZI2vl9Y6
 fDGKF6SmNb1tTYvUXhGicvdB3WF1kMDN6uYCoBht6A7GkWWyEW0Cjx5Qn5X5e1tUXoLfnH+e2/t
 hiYQv5z6dEL7ehuI8eb4jWPaM3k2KtIr2uDlFICDqBEwfA8nS5EihEZcF/JFnvKQEvVBxDi+pJ6
 f3Xe4LWccG8Xo0cCEcGLWJndvv2R159l6Kw==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id
 98e67ed59e1d1-34947f3218emr2946410a91.37.1764854544853; 
 Thu, 04 Dec 2025 05:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJkp4s2aAYrupArV4VNXtGG2J6wvDwKoGHL7+mVcBFJ0xuwwN+MGHm+I7zlL5Cu2y9LwcSA==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id
 98e67ed59e1d1-34947f3218emr2946369a91.37.1764854544271; 
 Thu, 04 Dec 2025 05:22:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:53 +0530
Subject: [PATCH v4 1/8] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-1-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=aOVaHYAaQPP+UfzJ43LHuSjw7Mkpd7AcC5kYLwX74IeC2r7laNLPg/Bp+fujGk62zrgZS+t47
 cUzYWV7EX8SDXQEHFBSNAfvqE8B3fK1oKMg23IRPMTNrVrjRtjdG5MD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=69318b13 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 10jyp06GuZPaXexJObVogMwyvlOismnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX4lcf2ZmURfdX
 XohVV5XgS7LUqwpIV4Fxfn2A3H5fgNfti90QvKYvRqWY40nz6fUk8E6ci5TJaQBLYvUEOCAWzwi
 kIBI69OFCyxZ+3JQMLQ+vVP2Ij4MmTcLR8dDmkIsRbHeAAZcca4RFg1/YaarxKtrOb29JvM+a8E
 SMAMrXz0aJ8x7xG+wphF1YdDu3JZG/8hy6UAjZUVBwZ33GEQHxrTR6Xyg4cYHEwejDaqqXzXN8z
 50AzDTKhrj4Lmzwr7/RiATvJ3RgNRGcvPqXDd/ZL095DyWhzBG2tyXETPQ4tNDGIb3IR8OZtId2
 V8vCYLX9IQ6HxNZdigQrRr8drn1nv6Vsi2wT31aIrVCMGK/3c9Xk1AXLYCkpDn2EuUrIqNGn0t5
 Rb5Lb/nmy9G/J1Iq2HTARFvv0B241w==
X-Proofpoint-ORIG-GUID: 10jyp06GuZPaXexJObVogMwyvlOismnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

Some GPUs like A612 doesn't use a named register range resource. This
is because the reg-name property is discouraged when there is just a
single resource.

To address this, retrieve the 'gmu' register range by its index. It is
always guaranteed to be at index 0.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5903cd891b495f20e521562358068c7eea6ae603..9662201cd2e9d075425ac98bfa7c60989d00337d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name, resource_size_t *start)
+static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
 {
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *ret;
-	struct resource *res = platform_get_resource_byname(pdev,
-			IORESOURCE_MEM, name);
 
 	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to find the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to map the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -2085,7 +2083,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->nr_clocks = ret;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_mmio;
@@ -2244,7 +2242,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;

-- 
2.51.0

