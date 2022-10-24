Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121360AEC1
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056EE10E838;
	Mon, 24 Oct 2022 15:14:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02A610E838
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:14:47 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g1so17215179lfu.12
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
 b=zCxdchVyQR/EsF3KDKVvPTyTFbNr3vJ6GZoJwiSlyc31edKx3etrs+zUWQ+3KkyStR
 xVW3JryyojbPz9qHUPJNmJLOuTzJt73PXsMo0gfusyqOcmGyO5eV/WhbksfVB+sZBTjT
 MokD1XZzN5tPLqCny+tle4ot86hncH/9j/j0ahVKtxWEp3D9e6jXK7oj0PBODBaGbJpM
 bBrwIVm8IHFeONzv/7Bd038k98oHWzjBNwB7ZyN8lNmo+09SzUOvZAzmCmr+8dWaBQ6N
 xU8yp6UYjQkwD9/RlHHuDHrCnl1aRE3ZoZlS0D6pBYsjA8UofY8CzSOmBpzLQ2/0AKqF
 4AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
 b=tViKPHUUXhZv9l6nWJt/fU0MRU0ry2xrZk9x/ZqJznzioWo29CuxAnp/RToh1jbzQx
 xxKCuHKLqm3kU02wuOJW+vC+pcSEARGzrvvGJoKM4ij6abqS8SUAMX/MkSNAiM6cyQqp
 IJWt6GNWL1sOIvp30xnrnrYPPrtqhJ9T7KoMyCmWkTG2YNmGc4cHdmuDVScAr9aN0VN+
 HBJTVx+jH//9PsvRTHe1dT8F7Y90XKJNi8yq9/b9IaYsVlUWsULnpOwp9DQZbMDEnkwa
 j7iYyCeLfb/eMRkHwnYAkefEAu1RI0JQDENLxzSIX+jDD9++AEKRIsfvkx0MdaRHW45m
 J0+A==
X-Gm-Message-State: ACrzQf0dkBDyZG1gMhFSOhHHWlMwUO0+jJ0tUKO9hO0IH8x9n9XIZT12
 CQgTCW2+LQN7pw4JkckV+jb+bg==
X-Google-Smtp-Source: AMsMyM7I5Z7haqJvgbG39DqjwUq8Tj44k/VShJNksqgQgMrE+D1PnPgYL2ybE/orrPCVslMYmDzDwA==
X-Received: by 2002:ac2:4d05:0:b0:4a7:7e1b:1c81 with SMTP id
 r5-20020ac24d05000000b004a77e1b1c81mr7222973lfi.110.1666624485975; 
 Mon, 24 Oct 2022 08:14:45 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b002771057e0e5sm265943lji.76.2022.10.24.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:14:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 24 Oct 2022 18:14:43 +0300
Message-Id: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm: remove duplicated code from
 a6xx_create_address_space
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The function a6xx_create_address_space() is mostly a copy of
adreno_iommu_create_address_space() with added quirk setting. Reuse the
original function to do the work, while introducing the wrapper to set
the quirk.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 5 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc578016e0b..7640f5b960d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain *iommu;
-	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
+	aspace = adreno_iommu_create_address_space(gpu, pdev);
+	if (IS_ERR_OR_NULL(aspace))
+		return ERR_CAST(aspace);
 
 	/*
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
-		adreno_set_llc_attributes(iommu);
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
-		return ERR_CAST(mmu);
-	}
-
-	/*
-	 * Use the aperture start or SZ_16M, whichever is greater. This will
-	 * ensure that we align with the allocated pagetable range while still
-	 * allowing room in the lower 32 bits for GMEM and whatnot
-	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
-
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
-
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
-		mmu->funcs->destroy(mmu);
+		adreno_set_llc_attributes(aspace->mmu);
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..ed26b8dfc789 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu)
+void adreno_set_llc_attributes(struct msm_mmu *mmu)
 {
-	iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
+	msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
 }
 
 struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e7adc5c632d0..723729e463e8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -338,7 +338,7 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev);
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu);
+void adreno_set_llc_attributes(struct msm_mmu *mmu);
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5577cea7c009..768ab71cc43e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	return iommu_set_pgtable_quirks(iommu->domain, quirk);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..d968d9f8e19c 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

