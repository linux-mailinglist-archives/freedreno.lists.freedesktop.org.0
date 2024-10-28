Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE59B3CD5
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2024 22:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D7510E582;
	Mon, 28 Oct 2024 21:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SegWkOzB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0E010E582
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 21:35:29 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-71e983487a1so3505246b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730151329; x=1730756129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
 b=SegWkOzBT+eDP0U59sN3u9K38ERQ6S+MvqwW3pP7mBbsK+WZm8/zyI/IU0FXzJSrBn
 Os4+vfonRj9uChSdBUbqTy49Ep6YOUA4o4yDopc8Wi+jFlnixAaVFk3BdvmemoFBnbrO
 I/FL9Od1aHfRkg4/dzcMOWMDvgg4b63+kIwFKMv54nGb9PNHaPUmvBrVmJ+drVgKFILQ
 zXR2wrkL8Cl7eyhOXsB1Hffb6A5zdzfsMunU3h95k0GN0N+6VosyKEDDU0jZncdSbT+u
 Ji44Qxx/0nBNfeWQhoGS+BfdXkYH8t/BgGk+HyXmnznjhswoGkUJ5nv2iZFyCot+9PSl
 AwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730151329; x=1730756129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
 b=nUdrQQExu/v5EJFj8BaZosHmY/THAX7qSftXsxV8yyY9vRqVjk8HlJmTXKh2gpMgbv
 TCJH6u8iC5HhSv4Bqx/fwzJamU2IHLcdUe04WCgqo5lXTOn1WLjRzeVaaIBFnPi6Xllf
 ulKyIZWRaFPjDjujm8z25Si8EUcuVvRGenqaJwBqev2qIfL1sNt78onYc2AkB+db3xO6
 S0LAn30HmVPL7XlW+nZkXCK/8KoxXUt84SmcRZ8xrtu37+AdnKGIIEjs3PK2wMSgngy2
 WCFPt9XiiyaXnCfJRygJ0Ai9wnR+H4/wzZwqx2VOj5oiVlYLbgMAD9abKuAKUEPS4Sma
 YEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0wyWJXF0XUdZeIEgnc9tWUeYLbZsK2LoebbV0w8WS/IenyAwdJ/GGXUHpk6SmBSotY/iPLV06Bls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqDpoODzKtVQGvuWa9lAGm9t3LM450JSSxYEqpZNMW4pKjYRgc
 TqeS/vuJg2kRooTAhLsiTJzsG1XTUyosSI2PBRUx0vEqlEMGLDc8u07YvQ==
X-Google-Smtp-Source: AGHT+IGJ/vSmxwIqBeNVXBSzAWZP5g2tROL+0Y2wcPzndUVsioqMA6yobuvrQ/JZESgfajh0W3hfHw==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id
 d2e1a72fcca58-72062f86088mr14718581b3a.6.1730151329086; 
 Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205791e4dasm6207770b3a.25.2024.10.28.14.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 14:35:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vasant Hegde <vasant.hegde@amd.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Mon, 28 Oct 2024 14:31:39 -0700
Message-ID: <20241028213146.238941-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213146.238941-1-robdclark@gmail.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
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
index 88b128c77893..6739e1fa54ec 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[data->level++] = *ptep;
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
@@ -937,6 +961,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b1ecfc3cd5bc..d7bfbf351975 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -178,12 +178,26 @@ struct io_pgtable_cfg {
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
@@ -197,6 +211,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.47.0

