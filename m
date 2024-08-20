Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51312958CFD
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2024 19:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E3C10E7ED;
	Tue, 20 Aug 2024 17:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H1lzsy+4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EA610E673
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 17:17:16 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-202318c4f45so28803615ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724174236; x=1724779036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fyhtVpDgygfT5fUkGsgqPbatgiu5TzPiPLAt109+iE=;
 b=H1lzsy+4qAHvxtWyoS1FgujMbQ3LizWeMupgGMAlOFMs9hnQ226HURMME6rcmOvBsL
 2fniSshj3yR8ZN3syRrRi9pgNm2SVxPBK37uunETomu0FVQdkVLvBsZyfYmyEGgzLml3
 fS2fh7ig0utvGAHTmc1OPkr/UCQRBslAe9JswE0EaQZeN/xJ+tnie9LYGG9iFxJn3mr4
 ou8LJ8uMB0reIcIrWfUSFG+y+Skbz0uG/xbhMywm3PAWjymPScXe0KmE1dGYWfJa7GrJ
 gCUZCmojmOy0fDKPSJnsvpjS+T8oFFngNK/M3AXP8hzRzoeoHYnQnupdjEC9WwuyaLK9
 viKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174236; x=1724779036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fyhtVpDgygfT5fUkGsgqPbatgiu5TzPiPLAt109+iE=;
 b=m+7tvT2SnEcskLfFTutUsnG0OFIHC+0Ia8Y93nEd5GPuIDkgkvsIvwUOkc8hXQmz2w
 vDeF3YH/gsAAxu9zAgp7wH426iwwwGNZelx8heA7K5F1+8Gg+ksHDuTxNKpnEmlgBfef
 UGDLpkLWrIMwoIl9+H7sCiK6Yqjckpg6qpxUcneMoKU0GPRiWANZrSGIdpv4DVQDoAJq
 aQ1lVmT2aaoCk/Q6OsEjFHgu1plH3+uOZgLBFr0WPO8JN/uBYNV88UcuZ6Gh5n5zA4hy
 F/rwng0TjTgDWPfbzPYJ/KwKMcI8plUD5EQh4jmgFTt6QrSC7Z17+ay8Zs1cTYeQmJBT
 ycqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPuh9Qek4EmKvY/amfKXFNFN1Zrk5aJChFUH7bfqjoc80AJTci8NqYprP+0oK9EhXbcVXIEvHLG2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWLwqf+iDdZUzT3mell6eggW/6Fv4O7Br3ADOXY5YBB0FmV/wz
 H77XC9hxSok6DbMLNAWzpSn+uZNQaCWehA8kGYOMJmhn5wZlCRjc
X-Google-Smtp-Source: AGHT+IG89nPNiTxJdoeWAd4I9+Nt1kCBeEpf+Ehrfj9fghEkvWbqdwi+s8kDEywa2ecTlYbOssqipA==
X-Received: by 2002:a17:902:e549:b0:202:671:e5bd with SMTP id
 d9443c01a7336-2020671f9b0mr167387315ad.42.1724174235653; 
 Tue, 20 Aug 2024 10:17:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038b303sm80401575ad.192.2024.08.20.10.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 10:17:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue, 20 Aug 2024 10:16:46 -0700
Message-ID: <20240820171652.145673-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820171652.145673-1-robdclark@gmail.com>
References: <20240820171652.145673-1-robdclark@gmail.com>
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

Add an io-pgtable method to walk the pgtable returning the raw PTEs that
would be traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 5fa1274a665a..a666ee03de47 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -759,6 +759,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte pte, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[data->level++] = pte;
+	return 0;
+}
+
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 void *wd)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_walk_data walk_data = {
+		.data = wd,
+		.visit = visit_pgtable_walk,
+		.addr = iova,
+		.end = iova + 1,
+	};
+
+	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
+
+	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -928,6 +952,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index f9a81761bfce..76eabd890e6a 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -174,12 +174,26 @@ struct io_pgtable_cfg {
 	};
 };
 
+/**
+ * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
+ *
+ * @ptes:     The recorded PTE values from the walk
+ * @level:    The level of the last PTE
+ *
+ * @level also specifies the last valid index in @ptes
+ */
+struct arm_lpae_io_pgtable_walk_data {
+	u64 ptes[4];
+	int level;
+};
+
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -193,6 +207,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.46.0

