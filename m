Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD3C7BCA2
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 22:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878010E90D;
	Fri, 21 Nov 2025 21:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgNkieJw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFM7Jr8F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28010E90C
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALIGPKO4024007
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J3pQTphbOvyGTpQsOyljwX9N4/Iy4OW8O/bre8HGT8A=; b=AgNkieJw44xDeiot
 JInOdISAm/b5WEjQQKhr+GOa57eTmKyKMaNlgytJjIAfF9Et9UxqDv0mFaAJK3qj
 yr7OJRX4ta/33BBZLCZievmNILlnzU2H5lwm8hKCG+dEuY0fMesJDCJmIzMj4oYj
 3eX9RK4O/1GqYXlIff/BBwmvX0JlNf56jDj7Hxi/ul2LfTPmgGvs0gM5SYMaov/V
 9d8H6XNlfNn1hPfKboKnTeGJ0i/5Y1sUlmnrS1vTkpHslRLfTxRkhR2W9OL8MgDW
 QWgADAr+tmkSgQHcGCyxaPydoNnxIOk5GpVFkSwTa3JO4SsmzYxksymyZj1lBWpi
 VzbmuA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a0gx1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:52:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7aa148105a2so2454080b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761973; x=1764366773;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J3pQTphbOvyGTpQsOyljwX9N4/Iy4OW8O/bre8HGT8A=;
 b=DFM7Jr8FbtVAd2XOoWxGC167iiRO6NJuflMvGIeKzAS0xTd/R5wTLxrYA7eAisrtSt
 qaWSUgZwFCiLl/KqMuL7p6LQ45ZTA/sxNJL3PjAyr2YeLjTJazm/GVly+620GgJjDXzu
 CKtMY+U7CZ4m3/S0NvNm6unmD2T7AjuBtTlk1jGLfIZkZI/Q8DQTY7zsjDFWHu7kgPhW
 7qy3ef0Rg5NFNvvfSjcCUO3+reFM5AujAVJjDKgl81liIpuJQGp9+bC35KslWcLFpOpM
 qrrYHpEDdksuY8SnVd39O708ruTdEHzRrlJcO1/OjmgOxAcyFwNYdyR92JpXQKytz1i5
 S/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761973; x=1764366773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J3pQTphbOvyGTpQsOyljwX9N4/Iy4OW8O/bre8HGT8A=;
 b=ikAYRJF2loYReu96qv1krD3yQhQtaPP0WzX2bvrEKWsyz3U3teVWoWudaYVv6VL8Y2
 MBdDUuf5s4mSiKx0zlladRN8kMrBLRTcno0jiJsUpK2zCuNSR/61dG31dAnd3N3Wa5Up
 uJHNH2RE+CyweXjOGHK29gv9cKW9/NjZNB5YYdRFUVvUfD2gMxEXlrCv9hzhpUxfd161
 KbYm6zgFo32lRo7tiof1XBbU2vs9SiOIFp8x+8UGSpVOxCMY/So1KPR4ULvIXNC9fYYA
 /SP4Q58swkPhqetY2hd3rmkaS047zGBxtZaMwZZon1zFts3jOdkXJ+z2J3AENyRbpHBl
 vk4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4x8nSoN21qwVeJRVXfZxaJlvEHmJuPkcdh0x2T+ub5e571x9/KgZ+oxL4B4Q54YImMWWZncsYxi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydHxvV+N69RzmpaO+0MKaOQdCmW3zO8j5S+G8SGkvFWm7A2Mih
 YTm27QmUHQ9TBaeX0NggGQQS6hILmdB89OJ90BpPI8Ug7OwNW4nonmQZKl1+YEFxK2NkmSof8A9
 V+e87pv8XUEY54cO6jB89++d/DeTSLt5lMtqI0hhyVwIpkzbuoGKBfhIUqBE+HEJj3jRb7ZY=
X-Gm-Gg: ASbGncvuvWwEKTXoo76l29obGT+UStcrih7Coo1FEtkp6Ws2GXvgdzsZ1/UhO9v8wEi
 hvcD9GwxJLqVrAzAXeNDIjt788P6Ok9c8ArCfCoP7MrZL0P4QAYILRxfr8qYIoHZjJyd3fOkoHJ
 pa/VzrsxauUkhEAmTkdFv8AwDmeuKEc9Rx3BGIkqOJFmkvE7hU48mr0TdYNpChQu5SOaOMjGfNP
 AhiRCP0m74RGPqv1eoEh0k1CNqr7WdkkioEQdON4sqbTBzL83wFsOkGS6Ulh+rzytnSh2cKOUff
 uLueOXC8adEIipg3Nu3/Hq+uk5LoikgBaI3ABnlaA/FQ0A8x3+6r6bNSRbmEVZfh3+Kt+aLxFrm
 7Kdjn1os9xsV+febJwcV6gGWewdvEKYwpqA==
X-Received: by 2002:a05:6a20:e211:b0:35d:f625:7e87 with SMTP id
 adf61e73a8af0-3614ecdb5afmr3815766637.22.1763761972911; 
 Fri, 21 Nov 2025 13:52:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/+4U46zyhkKPZl+BSd38HPBsjLVYVmZFu9he3w9Ox/ZVMAXvsyNg91fpwfW7FBFyKK3q4eQ==
X-Received: by 2002:a05:6a20:e211:b0:35d:f625:7e87 with SMTP id
 adf61e73a8af0-3614ecdb5afmr3815744637.22.1763761972393; 
 Fri, 21 Nov 2025 13:52:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:52:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:15 +0530
Subject: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=2309;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uT9XzuQneNvS7bfuO5zLIF5cGFXOPlOtjREqASBfuRw=;
 b=qWs60XA9e7ZlQQs1ab6q+brocDt66kNUi6SCn2P94+vVBXiDRV9f23ZBIk/Cgz/CDgXjuzawJ
 jd3YYyvY02lBkSwNWXuHNmY0afeU1hut9ggpYxHQDnpkTtrEU/lMQsi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfXz4D0EW2JgkwX
 +rqelNC13e45uq0ehIHSM2RTtkjJ68+yVB3nRHErzKPeaOy7l3Xq/rVHBG8Qxw6D891RAen1aw/
 5NBZHqW51S9i+NsckNggxDqlTAvA0tv0U3e7bgDVNgMASJQAoKEWoVpGcX7Y7DVOFFuBP3INkR8
 hVqaOo7pmSBgZ2+oKvpxpPm2W1omLhQbZRm49+d4uW0viS6q1bJMscW87/av9cw+wM3gREVgvdU
 V45V+D7I0flKb+M+ZE16wq0EwPeBlecgDqCDAmhUdQymGDtmeo8MxhYNxYrgjFEBvIm7l/FzdwW
 Ou64jCJ2qoqh9QVQFmGEIxuigbAwim/9jqG/mZT3RBwEJoqqn+N474tctRbrKVcCJpePhw3pyDL
 hR4tdAtZCRHD3PT4Z0UVMF5jr8ULHQ==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920df36 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: V3fYZDtRjZRdBcIc60Ox1DJfEDuIz1gF
X-Proofpoint-ORIG-GUID: V3fYZDtRjZRdBcIc60Ox1DJfEDuIz1gF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210167
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

