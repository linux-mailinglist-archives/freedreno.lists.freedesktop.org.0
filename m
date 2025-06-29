Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F67AED092
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792110E375;
	Sun, 29 Jun 2025 20:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSmfV4mc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B64010E369
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFgLFm022356
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
 ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=RSmfV4mcvX5pQ405rpyNr43/qDU
 7sAdjMrbR9hT8P0OK7oG1yg6B3Wq8RHgbDJ5/pIFs3dDGh9D9LAqVIYXCb/n9Wdf
 G6F1K+376yppN+S1oddc6eRkMo919bSAJATg3QUwhVnegGjPLm3X/TcSBOVIesri
 9q8LMjyUpTSYAPMT55dpYht1xmYn5KfYwg8Zi2wUaGq4HGqr/KtpRjjR1fCcMn9Z
 D3abonYgAdddvhUAG42wEKJYLiMEyX0+NNTRxKEoRkrRIbrCdBT7bts+8Op3ZDrl
 aPk3C3irtBbdoXiDAZaAX+Ec5nJW+7ynPCEywSHu3y8YwdEBjRt5rT+V/mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ak13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747dd44048cso4323254b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228227; x=1751833027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
 b=GIwoJ4FHxT5A4bOkTP9pboJpxbaPQcTLi+rTle5tYnUCPSuMuGxQIEnbPbhXP14ks8
 WKMrZ0pUT9+2QeB2x7ez/tJFoyH4JZqCeeQIX2ApvgX5RvJ6N3s3gN9SMTrHIS2vlbnO
 1dEIeiyTPbqAeaeFoyw2MATaCza0BJRZWpNxpvGZGjQNrNd6Xno9UFSuzEHZ99xZO+5h
 rv9P90+IZZsqx/US692Vg22ovfJWJRot1NNL/3qTihg5BbVWDvspWamC1zwG8rvjoYXE
 /t7vNx3nYPNuUBgC4OF5ssi2u5+Qyg2tnKsorqcK83vJscE7eD1ebR+e7q2Jm9S8CMru
 uBtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdU3xo+R6P8ep5/zlqUFSkG6vIiMFSyTY+ab1YfAtFRKryWMu8PPsHruBUItPMV2wwks/RcOm2F6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxihiR/xPDzDqYtwxLNKXAjW2r9LLAeJXF7YnJvfrNLpuhfd5Nm
 HrRSMOZym6B2tUz/O0ZRR9VKRCZRzKaFnpspW8w7iqGoiNbCDSFYTL8R0SOzcGabV09cP/9ryk/
 6I/3Df46DHuiQXTVZYe1W3jSOhTbJvB2R4ETutcFf1niqj3Pvp9jCkPJZPt6c+NlhuJ1RUHY=
X-Gm-Gg: ASbGnctV1BbUrkh06J/+lTpUUElJj3Kr7+zeaMcYAof4EmN1yv5PmEJVuolgdlLD2ao
 oAsk7VAIf7me1kFp42zr0bxuTaEzCvz7ARTwhEDYmEUaMNIAshO6Sn9N7sY8jzdnTcPUfy5BK6L
 Kbe2ag2D/VW0WI7WCCyCL0gcqtESgaubUV8P0JK/LjNtmqhJrvWGUDJMYFdoqMXPflm60aoX1ZX
 nZ7evw2de2f+PBs11p6FyjvXHSA/0WRNsLsxPykXxMjU5Xt/CWkdGloeN0vbJZaCbAUSVrA7i/f
 i2NBtTX25/2kjUinb89npCjwfRaLdnoXAQ==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id
 d2e1a72fcca58-74af6f5b39amr16188976b3a.24.1751228227427; 
 Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9aruV6eSL2q1mrAooTzltJ0Bk0WGQyzvvWFqX/Eu7bihRZwCW1HMVKXXsx1qqK/9yIQBAVw==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id
 d2e1a72fcca58-74af6f5b39amr16188957b3a.24.1751228227015; 
 Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e302378bsm5914877a12.23.2025.06.29.13.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 13:13:17 -0700
Message-ID: <20250629201530.25775-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: omafIHIKLOlpcV7iA8Y1t0vSIaNqXBGo
X-Proofpoint-GUID: omafIHIKLOlpcV7iA8Y1t0vSIaNqXBGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0uI9UMvyK0kU
 fPXl/cvmjCRQyPerrMMDRz6HqfkbJXLBweFqivRVDmKVLQRviNJ8n5MC9dUSWRbrAd+dFmjdFpg
 x2/YieVFPmrtnAUB9OVYtAax8VluAChW38XXT4uc1eis3CwS/U47Xs8ewDuWvWZ1rNJ0SzO70RG
 sIIxweEPjaFqLk2VzfOn8ZSofFWeT6UnF8tyNnFrdRyexIPfDWbuinB1d0Q4JdjIlGWnzwwnlgm
 qAiY86kC2zMdCBtJYDTCKk7L0GXon0eMX5YEk/lLSUSvd5hhLhWpW64lvA5h/0f5Svsn4s/tX0Z
 VfJqBI9BKvLhSZo7J2pS+gDOIRZXx8vBkkHA0cwuitM5h/ikNG2mtZ9Sy5gfXvuLUsTBh0u9aVt
 FfCpawrgm8oNDjARQP2Cb9ghvwNoqPSf+b7KJ6SULiEs9QBLDzsHcHwj1kKPy0CQHWirUJ0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
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

