Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE932F120E
	for <lists+freedreno@lfdr.de>; Mon, 11 Jan 2021 13:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0886E096;
	Mon, 11 Jan 2021 12:04:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BD76E09A
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 12:04:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610366675; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=P6fim5Tz2QEHSDbi95F4RGXF3HiX1EPKCKQvMfPse7M=;
 b=i6xSTun0rNa19BCi5+GowxlWFr4VPhdEXBF8xoNdEo9h3LJ/jLYchQWMEacWhIE71MKGfJs0
 lAP039z7lsn5r2XAuZ8fpqwrlyXS1lqUeQ0DHAuFpGrSrm56YnFQ2MYOlL36jxaAZBqNOLEH
 e8ZeIFjnK3l9Hp7AqysshuwmVGU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ffc3ed28fb3cda82f5465ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 12:04:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4596AC43461; Mon, 11 Jan 2021 12:04:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C3E6C433CA;
 Mon, 11 Jan 2021 12:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C3E6C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 angelogioacchino.delregno@somainline.org
Date: Mon, 11 Jan 2021 17:34:09 +0530
Message-Id: <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/2] drm/msm/a6xx: Create an A6XX GPU specific
 address space
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kristian H Kristensen <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A6XX GPUs have support for last level cache(LLC) also known
as system cache and need to set the bus attributes to
use it. Currently we use a generic adreno iommu address space
implementation which are also used by older GPU generations
which do not have LLC and might introduce issues accidentally
and is not clean in a way that anymore additions of GPUs
supporting LLC would have to be guarded under ifdefs. So keep
the generic code separate and make the address space creation
A6XX specific. We also have a helper to set the llc attributes
so that if the newer GPU generations do support them, we can
use it instead of open coding domain attribute setting for each
GPU.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
 3 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3b798e883f82..3c7ad51732bb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
+	struct msm_gem_address_space *aspace;
+	u64 start, size;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return NULL;
+
+	/*
+	 * This allows GPU to set the bus attributes required to use system
+	 * cache on behalf of the iommu page table walker.
+	 */
+	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
+		adreno_set_llc_attributes(iommu);
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	/*
+	 * Use the aperture start or SZ_16M, whichever is greater. This will
+	 * ensure that we align with the allocated pagetable range while still
+	 * allowing room in the lower 32 bits for GMEM and whatnot
+	 */
+	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
+	size = iommu->geometry.aperture_end - start + 1;
+
+	aspace = msm_gem_address_space_create(mmu, "gpu",
+		start & GENMASK_ULL(48, 0), size);
+
+	if (IS_ERR(aspace) && !IS_ERR(mmu))
+		mmu->funcs->destroy(mmu);
+
+	return aspace;
+}
+
 static struct msm_gem_address_space *
 a6xx_create_private_address_space(struct msm_gpu *gpu)
 {
@@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = a6xx_create_address_space,
 		.create_private_address_space = a6xx_create_private_address_space,
 		.get_rptr = a6xx_get_rptr,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b35914de1b27..0f184c3dd9d9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
+void adreno_set_llc_attributes(struct iommu_domain *iommu)
+{
+	struct io_pgtable_domain_attr pgtbl_cfg;
+
+	pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
+	iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
+}
+
 struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct iommu_domain *iommu;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
@@ -200,20 +207,6 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	if (!iommu)
 		return NULL;
 
-	if (adreno_is_a6xx(adreno_gpu)) {
-		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-		struct io_pgtable_domain_attr pgtbl_cfg;
-
-		/*
-		 * This allows GPU to set the bus attributes required to use system
-		 * cache on behalf of the iommu page table walker.
-		 */
-		if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
-			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
-			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
-		}
-	}
-
 	mmu = msm_iommu_new(&pdev->dev, iommu);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(iommu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b3d9a333591b..2a3d049b46b5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -212,11 +212,6 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
 	return gpu->revn == 540;
 }
 
-static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
-{
-	return ((gpu->revn < 700 && gpu->revn > 599));
-}
-
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
        return gpu->revn == 618;
@@ -278,6 +273,8 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev);
 
+void adreno_set_llc_attributes(struct iommu_domain *iommu);
+
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
