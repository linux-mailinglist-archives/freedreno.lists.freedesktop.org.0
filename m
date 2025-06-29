Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EEDAECD4E
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140CE10E345;
	Sun, 29 Jun 2025 14:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGaXb+qk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D9D10E34B
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAeHqC006623
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
 ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=aGaXb+qkNkHnKCMQbHKywKgHKpR
 BL2wXJ3XgRy9grgSj28Hcaii/GvaLwx1rkb7D25TLzS4Kkbd+NWfXNZ8JmqRmTln
 1MNpAqz9rSWsx+DZwMyjtiugpHICVfVDqAnJHbDw5hVEBRIGuuvYev6R5tjN0Fsx
 SJgauruyd6TvQyv7o1E449TL5Brm8keuQj1CnFAb3b4+yGAec2CJ95auxetRV5e3
 RgY2fmH1m4SgpCpTRkdBGnqsevJ1MjbzGI2Lh+KS4VLJjmUkApCBp/EcXCMTbExF
 1T0Lzb4SNzSGxw1/9t6qsUQtHlPpL1is+Na/THTPn4TCBFGoiXZgPDLA/og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2fa1a84568so2758100a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206090; x=1751810890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
 b=QCH6j/6W966H8wNnMZGXgPQqfJ4C66OC72VJ9IZ3vSOPDjl9nz9C6PjOEGQr07N4/z
 I5hO8aRnHR6009ZCN1/reWQ3rxhaIzpjyX4iShI8PCtdXg6DOgK/so+r3NBfi6oZLtrD
 j/ovTYyFW3nbLSNr0x7VYA5DWgDkuBV0ok5UdG5mR3C+OVAtFu5f1rXw07OOqqsusLHq
 NGwpoXy01A1zqTVlwMdM4vsVZTkeb2+9GNZl1de/1MF4VRCdreQ8x+J9AtVxuAOns67d
 KKHEr0afHXtLfks01UhmCrSYXzvYduqmBdRkoQ/RUeAWUMv92lRojB9oQ9RiVXfYKOv5
 2Fww==
X-Gm-Message-State: AOJu0YwWWEKB/XjXZh5IjSh+1XdD1xmTGc5WIL7qneFxwoVe+rJeKs5m
 /h7+JEmaSiC21niRWu7KH5O1062Cnt/kvbN+rpfcBGY4AYMxh7RGPYKEtmdpb9tVGJTLxTkuDDd
 7WsJ2iv76G17j7XPINKCUqOCxP7iuY6ZfQlcJWPposMfzAES3fKeKtQa/Vj6kAsen8gIXUGw=
X-Gm-Gg: ASbGncuq+GqPb4G81qZhnKP1ZmdrIKoIA5FboKPNIJ8twvMB4gJq4AO1JXC73R0Lq5+
 ezz1KZ4xoyZUdvY+1q+oShWTySrCD3DZJZBZT/hI579IBs5D1A4IZOOEKkK0r/j7Z+936UiPlgN
 7gPt6vdZfH9KekOz4sIHR6t1UqgBJK6xiRZ2/aO34Y/TqslRHYXOpxuhnyJ6CMmwEgPEj8bDnRI
 9u7LzMOv0/U3IUZL7shkYy83BR+kE11AEkheczdGf8NqtO0HGsAuz/5Dr9fLNSAfPRw+ZH1IhUC
 ycfRw4MCpY+vyW+4MaAsTvJCxHbAISq1
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id
 adf61e73a8af0-220a0893979mr18746131637.3.1751206090146; 
 Sun, 29 Jun 2025 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rwemeeKoXa3dY68CP5crYj0elFksFOZ4WGRjdgo7BPXpcPNprB8m352xNp9ATYbOhE0nUw==
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id
 adf61e73a8af0-220a0893979mr18746079637.3.1751206089570; 
 Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557b3adsm6718564b3a.106.2025.06.29.07.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
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
Subject: [PATCH v8 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 07:03:37 -0700
Message-ID: <20250629140537.30850-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3/zQjWQjjm30
 iin4Xtcr0pq58ZuCWUbrL/SQDZJ9djiB7WRTpdd6SA/kdxs4r+ihE4vHeoyrVuk+qSDqWs7sF9B
 FihrWZjVI6iBmKxztd22UQcHiZ9oNx4gEl74FCUk8y6xU/e5NAC7LgfZIzfHdgJhCGja9s+xJ2c
 qW9uyIFLeYG/Nw3/QmuqARMJrokWgKWfPzVTk+zoA0PB4UtFPY4N3W+6ADAFwHaW1HiUkwWniU5
 PXors3lRSMk0As53tJD/yHc0juCQZZYL/IoL4MB+LKv5dRfhL45ccWP99o/omdze4kAQdKCMuMq
 HhSVkYs+idAhh0jq8TK/xa4uOm+tUPj6kIC7PY0lIoPVYO7gWY9QmjJKclybdgN7h4TfltiJGJn
 vVJ4GpSuyX5MyDXFUG6Iu+7vQqgfTRK+uBVrsiqG8xe6KblRewBzQE7zvbPzAmF6g0UDO7ZK
X-Proofpoint-GUID: ds_wDkWqb_2jc5Q2xct9K_lPwzh5r2Ts
X-Proofpoint-ORIG-GUID: ds_wDkWqb_2jc5Q2xct9K_lPwzh5r2Ts
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148cb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

