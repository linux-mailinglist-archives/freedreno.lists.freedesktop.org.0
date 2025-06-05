Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FEACF6F3
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8C10EA04;
	Thu,  5 Jun 2025 18:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYPn6v9w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2260B10E9D7
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GpfM5000738
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=l1oDcpRqB1J
 +a1cJgnMEhleqoTcWJSa+Q8URyBzUP58=; b=TYPn6v9wYWE5PHNPJDBGXtHAdCV
 NALzwp9L3ij9piPI8YtW3JuL10sFQKM0wqMllYLgP2x/IKWrcqB6iWWPGL3PUQTB
 YKN+40xjqikm066CqIzW0Le+ZvC3L7Drt+BsveJmqw+jTcPIaxSS7QBZxz/IjA09
 MYO2/OBQWID0IVbBiHH54kVTM5uuDF8KgPUOMYwV/r4IHm4qxZiQnxJZg9+gIkom
 Hj/t8DrCEe3wdPZS5JTfXCSyvQXQbIx38c9G02dEdrIkUZPoyhXtjukCrdgy5wRr
 PM04FqfVqD0Y+U2TpXUaDLi+B+5BrawYgnIWx17hmx8kR8tEEcJmiohCNkQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-742c03c0272so1901306b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148404; x=1749753204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1oDcpRqB1J+a1cJgnMEhleqoTcWJSa+Q8URyBzUP58=;
 b=QTtYOkji6qM2Hlz9VDn24x7xTbwR9hOX1XQDbqHagx0HIiKC7f2LQ7fnDnZ572RLj3
 Lptm8/mven2LQEH93ypWLro/lpwC9a1rlhUY2Utz7BHXELbkYRzKMiF5CkYvd339sNhj
 u4zqeHYwsFeGrMzMMvDYHg+/Bq1nrh0KoTJ7FI+xv3zAZuMlNw0hBoQYWGyLVhFXgp7q
 0ipDFjvGqeyJ44VGEYfwmRYenBofk1Bc/QUhfqYBv/QPzPPHxQtQ0SQmjOsb461xj6nC
 m8vsaVO/IpjwOFt+GqBmbXxmJyFUuBLofwy0VkGdBjF9CAnuENkjBLoYYrDR4tcOIdwU
 bMHg==
X-Gm-Message-State: AOJu0YwbOIWrHIbO+fGsG9jXsHGqkn6CGRMm7EaVKCvUwTyTkHRjtUsJ
 x4qcRAZOH5XQRUi1wyECW8ujkR90ROzVTMT2UKeP8A64supp7xw3lpMNwp6ZGk2eJkMSAKr615c
 9XYOr0KGxPd6MggdSyuOzCulgExlRbayYQEmfcww/GiJq4LKDwCrrBXFoTFkzmJQoLLtsqoU=
X-Gm-Gg: ASbGncv2ZLT2YTdJTeKPcIsh8pXM6gcJ084BF3BPrXWs4d5EKtSYZvDTt5byNMiiWMh
 lv5zzIdOeB6gf56ytNvrovnuh2rCVs/F9LH94Ns7IX7x7rPVCuQsPO4Hv9wvECFnnhFJGuAqQng
 IIcmW/3gnoGy28VHG0Y289yvwQ9Gay9I49Ke6t6befTuhIwDw0l5i5obSTBkIt3YJyxSRy2NeXz
 BYvxwy6t1O7DIgVlo8K01ILceuoOpZ3CUuXMcWunkDO9XwRqJnCkTPlS6hN7BW3XAXCXY/WIG5e
 /7BfhHjVyHJ8WSmHKWTrfsQFBwRWy8/w
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id
 d2e1a72fcca58-74827e50eb9mr1048517b3a.2.1749148403479; 
 Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMNkt3VnPgo9LHcMEBOOISZcxlTtccCk13++zwvFaeLaKCW5x2JsNvx3t7Oim2FO7VOM6X+g==
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id
 d2e1a72fcca58-74827e50eb9mr1048489b3a.2.1749148403058; 
 Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafc55sm13562918b3a.96.2025.06.05.11.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v6 39/40] drm/msm: Defer VMA unmap for fb unpins
Date: Thu,  5 Jun 2025 11:29:24 -0700
Message-ID: <20250605183111.163594-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e30e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=kRuV8PDA-HUW7Xa4O9wA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: YV17fvYjQwbGKSXyTKK8HqfEpDjAZT4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXxZXB+92U69DU
 R98RgRjFetPx0afbV2sNOcrnX2e+sBn4yP6znjshkyjksSOCVHDssHNRhDPxqtItWCD80HmKZ+s
 S1f8VsUU8GWHZI5ibPgtgmyEvXi60aprCoYBPWzrSE+2Thgw0s81X6ifli/DHYs+uPGROo1uABI
 /ARNVeBJVwj6Yryi2M2DrDsyT98/CofbUFw9x8wTuvBLddkCBhxvJRwoH3Y2BDuaM5icbGTzawa
 43H6U4F6zP+9TBG5aEOuRB2Rm5+QS5wv8vTJZijG4d1huNJrlFga8cXwr9/4cU9r0jsGqn1MT2w
 Zaq+1bbq0XLsgrApTn/1eFn9FOq5vDQl9agBAfEoVAzJRbNOwAzxg7X8Or+fSHDMvs5yDV4hb4k
 XuLTwwWdspv08ZJe5HcoSHp1yWYVEjy2Uu3HoWnYhUPPSTWAhqae5pnHQA36yuD+OZ89lLog
