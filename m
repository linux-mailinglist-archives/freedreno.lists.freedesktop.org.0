Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C29B3CD2
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2024 22:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EFE10E583;
	Mon, 28 Oct 2024 21:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7gsB+zu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFD410E583
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 21:35:26 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7ea8de14848so2526724a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730151326; x=1730756126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HG6V5IEjg5fR7H7zxvH/yThNTAfW1zJep5mmD3Nzp9E=;
 b=I7gsB+zuw6ig1OK8s0iR6rrfMHVNOsmfMIeiiq39JJdbGJvovzu6BnDChiq6LPxNYO
 ejIyry5eRUxOJNDEi2QVEyuskrUGBesxBf1DHsD35RklfQL8RnvWgylbFe4Ob0n6oKuE
 yTp8/0c0YnIo/ik1xwRaSi0wLJI/hLhOvkU3oZHWtSDjaayQFCUnuqLVSF7m7GlAplpv
 TMyGGeDeOU1Yv/w1DyfcXYXM0xap5U26OOlj2aO9zLOj4GeDwTSDc1nKXF7greU2Rv49
 S1RztZTPpyTQDvySOd9exxID7I0u45l7n+imEm6ZAhkaIoyZLBXcKCgFaaaAx3YS71fl
 2bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730151326; x=1730756126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HG6V5IEjg5fR7H7zxvH/yThNTAfW1zJep5mmD3Nzp9E=;
 b=X15aK0pEV0m/HtlqKO6YIEzeLj8H/+jLjhSGAwrINpfFXS0GXs7kq7kcBmEFq2wYu+
 WaBFncb2kFxy0AWLxxetqZ9Zu0fuGrzEByA9+uctHJw831YEb3kWDfdoTbt+2ZC+pD6T
 gzkJ8QfzzQRTg5UtYvXgSL0qmfhE6TvXbbkkVKdNtGHq0VpltNHo4708PN4Wclygw2iM
 7Le9jOpYqx9YSap2CC1xDnhz2zi+60g+p36U7is4E111/Weh8Fr4F5SAKsO3CQ/G0BM3
 1it3i/aRFaR0VHgJxzE9Fmr3M9J3MXcvjIo1NMofTNbNYQa/3C1hmuOpsFmasujizG6i
 ZkzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX248NK5Cp4ICaYayQFMBjpCNvyqYeoJYpR9Cx7c6ao1Fi3DAv6Fzncq40ifYlNyqRlC4oXEJjIIbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyypHFkUmHokAcazVzGY2Nk33aunqmHCJ9m/Wsn/TRpUG7twP9F
 btGIbUq5Qj5/QS7qIQQBEdsDv2LqglTdyiHFyJ4tHm6wby05dH2Z
X-Google-Smtp-Source: AGHT+IHYfTByDMFcPygEQ50HF0A5OEX5ytobSAKHJ4GmVG1OnJTN978gymeL5m5xxwFxhYlpGaAN7A==
X-Received: by 2002:a05:6a20:4499:b0:1d9:1a3b:85d4 with SMTP id
 adf61e73a8af0-1d9a83b5192mr14212818637.6.1730151325996; 
 Mon, 28 Oct 2024 14:35:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057931a06sm6216898b3a.55.2024.10.28.14.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 14:35:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for
 iova_to_phys
Date: Mon, 28 Oct 2024 14:31:38 -0700
Message-ID: <20241028213146.238941-3-robdclark@gmail.com>
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

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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
2.47.0

