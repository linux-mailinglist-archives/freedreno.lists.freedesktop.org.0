Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654ACEB922
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0110E67D;
	Wed, 31 Dec 2025 08:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZOpK1N8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlhgXUKq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457110E67D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV3sdec715146
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=; b=mZOpK1N8IIZG/DZH
 5aIWijGvEQAoh0sIzVTObni8pcabvR8I+yVad3XASCI7C9px3dDJH/Jk4cdSQKxk
 Zq7UCuuUScUHDzPbW4qDQE/Uu8Wd1XzTs9gukr4k2egF3V2xofufdBFMa07lyUkR
 n+kdkbFMe7NDNRzq4VoidmszvMj49XiNxO5J0pSyMRFrrJsaPNVWBy4wYlS+97uY
 u2rFEaUZx/WTLVR80OeLRNEOQur1vbRe8Dl0kZ9f2pAk5DT8Al5E2nZeWnuk9plK
 K/jpVJeEkTB8795pTI3uHB37Nrf/1WDMObe0C2Vd36raCznq+8Fjdx8OfQZ4ot2c
 XO0CUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yt2q2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7f66686710fso24937508b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170754; x=1767775554;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=;
 b=jlhgXUKqZF/PZyjLvcUPZgon6vj3IpnwAJWGtFHS1Fzz+DoZV6uni12ftyr3JoWoTC
 qvPqaCX0zJuR7I/GIpkAu6FqMmIjweeul/sxFp/8dVhpbq7UmFEPRyOpyyH1NQG2P34I
 P1FWu89kuaev0EN6xDaushqNJsza53u9wqW7q8757wTlVgiSGGgSvb4jMd47dlii1laq
 0QURx3uRKX3Dkh46hq7724HfzjojvXLUrCa17s6dNVZbFw6ZfpoXcg2tHh5lU4bdp/By
 srHLUlm+9/UzNn0BLwdtBMXKJiTeGZvDukeaXIvZ4Y5gHv+0sXor/swduPE94qEEEHNu
 /0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170754; x=1767775554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=;
 b=jqVpNi2sfGuA1lJdwjYDPPQ+AjAhEF3AszaH/0yZOQWIjTMd478bzJK9GpDmR8ANWL
 0dDEZwS2NsicPjbEZFG6FLCajqesfMJgq+04nOi5XsbbTs0SVjkLfp2v/7CVcGKmaX/O
 syFid7ZOPAPOlkqi6lEh+vr2WP/tnVlngrMNyYCNWJa+pIay0HaaXjkClvDjONM5FXbo
 VPcMpHEIlgcpan2XoqlWZ44UhtaPrjWUDMfg5QUFHR0qHsD+wilog0AsAXnXtvnmpUBm
 GTHbtjhEvpjEJnv/j00z8TUfheB32kjTAA9tOch07UVNvVKmZXUgADI6ba9dg0E4VgOC
 fcyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOGE1ocvO2rGkr43Ucm9VMVmr8kzyrkxJMXrWZUYd+CxWUgW8c1lFzKU6pIeGIY+w1HzfpV/YpBlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD98oWDt4jHzyoF4IQhlyaVaf8g48jN3BjpVov5bt17JzHsQ5U
 SsxLhIyc+SplwvlZxLzgUcbh1VWMSnQFbFHfL/mOVWYa31w3w0RmcOMVC9cweZffF3JW6f8kKpC
 3/YUdlmWqeOofYaU0lCOXWgH024a5DcVvTXU6FruZHmF94TQYgxqmEBPghM6nfhEctsyRLuM=
X-Gm-Gg: AY/fxX77aWOUbFmkYKG8jPqSe6Ta1wbU3ZMzlk27ZXsyIeQfoeuTuloOKBSDkYU1Ht8
 5iKMJWofXx7V2KPep2KFCNHObUFvY/+Rviep5G6qZHwmPnI839e3L5MqTXxFAFy72SrOE7I4auN
 sSAzKXfl25AO9T1wjPS6WS4FEshNGmRgCfhwKZD04Nq38sVp9rv98udrJLID88kMYRg27NnlyHv
 Klz4GkYY67IFVPAYXayfuIDmflh+4fJHbO9pkjSesS2sFy/l+wbFfTps+Nt5SsonE4t84OEVHbl
 cmtL/FsRsCJURbgKkMAVigdGsxejI7PQBffowcNUdZVmrqv4MuYzqHAMUpxuHBLsIAeiE+ph5Z1
 tfb3ZkZ2DvuLVpejfrl+SvReINtxoSKQZkA==
X-Received: by 2002:a05:6a21:3381:b0:350:8f99:367c with SMTP id
 adf61e73a8af0-376aabfb4a5mr37381364637.58.1767170754146; 
 Wed, 31 Dec 2025 00:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAo6dVSAwao+S3Igkb8Qh1q5ljTKlW1Z+o57LI4podu7CjXok+fqoYJxLC0NUQooJgkDPFDw==
X-Received: by 2002:a05:6a21:3381:b0:350:8f99:367c with SMTP id
 adf61e73a8af0-376aabfb4a5mr37381335637.58.1767170753692; 
 Wed, 31 Dec 2025 00:45:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:45:53 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:22 +0530
Subject: [PATCH v6 1/8] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=2376;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OPiDnreeN1/VHEOQRtyu84fDdgcHq5MMvUjo9czgt40=;
 b=zhrU5zRuzb3+31hJUFJGdIbEHUzbwA2QKWKVFIos+tJc4cKdK/NOoZSXwyVuQHwdaIvRFjYR0
 Sb7hB6qvMz9C27ymv1rO0JgLa6J1NSAGeETZ1CiGcZLOz8motfBIk89
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXwS9leXdl7GHi
 wstAX3fhyT0kMbsI4YQ8PZA+Z0iTmlHg35T7trFnNTBUbgrnPG1q7YXKQ1NUFlswScez6KwJYBG
 KmtJ9P+vrh114fryhtmGTHP4CNIUGiSwWjCCAeNk5kbJR7zWZ5Ca8AM7v5NM+JTyGuVJgN2gM1P
 rU4afXtofC5rWu+n0OO3XAaL3qHDajupgAdHtEzR2pVj5TAu0LtJOTR5kpNpDcy7fiUTSmSb8y0
 uV2diHXS2nqatPxndKN+eMlsTMm6M0hdnv+xULMk9wzwNrCAuV69RRTTu3Yl+U+Q4CiTHQePjA2
 gtCzvvNMFivlAyKlVswqkZ4pJwm9inme0rwPNGvPbAK1D/0u3dWwd+f42V+4hKxxWvHNWkNm7eb
 N/nSbN7zvJIqfytxcXDyp48vidDTuEDvtPmwHShmEBQZo+cejQ2hdSkMlJhyGpRIIJgysS0zO23
 5vvXDeiuW7NV11c++Eg==
X-Proofpoint-ORIG-GUID: TRjMNgvnThkL34BhJiGaqds8fgpc91Pn
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6954e2c3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: TRjMNgvnThkL34BhJiGaqds8fgpc91Pn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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
index 5903cd891b49..9662201cd2e9 100644
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

