Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A02F17D9
	for <lists+freedreno@lfdr.de>; Mon, 11 Jan 2021 15:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A546E0E4;
	Mon, 11 Jan 2021 14:15:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133096E0E3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 14:15:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610374545; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+zvATLB17FSikJ474bJLjVIT/0w+t+4NoZVNMOXfLUE=;
 b=nIKm0UFkHnVKSJibgQlJ4dZB5i5WKPfB09NCApl8Ns4Iu3bAorO5am+Pt12jHzoHUsRrK8s3
 +SJps9QJaOLrrVz4/WPlKP02XIMmYBEAN+iAa/6TpcZGKBOnN670OgELl63KWvVAROkE47rG
 pQMjJe1IGOVz8i6gpmTibqDw28k=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ffc5d904dcca12475c0498b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 14:15:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E4D6BC43465; Mon, 11 Jan 2021 14:15:43 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF8F9C433C6;
 Mon, 11 Jan 2021 14:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF8F9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 isaacm@codeaurora.org
Date: Mon, 11 Jan 2021 19:45:05 +0530
Message-Id: <6f8ec1a563cb6e408c5c1cae82b9417860d49549.1610372717.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/3] drm/msm: Use IOMMU_LLC page protection flag
 to map gpu buffers
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, Kristian H Kristensen <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use the newly introduced IOMMU_LLC page protection flag to map
GPU buffers. This will make sure that proper stage-1 PTE
attributes are set for GPU buffers to use system cache. This
also introduces MMU_FEATURE_USE_LLC features bit to check for
GPUs supporting LLC and set them in the target specific address
space creation, in this case we set them for A6XX GPUs.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 drivers/gpu/drm/msm/msm_iommu.c       | 3 +++
 drivers/gpu/drm/msm/msm_mmu.h         | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3c7ad51732bb..23da21b6f0ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1266,6 +1266,9 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 		return ERR_CAST(mmu);
 	}
 
+	if (!IS_ERR_OR_NULL(a6xx_gpu->llc_slice))
+		mmu->features |= MMU_FEATURE_USE_LLC;
+
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 22ac7c692a81..a329f9836422 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -235,6 +235,9 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
+	if (mmu->features & MMU_FEATURE_USE_LLC)
+		prot |= IOMMU_LLC;
+
 	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
 	WARN_ON(!ret);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 61ade89d9e48..efcd1939c98e 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -23,12 +23,16 @@ enum msm_mmu_type {
 	MSM_MMU_IOMMU_PAGETABLE,
 };
 
+/* MMU features */
+#define MMU_FEATURE_USE_LLC	BIT(0)
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags);
 	void *arg;
 	enum msm_mmu_type type;
+	u32 features;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
