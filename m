Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0D20B9B1
	for <lists+freedreno@lfdr.de>; Fri, 26 Jun 2020 22:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879306E4BB;
	Fri, 26 Jun 2020 20:01:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0E6E483
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jun 2020 20:01:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593201703; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I4mi9KRzY9q8x+8ibjGrJyjF0IRQt7yz1HbGjbPTjwA=;
 b=i7SvGUg0obyzVAJlmoAKWM5glmNM2dhx6kR52Yqenc8dnThtunVAERI+HUO8v86lZlVajY8a
 mS3/M8C0dRdOlBpSL0NbHstZX60P9ao+VnoeHE143jRGpo+IdX3hgwXf9Wbo8ikx8vPlaNd6
 B+aTe+G6YlAcBgJxkZABUFliLcI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ef653f6e144dd5115d691a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:00:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85990C43391; Fri, 26 Jun 2020 20:00:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D8FB7C433CA;
 Fri, 26 Jun 2020 20:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8FB7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Date: Fri, 26 Jun 2020 14:00:38 -0600
Message-Id: <20200626200042.13713-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626200042.13713-1-jcrouse@codeaurora.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
Subject: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
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
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a link to the pointer to the struct device that is attached to a
domain. This makes it easy to get the pointer if it is needed in the
implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 6 ++++--
 drivers/iommu/arm-smmu.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 048de2681670..060139452c54 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -668,7 +668,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 }
 
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
-					struct arm_smmu_device *smmu)
+					struct arm_smmu_device *smmu,
+					struct device *dev)
 {
 	int irq, start, ret = 0;
 	unsigned long ias, oas;
@@ -801,6 +802,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->asid = cfg->cbndx;
 
 	smmu_domain->smmu = smmu;
+	smmu_domain->dev = dev;
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -1190,7 +1192,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		return ret;
 
 	/* Ensure that the domain is finalised */
-	ret = arm_smmu_init_domain_context(domain, smmu);
+	ret = arm_smmu_init_domain_context(domain, smmu, dev);
 	if (ret < 0)
 		goto rpm_put;
 
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 5f2de20e883b..d33cfe26b2f5 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -345,6 +345,7 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	struct device			*dev;	/* Device attached to this domain */
 };
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
