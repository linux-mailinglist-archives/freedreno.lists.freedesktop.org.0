Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581C2E03C3
	for <lists+freedreno@lfdr.de>; Tue, 22 Dec 2020 02:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3196E829;
	Tue, 22 Dec 2020 01:22:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E306E0A1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Dec 2020 00:45:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608597910; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1bjQCUDo6TkclQdX/S/yzQuV1vY9gcmjTKp7aSEvBh8=;
 b=sJ+5B8lPQxiGv/CX1VSOVxnS3QA2zjYmo6pefhQaD+7eZoZme3Ivssrs2Vl6QmHcmTq92jl5
 HpnJ4QnuKAjvg6bFIb2FqDK4r/rAMq3W1cX8TNXeIVNl4dAaI/2SyipVMeP5Kmxa4RFnV+Ni
 qsh3DXLpDc8xUu1s4nR9YB8Dzvs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fe1418b7036173f4f1de603 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 00:44:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5AA12C43463; Tue, 22 Dec 2020 00:44:58 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EBEE0C4346B;
 Tue, 22 Dec 2020 00:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EBEE0C4346B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date: Mon, 21 Dec 2020 16:44:36 -0800
Message-Id: <1608597876-32367-8-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Tue, 22 Dec 2020 01:22:03 +0000
Subject: [Freedreno] [PATCH v2 7/7] iommu/io-pgtable-arm: Allow building
 modular io-pgtable fmts
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
 pdaly@codeaurora.org, kernel-team@android.com, joro@8bytes.org,
 robin.murphy@arm.com, pratikp@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now that everything is in place for modular io-pgtable formats,
allow the ARM LPAE and ARMV7S io-pgtable formats to be built
as modules.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/Kconfig              | 4 ++--
 drivers/iommu/io-pgtable-arm-v7s.c | 2 ++
 drivers/iommu/io-pgtable-arm.c     | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 192ef8f..7e4f44f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -30,7 +30,7 @@ config IOMMU_IO_PGTABLE
 	bool
 
 config IOMMU_IO_PGTABLE_LPAE
-	bool "ARMv7/v8 Long Descriptor Format"
+	tristate "ARMv7/v8 Long Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	help
@@ -49,7 +49,7 @@ config IOMMU_IO_PGTABLE_LPAE_SELFTEST
 	  If unsure, say N here.
 
 config IOMMU_IO_PGTABLE_ARMV7S
-	bool "ARMv7/v8 Short Descriptor Format"
+	tristate "ARMv7/v8 Short Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || COMPILE_TEST
 	help
diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index a5cb755a..9d9f08f 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -1015,3 +1015,5 @@ static void __exit arm_v7s_exit(void)
 	io_pgtable_ops_unregister(&io_pgtable_arm_v7s_init_fns);
 }
 module_exit(arm_v7s_exit);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e8b1e34..e0de4ad 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1299,3 +1299,5 @@ static void __exit arm_lpae_exit(void)
 		io_pgtable_ops_unregister(&io_pgtable_arm_lpae_init_fns[i]);
 }
 module_exit(arm_lpae_exit);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
