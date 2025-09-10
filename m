Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6CB52298
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082E810E9E1;
	Wed, 10 Sep 2025 20:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRKQfVNs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9402710E9E1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgERN029764
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b5j0ANF9uGLsHOzn+Dz0rArXdn90tufLs08oVyQ3FJw=; b=nRKQfVNsE3VcO2Qd
 3Mnz11ZDL3KXX8MDrf7rtL9XD58FYDHKV11lPEf9QnhoSAzhrpsx/0N3KlYnHsqT
 +W1rdFCTsPLIOMxqjxASVRXaJquU+Hiv5uxn8+o4D5+IzwLLyxWdZYhdTYxzEcEP
 l7axTMGpqOTDHsfQVgcoDhRUCI56UFDMEB1hPnEbBeuX9r8WT/FlkaDVPIO+etyh
 CaIcxi9dlWwqy6PwNn6j7Se42XwLOms0hwXqjMlJSTYxLT2Mt8rDD+Yr/P4bbpgo
 +g2T7tEjFd4b3Ir0W1SZY/Qyb6g1xW7vrrhKXV3bwCWWBL5c0jNXkWVXYVkv44DF
 ZQrlgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapngsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32dd3e922fdso238873a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537082; x=1758141882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5j0ANF9uGLsHOzn+Dz0rArXdn90tufLs08oVyQ3FJw=;
 b=ashZ5kmWSziCF1lP2zN4MrN/BSK+9wEUmz31uJn0ceGgYfz3KnHZ5y4VmePI0UcZpv
 H52GUxpG3UQUEpiNv9rUynh/X3z1dwh8C4eJKLnSZ3vVWHTys1o3ZX3O+pHgRDlsPVQH
 2aJBzXhZuHXrzK+5Kit/cYRiCa4L4yiUKCKJ1iE8+UvthH0WAKhABukC34xR7tgDFz6Q
 BJEbgetEYMwM2QbBgZqpYchleAJ0bPq0xTIrFMHE17zGEsdkEcV0VRtkJdPFe+3YUMax
 6BGyRpBd3uFrEH7Dxa1ySIXFU6ICFRO4W/ezXrAMtIusAQmzzW2iFRuYMVebh42y8HDS
 QlpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHfdGh8nr7NcBVVxfzlBgETILi8m4ZEgkCaL+uwMfN4XYdckJ0BIT0RPYMXEfErSJ0TuLFkJf8AYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGcjC+GVOWImy/k4/N4wXF2usFIffa+SvqByGpHfSJuJvI4jCh
 hUc+F+ZUFBOUmzu0U/MWuCicBXfWKWcDGfbo5npGZV57LckCzkgw2p/24lQLztSn8JRES54r6C2
 /5IyyyjeAAGc2qnP86bHFKmMu3rirf7pA7uKZ+EA+I6QLPzoyujC0NLtA8H0AbL8zFIi2ZLE=
X-Gm-Gg: ASbGncsuUlpnWVjbT6MlnA8GOGnniW9IT4sHcYqCPn+f7rzDYOMJNg5TFk+0/dBoV7S
 lKeELDaZ/QA3e6qCGpjpbOqSkBZCeIylXDnfC4e6ju6X0dbFoSrwJ903tX1aI+pOPGO9lheBVX8
 pr0zv14XB3PULxdiSuouB6Z7zBwB0S6HuUqGCEtISPmzd1gbF4jIutghcOnzTxlGPCGWj0Ttq/P
 hxupKGLxCCEbdedtDXG020tj9pin4WpD6K6mohJVrptL4O4BobqGcNWhYFusHh64KkhZ17VPjxo
 UZlePb2mrBh3xTC0CRdWT/VZ2qV6gHPh2eanKxqKG06WD7QdckgLLMrSAWE+tcTQ
X-Received: by 2002:a17:90b:2788:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-32d440df06fmr23284164a91.37.1757537082398; 
 Wed, 10 Sep 2025 13:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrr/ras/Xa2STSpUl7+3f4rSITLnWKAYz06qyu08j95UISULF1Zn/GfVdsvegQxaSC1gr7FQ==
X-Received: by 2002:a17:90b:2788:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-32d440df06fmr23284122a91.37.1757537081972; 
 Wed, 10 Sep 2025 13:44:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:06 +0530
Subject: [PATCH v2 3/4] drm/msm/adreno: Add a modparam to skip GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-3-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1809;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ptvCQ44pDwO+JsrlkCUxCIV4rlpZnxasfp9TCljvBM0=;
 b=p663AlNIchQH8zO+l/OyM2INEDZQkWgx4XF4P+iNm7GhxMKHLnpQ/hNRhJJy3/OfjlqGk5qXS
 8h0nxAwt9qOAMSb93F2TMTo0diyYp4LMOMFaNcj6yaONVPmM7ECIguw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c1e33b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5u7-6dn6khLgd3CzhdsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: dOyRrgiVMVEy41J9uy5sWnCN5JN5oL5e
X-Proofpoint-ORIG-GUID: dOyRrgiVMVEy41J9uy5sWnCN5JN5oL5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0/dscuCndENm
 4C0WMkcLX79D68Gx0p0YBmDRNdSx3WgSyY02Kj2BEF1eG36IFEawaedDJtFWYuqdRpIv6WLlJB/
 oBDuaEdzTabzwCjDgPZoZ3cc5SKfaUODKc6j/1hEqWKADH9p3HCjTnHyirVvM5opRr8C4EZ1/1d
 nkFetfvpkVdYYllKqfRMTW4/y2O11gI52C2HgiLsMtiGxvS2nxBjurq/gfjOkH7fwxRCZPy8VLl
 8cjrrHrhjxBOAzP3cbNyeS2ii02YS+UNA1qZp/v/GKu9Bu2X2Aa/qdo0UBH1cI1nkTA3aH596zT
 8ZSXoRiIIQu1S668gMBaITL5OoWe17mo0JGI8anEMV6941Ov9/JSD9deCfRJrUfDIRjHGcM1tyK
 dVcmfj5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

During bringup of a new GPU support, it is convenient to have knob to
quickly disable GPU, but keep the display support. This helps to
fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
modparam to support this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 50945bfe9b4992118f23db3cd17ac348be9f9c9d..28f744f3caf7c59412aab06f912cd09a01e185ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ bool disable_acd;
 MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
+static bool skip_gpu;
+MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+module_param(skip_gpu, bool, 0400);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
@@ -184,6 +188,9 @@ bool adreno_has_gpu(struct device_node *node)
 	uint32_t chip_id;
 	int ret;
 
+	if (skip_gpu)
+		return false;
+
 	ret = find_chipid(node, &chip_id);
 	if (ret)
 		return false;
@@ -404,10 +411,16 @@ static struct platform_driver adreno_driver = {
 
 void __init adreno_register(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_register(&adreno_driver);
 }
 
 void __exit adreno_unregister(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_unregister(&adreno_driver);
 }

-- 
2.50.1

