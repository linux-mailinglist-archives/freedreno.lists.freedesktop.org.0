Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A693696D943
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 14:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F410E897;
	Thu,  5 Sep 2024 12:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMDaQ67V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814A710E897
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 12:50:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2068a7c9286so7026925ad.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725540607; x=1726145407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AbIcFL6KLZXMYP15JMSrziSxqWJs9UyvqU1aIaWK9pI=;
 b=aMDaQ67VxVeXZaxmaTc9BdYycBF92g3LCwRhqR3tE6s7uES1l7+8zPbw+9Om4MT4KC
 I9aXJ1aDChevq20jstnT3a6sbOAF1aSImQN7Ov7z90dJr/4n1hsQfy8vpLWiF4LCkb83
 zIcBAU8YczDjRU7d32S0dxt+65J3JiQhtfRNO0NKtnFP8pFj4HptrvELdi962bauPWx8
 dXmx5l9sN4jNJRjINBBhs+TS1vNYEOeiHPQDgCBHVlrca1UB/XbUqY2GsIqLBrvUfMRQ
 JwzyME/+YxelWfN0Sp/3pmj85BIO+1J7p9IAse/ccPn7l8a7L/oyWBPAAPBLBNY0aJmw
 VlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540607; x=1726145407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbIcFL6KLZXMYP15JMSrziSxqWJs9UyvqU1aIaWK9pI=;
 b=r6kn4iVraHfl5IxwJRkd3HwQg1Bg08ZYACmwCcdHkKnIfkZAxN4ElEb8leCsykHuLN
 aujU72vWpR85WlgRDMwYp+lNVFJcRJibC0s30fGG488judCbsXEA+hEcCi9cYULpfOuK
 RqzHvDMy43G+Hy3wVkXxXljsk4vSU190gi3rIHQTPAXc9LiIjXRwDf2LpubUp8Bduaru
 JTfIqTP42dJc1/qUuns4f+rxl99lfVf0bBnuk+r/eMOZM8hT0LyrQ1iB/cy8ikuALs5I
 /m4r1jCDbT9Po9OXxnoCJc7WwMAEfh/kJmXCDllusycNEVhs0ZkGfCPU5VkAC4d9xMsB
 c4uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr1hwvpC+oJvNu4O1gNKhBkEY1XfWPIwP8xHMaIQNZLp0mAt3gxgfqRQ6k8mcYhFGJm+HlgZgJUyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6Zhou79/kYg3t/8foiaTdxjDCLjhp9mGWMF4R8U39ECD9LNZr
 7T7WUTTTdunzbs4nE/sOG8OULjKWniW6IoAccrWP+PCwy9fmxr9p
X-Google-Smtp-Source: AGHT+IGWH67j9Ae4z1bWCKkTMqpdz15WdakR2Z0nl3EE0ssMBp8RIbo+r/JoS6LCLi9xCGkqsJVTDA==
X-Received: by 2002:a17:902:ecc3:b0:205:6a9b:7e3e with SMTP id
 d9443c01a7336-20584230d32mr143491935ad.56.1725540606654; 
 Thu, 05 Sep 2024 05:50:06 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea38c91sm28345915ad.169.2024.09.05.05.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:50:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Ashish Mhetre <amhetre@nvidia.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
Date: Thu,  5 Sep 2024 05:49:56 -0700
Message-ID: <20240905124956.84932-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.

It was causing gpu smmu faults on x1e80100.

I _think_ what is causing this is the change in ordering of
__arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
this patch is supposed to work correctly in the face of other
concurrent translations (to buffers unrelated to the one being
unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
stale data read back into the tlb.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 16e51528772d..85261baa3a04 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
 				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
 }
 
-static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
+static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg)
 {
-	for (int i = 0; i < num_entries; i++)
-		ptep[i] = 0;
 
-	if (!cfg->coherent_walk && num_entries)
-		__arm_lpae_sync_pte(ptep, num_entries, cfg);
+	*ptep = 0;
+
+	if (!cfg->coherent_walk)
+		__arm_lpae_sync_pte(ptep, 1, cfg);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -653,28 +653,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
 		num_entries = min_t(int, pgcount, max_entries);
 
-		/* Find and handle non-leaf entries */
-		for (i = 0; i < num_entries; i++) {
-			pte = READ_ONCE(ptep[i]);
+		while (i < num_entries) {
+			pte = READ_ONCE(*ptep);
 			if (WARN_ON(!pte))
 				break;
 
-			if (!iopte_leaf(pte, lvl, iop->fmt)) {
-				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
+			__arm_lpae_clear_pte(ptep, &iop->cfg);
 
+			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				/* Also flush any partial walks */
 				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
+			} else if (!iommu_iotlb_gather_queued(gather)) {
+				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
 			}
-		}
 
-		/* Clear the remaining entries */
-		__arm_lpae_clear_pte(ptep, &iop->cfg, i);
-
-		if (gather && !iommu_iotlb_gather_queued(gather))
-			for (int j = 0; j < i; j++)
-				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
+			ptep++;
+			i++;
+		}
 
 		return i * size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
-- 
2.46.0

