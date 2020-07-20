Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134D2263E3
	for <lists+freedreno@lfdr.de>; Mon, 20 Jul 2020 17:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B789C21;
	Mon, 20 Jul 2020 15:41:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966DF89C21
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jul 2020 15:41:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595259679; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=r/yNFTKy3cACuNdHlkj6MWPsfGUj2lizZtThQE0+hs4=;
 b=fewxPqTRophR0YOvyj3GWH0UzQ1KBKZKnW0AmLlmUTy7nri7i96vQMpcLrszzcZRCnJ/aTu6
 X+ukBh9pzaYb+f+FIxM1NnL8tkFrGMeuBhSKyJxlvZ/6aMV0G4cONn8Bb4HGV4P6PPuQE78l
 YAwO2kl0RFPc5oebkAXxT+QSQP0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f15bb1365270fa59527e766 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 15:41:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B78FFC433C6; Mon, 20 Jul 2020 15:41:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E7C0C433AF;
 Mon, 20 Jul 2020 15:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E7C0C433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Date: Mon, 20 Jul 2020 09:40:35 -0600
Message-Id: <20200720154047.3611092-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720154047.3611092-1-jcrouse@codeaurora.org>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v10 01/13] iommu/arm-smmu: Pass io-pgtable
 config to implementation specific function
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Construct the io-pgtable config before calling the implementation specific
init_context function and pass it so the implementation specific function
can get a chance to change it before the io-pgtable is created.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-impl.c |  3 ++-
 drivers/iommu/arm-smmu.c      | 11 ++++++-----
 drivers/iommu/arm-smmu.h      |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index c75b9d957b70..a20e426d81ac 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
+static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705..0e2c65ee9e5a 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -797,11 +797,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->asid = cfg->cbndx;
 
 	smmu_domain->smmu = smmu;
-	if (smmu->impl && smmu->impl->init_context) {
-		ret = smmu->impl->init_context(smmu_domain);
-		if (ret)
-			goto out_unlock;
-	}
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -812,6 +807,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
+	if (smmu->impl && smmu->impl->init_context) {
+		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
+		if (ret)
+			goto out_clear_smmu;
+	}
+
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d172c024be61..38b041530a4f 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -383,7 +383,8 @@ struct arm_smmu_impl {
 			    u64 val);
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
-	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	int (*init_context)(struct arm_smmu_domain *smmu_domain,
+			struct io_pgtable_cfg *cfg);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
