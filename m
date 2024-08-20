Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73789958CFA
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2024 19:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5330210E65C;
	Tue, 20 Aug 2024 17:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjMyKADE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAF910E65C
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 17:17:13 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20208830de8so34648215ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2024 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724174232; x=1724779032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2hM9IXnWJCIXdGneHBR3ODZityq3OdYqAzA4dSYz3U=;
 b=PjMyKADEKzDwe1woMvLSAKi/qkSz2/N8KR5NKwym6YCQqRevlJF2UT+ecpJJG6DOfK
 pKDcj3NAZcaYenlgrh4HbbA6sJt14/XUJAna/jIZfwRIZmOj+UiNpiP8ZpYjwgVyps5x
 oG13RqFqsFiDCnfNZK8A7tB+uST0TNLRbSSsik4W6SOdVZe73RrDpXOxuY9Fapsx/ehs
 /8q5cTe23TvDp1irJc6bKoRG6YdOR3MBPzZTt5IdmWye+UIV8ulBOxk6uWaGsmf9qLS9
 6a2dXGjCpY77nj4TgpEFKuf2S2wbPly7We8074zM6Se69bm2xeuPtCftiwSvOoY2IFsB
 VFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174232; x=1724779032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2hM9IXnWJCIXdGneHBR3ODZityq3OdYqAzA4dSYz3U=;
 b=C+qN0suPqx+WDIUEVselLkI2ojmNcYg3g3z8sFilH12hHKlwSmcpJ7MTeqHf6kfB2n
 5stCdUQ7S92l1FHHS9h/iV4uFCqEg/lzGftt6BSWbRVaXKZAmLuGfJBv8VjGmwT0A7SW
 AYSIX3I5WjI7AR6tDvQVEkLkdiMYkFk9owUAyfhlXe2IKBKU7mLaBQx2aDtUEgHJ3Zlf
 fTbtMtTWB08q7Cbs9KZ+/b1BfowJot62dnfXLofSUrgXPSBqNiJJYfwPQn1pZGDEhPRw
 y19xiHVkopbb2zpi0sp1mMFCP7fr2f6wyDx7m7fbkrAewxdo3CtLB5qj3zDPwXOdlUF9
 njfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wON28WEa9i539YXPMz7W/g3jz3zPNMJSbKPUFhlcyBllEbzY7AKtyYjLxi+a4KZ76ltxfNCjqpWkHgHhyxDAk0d6OOeFvnlw1hA8XEJH
X-Gm-Message-State: AOJu0Ywe3Ysk6G95Jyigd7OvMS7GltG+dHvoLOierqdJFqVap/y/rlka
 BzMnAIx6C0beJcez+pQ46VJN3Yd2UBVScavk7oA0wqFZANyH/2gS
X-Google-Smtp-Source: AGHT+IHS+4WBqpl7XNll/ytEzf6YHrvGP09TiR7krwtGsSYQlPFlo0KfVRx52A+btS5AqAL/na8UQw==
X-Received: by 2002:a17:902:db10:b0:1fb:4a57:7cba with SMTP id
 d9443c01a7336-2031512dbbbmr29303395ad.34.1724174232313; 
 Tue, 20 Aug 2024 10:17:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f0303285sm80066795ad.26.2024.08.20.10.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 10:17:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for
 iova_to_phys
Date: Tue, 20 Aug 2024 10:16:45 -0700
Message-ID: <20240820171652.145673-3-robdclark@gmail.com>
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

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 73 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index b4bc358740e0..5fa1274a665a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -710,42 +710,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
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
 	void				*data;
 	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
@@ -760,6 +724,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte pte, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = pte;
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
@@ -776,7 +775,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (WARN_ON(!iopte_table(pte, lvl) && !selftest_running))
 		return -EINVAL;
 
 	ptep = iopte_deref(pte, data);
-- 
2.46.0

