Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB30AAE2E8
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 16:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57C10E809;
	Wed,  7 May 2025 14:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Urf0EJeS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EEF10E809
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 14:30:00 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-af548cb1f83so6665936a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746628200; x=1747233000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
 b=Urf0EJeSDANoHXwfP1Lk30zVNoR6c4KmztUHq3hoRk1Fdhdoa+ap//wkKuvyUdDW70
 JsktfBQynPdVDox4XhyqRFZT/P4PQxmFNxvXciI1O8Si34S2zEuivWRv89yiBlzO5B6B
 +6UZ5pk/citnb3NsLkxeTj+1DOiz8usTd+NIM6M++P5HvVzIl7BbcGR9AdbPEBmVlHVF
 Kq9Z0OB7+6/KCXOKdfsMt88Evrf6+9emBazxl0Md1HZ19RfD7E1oFHj8Ov/PRjEOlMks
 cOKVA5QXzzi0GA/cR868S/tdJSaZMV5BZh0BLlR2qjSveZBXsBNzbN25C4v4ElPwcVRD
 /zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746628200; x=1747233000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
 b=s93SgJprW2LcOj55eQqY8YUyGfCfTzsap7qV31g25J4Z1nK+n7GaaO+3uADqMLvybD
 47c4rCybzd/XaAOuQP3l8e6bVQJOlvhctLQz7k30pN9M23Cu497Z8QeBZLjMuFfOWTr3
 YFZiu02h5ogTKYRW0sAkmkVcHHa2YQYeKX01e/yI++U822FI3z+2SGgLxDWN+sIS2Yo6
 NiTyszKJwYV9ayHTSCYFAcbp7ug6Zj2FPvJlmdxW1W1qjCSxoClz6Gul6wtFXtYNUkQf
 a00+IyXtdSe1hKE2H1L1RDeDhO1eMF1z+YkOKovAcyF99hNEQZ2vmPCIrvJvROJFTISb
 sLYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfA2RZjDQ15KIQgVpTVjgNTcE+4YnRJ5cONmbfVS4MfTUn000V3B5m0aDQaWSl1uqYudwkSdie1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq9d+BZ0KjwlRvWqbu+ngOyFS5fAa/CdIPdKMQ8isKUh0ax+GF
 OTHhZRo7YDJAlv8h2aaMF5Zn2/2rOCnFHgdvLn/KI+MP9NDLJuMF
X-Gm-Gg: ASbGncv2Hei2mwLKZjrUpXyJZQYg/5xsRCB8sEqQ8S7EKb1rnJr23m6mTwtire1yIwf
 cn00LGiMcLX45/o7eMJEsDImc7wSqrM8nHkkauUv+sDKYFx2KJZWgSG2hLpkHdGqhXj9EYyyW+v
 55VAHLib/TNedFoc9TUThjF2WAN7HnJyel2W4t909YVVNoCRVF3JpdR4HuWplRljs+lw9mwS4oC
 LBTHCNivrGPqta0ZPfDk40d4znsyrKo8RiUkzAHsDyNuKTGcHTil4Is4tNGc7JRZNaRGV295YHe
 eLdF/GQPRTSAiVd8OcboAyfon+1V9ZcH/GY+HnKQnGBI3HwSm6V4yeUTWNz5LBu3I7IOFuXDCvS
 8iVar6YcK+1AqH88=
X-Google-Smtp-Source: AGHT+IEfTnLrQfaILn2a1qg9FhcKbdkfEWk7UApwdzBZ8svWHw/KZHdECBQt/Ccuap4IqQpbIJLUkg==
X-Received: by 2002:a05:6a20:3950:b0:20b:a75e:fa32 with SMTP id
 adf61e73a8af0-2148d42d024mr5379907637.40.1746628199672; 
 Wed, 07 May 2025 07:29:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fd2f96ec2sm5819027a12.13.2025.05.07.07.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 07:29:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Wed,  7 May 2025 07:29:51 -0700
Message-ID: <20250507142953.269300-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In situations where mapping/unmapping sequence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Now that there is a quirk, we can also drop the selftest_running
flag, and use the quirk instead for selftests.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Sending v2 stand-alone, since I'm not quite ready to send a new
iteration of the full VM_BIND series.  And with selftest_running
removed, I think this patch stands on it's own.  (And maybe there
is still time to sneak this in for v6.16, removing an iommu dep
for the VM_BIND series in v6.17?)

v2: Drop selftest_running and use IO_PGTABLE_QUIRK_NO_WARN_ON for
    the selftests

 drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..a535d88f8943 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -253,8 +253,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 	       (data->start_level == 1) && (oas == 40);
 }
 
-static bool selftest_running = false;
-
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
 {
 	return (dma_addr_t)virt_to_phys(pages);
@@ -373,7 +371,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 	for (i = 0; i < num_entries; i++)
 		if (iopte_leaf(ptep[i], lvl, data->iop.fmt)) {
 			/* We require an unmap first */
-			WARN_ON(!selftest_running);
+			WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 			return -EEXIST;
 		} else if (iopte_type(ptep[i]) == ARM_LPAE_PTE_TYPE_TABLE) {
 			/*
@@ -475,7 +473,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +647,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += unmap_idx_start;
 	pte = READ_ONCE(*ptep);
-	if (WARN_ON(!pte))
-		return 0;
+	if (!pte) {
+		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
+		return -ENOENT;
+	}
 
 	/* If the size matches this level, we're in the right place */
 	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
@@ -660,8 +660,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
 			pte = READ_ONCE(ptep[i]);
-			if (WARN_ON(!pte))
+			if (!pte) {
+				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 				break;
+			}
 
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
@@ -976,7 +978,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1082,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1320,7 +1324,6 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 #define __FAIL(ops, i)	({						\
 		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
 		arm_lpae_dump_ops(ops);					\
-		selftest_running = false;				\
 		-EFAULT;						\
 })
 
@@ -1336,8 +1339,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	size_t size, mapped;
 	struct io_pgtable_ops *ops;
 
-	selftest_running = true;
-
 	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
@@ -1426,7 +1427,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		free_io_pgtable_ops(ops);
 	}
 
-	selftest_running = false;
 	return 0;
 }
 
@@ -1448,6 +1448,7 @@ static int __init arm_lpae_do_selftests(void)
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
 		.iommu_dev = &dev,
+		.quirks = IO_PGTABLE_QUIRK_NO_WARN_ON,
 	};
 
 	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index bba2a51c87d2..639b8f4fb87d 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -88,6 +88,13 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
 	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
+	 *
+	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
+	 *	mappings, but silently return -EEXISTS.  Normally an attempt
+	 *	to map over an existing mapping would indicate some sort of
+	 *	kernel bug, which would justify the WARN_ON().  But for GPU
+	 *	drivers, this could be under control of userspace.  Which
+	 *	deserves an error return, but not to spam dmesg.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
@@ -97,6 +104,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
 	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
+	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.49.0

