Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A426DAECD35
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1CD10E343;
	Sun, 29 Jun 2025 14:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw0nADv8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8C210E2B9
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T8MDMw012700
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Dn6rNLtmwPZ
 aS21Jedvkq0LzDSIrl4pjgU4LG7FVLPE=; b=Uw0nADv8BVv28zDWdM0hCrTeORS
 CSS8yo/WR3Q7radejVXxXpWbHFXTxUKoGpy4rOGsLWKETreCZeuOKVGeUNSx4jt3
 9hyT2oHQQU906ZfflRA5v55Rl3umwPN1oN7NRxaRdlhFVqIzssKXTEGy+IIh7fSN
 YzfutamzFp8rgxnUpRH9B5dqnD7m8WjhB9VBdFdpG3NPlb4AfFDS6eIJLKv9v7qQ
 buh8FbmxO/b4FJAdTHwaRG2Vitiuz21GAfKaFhRiP3X4ivi0ViXpbYE9F4vUN/qf
 6fsVtYBmuekuYkvhxED8jBSULapT4AUWxHb9J/zd4WF46TI1XYuhd0yh08Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2ews-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso2356643b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206067; x=1751810867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dn6rNLtmwPZaS21Jedvkq0LzDSIrl4pjgU4LG7FVLPE=;
 b=NzYIeTnulZotGxmI3Vs7J1+fx2z0pEum+jFgR3fjMo1r6fGR0h1dUNRYVy7z2gUAdx
 2Xosk8ZlBuXoI+Ahzj53pXFe0hBjZT864+EdLiGNzhxYN6HRxhs/VyKVbiBpAVFPO3H6
 jGMv86c6tf+rkZOurJ89pf7pWvAt+6ZVhbwAh4syyA2F23/R3FBBQMwwbFWOb+EDbUkG
 i0IFchgQpemJ14NcGgkBdGq7uEBKyRplDVnqylJt2KbCQYJ1uUtP/VMZeWxHjpNEuM3Z
 T/zsav9mJ3S2FOw34ZPtrEb+QfjQ+EUK/8EnPaMdGIYyVxELgtHFqGJsiUm0GKRciCfD
 g/5Q==
X-Gm-Message-State: AOJu0YzX9W73CG7SXSyF7rPkRFdX4F9wCvOziwZQdzNZAP28ERiq9mm1
 4bLzY/1ivZTy2V71rfaetsCEEkhEjqCJ6GfA1McAvMky/KdNHo/1P8lgCjVZ2stsfVNLE2V7q0z
 jsg0uINGeyZRY+MfkJrpElk+OzUFb6AHoqp6ovZ745ElU6YKXFRxgWglXeZeKUEF3iQfTzSc=
X-Gm-Gg: ASbGncuV3Cxe+wAAFB6bHOMIvlCgqWc45BQoLxw3S3gSXlpG1liUPv2q9VY6I5+Ssrw
 cVUjDdNV1tk8C/rzPV1Yv3mldSbgI2gb/QrM5t6hNrOm90KNR5ec3QjZZ+0ILtLN53yGPP8yWgj
 Tdiql/+TiUP+DfLILnjWXlAI31BcT9qmbwE6/m4Y5rSh1i/4YVywwKp7KAd0KG++FNGL5GXccwI
 7q9y0I9fkANrqnchp6gQbVmSKId5ur8Uv/QOM+vfUu+0FczKXzODOJEqNddozZwLYpwYNg8ZcHo
 uFRB1DQ/0c2libI27CPdtQYJTi0fFItA
X-Received: by 2002:a05:6a00:3a04:b0:740:5927:bb8b with SMTP id
 d2e1a72fcca58-74af6cc48ddmr12775918b3a.0.1751206066639; 
 Sun, 29 Jun 2025 07:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpT/b3SDSccYMa5CBmr+Nz8pP6Uz8/h7oHbjun/s8cT+dzTNn+jqYyULUBTy7JpVyUo6Zag==
X-Received: by 2002:a05:6a00:3a04:b0:740:5927:bb8b with SMTP id
 d2e1a72fcca58-74af6cc48ddmr12775875b3a.0.1751206066173; 
 Sun, 29 Jun 2025 07:07:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54098a3sm6847772b3a.16.2025.06.29.07.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 17/42] drm/msm: Add mmu support for non-zero offset
