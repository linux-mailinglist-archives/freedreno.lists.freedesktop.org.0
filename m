Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4084E39B
	for <lists+freedreno@lfdr.de>; Thu,  8 Feb 2024 16:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9310E86C;
	Thu,  8 Feb 2024 15:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="duHqgMAL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DA510E865
 for <freedreno@lists.freedesktop.org>; Thu,  8 Feb 2024 15:01:13 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51032058f17so2349205e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 08 Feb 2024 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707404472; x=1708009272; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bM1ON0mCYxX+OrdVKZhi68MkEuup4raYVaf9XhQ9xPo=;
 b=duHqgMALGJXSwEbGx9cLp2v4marUKzp6UzIONGFFirAe0qxVHd7YTwp3xWwgKmlx2p
 Yaks1JBGUfEmx9mIGULgOOZMldDGQQ7YmcK8RdXAUPxXu6FIFlQu5iJqrq8jbzg5+TPa
 wbSahAmaEh7SbCT4ukg9SDFlt5amlzP/PwDBw17yYGH91Y6x6ZFa+rLZjNWQQcGHsbuA
 zhO/5QPd8jlgy5hjuDrmBZlLkhBklnDMU8BOyAIdn8Db2pW6Wq5xQYqmFecljMFs4M3h
 +UJwwummQf8C6H6B7dExvlDeISQtJYDTQbV3iDAYneZI0RI3JGL8hM72Dw+e12TAykkn
 p3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707404472; x=1708009272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bM1ON0mCYxX+OrdVKZhi68MkEuup4raYVaf9XhQ9xPo=;
 b=b11KWuD80Yryiwq+/gnYxxPwqcaGgAsEEHB++HF+V1hPRTkwFkirit8PDWzMNnvn/k
 19mmoGgKYLqx3KdeOod5dFNekE6OeNHnkA4/HWApqtLqKQMReaibGswVTvOvWUtLLNX3
 puh1FBrKyLaTGQhnsCz1UgGngaSLmUqgplayyPfiZIdJcr8RcJ1o6ml7/0c1f/qVRRO3
 xO2bwRdF/+4Yzyt35Dy6GMsO5OF8+Pmkek1QUN9GjsFrTBZiFp26Ha6n/sEYduZMXedI
 HRwB221fkoBGWIUJ2DatMa1oMNZVbNB9v8dY1+TvCwGAQ7PTU8oMJeBgPgTt641N5lWl
 Hnjg==
X-Gm-Message-State: AOJu0YzRR90srMKmTv5gONf8WzaWhMCkCcli5P77hBDFrI14SfX+Qtfz
 YCYC4hq14Yo0YDdRdv6vfgd30Qu9iFG95aeiTkRYLBu5jLBPl+5YnshVcUS3K3M=
