Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310FACF6E8
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FF210E9D7;
	Thu,  5 Jun 2025 18:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er67g9a7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B510E9A8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HFnvg013514
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
 NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=Er67g9a7Gk+LidAHj0cQ3Qpw+LZ
 EOrAqqdSVqkDq59XlMHbDRo+tYSYL7Ja1AovMDGAFfF2RNgqcND39nck3lTCbvCo
 LEucwKE+Arcv/SdbxI7OJ5b9IVxrg9oGSUD7O3hKLfacNNtKdCxXKqZQyN0ZwYTd
 0u3k71SQtAiH1L9vSzgzSCvBcIegzE4XW4sEDc3spBWolYLfRJj4h6SLr826NJza
 w5+7da1NqDou+zrlJT0IwnlnI0os3Orinjhtu0HEh4mFr3Bg90ntPeH+RcxzsTs8
 wMTOX1zRZBOWfhWl2UEv29EAZ59+pjJOMTcILfb0SEXpKpf50Hv8+8CcpRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nta0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234fedd3e51so12380455ad.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148393; x=1749753193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
 b=d1mF1sA/xd+q5YHnntwKzQM2ftVlr4o6bsPNMQtU4McbRMfzyVUIgQ+3Jrzy/O1z3i
 1eyRBQUCjziukJNRTXWHaUYabUhWSJCr9hL/f79cii+Tetxip/iwIyLthCt34N411kp4
 qtVfv97hMMsYf1ITY2Gg4Ny3hu4KdXHu1lXqdDFiZj4/krayEG5DAZg9ZY70hW+Pawuj
 ZtOg55MFAFQ1gyjfQ7lVmWEn7o/y06hz0aTjVwJgQL0hNGssrqb5s/GfnF+395mzvB92
 NPUVZ44hQD+OIB7CJuZiwYmAnfp6SNK2hy2L43aY1UkMGF7I8ZJnIut973YqQsIao4ud
 od1w==
X-Gm-Message-State: AOJu0Yx56qehR6sl0WC2WYUy1ABKELNKYPC4NPk26TbOorHwLWwX4fq5
 /Z+oS+HAXUab3P9BjRssRcVOpjBEHO8yO7GqQcxSetrQMgDjygJ6GBcjy+y1w/7+Z6yNW7YRzYu
 7uB4cwLi3x/2rT4zrp2R98JSYb2IsnqN2ccQMo46hVsJjUZZE9wf6QQNOsykyihODHFeU0f0=
X-Gm-Gg: ASbGncuOxvxiYD5nbjGXyPln8IlzqEql0WMhqynwialJJnj8fSyKyceVLusPL7Vhgfp
 /wZtpTyDPsjp1uGHMm87qpK1JASTQC/kDwGjM7kvE99APKABgVtc3vBYNAPoQlKVs4ljxYNuQZs
 hu+ThpYCuz2ymXsgX8az4XLsxFuTWhBLiA/PHT3/Vq++cxGzevikkL9oH1NkaJgDMAye/8COB5k
 ZVG4IlC/cxJhdmxQ/4Wo10V6AlpQvfFqelManGmSl3BIgm3lu2lvpSwbY+0Py9vs1cUvwa9sbck
 HaEORxWMG6gYK6cg7QsAyQ==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id
 d9443c01a7336-23601d225damr6094215ad.25.1749148393475; 
 Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0jqdoODWZ/61ArVqyj/ItoV5kaRHwp4+BPeGGigRtruYOwxTDYKpmN1DgxwTU01eE5wdGg==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id
 d9443c01a7336-23601d225damr6093815ad.25.1749148393096; 
 Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf954esm122815285ad.210.2025.06.05.11.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 32/40] drm/msm: Split out map/unmap ops
Date: Thu,  5 Jun 2025 11:29:17 -0700
Message-ID: <20250605183111.163594-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k3c0Q23o49Msp9qrSRIBLVKmZOHSZ8xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX3LSysW/SL2rd
 nGYJ1MIN7nvBXeUNYoQFUsiw4UuFvj9DWbJWYMo5v7F+jR1+1jweEAVZ5jbOwEVg4yg6N5NOTnA
 xlTHEreE+imYAVQyUrzVD29q+WWZj8/v3vCqLm0Aj/y+G8XibnLdj0KvP/VJvdb9bSYTZH/b4Fk
 3Ix0AmGCcD0ECHomV/a0ojwoYs16n5TRpuC8p20pVSfTiCEwYLO7rtif+eb6sx6EX6JbRLfhBFa
 mMOW9hjwxVyUAGxkKDA5MfEiWZ7TiQsqqNdLSpbSBpANF3zRrNGXzsNr8YAYShdFVW9qqHpQHCw
 omfIdP+NnQqkrTtRbG5yR+2VAswKh7OhEoBs9lsW0m4nMCC/SRXutdmmIb/sKyWP2t8jk02xaP9
 J3EC3kZFmSoP2iXH0TUIBL+IN5lY12GeKgTgMBELBLbfy/DqIhUzp/m0ZF22cBxkixXvgW2t
X-Proofpoint-ORIG-GUID: k3c0Q23o49Msp9qrSRIBLVKmZOHSZ8xq
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165
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

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0

