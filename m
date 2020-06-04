Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD361EEC96
	for <lists+freedreno@lfdr.de>; Thu,  4 Jun 2020 22:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356836E5D3;
	Thu,  4 Jun 2020 20:57:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB86E5D3
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 20:57:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591304265; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wI+CMekow0meYW6dUpwEc+eymozIziRtNlUOVzQUGoI=;
 b=DK2Iq9aQi1otzafGttBgk1dG09fBUucFuzAiRSRLMY8wyjlRpTMdRz8cTF8nkXRoKF/CVPhK
 2Ay93bCJDERpQO/fL2p+gm1OoopBRIxGIiaZjsEpifLAY9vxxBFLLHvQMHkLjQN5fhVUyTT7
 CYZHvNQIMRnRmgKMaJt9OOB1wAM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ed960362c54998475b88f97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 20:57:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86B0DC433A0; Thu,  4 Jun 2020 20:57:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14351C433C6;
 Thu,  4 Jun 2020 20:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14351C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Date: Thu,  4 Jun 2020 14:57:09 -0600
Message-Id: <20200604205710.3167-6-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604205710.3167-1-jcrouse@codeaurora.org>
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
Subject: [Freedreno] [PATCH v7 5/6] drm/msm: Set the global virtual address
 range from the IOMMU domain
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Takashi Iwai <tiwai@suse.de>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use the aperture settings from the IOMMU domain to set up the virtual
address range for the GPU. This allows us to transparently deal with
IOMMU side features (like split pagetables).

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..3e717c1ebb7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
 	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
 	struct msm_gem_address_space *aspace;
+	u64 start, size;
 
-	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		0xfffffff);
+	/*
+	 * Use the aperture start or SZ_16M, whichever is greater. This will
+	 * ensure that we align with the allocated pagetable range while still
+	 * allowing room in the lower 32 bits for GMEM and whatnot
+	 */
+	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
+	size = iommu->geometry.aperture_end - start + 1;
+
+	aspace = msm_gem_address_space_create(mmu, "gpu",
+		start & GENMASK(48, 0), size);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 3a381a9674c9..bbe129867590 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	/* The arm-smmu driver expects the addresses to be sign extended */
+	if (iova & BIT(48))
+		iova |= GENMASK(63, 49);
+
 	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 	WARN_ON(!ret);
 
@@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 
+	if (iova & BIT(48))
+		iova |= GENMASK(63, 49);
+
 	iommu_unmap(iommu->domain, iova, len);
 
 	return 0;
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