X-Google-Smtp-Source: AGHT+IHmgBBEIVWJ3JryLNAVPgOAqRUrD4/Io65FjB2JFKaahMiRIVll1dtAbGsF3ZA81Eb7MTARIg==
X-Received: by 2002:a05:6512:3084:b0:511:4cc9:33a4 with SMTP id
 z4-20020a056512308400b005114cc933a4mr8423242lfd.52.1707404472071; 
 Thu, 08 Feb 2024 07:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPI7jqCSDTEQwvf49fCJB2nh7Ft9ZVdyBaxPIsoFErUzO5eWZvcgHD2TbF4rEI5iuJkjhI8AK0Wh82Sw/UdmgCNZRz1Ob08A9Kw3OMk/gabqeh1L6sFzf2TqULTbj1sJshhoSqyhwihX+CqEbFVoYotiAKP6UrBzg1fL02hdFDyFuB29Rv+HSQs+eIe3G7D4h5F9J3t+s1DC2/a3mdNYwR3w7sVDLArt6qhnVLLnyTsjIzxrGC+v85FvKE8cMYShl89HE8sbXPT6wJ2cCQtDnGUgzmheEAFbUtSbLSTRKsUGzBF6CjSaMYv0SEto5fgI3NbMcQPc2R0RHVCZgh
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x18-20020a19f612000000b00511498107b8sm22444lfe.65.2024.02.08.07.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:01:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:01:09 +0200
Subject: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5596;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tl6JEvUus0xlZ8U5q5uQ8wyhk+g9z4wbwtBHieQ2hyo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOy1hHipg/dl04ngXKXm31WoTPg06D4744LEw
 TGvy4CLo9iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTstQAKCRCLPIo+Aiko
 1ZXXB/0RJS1fympL90lLUdAGvRisrATJ6XoAg/Oo8/RJvTpFhiUkkwhqsaZLBnqi9yfqYwnLYGh
 CqwHwd67IigqsW3DYhGGFl2zRNCQncbhH4PA2GY2NHWNcSWxygh7Ql/w/EXEQ7/eG3voik4IuYc
 3Bek4Gu7oV/kWt9N2aR+F7uRzNLK572iGLy+ei7XxY5rfIxX6Su0+b6Z8SHsZHx51lZ2u8X3NTO
 5+/E4fXhLW/QwHRH9JLIbx1FLoxE4ypbQbrEbkWIGQWe5V/2TzLdPQpGMKzS/ADFgE7eF4Gapyg
 Tb4oc0uIwySsb+Dn43ofsjL4LlxBRkdUI5k2U2iPT8Az+FIS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Existing MDP5 devices have slightly different bindings. The main
register region is called `mdp_phys' instead of `mdp'. Also vbif
register regions are a part of the parent, MDSS device. Add support for
handling this binding differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h           |  3 +
 drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
 3 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..5de1861f608e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1197,6 +1197,78 @@ static int dpu_kms_init(struct drm_device *ddev)
 	return 0;
 }
 
+static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
+{
+	struct platform_device *pdev = dpu_kms->pdev;
+	struct platform_device *mdss_dev;
+	int ret;
+
+	if (!dev_is_platform(dpu_kms->pdev->dev.parent))
+		return -EINVAL;
+
+	mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
+
+	dpu_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(dpu_kms->mmio)) {
+		ret = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+		dpu_kms->mmio = NULL;
+		return ret;
+	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
+						  dpu_kms->pdev,
+						  "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return ret;
+	}
+
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
+						   dpu_kms->pdev,
+						   "vbif_nrt_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
+
+	return 0;
+}
+
+static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
+{
+	struct platform_device *pdev = dpu_kms->pdev;
+	int ret;
+
+	dpu_kms->mmio = msm_ioremap(pdev, "mdp");
+	if (IS_ERR(dpu_kms->mmio)) {
+		ret = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+		dpu_kms->mmio = NULL;
+		return ret;
+	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return ret;
+	}
+
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
+
+	return 0;
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1230,28 +1302,12 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->base.irq = irq;
 
-	dpu_kms->mmio = msm_ioremap(pdev, "mdp");
-	if (IS_ERR(dpu_kms->mmio)) {
-		ret = PTR_ERR(dpu_kms->mmio);
-		DPU_ERROR("mdp register memory map failed: %d\n", ret);
-		dpu_kms->mmio = NULL;
-		return ret;
-	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
-		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
+		ret = dpu_kms_mmap_mdp5(dpu_kms);
+	else
+		ret = dpu_kms_mmap_dpu(dpu_kms);
+	if (ret)
 		return ret;
-	}
-
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
 
 	ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd..01e783130054 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -476,6 +476,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *dev,
+			       const char *name);
 
 struct icc_path *msm_icc_get(struct device *dev, const char *name);
 
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index 59d2788c4510..afedd61c3e28 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -50,6 +50,19 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 	return clk;
 }
 
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *pdev,
+			       const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
 				  bool quiet, phys_addr_t *psize)
 {

-- 
2.39.2

