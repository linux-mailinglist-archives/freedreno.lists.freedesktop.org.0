Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B273958CF9
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2024 19:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534D10E7D4;
	Tue, 20 Aug 2024 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SiUDPso1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DABA10E673
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 17:17:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-710ece280b6so4384653b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724174230; x=1724779030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n/7p2U9ieS4fxPWTOeYgrS5HGZLrK9VdS3pHhqiNE0=;
 b=SiUDPso1NN1uRcREytJTYZWMD9BeW41mOiysjzCgjD2jNLm492LeO5fkIrQn66NhOK
 V3H2DSuS//uPGLf85IhDf8kiVhnGXSdB2HELwXbvDl0UVEV5LQ3p4FKYn9ONms+OPEBf
 lBsL5qCfvDwAVtq0CqII/Wb5h6lsWm7THRz9MgV8uSwpMlAuhhf8d6CWhNtVTpifY5R/
 Ace+ndjhX1qekYfABQsD4N9PH9govef6KHM5eYFjg2Yv2UOvZujJE2Fv017eKvIVKgz8
 SESXTGD+Y8XDLyCyLouxu4pRBwPtbo/9xodWncHwUtE8/UqCXyvpHu8wb92h4PbLO9OE
 xA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174230; x=1724779030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3n/7p2U9ieS4fxPWTOeYgrS5HGZLrK9VdS3pHhqiNE0=;
 b=ea9yCLWZggwe+nKqJ4kAebHaatz2ud6m1j+Xc/xrl06e1KiJUfv9idwmRQopDyFYfj
 GvsJZtQycKbxBw+HGXdEBHRVjRF6QJY8jEDBq53xBB7kbSIJI+juMO7kxTxQiHF2Lzp+
 QXlEIk0vjM/tKVMNFnW9OPknGfV2Es8JbX1uhpNY339CkBVo5FZblPs28k9XeiCchMuZ
 k5FDDQ/AFy0BZyg6ASNYWCyMo/2JhFql+C++o0eJS8RdvhTGGaZ8qthzI8+uAAyRwKq+
 P+MdVxxe1PmgYlWACLc00WECw8Kmr0d3PROAyGWMMKbSMoObY8JmPTsRCYSv9sTGyWTF
 gInQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX01ZJ+QTjBNIz85ObGufaNwg/oUkjt3VhHnU5gQXzSVSIeWLxdX8uO+UT/feQl9w5uNUCSMq7Ik6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLNDKOwfhRNQ/qVlwcePgAqcuOhb8G8rsjwSiiQwr2RUzp1SdR
 Fp9qsderNWJErNtaaugR7odK8u6HjQoEipQZmGwBFzM/8EP4ddvz
X-Google-Smtp-Source: AGHT+IGN8V4SYWFCRpzsemtnMPx/Ae6udueJVGLrFDaSeEfYPszwWWE/tbOvS5tDdOuR5xJpXoGzfQ==
X-Received: by 2002:a05:6a20:6f87:b0:1c4:dfa7:d3ce with SMTP id
 adf61e73a8af0-1cad7f954b6mr103988637.17.1724174229744; 
 Tue, 20 Aug 2024 10:17:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f0379031sm80590295ad.159.2024.08.20.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 10:17:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
Date: Tue, 20 Aug 2024 10:16:44 -0700
Message-ID: <20240820171652.145673-2-robdclark@gmail.com>
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

We can re-use this basic pgtable walk logic in a few places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 59 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f5d9fd1f45bf..b4bc358740e0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -747,33 +747,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 }
 
 struct io_pgtable_walk_data {
-	struct iommu_dirty_bitmap	*dirty;
+	void				*data;
+	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
+		     arm_lpae_iopte pte, size_t size);
 	unsigned long			flags;
 	u64				addr;
 	const u64			end;
 };
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl);
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl);
 
-static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
-				  struct io_pgtable_walk_data *walk_data,
-				  arm_lpae_iopte *ptep, int lvl)
+static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
+			    struct io_pgtable_walk_data *walk_data,
+			    arm_lpae_iopte *ptep, int lvl)
 {
 	struct io_pgtable *iop = &data->iop;
 	arm_lpae_iopte pte = READ_ONCE(*ptep);
 
 	if (iopte_leaf(pte, lvl, iop->fmt)) {
 		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
-
-		if (iopte_writeable_dirty(pte)) {
-			iommu_dirty_bitmap_record(walk_data->dirty,
-						  walk_data->addr, size);
-			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
-				iopte_set_writeable_clean(ptep);
-		}
+		int ret = walk_data->visit(walk_data, lvl, pte, size);
+		if (ret)
+			return ret;
 		walk_data->addr += size;
 		return 0;
 	}
@@ -782,13 +780,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
 		return -EINVAL;
 
 	ptep = iopte_deref(pte, data);
-	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
+	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
 }
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl)
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl)
 {
 	u32 idx;
 	int max_entries, ret;
@@ -803,7 +801,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 
 	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
 	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
-		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
+		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
 		if (ret)
 			return ret;
 	}
@@ -811,6 +809,20 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 	return 0;
 }
 
+static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
+		       arm_lpae_iopte pte, size_t size)
+{
+	struct iommu_dirty_bitmap *dirty = walk_data->data;
+
+	if (iopte_writeable_dirty(pte)) {
+		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+			iopte_set_writeable_clean(&pte);
+	}
+
+	return 0;
+}
+
 static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 					 unsigned long iova, size_t size,
 					 unsigned long flags,
@@ -819,7 +831,8 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct io_pgtable_walk_data walk_data = {
-		.dirty = dirty,
+		.data = dirty,
+		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
 		.end = iova + size,
@@ -834,7 +847,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	if (data->iop.fmt != ARM_64_LPAE_S1)
 		return -EINVAL;
 
-	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
+	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
-- 
2.46.0

