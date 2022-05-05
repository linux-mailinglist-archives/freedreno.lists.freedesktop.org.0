Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098851B48C
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 02:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1A10F925;
	Thu,  5 May 2022 00:16:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E838B10F917
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 00:16:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p10so4952256lfa.12
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 17:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZspMTshjDW4WDZS6BMcAGQ/7Se1fA5JS5aIlcr6onoY=;
 b=Pezb54P34LSTFKkTF1SGSvTJb3Z7bUximjMQnSta1e/yj6WecKbh/MESjtolOPTXND
 uJDqn7+iDrn+hfU6FpP4n1mIurw+aCfwpWizqCIPlc6ijARpOsMgnpvIXlLsmF8yL9dB
 MrKHQ7p5YSU4Y2Y7tcyrv1BpKl+XpEQ2fmw9Dtetf8bls1xX0b60YTQPzWRUNfht2eLB
 2GrYEtgzJwaMh5vabfp9wv9fnonUitSQWBNEaTB6vWpn+XUWXzP8C9qjIm4nOGYTzweB
 FYmJ/BDg4qmmpxaDmPZpkUp86dt8RldwbOChca0uzOuc2Pq1lUqIbPiZZB8nHB5xc4dN
 c1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZspMTshjDW4WDZS6BMcAGQ/7Se1fA5JS5aIlcr6onoY=;
 b=roVbAsX+Q/Pxe4WAPUpGycv2le8o9DbiC4VF73iMNOaH1ORXKmR+en25cGgw8rrl6G
 wPB8lB7myGOANRUZ3GbeJvgPmoNybzhEy1z5qJdhekeRcN82UHnf01JzgTLW/HVEEg8E
 ZSwASZ8G6atOBmVsSAuAma2HJHg80GGxQKWj6/gP7Kh0DxRbuq2+wWvQ4Z45EvoNHiti
 hvLH1NZcqfPPsmlsI5cO/ipvEDKaT41YXzY7KfeozB6NmZ7E8SCIecNGltYZ7gvfjrmu
 ip4wEHe78lG6caPAm8nMzup29CBO20E6kZicoa20WGrr7cXenxmy/CaJwi/q2FFQuw3P
 S6EA==
X-Gm-Message-State: AOAM532XrZKmSS6+j0b2vJ35Hzs3dje7ml1mTSfTeUJDErZhIYAE1Dmo
 vdNn/ImQh+LMxpzC4aXld0lMHw==
X-Google-Smtp-Source: ABdhPJwrGu0+1eCfsRcbyZmUyLuEbyINB9VQKtQj1dw8L7EV7bmjpfvYthIUPDSa2I3G/OlDBD6fAw==
X-Received: by 2002:a05:6512:696:b0:473:a6ef:175d with SMTP id
 t22-20020a056512069600b00473a6ef175dmr7196085lfe.540.1651709769224; 
 Wed, 04 May 2022 17:16:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  5 May 2022 03:16:04 +0300
Message-Id: <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/5] drm/msm: move KMS aspace init to the
 separate helper
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

MDP5 and DPU drivers have the same piece of code now to initialize
IOMMU and GEM address space. Move it to the msm_drv.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 32 ++----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 33 ++++---------------
 drivers/gpu/drm/msm/msm_drv.c            | 41 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5ccda0766f6c..45afe260329a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -999,40 +999,14 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
-	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
-	struct msm_mmu *mmu;
-	struct device *dpu_dev = dpu_kms->dev->dev;
-	struct device *mdss_dev = dpu_dev->parent;
-	struct device *iommu_dev;
-
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain)
-		return 0;
-
-	/*
-	 * IOMMUs can be a part of MDSS device tree binding, or the
-	 * MDP/DPU device.
-	 */
-	if (dev_iommu_fwspec_get(dpu_dev))
-		iommu_dev = dpu_dev;
-	else
-		iommu_dev = mdss_dev;
-
-	mmu = msm_iommu_new(iommu_dev, domain);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(domain);
-		return PTR_ERR(mmu);
-	}
-	aspace = msm_gem_address_space_create(mmu, "dpu1",
-		0x1000, 0x100000000 - 0x1000);
 
-	if (IS_ERR(aspace)) {
-		mmu->funcs->destroy(mmu);
+	aspace = msm_kms_init_aspace(dpu_kms->dev);
+	if (IS_ERR(aspace))
 		return PTR_ERR(aspace);
-	}
 
 	dpu_kms->base.aspace = aspace;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 1c67c2c828cd..1a4d02c353e0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -557,8 +557,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct msm_kms *kms;
 	struct msm_gem_address_space *aspace;
 	int irq, i, ret;
-	struct device *iommu_dev;
-	struct iommu_domain *iommu;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 
@@ -602,33 +600,14 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (iommu) {
-		struct msm_mmu *mmu;
-
-		iommu_dev = &pdev->dev;
-		if (!dev_iommu_fwspec_get(iommu_dev))
-			iommu_dev = iommu_dev->parent;
-
-		mmu = msm_iommu_new(iommu_dev, iommu);
-
-		aspace = msm_gem_address_space_create(mmu, "mdp5",
-			0x1000, 0x100000000 - 0x1000);
-
-		if (IS_ERR(aspace)) {
-			if (!IS_ERR(mmu))
-				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(aspace);
-			goto fail;
-		}
-
-		kms->aspace = aspace;
-	} else {
-		DRM_DEV_INFO(&pdev->dev,
-			 "no iommu, fallback to phys contig buffers for scanout\n");
-		aspace = NULL;
+	aspace = msm_kms_init_aspace(mdp5_kms->dev);
+	if (IS_ERR(aspace)) {
+		ret = PTR_ERR(aspace);
+		goto fail;
 	}
 
+	kms->aspace = aspace;
+
 	pm_runtime_put_sync(&pdev->dev);
 
 	ret = modeset_init(mdp5_kms);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a37a3bbc04d9..98ae0036ab57 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -26,6 +26,7 @@
 #include "msm_gem.h"
 #include "msm_gpu.h"
 #include "msm_kms.h"
+#include "msm_mmu.h"
 #include "adreno/adreno_gpu.h"
 
 /*
@@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
 
 #include <linux/of_address.h>
 
+struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
+{
+	struct iommu_domain *domain;
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+	struct device *mdp_dev = dev->dev;
+	struct device *mdss_dev = mdp_dev->parent;
+	struct device *iommu_dev;
+
+	domain = iommu_domain_alloc(&platform_bus_type);
+	if (!domain) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (dev_iommu_fwspec_get(mdp_dev))
+		iommu_dev = mdp_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, domain);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(domain);
+		return ERR_CAST(mmu);
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
+		0x1000, 0x100000000 - 0x1000);
+	if (IS_ERR(aspace)) {
+		mmu->funcs->destroy(mmu);
+		return aspace;
+	}
+
+	return aspace;
+}
+
 bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fdbaad53eb84..99c2c14c558d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -234,6 +234,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
+struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
-- 
2.35.1

