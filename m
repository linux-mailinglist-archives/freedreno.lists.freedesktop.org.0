Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B52AECD19
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275D510E29E;
	Sun, 29 Jun 2025 14:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYJ5D3su";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65AD10E221
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCR9Ie014540
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sVxQxqcInWG
 kGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=; b=IYJ5D3suc16HbIFda1q/42LjJ9/
 nRxIYwMK489S0+PWp2k66r1P7SCrITojE6k4gPRhDmHLr7IzTrtPI6TxbtIPaRpa
 eO5iH6jwNuhSgIHNChOOcpRIhOlHlKwP+mAuwycPfyHNQM1AaeJNAA/cv5xNyNYQ
 YV/LioaElYtpIy31HOp6WYumtRapq4GfMMW5bWa0h22J5iVN6iJD47zL+82Wflpm
 McgsH+tkuwbXS8F3kR/Iim+NnNEfirg74F+XjekluNGuiDCMv2Pw0zNlFAVKSK4Q
 cfmkhkczRIHIxbodyXiZBDVeKzOVMw13BcbHFae8awk9ZYZj6OWIlrwNTnQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcj54h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23536f7c2d7so19740085ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206043; x=1751810843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVxQxqcInWGkGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=;
 b=OfdPBNH6Fe8EKUtwdQMFm6fT8L70te5I3VU4pcX1KsS7uVZl5VXQXXfym5OZrCwmeq
 Gb7DW0nkQMVf1/Y7J6XQJv3uuKJLoeb8x4OaP8n/Qbqd8NeOa6kJ2fOPDtfjFdHnNrJb
 y7khEUydQV4nkjBSeUmrz9jYSd/FLAOCILdUk5JW12dO/yKiYdtAGKT0Jf7+EM0QCijn
 MT92Qbx2hblRg7n34jZwRIBplBdi8Vfcn8tTFh2j30uyzLZ8UhoaxyzWme8lI5u0NwGq
 +PYLBxjJO6oWj2GJPpxZJ2ErrfptpVMamKCvoZ9oiZ2krUmNrxS4ceU35WcONF68pH3w
 Cxgg==
X-Gm-Message-State: AOJu0Yz+Feo56sRqvUpxVwFK4UNmQXzlaI//V6F2xZ2hcnMFOqph+4CP
 5ukZ3d/BFuZMArTU7RKesPrtmAPCLiXv4dfrk3ia3RdX+rfyuaVzzkFebBn49+H9zYFx+TeKe8p
 8w0YatlD2yq6QWIruKnluI0ZdLNSbyYI0h5Q9fqEHTuPXeSQpMlUli3MwGpOtzSvUDuplVCnoET
 tR2Go=
X-Gm-Gg: ASbGnctV1tCcWLW8prpEY4+R88d1cHUK586ubhBrYEgR+bGUTNin4QGI8UsVqWrWE8B
 7WW5CkRzRhBhY0RBGIL9euakmoeqsuBk85asv9ruSSkGcGLm4VtGLBTA3Uyc44jFiPU6Sb0QKHJ
 XrOUcTr2U9TJ9slLI3xzhiN/0E+5N+xtxDhNnfEJob9+O/WyDO8cIuRIxjjdZPefuF4gMjiIfHo
 9os7rWY4CVFrJ+y9ib7sx7PIr0+WkKregXzwAsbEWsf4ZMp0vegjoP9TpCYCCsDybrk93F305al
 KTnaiMPZOSjzE0YSRUIzfyVRq05gMPQM
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23ac4669445mr164026195ad.40.1751206043226; 
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjlNaS4GuuR0AQMQjI+3+VSvt4lcAZtZqKTQqSco/bWPE6Q8TkSQrt0HwBQMPhpYXjAE5Ueg==
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23ac4669445mr164025665ad.40.1751206042803; 
 Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315edcfd75dsm3079464a91.1.2025.06.29.07.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 08/42] drm/msm: Collapse vma allocation and initialization
Date: Sun, 29 Jun 2025 07:03:11 -0700
Message-ID: <20250629140537.30850-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q-orm7bIAtJQqLC1Qld56qEpRAlPqM09
X-Proofpoint-ORIG-GUID: q-orm7bIAtJQqLC1Qld56qEpRAlPqM09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0IU9M3c/QkLL
 D3rxUIPnm8gnhUL4+iRTV0EQtGEPrHF9BPVYCYyrMCu8NmugSouSS22UONQRZOfE5DIUXEOdfJi
 SKUy4H1AgTzj9e6WgMq+dWeZTEaJAqUMq4O/qlHFk2WpOrXf9oXM7Il5MMK/fE/OHDowMN5oTzt
 VBVcJm9b7Kc8JUSxBWrF4FeW4XRBNprt2sROonvUbjmocLFib58g3KHjrETQGfhH+T3ncjPmSA4
 3JU/H62/qbMcXccN90dqDa2SzjSxElPHHxVIyDkRTZngPAN9q7itTAtJO4rUs8luV4SYe1//M39
 E6qCm3s/hNFfKA0iWwY0EGAQ5aZvFUeutL2SNZ4nhJGUqF4FhCRwEYrB/rAPvg93rRm10lnJ0dt
 etz9cefEXDPRe+DGws9AoIpg+naZFDH8Qs9dEks0u7BbjZnY1rvNfPzsuzFWqx+6nF9y3p1K
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6861489c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=amM6-9Z1s-9IjK5NNPIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b83790cc08df..9fa830209b1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e47e187ecd00..cf1e86252219 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.50.0

