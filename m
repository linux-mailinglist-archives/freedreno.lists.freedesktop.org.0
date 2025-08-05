Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00510B1B8B3
	for <lists+freedreno@lfdr.de>; Tue,  5 Aug 2025 18:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D121510E086;
	Tue,  5 Aug 2025 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRIvf3C3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3AE10E031
 for <freedreno@lists.freedesktop.org>; Tue,  5 Aug 2025 16:44:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575EA3E4016577
 for <freedreno@lists.freedesktop.org>; Tue, 5 Aug 2025 16:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTj
 q7d3NNvg=; b=SRIvf3C3XrZjewO4zKbPO7X3F9IOLoIBzYRNbchpfa32QM2YoPm
 QDimi+wg7WVw8qrS879CcnYVAcm8jHG6N6dWEdwt99xiHvzAVB+iORPxpDVOfFFo
 kD09DUHvoJliAYG9UpyP2DO88sE8JyiEz+Y9IfrwFmp1ZBfFeP05ouGz2E3wjVl+
 AftroD2NAc1/SFIw1tMTYLVqQxWVkzO+EBjXRW49LtsY2CYwZeuKHerhJ4dTojZr
 tprPQiWbeWQ2mjabwiq/RIb0h2V8LSuokn/zaY9ogqq8WrNW/KqdQMbx20Bg8waT
 7cxFz2i7j3hJUfHIiLwcsE73JGBfMRUgUaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjsgrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 16:44:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b1ffc678adfso4457987a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 09:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412275; x=1755017075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTjq7d3NNvg=;
 b=igp3aE3WoTKY/3uiHf6sXcgDTGuekfC1EwHPFlP4f1DRF9Ay00N4GDG/hMAsnawJo0
 yCGCszk3KyQIaqHa1+XEci5rS42QhC5Hq4dqfw46g3Pqhb6ZKtpvMsgXvynGfit2V6zH
 3ZzRDez7T3wUcmTHPXRjn7thx0t7EEyt3KASYHX+79u1V6jGPlB7Ued4iVR7aGkpdCa8
 aq90R4P2GxJXeM9P9WULbPXcJmC42WIOn6EpOp+aNWbYNRDVicyU+AB0lfQCjHqsImd2
 eYExXpBc0sblEgbCMIutyrIPFCkGZMt1QR5kkbfjdFeAq0TGHyiFpBztzetrkhl4GrvZ
 hAIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNlyuYNQZgIhdqkvl7Fwk8jqREe4dT/qTodvMX2JkJL+ROUj/uTig/HcCyCc49BaFeVirVTF2V38I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysL3IBPYdB75EdCACgzneI1HnxnP8pSGhj1cTB7e4CS/yM//ck
 kp8VtHVPviCvbD2aOszvQNEtt70k9L3FS570AzNEkV3mTUALKdnzjid9z/7tm5OS9diqMHXPX+u
 oK4xj5DiatB/Q7W1Kugg7YFlc+7CDtk1JcJ8ByO0gJpNHqBwcnaP19x6bKVNRZunPBuFzxYE=
X-Gm-Gg: ASbGnct5Z+4RoBJ2iVyj/Y/ZzW7Ee+umAsCW9CrLy0GCw6QkXCX6SqS6ZRYZu+zz541
 SECpwCRNcY1PogngbkP/giWfXBuFwjSvQI8TlBues73oJI9TlkLhqhe4BuEHGhspNdUT9pjFBJM
 k+d1IggcSv+aVCJreiopGkZf3R4RBoPbE9FyI9z19LuYbswSwd2jfMafaQtNxmTTei/xXcqwLNB
 PWtilqPAuriyOLs3/E2Bc6kVEgMyYFTqRmVBEg2realvNaoEuLS/wfCqVoc26j5XByexxSTiiK7
 maNqsmwbzZ02Q/pPBlaHiSV6Lbj9Je8cNrjzaJvs37OEE/2IMp8=
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id
 adf61e73a8af0-24021e1cda9mr4886592637.26.1754412275130; 
 Tue, 05 Aug 2025 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm/6uN6G/KVi2o9cN+/U0oUl1Y1E1Sdo+Y+NbmDyrpK8rXomnmGpne1qkC2tg1XzKix+vaGQ==
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id
 adf61e73a8af0-24021e1cda9mr4886558637.26.1754412274703; 
 Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422b7841besm11489904a12.3.2025.08.05.09.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Handle in-place remaps
