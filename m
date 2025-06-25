Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AAFAE8D7B
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3010F10E7EA;
	Wed, 25 Jun 2025 18:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtZf3CkK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0E310E7F0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCa9Ca016718
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
 NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=WtZf3CkKNuQU97IvGeNFmcWXCY6
 y2l4y8KMgmNeiWDi0g8rGOrSkCzKn2ph/JxmTm7tL0MJ/qr4a+CkeUaZ4x+thjl3
 DLLAuPmFc9T+hc0c2jEUVcJeX3Nbd5qGNf/ioRPy0deT+qW2mOwvaNneFIRsvZqv
 V/hQv31Z0d/sAXbcJ+ZeEOfUQOBb/rylxj3dJY8xK14i/xGjgM23/tqYgWDNaJtl
 /PQR3mmLuMGbURcDyQzCDG0WKTXhKVoLurdai2h/Ip6rHKRHTC1b8ptbkpsh6IED
 Qmm6juVfCxYYyRiJPiYxmbFyPgrXA3THe7LRso6NbvuOi7q1mSCm+H9ikQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235eefe6a8fso1205325ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877954; x=1751482754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
 b=C1UZv27sYAbDHAYfkY/SF+C3Y6j4Un6cmXHrbnRcTyXV3rsfOjNa2LzZKFf/8l52SK
 1ovJPXyLjfz8GA2G1Eh96PXh6IBzQ/2Tqs+lF9LWA4v7fDRZYSICdyIYQTBbv8Lgx3y8
 BOxwxyfXMgzv6XR/0FIX7Sf/Vnum0/W9RjZo82N8TNj8XZoiVgJrCgM/WvL2TjOqnsXO
 kjCCf53p6PUBS++wNnKrvTJAcQYXQ3nLywd6VLvjoyXnVA4mtZu1UMBi51Dhe87rOMPY
 pX8b3bdMUeWAmAAWai3dB18vTLZI3e50yTqlhiIyXwEwWeexAIJmmqGiSlwqO8LqnW0P
 Fz/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8BMRjYfMLCN9KIYymEpfa2XNhAPi39xnA8JeDXYtPKdwZd2jYSFJgpPNHk1FhHNEDdzLgcJwUsn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE2rhNasn+Zx8z9g0fDjRx6W7POmvMosFo/p1D4c70udJ1kmoI
 FQjx6iTx1l+1W0i8n6IMN/3Fl022cVu0R/XY/nemAJQXMmp8WzRbekTZlF7d4WTwopdMMAEey5c
 VIK4CiSxhWgQxONGFH2YB280ZIwB9dG9S5l/eNxEN8tJLF08tDP09PrzFl6i3loCJjYOt/bM=
X-Gm-Gg: ASbGncvyRwAQfzI2P0ziE55r9W2tig0ojxrQJdNVo0X42JyIgKrnuZJobcRTWi1YLzF
 /qvq0qGhzhkQm0/SPpBPO6X5Vk9uJRnjUR8jfoIgWf/8YCjwIpV8aHQYMSA2qeoFd6QLXb2lVc3
 CY8exOGpm/ORc1P5du2Lk5MuEuFUtPBbRH+fErAB3TjsVx0AeIJiRQYTiTaVHeIgQ4qxHjTaOM1
 KZaes+Muneu0g/yDXbor00gbrIDjpAiP/3FLJHLsM0qnEVrLQFaCsv73FtujW7YHf3kvLe4LqcF
 bdVKhVNoqaWpa6IHBNkcMew1rlzo5rRy
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id
 d9443c01a7336-23824108cbdmr77910055ad.23.1750877953563; 
 Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3AcJpzfzjZQsgRmjwLAbbXRsrGhtl7AY0PDU2VAAi3sP12gUBwP1a3MTqSTUA/gKCDHVqw==
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id
 d9443c01a7336-23824108cbdmr77909665ad.23.1750877953165; 
 Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83989besm144278745ad.38.2025.06.25.11.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 34/42] drm/msm: Split out map/unmap ops
Date: Wed, 25 Jun 2025 11:47:27 -0700
Message-ID: <20250625184918.124608-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s7t1O36t3bNynbh2KR0M1RnC1HaTOdvo
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c4703 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: s7t1O36t3bNynbh2KR0M1RnC1HaTOdvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX9d0USg2+bJ8e
 GXE/uZj8b0j5YsgcuZ7udhx1pZ4D95nv00WUEor1qUqG55LFDOYZuJN4xdG2Sr+0iZWWwQTPT/m
 0U62U8KYRXYdc8lMRQTOrfmlRSitJGzlbmQaTTVIs5umr+knjYMHx+2FDnYlLDvQ8QH9beA8COu
 yyJnjQNxCyydP/LKfPFOywXGr9RfwN+q8gVXTle4ma93AT9krajlVx+RCJN1ohXv3NofrEC+adF
 3UCNCIT24b9oUMXV2fP1/Nxz7+BH52DBqBhUT1Z4yhiCJveN94FjB8CV+QjIcNpZUX+zxEE/kyK
 61g+hjLXrgx00njqfOCo85nYoIWOO4tUUmjnGoENXjwJq79NWTPCPa0RsUyDfiUMwzPK+/gS5bN
 RTXha8I/w/m+zXbmylMXEMv2pLQ/OzVkf2N3gogkLwZPodqjKvCdDQT2K/HYYF7LhE179K2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

