Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFAF2E6D0C
	for <lists+freedreno@lfdr.de>; Tue, 29 Dec 2020 02:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ABA892FF;
	Tue, 29 Dec 2020 01:49:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415DD892F1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Dec 2020 01:49:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609206556; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0K5VBSFi9Zn+RM5dSDQee5wwyKqTX6V1so6lTB/p7kQ=;
 b=dkkENSa3H5uAnyncfmAXcZX2V8+Rzn392XZJdbyCkmdANyZeifEjlqv7LiNu650yzDCNAzr2
 f2W0wta9WA0OylcOynIlz+jfFEgiObic/ntrsd3+BfMq4qW2IPdMxsIfB+e0tjSm5ya5qnC2
 zYhtKJp8BYGAf8wUfhwXCZbXrgc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fea8b1acfd94dd328f3cf71 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 01:49:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 72EE0C43466; Tue, 29 Dec 2020 01:49:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AB35C43462;
 Tue, 29 Dec 2020 01:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0AB35C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Date: Mon, 28 Dec 2020 17:48:56 -0800
Message-Id: <1609206541-14562-3-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
References: <1609206541-14562-1-git-send-email-isaacm@codeaurora.org>
Subject: [Freedreno] [PATCH 2/7] iommu/io-pgtable: Add refcounting for
 io-pgtable format modules
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno@lists.freedesktop.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation for modularizing io-pgtable formats, add support
for reference counting the io-pgtable format modules to ensure
that the modules are not unloaded while they are in use.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c |  1 +
 drivers/iommu/io-pgtable-arm.c     |  5 +++++
 drivers/iommu/io-pgtable.c         | 12 ++++++++++--
 include/linux/io-pgtable.h         |  2 ++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 080881b..7e81135 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -839,6 +839,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 static struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
 	.alloc	= arm_v7s_alloc_pgtable,
 	.free	= arm_v7s_free_pgtable,
+	.owner	= THIS_MODULE,
 };
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e1f8d54..8ed52a0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1054,26 +1054,31 @@ static struct arm_lpae_io_pgtable_init_fns arm_lpae_init_fns_table[] = {
 		.fmt		= ARM_32_LPAE_S1,
 		.init_fns.alloc	= arm_32_lpae_alloc_pgtable_s1,
 		.init_fns.free	= arm_lpae_free_pgtable,
+		.init_fns.owner = THIS_MODULE,
 	},
 	{
 		.fmt		= ARM_32_LPAE_S2,
 		.init_fns.alloc	= arm_32_lpae_alloc_pgtable_s2,
 		.init_fns.free	= arm_lpae_free_pgtable,
+		.init_fns.owner	= THIS_MODULE,
 	},
 	{
 		.fmt		= ARM_64_LPAE_S1,
 		.init_fns.alloc	= arm_64_lpae_alloc_pgtable_s1,
 		.init_fns.free	= arm_lpae_free_pgtable,
+		.init_fns.owner	= THIS_MODULE,
 	},
 	{
 		.fmt		= ARM_64_LPAE_S2,
 		.init_fns.alloc	= arm_64_lpae_alloc_pgtable_s2,
 		.init_fns.free	= arm_lpae_free_pgtable,
+		.init_fns.owner	= THIS_MODULE,
 	},
 	{
 		.fmt		= ARM_MALI_LPAE,
 		.init_fns.alloc	= arm_mali_lpae_alloc_pgtable,
 		.init_fns.free	= arm_lpae_free_pgtable,
+		.init_fns.owner	= THIS_MODULE,
 	},
 };
 
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 95e872d..9792e25 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/bug.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/types.h>
 
 static struct io_pgtable_init_fns *io_pgtable_init_table[IO_PGTABLE_NUM_FMTS];
@@ -28,9 +29,14 @@ struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
 	if (!fns)
 		return NULL;
 
+	if (!try_module_get(fns->owner))
+		return NULL;
+
 	iop = fns->alloc(cfg, cookie);
-	if (!iop)
+	if (!iop) {
+		module_put(fns->owner);
 		return NULL;
+	}
 
 	iop->fmt	= fmt;
 	iop->cookie	= cookie;
@@ -55,8 +61,10 @@ void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 	iop = io_pgtable_ops_to_pgtable(ops);
 	io_pgtable_tlb_flush_all(iop);
 	fns = io_pgtable_init_table[iop->fmt];
-	if (fns)
+	if (fns) {
 		fns->free(iop);
+		module_put(fns->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index a460ae1..bdf0a01 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -168,10 +168,12 @@ struct io_pgtable_ops {
  *
  * @alloc: Allocate a set of page tables described by cfg.
  * @free:  Free the page tables associated with iop.
+ * @owner: Driver module providing these ops.
  */
 struct io_pgtable_init_fns {
 	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
 	void (*free)(struct io_pgtable *iop);
+	struct module *owner;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