Date: Tue,  5 Aug 2025 09:44:31 -0700
Message-ID: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=689234f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=54pnWYnEFG7XCx_V-2kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HaJsy-9rafGPh6AO6JCxSfxN4oF3C39B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfX9cZC6k+Cx2Mc
 UlAr/1vldHFWD6v5nhwyaQM+f+w73PpWKeM76y7dN4WURPV5Wp4ml8GoBvVC3RHeSowHudcAHZT
 ax0Y70KPX3OXx8V6QiGteqxV5ofrNL4L4+en5jRe0t092nXp7T6V3lBYkmx2qBeyoQ3MkJVxQHU
 D+1ljJ1LfkkmyzOh7VFl7D8g4AZTdrlb7AqddG/8tgGlhXyNhgctb8Egvux4sekwor3HRCA4dov
 9cJRvBLJdX2tkEvtjr+jpOM/oRIaijCOVoVqyLhVeEpru+XlRTTgXqcNPKRIIhHueaHy8tGAcnQ
 1oa2aHueXcID0FpWXk9Np9aJIfIpUBO/UWTxO0v7qBvnwHcSZyLCdGfpz/aRuXQ3dbLCCMlQ6bP
 86EQjDB3bTtSGX10WMtYi0IxHWvlMhP2mx3EnCRe4HyseJk49UfvcIaJp4aT98qnZ44Gcfdn
X-Proofpoint-GUID: HaJsy-9rafGPh6AO6JCxSfxN4oF3C39B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050116
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

Detect and handle the special case of a MAP op simply updating the vma
flags of an existing vma, and skip the pgtable updates.  This allows
turnip to set the MSM_VMA_DUMP flag on an existing mapping without
requiring additional synchronization against commands running on the
GPU.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 41 ++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d1f5bb2e0a16..00d0f3b7ba32 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -451,6 +451,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 struct op_arg {
 	unsigned flags;
 	struct msm_vm_bind_job *job;
+	const struct msm_vm_bind_op *op;
+	bool kept;
 };
 
 static void
@@ -472,14 +474,18 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
 }
 
 static int
-msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gem_object *obj = op->map.gem.obj;
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
 
+	if (arg->kept)
+		return 0;
+
 	vma = vma_from_op(arg, &op->map);
 	if (WARN_ON(IS_ERR(vma)))
 		return PTR_ERR(vma);
@@ -599,15 +605,41 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
+	/*
+	 * Detect in-place remap.  Turnip does this to change the vma flags,
+	 * in particular MSM_VMA_DUMP.  In this case we want to avoid actually
+	 * touching the page tables, as that would require synchronization
+	 * against SUBMIT jobs running on the GPU.
+	 */
+	if (op->unmap.keep &&
+	    (arg->op->op == MSM_VM_BIND_OP_MAP) &&
+	    (vma->gem.obj == arg->op->obj) &&
+	    (vma->gem.offset == arg->op->obj_offset) &&
+	    (vma->va.addr == arg->op->iova) &&
+	    (vma->va.range == arg->op->range)) {
+		/* We are only expecting a single in-place unmap+map cb pair: */
+		WARN_ON(arg->kept);
+
+		/* Leave the existing VMA in place, but signal that to the map cb: */
+		arg->kept = true;
+
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = vma->flags & (DRM_GPUVA_USERBITS - 1);
+		vma->flags = orig_flags | arg->flags;
+
+		return 0;
+	}
+
 	if (!msm_vma->mapped)
 		goto out_close;
 
@@ -1268,6 +1300,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 		const struct msm_vm_bind_op *op = &job->ops[i];
 		struct op_arg arg = {
 			.job = job,
+			.op = op,
 		};
 
 		switch (op->op) {
-- 
2.50.1

