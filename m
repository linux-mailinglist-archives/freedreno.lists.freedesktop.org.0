Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9CACF6D3
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D09510EA09;
	Thu,  5 Jun 2025 18:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UC4FJCH5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB8710EA0A
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GjaDQ010763
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
 8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=UC4FJCH5X1JLCxB5ylfxR7L8laL
 9MqIhJsSIs3QAhPEEhv1Ikih6CoaxRVdPGUFvnCgbfSSMa8s5xTTUZEqg94X3QZp
 y9n0luRXoqq8kjh6UI4M2yXyWpINJkJZQX0hP/A8+mFwRYRwpZ9mjqV9lMXaTwGt
 +mQ6pWjwAu04mrjCQ4tUSckZ5CIoWORh7LjUR100dorIuMDxXXoMsAiUDtAI6t9l
 FWMq0BjxWCK9uz3wO94yrSvlLcE+lJ4Zne8ByBpQzh1bY1VrLb9iVBz//IiTIvw5
 dMIilNjwl/mAb0HFDexazbq9pzTLUfeeAmbmfIwg3RlMSczgOQYm5zzx4LA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ytc3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235e1d70d67so11793025ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148383; x=1749753183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
 b=OzJIMLgy0smhvBdsd+kqeOig9dErREQtEiRRyElJez5Movf6k2J0OGLllp9a9+55wv
 aqoSH42xH5UKFMPQ+4lJ0PBjQ0K64nryKe6IwMr44TeO8mXeYbm9fbnQpon8mSqbhaE4
 Dwh0/P++MmQdn3LpR0ukUoDydBwykYCYEm28kKDyV/a1K7kmfMwyXOvFL0oj5qj3dek3
 RP5oIiHWVDfoTqlWgGFSsNSDFKbiMM5xVpRilFvRUzDOZZmo2Lwx2/3U+gQeeobLptmp
 tDWLw7qun7PCEqIgv+UImuZSaUurykuDVwAwt3vjWoufsTO3ZLBJUbcd8xtH5acAGTfw
 mrkg==
X-Gm-Message-State: AOJu0YyBYydM5TfiIf6vyQluP90gsRIU+uYZEoDVGAGDdhCLvYa0519U
 cEWcjutKVTL0xrmKxMwqJ0pSBc0DFVHEqb11lEw85d4iZqnjm8E5ipmH4QYDV8wvnLbcM2KafTr
 kolb5FrZ7YnYfR/itnU7QMvVmIatR9lvVirRelnkqnB28meWNVB0i15ji/GUncKgRTXIRyNo=
X-Gm-Gg: ASbGncuovJp98tpTV+HCLUnUVDuwrcyegWYRbXxP+yHllc/WWTxvRAP494djPYJLU0i
 eRyovyymXFTZLmR8nev+tPXBK0XFCEitGLHByohlO9fpZJ65tEm2BbdcuH8kMpDx6TcfVH8Rzov
 VrSFoJvNBru6i/mr5zzFttmg2a3ixjaew+Dkz0qcLgGq6uh1c48/KfZKjRUcchw59JLbtRP3WfL
 9PC51lQt8hbZvAJ4AwWPbGP5McBhLuvCZcKWLhZzSZF+kZp6SGpbIT7CB/4LK2ZkJPeMp73+K2H
 qFRt+spSp70VjzTqTGA89g==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id
 d9443c01a7336-23601d977c9mr5811095ad.36.1749148383284; 
 Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXsjrpMtJeaeFHHJbJYs5K+E0Ts7FRZDqdRwAsfHwOl9dnEOZ4Y9cggfPiVerZSYeeQaSUqw==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id
 d9443c01a7336-23601d977c9mr5810695ad.36.1749148382861; 
 Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8863sm122351415ad.19.2025.06.05.11.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 25/40] drm/msm: Crashdump support for sparse
Date: Thu,  5 Jun 2025 11:29:10 -0700
Message-ID: <20250605183111.163594-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX84OkwtDUFNBu
 h2+5f2ksa8RUwrkl35gaR30ow46R8ZKOb8/Od9LY77c5w5SS+85boaHqdq/UDVZy0IR/fnWzHdx
 SewwYC93D+FpL1SFyHx7ZO/nsQS5PqXDaHbv0W9XkITOw9PDskmt/JY47unJUN/L+zc8lWyZ6/K
 mOhovQvXNd+3PVOPulCLbw8riPmok4NsEtzvJG179SdcfALpo48gDJb45bCRolk0qnhiyzHtJ8U
 j1hZpS04OoVU6tDOuTlsuSnTYQUK18cZq0iD6PyMfld9cieZpwV2/k2BGh1Pvqd3af1rwRXb25g
 OILbiMEQ9whX9b7JLtIgzs3BPnTuh/QzZPY9o1YY8lFxAKoojFJkr/9EjqBG3mFdP65OVUnlDDW
 pGNfvVD23RcVxTcEs461SviOH9IWEwqsAGADZGnFy4wuPZlaFnpS+jow0sXCmCXUam6lkqtA
X-Proofpoint-ORIG-GUID: QUlw_3NUgTakFN2OXaQSZ281TDrIpIVp
X-Proofpoint-GUID: QUlw_3NUgTakFN2OXaQSZ281TDrIpIVp
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=6841e2e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..8178b6499478 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +340,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.49.0