X-Proofpoint-GUID: YV17fvYjQwbGKSXyTKK8HqfEpDjAZT4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166
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

With the conversion to drm_gpuvm, we lost the lazy VMA cleanup, which
means that fb cleanup/unpin when pageflipping to new scanout buffers
immediately unmaps the scanout buffer.  This is costly (with tlbinv,
it can be 4-6ms for a 1080p scanout buffer, and more for higher
resolutions)!

To avoid this, introduce a vma_ref, which is incremented for scanout,
and whenever userspace has a GEM handle or dma-buf fd.  When unpinning
if the vm is the kms->vm we defer tearing down the VMA until the
vma_ref drops to zero.  If the buffer is still part of a flip-chain
then userspace will be holding some sort of reference to the BO, either
via a GEM handle and/or dma-buf fd.  So this avoids unmapping the VMA
when there is a strong possibility that it will be needed again.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c        | 77 +++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h        | 29 +++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c  | 35 ++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c |  8 +++
 4 files changed, 124 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b882647144bb..55a409ac72f5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,11 +19,11 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static int pgprot = 0;
 module_param(pgprot, int, 0600);
 
-
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -43,6 +43,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -50,33 +51,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			    bool close, const char *reason);
 
-static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
-{
-	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(vm);
-
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
-	if (vm_bo) {
-		struct drm_gpuva *vma;
-
-		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != vm)
-				continue;
-			msm_gem_vma_unmap(vma, "detach");
-			msm_gem_vma_close(vma);
-			break;
-		}
-
-		drm_gpuvm_bo_put(vm_bo);
-	}
-}
-
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
 	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
+	msm_gem_vma_put(obj);
 
 	/*
 	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
@@ -103,10 +84,47 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
+/*
+ * Get/put for kms->vm VMA
+ */
+
+void msm_gem_vma_get(struct drm_gem_object *obj)
+{
+	atomic_inc(&to_msm_bo(obj)->vma_ref);
+}
+
+void msm_gem_vma_put(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_exec exec;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
+	drm_exec_fini(&exec);     /* drop locks */
+}
+
+static void msm_gem_vma_put_locked(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
+}
+
 /*
  * Cache sync.. this is a bit over-complicated, to fit dma-mapping
  * API.  Really GPU cache is out of scope here (handled on cmdstream)
@@ -281,6 +299,7 @@ void msm_gem_pin_obj_locked(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	to_msm_bo(obj)->pin_count++;
+	msm_gem_vma_get(obj);
 	drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
 }
 
@@ -518,6 +537,8 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
+	msm_gem_vma_put_locked(obj);
+
 	mutex_lock(&priv->lru.lock);
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
@@ -664,6 +685,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static bool is_kms_vm(struct drm_gpuvm *vm)
+{
+	struct msm_drm_private *priv = vm->drm->dev_private;
+
+	return priv->kms && (priv->kms->vm == vm);
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -679,7 +707,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9671c4299cf8..fafb221e173b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -211,9 +211,38 @@ struct msm_gem_object {
 	 * Protected by LRU lock.
 	 */
 	int pin_count;
+
+	/**
+	 * @vma_ref: Reference count of VMA users.
+	 *
+	 * With the vm_bo/vma holding a reference to the GEM object, we'd
+	 * otherwise have to actively tear down a VMA when, for example,
+	 * a buffer is unpinned for scanout, vs. the pre-drm_gpuvm approach
+	 * where a VMA did not hold a reference to the BO, but instead was
+	 * implicitly torn down when the BO was freed.
+	 *
+	 * To regain the lazy VMA teardown, we use the @vma_ref.  It is
+	 * incremented for any of the following:
+	 *
+	 * 1) the BO is pinned for scanout/etc
+	 * 2) the BO is exported as a dma_buf
+	 * 3) the BO has open userspace handle
+	 *
+	 * All of those conditions will hold an reference to the BO,
+	 * preventing it from being freed.  So lazily keeping around the
+	 * VMA will not prevent the BO from being freed.  (Or rather, the
+	 * reference loop is harmless in this case.)
+	 *
+	 * When the @vma_ref drops to zero, then kms->vm VMA will be
+	 * torn down.
+	 */
+	atomic_t vma_ref;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+void msm_gem_vma_get(struct drm_gem_object *obj);
+void msm_gem_vma_put(struct drm_gem_object *obj);
+
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 1a6d8099196a..43f264d3cfa9 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -48,13 +49,45 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	msm_gem_vma_put(obj);
+	drm_gem_dmabuf_release(dma_buf);
+}
+
+static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
+	.cache_sgt_mapping = true,
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = msm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
 
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EPERM);
 
-	return drm_gem_prime_export(obj, flags);
+	msm_gem_vma_get(obj);
+
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME, /* white lie for debug */
+		.owner = dev->driver->fops->owner,
+		.ops = &msm_gem_prime_dmabuf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8a0f5b5eda30..bf9010da7e58 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -527,6 +527,14 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
+		/*
+		 * msm_gem_unpin_active() doesn't drop the vma ref, because
+		 * requires grabbing locks which we cannot grab in the fence
+		 * signaling path.  So we have to do that here
+		 */
+		if (submit->bos_pinned)
+			msm_gem_vma_put(obj);
+
 		drm_gem_object_put(obj);
 		drm_gpuvm_bo_put(vm_bo);
 	}
-- 
2.49.0

