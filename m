Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB26CDEE30
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0516112CC9;
	Fri, 26 Dec 2025 18:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrhWk0X6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXi3IBiX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A4610FA23
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8blH1754990
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=TrhWk0X63nN76CEN
 Txvv3cI9xk9ZuhJ0knooXspmzvrg3QdMB8ELMDQarwbWw6wtpkls/RTX/BxzksAS
 gNlWfqHk3NYSRe6B04dRDPjeV0opoeo2tQvLlwvGNTo3I0xaAPnq0LD6D+hg5ftP
 Y6O1dEQt7S38Z3giC+YVtGa13gzHNVplZfy+ucX+/USeNw+qfAIoIYy+7wD99rwy
 9xXDqszCzFN7OfFmxFIUPFOoIlBp7DEP23BkNK91IFxYw2AXZ5iRs2dKtkBIbtZD
 +Xs9LuXmLVOSUMtWNrABY6C/P+/+hN61IfOljGerQPio+6LW18HEkFGRsUOzVyPT
 CwlEJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvh7n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c93f0849dso7445788a91.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773812; x=1767378612;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=BXi3IBiXQhnEIncxdWuyK5nwNtUAF2HH+O5l02TLKvOVwxbpE79XoF2490guoWZMk3
 cIZKroldmKtqhBv2nqszNsd/OOjBZbfjesiIIPAcR83FMoY6H/JLHMAi8wt7CTRcAyFS
 NAlvHScR0XK+vDX/r4XjPs+J2FjTJorD9ZQSWu9DDmk8Y6PPrITrCzbVSLjAH91QhUVa
 5xf91k0LvRG6IFICleRdS/QO5tLddlogUAewNpuwyyNGtAPLHBGgtR8Y1cvfRm7EboDk
 BoXynNgFqqkBtQfKYhkWcH1ZDsl2B0D1XkXlSE1esywV4wYtODjkORiyN0HaT5XkoKiq
 Fs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773812; x=1767378612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
 b=rOXqa/+PqpdoNsPLvd/sdI8Hn6sgeANdeQWwzFlBz+uhUEWxNNQa4LfWr0yEA6E4dF
 3SX84FFjzRXnB/qAOaPswKVfLbpjJngjxwLs/aLGU6AhflMpdO3DUrxrJCTwyJh8+RSV
 yswdfSCU5u9XrCOzokepwBE+yNgqtmiHuU0mZfExb7IJb+cB3Tx+95iW1P2O7NLbNDOQ
 W9qa+HqKfwO6Gy+jJF5JplcmCzSQ6rRAiu8aBmt8Ti4H23DT9WU3xlMGCE4Wd6LHjYAQ
 UMdWKEUpv0ZI4ACvdEcgE17UJSQE0Zs24U8JQ5+nV7Qm1QWG0DK1WNXGe9s9MufEmmK4
 vmHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVew2dil4BPIY5prb3PffUa99g+ueT6N75oU3nzBUyzPPCWZZCH+zCK3hk+A2/aMtZr/Xr0SzfDWKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdfhn7Vnk5Hm1h04LZtD/oLoNWDZS+DBnA7Msf8Vh2LRIlZFlQ
 WnICuafT3ugN3AFlpKFLOb4Iw/L8/Fgt0s1n5IN3aSTs82QglvDdS9ncvzzMLT4bpnmXsaMNh2r
 v7nbCbJjYUYQ+e6QYqE9BlgOHkpGePZGsEzfPiQbXN5nkwFyllvz7FAlvRqACmfdqeSYGtEM=
X-Gm-Gg: AY/fxX6KB1D4Nb1zqWzNF3z4rKeopwUIlSUQ1DYjeW4ZInSSecrW6lPLvelfDuucjeu
 TsMOc+hWkTen1lIKDXZCIqCXDDEK5TXOvLKnamU+oqEv3eDQji0sFo/JAXxJv+/GO5zG5AgmIA8
 Z3lo+Lnw0onCD+zdaOjIbp2q23Txx29FtGxvgAN+C9XCJs+9sbzd5fNFWk9I/lqbOJ2avW5+XT4
 Dg7oMUabP1b3/yTJ1whHUVCt7SGKDGdE44J6V1UOK0E40oqua6st+Adr/OHXqux/RKxhUzUkCnZ
 lA9PeQZVY3qAh8PQcqJaq4AjmsOqRxOlEUyR+qOalFnMVw1Inkg/6FTOG13x3ftGdpZxEKXvDaq
 K6POcGnMvRfZ9Q8MBSXiQ5ny+a2vnPw1UsQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id
 98e67ed59e1d1-34e71d6961amr23605185a91.3.1766773811515; 
 Fri, 26 Dec 2025 10:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaD8kQxfQc/TThojHQjO+Ie3t1EH+3EbOETAYXHcDtvrG4vSORZTdAIFwzqkAJiBzPmYXtvQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id
 98e67ed59e1d1-34e71d6961amr23605157a91.3.1766773811038; 
 Fri, 26 Dec 2025 10:30:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:10 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:34 +0530
Subject: [PATCH v5 1/8] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-1-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=hn1AsMrVUsX2Z0TG+8TcZQT5a5wVnvQcQ0r/EOOjUPBRYXz7V79M72oDjV+3lvMiMbYkymYrd
 myNzut/c1GYBK1YrqvxMk0w83pVixNbiV/sZjlIBSluq34y5Kl7BG8p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfXzQzeh/NTpCI6
 ID9XLJk0SzvaEMmVMeIBJE+OfHmDgG14teUK77lgc5PCt3MKhu+UkXTDVXsCKP7Tw9g/BKwI2PZ
 OHmH6GZwcsp9fJLuzrxLRWzbVM8gx38x1+xZ2HOm0xzVm/gUxCyE0AiZEc4+dTfVJnMZohcE1Kz
 elDJkpT2dRPMyU9ZgwFFa7VMj4jBdEVJLlm8WW9FxjxoWRun1FCWLjyyK68zxKF8t1m9SsOBQFj
 IayL6jaDV4CquUnwR6JcM7oDFm8HHZ97AnqvxJQ+I4k5lnY6g1UHfvMs2IWEFDW0M4ka2p3CI4J
 FiKP9KP5SiPosGs6zF/jAeos8nsSYWp1KppPeaXaauUxdR56r04pNgFjKz9Yu4UxqkGitQ05lyO
 fpzR3GJdjsmOYCKTibtQXUqzhTKnbhE9eybPIaYUWAQ8eSRqIxaJOGPoxDpR+YJSaD3b4dtZVjg
 4weYjLe7pYfOPtEp57Q==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694ed435 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bY6Nttp-4IWDE6phyI719nWeJePGbK5X
X-Proofpoint-GUID: bY6Nttp-4IWDE6phyI719nWeJePGbK5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173
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

