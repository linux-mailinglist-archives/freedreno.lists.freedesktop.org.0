Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E477DACF6E7
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28FF10E9E3;
	Thu,  5 Jun 2025 18:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4UxTq2K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03210E9A8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Gf8wO000679
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Mhg+7koyMe2
 2VLdx/7/ei97p7J97kc5Kcsq5C3Qay4E=; b=P4UxTq2KCtS6reJ+1/wpbRQgr1Y
 8cCv/eyfWiu/9wuc4OR2PnqsZQF3DqaB3Y+tLC7p0polvQyw4vnWRB/QCQxQS4Hp
 NDee9bwLOJOmhykTYn+6rKvkEuLCsGOQUmF/z2/AyTtWCKCyr3RmmZHYbye6qegn
 KMEPbwZ0EeJPXPIFT4eYQglPpKlJYq+X6HBKh+QL5m6C9GwjEuW4yUkngx/rWoyp
 rmoRgqNVSMJX7dq4vOasLNZRitkJTFb9Pchk6HdNdNZ5Z+irN+Iq0mXSCnfBrqpA
 4UXtSju5VJYdYlttEXxHv/rNibQlG+1Ox9vO8it4npzplpBmfCUDIti4HUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qacwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31220ecc586so1279534a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148398; x=1749753198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mhg+7koyMe22VLdx/7/ei97p7J97kc5Kcsq5C3Qay4E=;
 b=dc0qpQlDHAuAyBznok+WU0sgxKbk/Cyzmf5FdYUu6474grz+g/Du5IPVZHEMNUE9Zb
 xbLaPDtcFC3S9CSAgu6wip6OWk5o0IxPdt/EA0sE+wpPHZYeCohUR5AsdOqBGTjTqHbK
 uul8Bc+nmng9oBuBcleu/69gRHmRFxHiqQs+obPLnFmzfffs1UBGf6vyGOTWivGatr2r
 kZbMQB7KVWIi7bXlWnvgoaST87LG2DR4VR1dCTNnS7THgY6crcVEpI0PMdlbuoqVtM7p
 4zsNyTo+cBGz43S9A5NGHWex5pYEEtHZXP2ENFsOkg5cAu/v8wxtMUrNQJfvvjdSBHiM
 nfMg==
X-Gm-Message-State: AOJu0YwkbyOETkJjXSFW2bu7P0q3PMqBqEiRK3pTML9z0SbdGPhLJbmd
 i8fh4aIshMGyxsx3PipFmW7kAVmWauBAhjdDbfEi3FNBUtmwbYQ0HHSUZETdteuLTTT9WwN8Il6
 e/MjyMxXnNphs3E2M9RmE7PiTogyaHL0u6o+U//MTY8qI1v7qfQX2BFmhaKR5vFcozg9TmzqWW8
 JwQ/w=
X-Gm-Gg: ASbGncvjVvPGoCeqFJJHIrs131XhkQ6/vw7OYPSbPal86O81pWZLx8BavdzWtLcTywm
 xpneCPwWGcXHyd9jcBBONt88Vcb/s/EFk84p7Pvpvxi43R2u0BjR0GJZX3UnYDTc8h2ke3nT9vh
 VGz0gdTWl6R/KinGoUXpftDTNsY66Ar3dGkwd+xtVSaeJK63nrgShAunaO8az6HM/vN94kIRzNY
 nFzTMKwcooVaw7k4T7Kdhj/nEnCZaUzx1xyO6ITt3H85KQIBITIMD+mlVrAU5vQfxcFiQPAvUzy
 QjpZM9S4HbYRvVJFUZs5Rw==
X-Received: by 2002:a17:90b:4fcc:b0:312:daf3:bac9 with SMTP id
 98e67ed59e1d1-31347077489mr911971a91.34.1749148398252; 
 Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjDsIfx3jrnAvxzEYIjomq05BnDcBK9KkqjdcW/+24UL79HmWGPX0+sBZL4Ans0KuSMxmN8Q==
X-Received: by 2002:a17:90b:4fcc:b0:312:daf3:bac9 with SMTP id
 98e67ed59e1d1-31347077489mr911924a91.34.1749148397819; 
 Thu, 05 Jun 2025 11:33:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132ad9a4aasm1559479a91.1.2025.06.05.11.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:17 -0700 (PDT)
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
Subject: [PATCH v6 35/40] drm/msm: Add VMA unmap reason
Date: Thu,  5 Jun 2025 11:29:20 -0700
Message-ID: <20250605183111.163594-36-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xDoWB5QJmCKVhjLrNXaZZOJ_18Vj0Gxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0/Xdgk3AAWTD
 j08HwVkCooesLS5GVrAs2+OwhAvaDY8axsgsQeJmGNc11zjKsX+/qrbc4Oecl3ACGGp8/f8aAZ1
 0iMQk16XoAcE2Q3vlkBfZmlE6TiekiTd6iFyJqtOEGmF8Ful79aS+bakcEf66X0V+f6WzH9evPe
 00QxOPMd0dz1f4g+/JUAkOo9MFcCEBLU4/ipTZjUPrJcJYsRYTgl7daCEJAO4TB1oNksba+Ngn9
 nkQOB+znwJQ5hL1JeWsuMyqLDNstGRJ9OjPOfmZbPWMs1Lxah5Kf4GXKuh6DVLJwkF9GA1SJ1iA
 HLuNvHqoUmDkeo+fz0Ri8iJf95COMh9gfFcA/DfxMgU+hHKNmvl45Mdy3CXPfX5M5UQZLs/RdUw
 pdbTwaqSwRINz+PnCeA++4r7Y6wtT4E4ioCpRKJ73G0Y1tDXxA5D/oF8yZFCNaMraMQzi51n
X-Proofpoint-ORIG-GUID: xDoWB5QJmCKVhjLrNXaZZOJ_18Vj0Gxo
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6841e2fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index fea13a993629..e415e6e32a59 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,7 +47,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -61,7 +62,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -101,7 +102,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -429,7 +430,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -444,7 +446,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -625,7 +627,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -837,7 +839,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -875,7 +877,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1087,7 +1089,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index efbf58594c08..57252b5e08d0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -168,7 +168,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_unmap(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b6760fa9dd82..b6de87e5c3f7 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -53,6 +53,9 @@ struct msm_vm_unmap_op {
 	/** @range: size of region to unmap */
 	uint64_t range;
 
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
 	/**
 	 * @queue_id: The id of the submitqueue the operation is performed
 	 * on, or zero for (in particular) UNMAP ops triggered outside of
@@ -242,7 +245,12 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
-	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -257,7 +265,7 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_unmap(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
@@ -277,6 +285,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
+		.reason = reason,
 	});
 
 	if (!vm->managed)
@@ -863,7 +872,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.49.0

