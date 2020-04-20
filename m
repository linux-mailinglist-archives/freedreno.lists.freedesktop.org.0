Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700431B0DB7
	for <lists+freedreno@lfdr.de>; Mon, 20 Apr 2020 16:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738086E59D;
	Mon, 20 Apr 2020 14:03:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600576E59D
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:47 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id fb4so4666299qvb.7
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
 b=VbG3OkuzryiADo+SuBJMbjRhDLggqq8Z1nhcUstkpW0HmJY80ivSzoVD2bIoL6+c7I
 Uuz2QniB7Z5CqT94K3NPuYYbVgEk167cNocTu/UlsjOALbqUng7Q1NVdJibuQAanmatL
 DduIC6hLlqo28IdSPd0YwUcYBhPtHmyeb29iL7yLS77UHGjIR2tuLHes5h98hsDaEwQS
 /oKP9LDWnrAJD5oEEpwSKM6ofmER19wQeJE8eZQ42tTaJJFNsy4QFfd4A0MmR+8EvgXc
 1y9+4KleZ3lbmFCkeUINytrZV/azWgy2U9PJ4oZlHOt3Yae9ET3/FjlGOZJty3tL+svC
 NeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
 b=bMC8ZTMvc/Zl0VQWFXdyPlfxukHqLoa20aNtSO1Sisrwtw8cUsT2ES7mieCi7e3PK0
 Dslx8EPKfRMZDCxv92g6zQN5m8MG+pIvb1w7OW4/pghKBVRAtvl4rGTFOiGxIEuZmTbF
 zEB9IdA/obQji/1gkrwrbGfhSwlNu7PE7ADfg23kLYiChqoIxLvwS77+EqWfAJOk9XQm
 /mfidZYdtaGpSlXEzHAFrQOUqb8VFK8UzZu9GLGWezz/yXKiRY+2bMOGoMxcNVMxiu+Y
 7og4y0F4kwK31YGUMl9nEfJx3H8EhreCFXsIMET0pjdp5OW4kqc/ExEIWgRH+SSljmKr
 Uixw==
X-Gm-Message-State: AGi0PubqKZwhwPYFVoh/ArFK86JAshlw5rTPIhbPcqaZpxsl24EPMUwV
 H0msQte+PqlPHDXvQ5qVd3VeABO+5pMoRQ==
X-Google-Smtp-Source: APiQypJbBE+wFH9zAewo04smsE28aAKfYYfnbIhgn83376FC45tY9AalDkIrTnMLrKQ/dym8U3JM0Q==
X-Received: by 2002:a0c:f38d:: with SMTP id i13mr15276070qvk.187.1587391423430; 
 Mon, 20 Apr 2020 07:03:43 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:03:42 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 20 Apr 2020 10:03:07 -0400
Message-Id: <20200420140313.7263-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/9] drm/msm/a6xx: allow allocating GMU memory
 with a fixed address
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd379065f..c6ecb3189ec5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -938,8 +938,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
 	kfree(bo);
 }
 
-static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
-		size_t size)
+static struct a6xx_gmu_bo *
+a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, size_t size, uint64_t iova)
 {
 	struct a6xx_gmu_bo *bo;
 	int ret, count, i;
@@ -964,13 +964,13 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 			goto err;
 	}
 
-	bo->iova = gmu->uncached_iova_base;
+	bo->iova = iova ?: gmu->uncached_iova_base;
 
 	for (i = 0; i < count; i++) {
 		ret = iommu_map(gmu->domain,
 			bo->iova + (PAGE_SIZE * i),
 			page_to_phys(bo->pages[i]), PAGE_SIZE,
-			IOMMU_READ | IOMMU_WRITE);
+			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV);
 
 		if (ret) {
 			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
@@ -990,7 +990,8 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 		goto err;
 
 	/* Align future IOVA addresses on 1MB boundaries */
-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
+	if (!iova)
+		gmu->uncached_iova_base += ALIGN(size, SZ_1M);
 
 	return bo;
 
@@ -1331,12 +1332,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_put_device;
 
 	/* Allocate memory for for the HFI queues */
-	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->hfi))
 		goto err_memory;
 
 	/* Allocate memory for the GMU debug region */
-	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->debug))
 		goto err_memory;
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
