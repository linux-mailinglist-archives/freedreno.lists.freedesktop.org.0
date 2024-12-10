Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6C9EB70F
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 17:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD1B10E3C8;
	Tue, 10 Dec 2024 16:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4jfTvNM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDF010E3C8
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 16:51:47 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2166651f752so18714635ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733849506; x=1734454306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
 b=J4jfTvNMGx8DOl0gqbtH5JcqXQxz7FD7mwxbi9NSFTSVKUt/V+fBV3uLJc16ZSb/Uo
 exy8RahpmZnUc2+agA0ojLewuDufkSjTaIFk1lgPPFoDrIm5mapFNl7hdFwKg12dDCUB
 Q+xxaqJ8ujxODveGTumJuEcE8WS3oGt+qINbMjIgBM7AhCuqVDc2e3J+fBChYPSO08Uw
 /ibhhrK205bkX4nuCLkeZ9CKbuaFdJ5VL1HJsdLAVOZLzDdgjUZDNWZXCKRVET33qIZX
 Hw+XY19e7sxOUBwzXmBHJnLRTpFTt8GMeMXmSK4/SsND488LRSaDjRq/CXcMVQ0E+ty2
 XsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733849506; x=1734454306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
 b=iPZBotvbDjT4YxtpLASDZYFxKHrcqi2EkvkwXtE1QpVzn7OMtSKo4rJTo3EDGrtF3M
 U4WcV9PZfIHaX1x8mOaP9SZU/GK3y8dAptc/n8a03el7gDSQwTR5LjcAwlg3kFRNQ6kE
 YFowM5J76d0YvXf1n+pDDEbYKxOKwKxeKH+egmLaBwzF7ffhAuWfRTW92rQdojC2JIbs
 uA/4JR85bzd7N2+de1O4+jfSLQqb9bff+au/nj7JaBO+JlHDvByGRxL2k+HOIMIohflR
 KLD5JXCe5Ysb7okVbZ3v4EGUAZxBpoo6sPN9pTreGmuAmwEDTex/rgphhzUgetJ2mAUC
 hCgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnhal0UqtdWb3ForR3cXajj3jEPfKagu1ko0+IrFa5DyVqHQr/DxCKCywKA3P9Pq3T3ZayJ63b0ao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8E36atR4PTTvqai6sAVOoGpB73VhtCOCT0xk2Yrc1c+/7u+uu
 VMHG4C57NbWjk0CleM8NvwOzrPMxX7x/HZU7ve8vWOzk4Jww1PSV
X-Gm-Gg: ASbGncvQCh3Y7e9zIck7cYw8wRo7dh0CqS0MLoQo9mkuDfdVHGahy0lqpUHOFPbOsxw
 F1GWe4TcR/faINFHUfM2VB5gHOI2qXpxgnXVUTYdRIWRzmwdqpAmXX2M+uxufxwzUNP0rjWfnlo
 d1OctnQioNc1hdoMW+HviTBYc0imk+tpMjF254Hz5gPoRfds5aVf4onrcFS+8uqIm2R5G01Ux6U
 45nOeg+NHuB/lpPC4Ex1GYXJP7pY2elBAyHyxLwroSBMQRRxueJad7cFxkuYiew/5ORyfdpyAt/
 dhZbigmcgj1DUZX/ePyVLoZHF3SX
X-Google-Smtp-Source: AGHT+IGzJ9YtJRIXUx2WRftwh52jZYFp+OAl8TSYa6XERyxw2e0dtG6AQ2EjYin88gd4uM+Xi+ABrA==
X-Received: by 2002:a17:902:e94d:b0:216:7761:cc48 with SMTP id
 d9443c01a7336-2167761cd20mr46263785ad.40.1733849506543; 
 Tue, 10 Dec 2024 08:51:46 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8ef9fcdsm91889225ad.146.2024.12.10.08.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:51:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
Date: Tue, 10 Dec 2024 08:51:19 -0800
Message-ID: <20241210165127.600817-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
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
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..7e9c0f8ae138 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 }
 
 struct io_pgtable_walk_data {
-	struct iommu_dirty_bitmap	*dirty;
+	struct io_pgtable		*iop;
+	void				*data;
+	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
+		     arm_lpae_iopte *ptep, size_t size);
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
 
-	if (iopte_leaf(pte, lvl, iop->fmt)) {
-		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	int ret = walk_data->visit(walk_data, lvl, ptep, size);
+	if (ret)
+		return ret;
 
-		if (iopte_writeable_dirty(pte)) {
-			iommu_dirty_bitmap_record(walk_data->dirty,
-						  walk_data->addr, size);
-			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
-				iopte_set_writeable_clean(ptep);
-		}
+	if (iopte_leaf(pte, lvl, iop->fmt)) {
 		walk_data->addr += size;
 		return 0;
 	}
@@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
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
@@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 
 	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
 	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
-		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
+		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
 		if (ret)
 			return ret;
 	}
@@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 	return 0;
 }
 
+static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
+		       arm_lpae_iopte *ptep, size_t size)
+{
+	struct iommu_dirty_bitmap *dirty = walk_data->data;
+
+	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
+		return 0;
+
+	if (iopte_writeable_dirty(*ptep)) {
+		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+			iopte_set_writeable_clean(ptep);
+	}
+
+	return 0;
+}
+
 static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 					 unsigned long iova, size_t size,
 					 unsigned long flags,
@@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct io_pgtable_walk_data walk_data = {
-		.dirty = dirty,
+		.iop = &data->iop,
+		.data = dirty,
+		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
 		.end = iova + size,
@@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	if (data->iop.fmt != ARM_64_LPAE_S1)
 		return -EINVAL;
 
-	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
+	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
-- 
2.47.1

