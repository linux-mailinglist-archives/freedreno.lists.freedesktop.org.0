Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3648AECD3E
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6D10E2BA;
	Sun, 29 Jun 2025 14:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3WXG8rQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806610E344
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDC0EV015448
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
 eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=e3WXG8rQ6vHuJOqD6VGdpzNnBbX
 PUBJy/yVEcAa5UG18CIGIWSs1yGDkldBONwQjE1deVxapBFN1T6q/SlheZqziWPs
 5Tx32azGmi13Qd8CtDjfEujKkelZvouXKJSj7YIDhgohch0uX2KjOWbhD9h6CEX1
 lZB2IwbgkoJ65QtLXd4FwYjt/evKDDpikKmJRxEEq7VGRNJFc+ZJe0oJX0UYaMT+
 76rZiPYJ4dfAwmD9b4yAqyAPMmRVrsRej2AeD28ApyXSedTG2L6CoRmlajDSDeTU
 J+xhkFB1+6JwZe2pSJ8C/a2PniwfETZWjYvM7iivaZevT2AKzs9SdaDOJuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31366819969so2731453a91.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206080; x=1751810880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
 b=t15QMcVm0jDXPvGJ/RYHdBCRht14RI7uLtA9npj/DrEG46k36v+O5SBnPzBJODJXEc
 Qogp92lCzO2Zgnt7WJ7FWa9yzQENULBw7JuvJBJSSXv3mtSICnQYFVudT78HvAJuZSEv
 AWYnfCtZO4CQu7HzOgsHM1UWkgr9xDP77qkpf+akOVOA7HW2CXDLJi9QQ2A8iZsUoAd3
 ym5B0+6eTG6Gv8akRoWqABwZ7Bu1eyxzDurZaADXu27p56LHMM8OC1nX8CAGcgvdy231
 7EGYghrEkRNF2Lad6Y+2mH7rUUfMtDTSdKV0kkf+ckav/MEiMwUy7qxGs4jqu0Awikvy
 e5/Q==
X-Gm-Message-State: AOJu0YyBlwyk0+m4YmrQ4bpd7xwjN1BRCrzrDYPGgXwPtGb5YP5mHR/G
 NoqT2ZOLA4kcx30EKIezEuyTlO7QpwVeE9QhRo51UDkihTqipsIi1Lt4aefKv4D74ahYlBivINM
 tZdZa4z0dVY3MBNzjVFkovdEmhqie/AHUoW2rTVCxLYkCU2q8y81RLwGsq2r0+8T30tzjWtM=
X-Gm-Gg: ASbGnctZtuL0qg2aNzuv6wHrzcRKBfnGdSjrmGbZaKdR0fKkS6ZarQLMwQ/ibxOFWkY
 uOlFLSYsAgSzyCstIARak03qUKoBrmphZgJJTglzzbErRFYE7w3B2yM4Xre5b2P5pimoau7fb4J
 XnZiGCJDtCMRnA/BqJoYAVEIX+NV6iRJ5zMLlqCzyDATtRzrHbaM7hwucihZNdyQEVVuxqE8Prr
 lE49qkrt2zE8vr8zY4kgxS4w81FFGzdxWsqmbyWcadMHgYizOCrKktPp+RiTWLNxRf8DrSbvLEp
 2sE5FfiUbklVPwNMfgwqgSLkfg/UmSMC
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-318c8ed854fmr13825603a91.13.1751206080050; 
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2yCfAWZdhnM43W+FQAK7Ei13wp2HdXGViln7XgoM6zEbL0poVm6fbDuQVtD+plTe3hIuSDw==
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-318c8ed854fmr13825561a91.13.1751206079616; 
 Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f02sm11175097a91.1.2025.06.29.07.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
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
Subject: [PATCH v8 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 07:03:30 -0700
Message-ID: <20250629140537.30850-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: yLVd7D5IJd57Eu0bXKmR3MN_-4h_LY7U
X-Proofpoint-GUID: yLVd7D5IJd57Eu0bXKmR3MN_-4h_LY7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXxDhOLJyaI1Id
 F3iEUIWPak3Ux3AVqtwnj9C0XGKwU2OoL0ScX0yjWqLQC70inmJ1tl8XNKopgD8u/zTUt7VdBdu
 9RgjTQRHjeddBqYuyb3bRhVux9QONHL5dj2L2w5RmdZsibfeMFGKvs1bZ4tCfEGO4MpFUjiNVEe
 fo3HtOPTz7bRKjjSBVIUFhdICoztXVnDu6sM/ZCgfxquyKGBSefSzNp0RlMlKWSJgsEsPCE0fLy
 6bVr+BpBtOJYcNitZ22Gyc6AlHyFL9hWvEfzQAVjJOKm+iWgboD3obc+3Eu8kSsidMzNtxZfCQa
 hazrh7AYHwhcg+PXjJbexDHJWlAvuTO/VDVmHB4M3EPS2BUG6tv+ZsKOys4F1pj9EAz4GlqfvrI
 U4Gt6CgdGNDUBbUIa3JHryh82ce2hqdpc414XxmmkgPFNvlKrW5R6wjEON6RasTC8sa+48Y4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a9d5ecbef7b..ccd9ebfc5c7c 100644
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
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
@@ -281,30 +342,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (fault_info)
 		state->fault_info = *fault_info;
 
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
2.50.0

