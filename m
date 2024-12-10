Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB59EB713
	for <lists+freedreno@lfdr.de>; Tue, 10 Dec 2024 17:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E7310E5D0;
	Tue, 10 Dec 2024 16:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lx+ACac+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6210E930
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 16:51:48 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2163b0c09afso27465835ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Dec 2024 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733849508; x=1734454308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
 b=lx+ACac+wKOX3yG0ILv+LSQn5jSwqfm9bWTBRMuii+SedpSv9feJCxA/tYqgSxxcn/
 KOdckaB2NiWR4zVReuy82Yt7G+1fmc3RVxrdoSOa15lvHSYt+Gok3zMaOYF1iJqEbWhI
 +fokDW8f0VkI5euDdIrnimgKnI1gTygHZM41TQCsn+0c3ZJdlZw/Q0LZVwP2sBsNeoEx
 5SkMZ8vshTLKhJWVsMqnEix9cDd9c9CqnuF8WNjhqEKsuzjCHtkgT3Ab8/7b+L4onefu
 RZRYOuKmZKWd7uz8O5KQ7bTgBJGrCSHp5UY8dreVoQqklLHEDOVCAA/UtMVbF+HvNR/k
 ePrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733849508; x=1734454308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
 b=sD2bqF7S2s4rezmQtDKEmoWE3bmEfx2IiamM+LMRlGfAF4ODeB1CZ8XfClYSFgMJRx
 P/mq5EvEf0Blglh76d8OCL8dIk8Xq2WbW7sENJRd7NRPU/67zQ/gYz2WIgKynfDSvV+8
 TJtLWoq9Z7kRWG7k+qZoASulYbdfJdJz2QTFfKrH6s/oVkIKJd8BA5/6aDxQ0Vzhy4C+
 hQHbQnO5RRRVybetPPw2QeHxNSjUqTncsspC/z58F2mmTE8vHIg+4XV/7ASd7M9lrtpd
 xp3wK7SHfBV423Gp+2eJcY2oFPE5yAfmLVFIgAZVSHI4lSYO/iPOVEE+yLch2K856lIV
 d1Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWymy6xcJFVvQI3mXuF+ylwkxgDmn6QUj2PzsXtJcQD5HS/1721N0qvIYaxCeN8zLfkmz+nLHWkI4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1h2s3Rjf3ar0a8k+5XtvXOY9zUkXp2m/m4TPI4FaNGPdp5HY3
 yLxdepCNDpoGyRbaHPPJlR0LuhHYHVrcUSG19rYkVY3FrqtABaG1
X-Gm-Gg: ASbGnctpeK8Ozi2wx+k9gEktwIlf4HyyZ51k5Q30egYwt1zFJHsZx+xHQb6C7wb05w9
 Swv4hbOTwiicHtRJZWmBFePuphR8Y1KDKG0PxH5geyocwk8ZE1N66YcUGo39IqnA4Xvseww17n4
 GgviX4DkoML78amE4YaeBWvmpmmUhOFthXn/hyjnsrsW1XXO1CmrhKi8SosQvGmA+LPoGwjy+dD
 +JCg2LMsaXfEy96XEjiBrjkQUl0CNdWKlL46hUvrpaay0XJVfSz8++1BZF5lwv2VCLDAGlmfSPh
 uIidnO/w0zUi4H2A7wY0aBxBM7KV
X-Google-Smtp-Source: AGHT+IHS0LaxpkQDW28nSbT1wx8gEP6+R1uzXYbRGTNeVekseOAHAqPvkFtV0qVh9HekmfV/jSF44A==
X-Received: by 2002:a17:902:d2c5:b0:216:725c:a122 with SMTP id
 d9443c01a7336-216725ca362mr51995685ad.19.1733849508260; 
 Tue, 10 Dec 2024 08:51:48 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f093a3sm91911265ad.192.2024.12.10.08.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:51:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for
 iova_to_phys
Date: Tue, 10 Dec 2024 08:51:20 -0800
Message-ID: <20241210165127.600817-3-robdclark@gmail.com>
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

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e9c0f8ae138..88b128c77893 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte pte, *ptep = data->pgd;
-	int lvl = data->start_level;
-
-	do {
-		/* Valid IOPTE pointer? */
-		if (!ptep)
-			return 0;
-
-		/* Grab the IOPTE we're interested in */
-		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
-		pte = READ_ONCE(*ptep);
-
-		/* Valid entry? */
-		if (!pte)
-			return 0;
-
-		/* Leaf entry? */
-		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
-
-		/* Take it to the next level */
-		ptep = iopte_deref(pte, data);
-	} while (++lvl < ARM_LPAE_MAX_LEVELS);
-
-	/* Ran out of page tables to walk */
-	return 0;
-
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
-}
-
 struct io_pgtable_walk_data {
 	struct io_pgtable		*iop;
 	void				*data;
@@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = *ptep;
+	data->lvl = lvl;
+	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_data d;
+	struct io_pgtable_walk_data walk_data = {
+		.data = &d,
+		.visit = visit_iova_to_phys,
+		.addr = iova,
+		.end = iova + 1,
+	};
+	int ret;
+
+	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+	if (ret)
+		return 0;
+
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (!iopte_table(pte, lvl)) {
 		return -EINVAL;
+	}
 
 	ptep = iopte_deref(pte, data);
 	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
-- 
2.47.1