Date: Sun, 29 Jun 2025 07:03:20 -0700
Message-ID: <20250629140537.30850-18-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ONPDTj7eKXuLbBXiTD_7bI0TILoU3XXs
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SJjE8ph6EfIcxDFTuEgA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ONPDTj7eKXuLbBXiTD_7bI0TILoU3XXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXzjYAsD8vZdcQ
 JSt06t0aUF3iYfVbCuAXjsa2bSIJF+s468vW9cH3OXxGEWKy+E0tCr4XFL0NcA9FmJS8wG5N2/Z
 5hd6ahI7YY+0MiqxYUT3XlhyqYLyJ6fiuMsHN1c3ZKCqYyHi2zSFgh0Kl0Rz6PFIQEdEyC4bX8K
 gwHjbORnIj5RgJqo2FSagCV1G/By7Riy3h1Ne2v4B9WbRvfgJswt7jmD6EOMHhwabYBNNcA44o7
 u3S6XPBCAkevOlvjBenDbxfzGp0djb6v6Px5ydrJgcFBt9XfLL2gOz6tCBF4YsEykeDPma9+TdW
 Nm0ym/0Sk/kGkZklb2dnhjyUyF3iNwEu7z1Ysb/EMB7zS4qnwCTb+zsU8XLpOw6gImDbGxmKzl/
 d0/phGx2BYHjhB34uCtGSdRkAuW+V8dQir2Ky2EzHboHBhzTzgokcVuArvJTr7ZFid1aZ0xC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

Only needs to be supported for iopgtables mmu, the other cases are
either only used for kernel managed mappings (where offset is always
zero) or devices which do not support sparse bindings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
 drivers/gpu/drm/msm/msm_gem.h            |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c        | 13 +++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  2 +-
 6 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 4280f71e472a..0407c9bc8c1b 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -29,13 +29,16 @@ static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 }
 
 static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			   struct sg_table *sgt, size_t off, size_t len,
+			   int prot)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
 
+	WARN_ON(off != 0);
+
 	if (prot & IOMMU_WRITE)
 		prot_bits |= 1;
 	if (prot & IOMMU_READ)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 20d5e4b4d057..5c71a4be0dfa 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -453,7 +453,7 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
+		vma = msm_gem_vma_new(vm, obj, 0, range_start, range_end);
 	} else {
 		GEM_WARN_ON(vma->va.addr < range_start);
 		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
@@ -491,7 +491,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a18872ab1393..0e7b17b2093b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -110,9 +110,9 @@ struct msm_gem_vma {
 
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end);
+		u64 offset, u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct drm_gpuva *vma);
-int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index df8eb910ca31..ef0efd87e4a6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -38,8 +38,7 @@ void msm_gem_vma_purge(struct drm_gpuva *vma)
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct drm_gpuva *vma, int prot,
-		struct sg_table *sgt, int size)
+msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
@@ -62,8 +61,9 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
-
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
+				  vma->gem.offset, vma->va.range,
+				  prot);
 	if (ret) {
 		msm_vma->mapped = false;
 	}
@@ -93,7 +93,7 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 /* Create a new vma and allocate an iova for it */
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end)
+		u64 offset, u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
@@ -107,6 +107,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
+		BUG_ON(offset != 0);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
@@ -120,7 +121,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 
 	GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 739ce2c283a4..3c2eb59bfd49 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -113,7 +113,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 }
 
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-		struct sg_table *sgt, size_t len, int prot)
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
@@ -125,6 +126,19 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
+		if (!len)
+			break;
+
+		if (size <= off) {
+			off -= size;
+			continue;
+		}
+
+		phys += off;
+		size -= off;
+		size = min_t(size_t, size, len);
+		off = 0;
+
 		while (size) {
 			size_t pgsize, count, mapped = 0;
 			int ret;
@@ -140,6 +154,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			phys += mapped;
 			addr += mapped;
 			size -= mapped;
+			len  -= mapped;
 
 			if (ret) {
 				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
@@ -388,11 +403,14 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			 struct sg_table *sgt, size_t off, size_t len,
+			 int prot)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	WARN_ON(off != 0);
+
 	/* The arm-smmu driver expects the addresses to be sign extended */
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 0c694907140d..9d61999f4d42 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -12,7 +12,7 @@
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
-			size_t len, int prot);
+			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*set_stall)(struct msm_mmu *mmu, bool enable);
-- 
2.50.0

