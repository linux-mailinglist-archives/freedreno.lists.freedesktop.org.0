Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1DB9EB719
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 17:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8310E2CC;
	Tue, 10 Dec 2024 16:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agP7q0t+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D8810E2CC
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 16:52:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-724f0f6300aso6725526b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733849520; x=1734454320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
 b=agP7q0t+yp5XSlNzYPV3LmDSnvmRWMlGeNj8uanziYybr+SXl59boK5MM72LvoOHts
 nn1RAe5RCD8kJBTlzxMtMqFmUnd4xHlgBiizvyv6kSl5U7DxaHcwhPu8+lVPK8KxlbQa
 oS6D+stRD/WrZgKenx4KtkWbxheKnvKYTMa5JjtFdFAkOOKGvJ21QNum9m1ulFhFtsP2
 0nLqpCq3gJTo2zl+5I+B+P+5L4KepmM9hRMx4SIQHu9ylG9NMu6OvH8G8uRh5tjOaTgg
 fG9NCBULh/VGa7DoSb4q9HznUfVIBIyY2uiJG/TVBAx0StrbcdxWmvZfOjHiZEE1mKsN
 vs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733849520; x=1734454320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
 b=QlYsaxn94Xda22kfdBhfCi5vsdH2UinEdJPRq36oE1oauKgHkpDDuxE2hpwDZfiNHt
 V27Khjn/33YVzYjFJakmh9fiDcMlfxlXpywClZHELomCwOYNWOa6QHaJ4Cd+45KdK6Sa
 ZwkrfbwApvJfU6K7jFcLwR0sNnXqG2mHehrFslPsneD8gmdvw3ZZJhbPURY+3Fpc4WHs
 uXmfIETD/bVcIZCltTHY5F4+SiuXt9XFp6kTShUfv/hxN8UbRqEnRi2Oy6ml+xeYBnkJ
 G7+46M/eX0pY1Ks5qhC8L7ldh4BOI6uY2wOYDSDYYtwrY7kLadDZKcG9zaMDmP9gmavY
 DS8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnVKdrC45P2blDWjXzDnIUOmWXEJrT/gp55LyYjTJRQHfS5H3xHyunfPRPdd6I4tLg+OZch6LOVic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEjeH23qkEKGtz1CiRFgCXxOG2liJOmGChAMOYFNFXafkyK6cN
 nKluamwmHAqJGksWRpJtMKDV4keqhgNu7FQ2Xy4rvv5NOCVW760j
X-Gm-Gg: ASbGncty7b9lqYNTcmyCw6ns6cPLxuNYCLoMC00kYGI6/P7Uke1F46uBESMeVX9OolE
 QMA2X7zLyTop8UUEdS1mW9RSLaSRZxXcqVuGgpme7/aWPzNHLR9y/jINmDXmksDNfHlCOkufX2t
 bMYs9ntWv5tvYpCj8FX9be8LhHFV1XDbNqkE4yUeY0tC3KTWd7EuOFWBZDr3SgTwt/hnXHRoId5
 QOofMvDN2nBD4FoePYfurWUi01TMtTKmWHUKZAu8UQRQxzFf7obSVWnsCMti6UcaEaRyAnL7dEh
 tZiv8Fwkuwa9C7BvGiLEhEZKDPS5hn4=
X-Google-Smtp-Source: AGHT+IH1n6c0fXB/5rusM6KflQSKemThS3VyuHQY8wT9jvY3JVEpZqXFRbfZPqjeknRfEZ0z87Krzw==
X-Received: by 2002:a05:6a00:c89:b0:725:f376:f4ff with SMTP id
 d2e1a72fcca58-7273cb14556mr7832493b3a.13.1733849520359; 
 Tue, 10 Dec 2024 08:52:00 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7261829be9dsm3195343b3a.89.2024.12.10.08.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:51:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue, 10 Dec 2024 08:51:21 -0800
Message-ID: <20241210165127.600817-4-robdclark@gmail.com>
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

Add an io-pgtable method to walk the pgtable returning the raw PTEs that
would be traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 26 ++++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 88b128c77893..c51c48851f9f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
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
@@ -937,6 +962,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
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
2.47.1

