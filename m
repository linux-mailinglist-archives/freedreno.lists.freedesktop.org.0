Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09BABAF84
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0592110E2B4;
	Sun, 18 May 2025 10:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+Ch9nWq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FA710E2B8
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAnlxB012486
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 967BFGTM2fUvMgLCbEf8k3a4tE16gLH10KN6lh/mGJQ=; b=g+Ch9nWqBwWiTwjG
 blPHgpqcB6+izV7Sn0PiSIJlNQbQ638PfFJN+5pnfHlPOKGuzE5aPQ8yNqFa8KJo
 u2g/VHiJHJIz0kixABvKnct/xiCZz6XtVFulAOePsyNtkAfmwvjN950B6ujoXJKU
 YxckUWEsTUaoI0muQoGQcyY4DB+spcN8jaVoeXbFELXNvkNHKDDq6F9ptvGw+Nv6
 j1VL6w6VUW+6piHkklRm5zyCcfeRYjksrshr983Ps9XvD9tMiquf3pL/5p4CYs0u
 Ql9KUITEiQJCdzczSmY9ORiiwrxsOFMUkLhcfPuagJarR9dbLhGOAvjDZlI4iO6e
 HfAlNQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhvry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8c8a36dddso22077736d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565742; x=1748170542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=967BFGTM2fUvMgLCbEf8k3a4tE16gLH10KN6lh/mGJQ=;
 b=siYCcKYFPdHbRZrEvKpCII/EZhl48qbqghBJLjAK+6y/13jPLKvDIf3ySVMOpo91Wg
 sn6xYn7rqrPsHhNvDfDbDZwuRS9FiSipmPreFlV5mpa4K8jlG9ijUu3ewh9IYEuuV6Pw
 2wboGzNKkbLjiMppbPMyQ876s6pRL9TLqSUWg70awxhJIHBBAg37wllo7m5lpiDkZcW7
 a2iQWjXRUSesCNzVhdDjxiTPnUlt7BxO67LtMuJYreMzYACLnN1HJGuC27M7KPmPClni
 T0835IKj3NVtHryTwv1EGRT+h+1AXL0BWk71QbvEkqeg//J7CIrg3LNc2ArejPuj4QTe
 fOxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVltX6nHQr+l+DEHRMoZE2kIFSZZc5dugD5xty8dsohNnUGsivXOa+TyExHaLUTjRk3RwTWOpvvI4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSWI438EQMFR5fy0Ab0m+2EqCcRDd6pSRxPKe5YSgaxxMvF9yV
 b8gfhYjC3o7YzdPDpLnSkScTunaejnvRFlaWTyp46BOu9CAYHsN1oivczNsZrMD6Q2xBr8jam0X
 BaEztquaXmirGtZgSD8xD+Dp45PiTP22/evB32t/BcOPM3Wr64cRMuFJ8YpSLXyIYywzF6PM=
X-Gm-Gg: ASbGncvrR+ToJO3no9EzfYpaXa1bSwTeRfHPBN3G5u6S/qRNib4UfI5SKwzZlNo3+w7
 nXyupNC3jcpK9xmfRapkWKt2C0lzqd6y+FGR1u3ASw6SCWV8Ai0lcH7R7g5dSNSM8E5P5IVoCMy
 4q2GXxyvc/avjBjbS3PG0uafU0cE5gG3zCYwge4PyYUpRuz2WRsVENOYj8lxBMupzG9gZyShBRJ
 TV0uQ6KW1DLOmpDKnLwND3wG6OvpPUajj/NhQbAa+m5MKUmYb2fZem7ewCkxllGHS1N5EAdn6Qv
 kd1Wd9EaqObCH/h1OZ/86fQ4RWhlF8zokeNnCswK3dOZcHmHXIgdQcZoJ71ZsNVaG/Y/ocxlZu5
 Ay8Dup+bmbuW2INbXXjFmGwoh
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr94568086d6.30.1747565742555; 
 Sun, 18 May 2025 03:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFmTxe3fzf9wIb3hSyjW2e7g2RhpXUOaJEjP1Zi2GnPh99qsQD6f6HpXWSHKiNJuJ0w4pUSQ==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr94567886d6.30.1747565742140; 
 Sun, 18 May 2025 03:55:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:27 +0300
Subject: [PATCH v3 09/11] drm/msm: rework binding of Imageon GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-9-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0LqRPtPOFWdF3NM/7wOtnNgFIrF9n7ejqAUYuZxTuFI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbya1AzQz4b/8IxydV3XRJgKMle+XUQ911LvG
 uFJbg4dUPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1R1WB/9d+TsZ3SeNofduSai6+uHnuuU/lV5GVRWJONKdBgldEBA1F6wl966+AltHq7n0pqjdGaE
 u8XN4j/FwePUJ9+RgMiYXi3LCi+VwyuhX7Lk1a41EILLFzlgEo6fJpQN92kO5RoLZc/+PbtSOjN
 cMaqKP/YICW7Ryp7gJgf5xssIH6TNvoxHlH8zwxnpyqeO1JtFnXy9siIPizhNsj0F8RZUymiZ1B
 /iCW+c5FXdVTvYJ48xPRYZPvoQiwQz9O947HAALux9fpM/aGdeChukq1GHug2Ne3+qQ6agNitaK
 yXxbevk+JDjxu/1cdxuMcmDbpQDbi9cnAGyLpJz1q7oAVUq5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX1j1jrt0fGKTi
 gQenca3nKQsYi4IaUiIDk+pONF+ZSDlN9CS089Y3nx3UXFB0tXcm7PXa0C8ULOIdK5c01J/gGjY
 zcW6PX7Ei+707Gnf9lNSPNIrYuAohukY14hkrZeszd3p817PMEsjJzBA1gNkA/IIyc9d4WVA0+e
 ZYp/N/fKOhliykJArFiSEsr80ULU++hiNhvqpFJymBUE2249FDvojWLtkiRsoLDGELo8w5DJNup
 v+CbuKBNRp9A2zXRrKIgmJV4HcwpccDkSO8FsS1Q7GNS8Ub/JRUd5/wD/iqWtO3ZXiazr8em15i
 nfai/69t8BifZVXqdV3OsuhPWhWTYRXmo/mJHtSol6WqF7yCmTnfZ5jViMcMyplc6tLLOfikQMj
 w1nSOdeSru0R8QZo46MpAQGJ+Trzgoo+Af794sNUz00O28tzMZTVDLkIZctGAJPhKck6HWAy
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829bcaf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: D3hbZ3nYfxEV7jQeEsHP42C0MwvPKbqX
X-Proofpoint-ORIG-GUID: D3hbZ3nYfxEV7jQeEsHP42C0MwvPKbqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

