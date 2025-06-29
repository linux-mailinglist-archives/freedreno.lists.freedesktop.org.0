Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D03AED097
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5A10E375;
	Sun, 29 Jun 2025 20:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C205ImoM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D4310E381
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TI0mkV002475
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
 mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=C205ImoMUA3PXX4VdMPfQpZQcpx
 4l/8ebb50L2HtCB2w7fMbd2JYEy6zU+YJwsD0NZm09WUDWWtzqE4BgZ1g84AEBPN
 FvP7Kl7avWNryi3+zsT0mYgQ+HibZOLRF6+EJzkGz3vUP//UyypJ0z/tiFLFqgUf
 /Tfbp4Ky0vXiqoH96aRmlkXjvWsaDfzMrXm3j32Sj9eMEUYNVITa0ybX6DWBsuW2
 VbPa9PjBosu3RvaCfW5FRlu11745OHM6HrGxv78SVQqf+QMPj6tdxxrMgTiMIn4C
 8zvS9kBF6ABT/BOY5ZAd7gyzKh/G/9zNA1DjOXAoVR0D/XlUvrlA9V9UM1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62md4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so4189130b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228225; x=1751833025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
 b=tmBQHuIS7rUtcBx4UP5/Rs9VDey4kGEMvsiKIoDSH7xRq6ndo5MDyV/ZDMrrgHhoCj
 OVVKZNnitw2FUQRoOhT3x512b8KU/bJ7+z7hgzzkVms9Qs5ZF8/J1JaJ9+B8U57PvFAs
 F3xAh+QkDVR9AO50UZi7qNmWiyg9JII8KtNSK9y43LWHQopUnuX0zWjCayGMOivrXBOs
 ujHRd4TxuGuMkhvKJPzHRMI4JEm2uSVDf80MIBNV2Vicp7NvVf35LKjxEYxgw96z66OZ
 L9bV3Ii6aMn1YjHbDeVD1rM/+zHNC7w/yiv5AfrV16jSdqRVVIecvoIDEyvvI9yNNHlH
 W5jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKA2MVI4QBbEFBw1SV7bC1oNw7GKj5fb6AKTcjuTT/4s9d4kfep303Ggw89lCnurI8WXYKruLzqyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoMa0eekXJrVmcABvHUYp9Zr85l6xPi+WirQxrD8b/5UH5vyTs
 gK3WzAilHiqCGj9pmxP6nslr8GE3udZR67AtPShtqQPpnxt+rOCi2b5tjWZvmDSze2DTYZpno8a
 QzPCCb++JacsXNkIfUnsIDGGufTBOK8547vl6Ruc3sjlAYiuIykvMwK755fr8RnFvTqrkjUU=
X-Gm-Gg: ASbGncv52ZTWIhpD5v5ZEh+7cejHotNweaIrCcvdQeUN2xbYHVYgSKxwdwJWv5/ieKq
 DitYcO/7sHRZvtzyXKkV1ltgKIKVxHUXg3zQ5ZAT9rUlwhpcrqZssMfaTWwXjl/vw8BcA9iSQiA
 skqVLIsktKpudSWcSa0Leok1enBfWkYT68GNETqYpTEwyTokvRdZNph2vtl0vI+IEy6F6MZRWE6
 +CyODI4FekOKQQ2s/kJfzhh4BvA8pdqXyrxh9MS6gfBf7SdFRtkQt5pV4bKfNHXEW4kXBre+MaI
 GG8U20VxdMk7YAiVM7sMgxWR/V48dtsWHQ==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id
 d2e1a72fcca58-74af7aef473mr15223410b3a.10.1751228224773; 
 Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0f42J78b5kxB0hNvjroBKsRXjXeZuWzvQV4YS47hMUJFad/41z/IabO6ypJ/hY16UGYkV3Q==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id
 d2e1a72fcca58-74af7aef473mr15223388b3a.10.1751228224324; 
 Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cb98asm7266082b3a.126.2025.06.29.13.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 13:13:15 -0700
Message-ID: <20250629201530.25775-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxkTfpyek9bYV
 /cS4LQILLt7y5x911/2WoCQBYVv6p2TGk07FVoSpWPzNS9X9HRa6vVZW4JF8v4LQB13/iApdonP
 7Djkr7G3lgD2tVTbfNyEIeAldLWiUaaLR2MWLzHSyyLUFh4g63pTeeOdO/JEzT2cTSNPgz9/RKW
 +Xu0fRvqcd5jOGnnkQ+vWVdcVRjTEm9qbRGPI2tpR4jMZ1OQ6YJtH+VbX7GkE756gbL0uQPxct/
 ToXROam50bxwQkwsLdmRG17HFBL8npH6mAjmSMiXXvnKJSKuNig2OjJ5jtwWzxmvk1dTcgJgrou
 p7X5E8WXjaFLSd1WtwqwRi17HCmj5QNeMUApcvG+Nj7EXzymluhRNANg/CwUSsFSjVGDLk7sTWj
 mgGvCwKKUp0WbHZSBnjqzXF19id+3NoQJE93g3o8eOtT+qjxselkYluV9BpEOU3Q9dnDZ8mC
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619f41 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3BV5n5SZcjR3q6aDi8_gWVb90TPnLz6_
X-Proofpoint-ORIG-GUID: 3BV5n5SZcjR3q6aDi8_gWVb90TPnLz6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=946 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0

