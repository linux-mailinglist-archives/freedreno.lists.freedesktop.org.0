Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BFAAA7F26
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 09:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5410E38C;
	Sat,  3 May 2025 07:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALe8Dcqd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295B810E38C
 for <freedreno@lists.freedesktop.org>; Sat,  3 May 2025 07:17:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436CVLd030566
 for <freedreno@lists.freedesktop.org>; Sat, 3 May 2025 07:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=; b=ALe8Dcqd+LnzAGCv
 JX43vDb6czVQIJrkOpOJBK+y4xuMCRWJB/Lm8R3wB1H/ilV19gaTcdrtcuwyrw7R
 /JSWkW7GaCOKgymc+tooo7JrNXUnJPaKhvBC6Eg7gn0wydQtAQE5/f3UXCMvh7hf
 vGGlrMgSY9Rzo+rYFH1FxtpY3aNqiZ7i0DBgYGpNk8unpaVwFAhODvfMCCnXljCt
 7RyxxO4nnEliDL2HflNnakmogIgvnhorcCLMWW8AgfC4zQShRrfVIy0AxVoell2u
 DoYRZsXbqcTBjIedBYzgvSkQugktzSHSySOc8FFX9eljfEEA6VV+8wn922Pna7Ko
 HCWxRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg09up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 May 2025 07:17:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4766afee192so15760501cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 May 2025 00:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256650; x=1746861450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=;
 b=YJMNzdlS/EL6MXDpjOWTXUIU5yR1GeESwIs7z0x2qdZ6YW2NIA9f3giVtDaRO5GNuR
 H0bSsqpWbPhHez7l5W35IZvcBVWz2w/u0+SAYQM7S5e20ZDGNzPumomfYX7MTHTXylob
 RcwomlVEgmXaO6X+MFzLIstlXHAKiXJwrhstEwbpIR/HcRPRe/MIWJn3OWupe++6X2fg
 fyNbR6RIJ47hd7koUhtf0vYmDHMZ7RNTlKNcT9EJkfx4eFim2937I0gvZOYsR2by7Owc
 aH0Lqo86IlhMiRCqVxtlg6kDRHs17IFg47K1SJhp7CkjOUmNy9ATVrvICCHPZ+1PWqBf
 NjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7iCdViA0CwBrpbpJJQFMHSSsoMSeIwWwIqTLVW9m2M2DIl7UYW9OL333gziD0VdE3uo6uxndo0Sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwshPSc6h/NaMe0CIPgSeDiQFYX57CynPXpo21UOb5I8ZTcMrlf
 aXEfnhUB5ZYxk4Qlr03LSJ8Kk8yOTKP4pbW5hthP9mmWPPT6vJ3fop+uhH+SjRiCafv+79Wruke
 aUAxiyuwReEAaX0eoK56AhYS7yiI3BJ0wRAAR9K27VQuUGwV7ORww+CC6IHgaJCnwaB7CE+D+ze
 CSsw==
X-Gm-Gg: ASbGncsC+nWuTkwJE117+t1LTssNHDyS3lbeLLSorh6TJT1b32wsdlU5gUCx/5DyXZ1
 mjaeHAjPlaW5+tdTJYZlNZ2s+r1SXMLiNCCO/rZ+QufYVoqBgjBqZVW04IpEoFm2U7TIRC0lbP+
 /NnStUUcBGzySeT9pnLuuGqfT9zZNHkV8q0nCzhChn1Livybr7hgzIJY0SSa0jpCMkQmVgFGHDa
 mCmcTWSvrsw37TGR4QLM4XGrSStkuUZajfqAfWDTwIcaHUez7l3Xml++Pp6WScenKk6BUsqUmKI
 nXcQUx9K5Oq/Y0nHmSoOtLJkIbWJD0MCaQpmJBv2xiIS5XOYsT8hKOK+TbmhYryJKep9FoLTyXp
 iQhhKlBDF+J723EN47eTiVNvm
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id
 d75a77b69052e-48dff4de974mr1620561cf.14.1746256649929; 
 Sat, 03 May 2025 00:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1bzAAdQlXhBzA5PTRId/zIWytzDLkPwsjKAlBtMNTIcrcDvoywr254sWtwJFp/iqar13fZg==
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id
 d75a77b69052e-48dff4de974mr1620231cf.14.1746256649610; 
 Sat, 03 May 2025 00:17:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:08 +0300
Subject: [PATCH v2 09/11] drm/msm: rework binding of Imageon GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-9-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
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
 bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4booXccTgyqU9uqPO7yxuZXOEpuavKdezmDO/35IpcZW
 suz9vZ1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAirbrs/2vbHMPmpH88qxut
 yDf50ppFZzLMlVo2dfxyXVb+tt7Fe3/t4Zqd0v12R5u26324+P3mv+vyHpcbv8wokxGsK4rQ3PF
 F0+ZVitsErb9/dwvP6nixPebNj6w3bV7JJRWVibW5F9k1S98/ZpolWiF8uKvkxZGpL/aLvW8xfr
 0iurfStH/ZpLDsZ835ce8zslnTv76/0NqkLHZjjcyyBtUDz1dFO+1dly39LuejzcrVW7rOd7cyJ
 tf5urFJdFxbEJsXUtBV+Oqh2lPnBzJezjKvGF5xuhQskxP/fp/NSe6yLHf944azVeouasp9rz14
 yl5rJf26nudqkF3RcOqghOFjn0Lu9wYKEv6bNJ72nygBAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7Wc_PfBGXZKU3bU5zjATfSYgo9kSJ_5w
X-Proofpoint-ORIG-GUID: 7Wc_PfBGXZKU3bU5zjATfSYgo9kSJ_5w
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6815c31a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX8pSTd5JD3jyU
 Xi3NSqWHeKqN0gPxxJFmsVsBed4c0twP5W93dD25L0o0cD9VMNlL3QifV6JpX3kKb6rGbmIwClo
 vCyMW+07CpzD9u0eAc0uxvWuQyfw+tiFL1OWP6oYvJCyPP65Oz6yyxxygQVXqh+dWUQ2gEllYzg
 d3VeuaprGLRZwt47BhgEh5JFByM/pJyrig1nRAZ94fjq/HIUqoCAW1Gd9CkY1+H4TRfj+XRVry4
 Pt9FieqXbQJrQUbipB3P+N5MKco0yO6YMVsAvXKK8nKI+VIRYSaxH9VGswBssEYQ3SjUtIn+x8S
 XWuk+9Y0t4RBDPFSHVsHFr+Q3Nt+FKrsLeLl9KmIR+V8WE/vQSIno8r4QSG5hpg5JDizjb3y/dO
 50dSPRarQeBGCvXJ7kk5RufwwdE9Gteud5W1X6lifbhJgsE1pJznsHvfh2cGkyIU4pdJYDeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062
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
index 236b25c094cd5d462f4b6653de7b7910985cccb6..325cb710ea08ac8e5c3d9c80c8d8e18e1946e994 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -241,42 +241,22 @@ static const struct component_ops a3xx_ops = {
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

