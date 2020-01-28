Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452614C2CC
	for <lists+freedreno@lfdr.de>; Tue, 28 Jan 2020 23:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B386F439;
	Tue, 28 Jan 2020 22:16:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB46F439
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2020 22:16:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580249789; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Llw2kTJ4XUeuT4T/F2T53za68YIhWHzkSvM16vklV7s=;
 b=l5IKg7VnotA9+Yh5Y70o5/v7aR8P4B5eZypY3nO5qbhedv+Oo7/D3Wuzmu+76IEjsLr6j+3W
 IFvH82AtjhuEXBUV0P2MySMKxOaRuQG3JlK9uBDEjbSTJvGS6eORcp7tX3gzeq6dZ9TbzY6m
 doRXsTjMRExTL1oEPWOh9X1r52k=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b2bc.7f1adef063b0-smtp-out-n01;
 Tue, 28 Jan 2020 22:16:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22C9DC447A6; Tue, 28 Jan 2020 22:16:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 143DFC433CB;
 Tue, 28 Jan 2020 22:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 143DFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Date: Tue, 28 Jan 2020 15:16:10 -0700
Message-Id: <1580249770-1088-7-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
Subject: [Freedreno] [PATCH v1 6/6] drm/msm/a6xx: Support per-instance
 pagetables
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 will@kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for per-instance pagetables for a6xx targets. Add support
to handle split pagetables and create a new instance if the needed
IOMMU support exists and insert the necessary PM4 commands to trigger
a pagetable switch at the beginning of a user command.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9bec603c..e1a257e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -12,6 +12,62 @@
 
 #define GPU_PAS_ID 13
 
+static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		struct msm_file_private *ctx)
+{
+	u64 ttbr;
+	u32 asid;
+
+	if (!msm_iommu_get_ptinfo(ctx->aspace->mmu, &ttbr, &asid))
+		return;
+
+	ttbr = ttbr | ((u64) asid) << 48;
+
+	/* Turn off protected mode */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn on APIV mode to access critical regions */
+	OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
+	OUT_RING(ring, 1);
+
+	/* Make sure the ME is synchronized before staring the update */
+	OUT_PKT7(ring, CP_WAIT_FOR_ME, 0);
+
+	/* Execute the table update */
+	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, upper_32_bits(ttbr));
+	/* CONTEXTIDR is currently unused */
+	OUT_RING(ring, 0);
+	/* CONTEXTBANK is currently unused */
+	OUT_RING(ring, 0);
+
+	/*
+	 * Write the new TTBR0 to the preemption records - this will be used to
+	 * reload the pagetable if the current ring gets preempted out.
+	 */
+	OUT_PKT7(ring, CP_MEM_WRITE, 4);
+	OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
+	OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, upper_32_bits(ttbr));
+
+	/* Invalidate the draw state so we start off fresh */
+	OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
+	OUT_RING(ring, 0x40000);
+	OUT_RING(ring, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn off APRIV */
+	OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
+	OUT_RING(ring, 0);
+
+	/* Turn off protected mode */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 1);
+}
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -89,6 +145,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
+	a6xx_set_pagetable(gpu, ring, ctx);
+
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
 		rbmemptr_stats(ring, index, cpcycles_start));
 
@@ -878,6 +936,36 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space*
+a6xx_create_instance_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace;
+	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
+
+	if (!iommu_dev_has_feature(&gpu->pdev->dev, IOMMU_DEV_FEAT_AUX))
+		return gpu->aspace;
+
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return gpu->aspace;
+
+	mmu = msm_iommu_new_instance(&gpu->pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return gpu->aspace;
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "gpu",
+		0x100000000ULL, 0x1ffffffffULL);
+	if (IS_ERR(aspace)) {
+		mmu->funcs->destroy(mmu);
+		return gpu->aspace;
+	}
+
+	return aspace;
+}
+
 static struct msm_gem_address_space *
 a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
@@ -951,6 +1039,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
 		.create_address_space = a6xx_create_address_space,
+		.create_instance_space = a6xx_create_instance_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
-- 
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
