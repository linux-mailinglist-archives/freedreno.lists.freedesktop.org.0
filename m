Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B985F2F120F
	for <lists+freedreno@lfdr.de>; Mon, 11 Jan 2021 13:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4126E09A;
	Mon, 11 Jan 2021 12:04:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C8A6E096
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 12:04:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610366675; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=K/9QPegi5k1JmfnvvHJxNLJQiw128Wqc+4ZBKDNjaMM=;
 b=A+S9L1WrYDks1N8b0v8ocHQJhkS7qVXSTYztWJqsst4pvMwoSxuxs4vgLI0deTy6SB6fBJSr
 ixP0glXgXOsHge360dv/t9xrllwjrnteeHiLirlYFEhAfjW50D948RWqh7rV9vsNFih4OH/l
 2mrVofxB6uKgFKa5Q88zeRmp0MU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ffc3ecd8fb3cda82f544e74 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 12:04:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C5CEC43464; Mon, 11 Jan 2021 12:04:28 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4155C433C6;
 Mon, 11 Jan 2021 12:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4155C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 angelogioacchino.delregno@somainline.org
Date: Mon, 11 Jan 2021 17:34:08 +0530
Message-Id: <79ffb79853104f85d097e65596724411d084d13f.1610366113.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/2] drm/msm: Add proper checks for GPU LLCC
 support
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

Domain attribute setting for LLCC is guarded by !IS_ERR
check which works fine only when CONFIG_QCOM_LLCC=y but
when it is disabled, the LLCC apis return NULL and that
is not handled by IS_ERR check. Due to this, domain attribute
for LLCC will be set even on GPUs which do not support it
and cause issues, so correct this by using IS_ERR_OR_NULL
checks appropriately. Meanwhile also cleanup comment block
and remove unwanted blank line.

Fixes: 00fd44a1a470 ("drm/msm: Only enable A6xx LLCC code on A6xx")
Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 130661898546..3b798e883f82 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1117,7 +1117,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
 
-	if (IS_ERR(a6xx_gpu->llc_slice) && IS_ERR(a6xx_gpu->htw_llc_slice))
+	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f09175698827..b35914de1b27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -200,15 +200,15 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	if (!iommu)
 		return NULL;
 
-
 	if (adreno_is_a6xx(adreno_gpu)) {
 		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 		struct io_pgtable_domain_attr pgtbl_cfg;
+
 		/*
-		* This allows GPU to set the bus attributes required to use system
-		* cache on behalf of the iommu page table walker.
-		*/
-		if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
+		 * This allows GPU to set the bus attributes required to use system
+		 * cache on behalf of the iommu page table walker.
+		 */
+		if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
 			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
 		}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