Currently the msm driver creates an extra interim platform device for
Imageon GPUs. This is not ideal, as the device doesn't have
corresponding OF node. If the headless mode is used for newer GPUs, then
the msm_use_mmu() function can not detect corresponding IOMMU devices.
Also the DRM device (although it's headless) is created with modesetting
flags being set.

To solve all these issues, rework the way the Imageon devices are bound.
Remove the interim device, don't register a component and instead use a
cut-down version of the normal functions to probe or remove the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 36 +++---------
 drivers/gpu/drm/msm/msm_drv.c              | 91 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  4 ++
 3 files changed, 72 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f5e1490d07c1868fa21cddb38de44c28af5ca0d5..574bc452f3df539cc8e03e161043b310d83c624f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -245,42 +245,22 @@ static const struct component_ops a3xx_ops = {
 	.unbind = adreno_unbind,
 };
 
-static void adreno_device_register_headless(void)
-{
-	/* on imx5, we don't have a top-level mdp/dpu node
-	 * this creates a dummy node for the driver for that case
-	 */
-	struct platform_device_info dummy_info = {
-		.parent = NULL,
-		.name = "msm",
-		.id = -1,
-		.res = NULL,
-		.num_res = 0,
-		.data = NULL,
-		.size_data = 0,
-		.dma_mask = ~0,
-	};
-	platform_device_register_full(&dummy_info);
-}
-
 static int adreno_probe(struct platform_device *pdev)
 {
-
-	int ret;
-
-	ret = component_add(&pdev->dev, &a3xx_ops);
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
-		adreno_device_register_headless();
+		return msm_gpu_probe(pdev, &a3xx_ops);
 
-	return 0;
+	return component_add(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &a3xx_ops);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->kms_init)
+		component_del(&pdev->dev, &a3xx_ops);
+	else
+		msm_gpu_remove(pdev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2c6997c85fbbc3767315ca3a166a99b322f1218a..804b594ba1e7df9d9aec53a9be1451f1167fc77a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -62,7 +62,7 @@ module_param(modeset, bool, 0600);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-static int msm_drm_uninit(struct device *dev)
+static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
@@ -91,7 +91,10 @@ static int msm_drm_uninit(struct device *dev)
 
 	msm_deinit_vram(ddev);
 
-	component_unbind_all(dev, ddev);
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -200,7 +203,8 @@ static void msm_deinit_vram(struct drm_device *ddev)
 			attrs);
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
+			const struct component_ops *gpu_ops)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
@@ -247,7 +251,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	if (gpu_ops)
+		ret = gpu_ops->bind(dev, dev, NULL);
+	else
+		ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_deinit_vram;
 
@@ -259,11 +266,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
 			goto err_msm_uninit;
-	} else {
-		/* valid only for the dummy headless case, where of_node=NULL */
-		WARN_ON(dev->of_node);
-		ddev->driver_features &= ~DRIVER_MODESET;
-		ddev->driver_features &= ~DRIVER_ATOMIC;
 	}
 
 	ret = drm_dev_register(ddev, 0);
@@ -280,7 +282,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, gpu_ops);
 
 	return ret;
 
@@ -896,6 +898,28 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_RENDER |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 /*
  * Componentized driver support:
  */
@@ -1020,12 +1044,12 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(dev, &msm_driver, NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, NULL);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1074,29 +1098,34 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-/*
- * Platform driver:
- * Used only for headlesss GPU instances
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops)
 {
-	return msm_drv_probe(&pdev->dev, NULL, NULL);
+	struct msm_drm_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/* on all devices that I am aware of, iommu's which can map
+	 * any address the cpu can see are used:
+	 */
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret)
+		return ret;
+
+	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
 }
 
-static void msm_pdev_remove(struct platform_device *pdev)
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	msm_drm_uninit(&pdev->dev, ops);
 }
 
-static struct platform_driver msm_platform_driver = {
-	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
-	.driver     = {
-		.name   = "msm",
-	},
-};
-
 static int __init msm_drm_register(void)
 {
 	if (!modeset)
@@ -1111,13 +1140,13 @@ static int __init msm_drm_register(void)
 	adreno_register();
 	msm_mdp4_register();
 	msm_mdss_register();
-	return platform_driver_register(&msm_platform_driver);
+
+	return 0;
 }
 
 static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
-	platform_driver_unregister(&msm_platform_driver);
 	msm_mdss_unregister();
 	msm_mdp4_unregister();
 	msm_dp_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d..e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -532,6 +532,10 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops);
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.39.5

