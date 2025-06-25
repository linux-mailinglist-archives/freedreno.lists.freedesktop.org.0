Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD92AE8D6D
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83D910E7D7;
	Wed, 25 Jun 2025 18:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GysHBRol";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797A910E7D4
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCUNYn017715
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
 8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=GysHBRolCVL8iJJjgnL3i4JJ2C4
 r/PjE9IgO0DcDYOlwm5VGFd5z83ttKrBGTWcy76wrpYMlUyqjRmEuAWkub+MoL6H
 kP+M5glqyt2YoO6mRzHgxYikmRZ73856aNpOB+d9wLTY+BcvmazdZh3CJsLp9zOQ
 wPOOf/q28tsuNfiMNvgUylh4geO1zsITey1HNKkX+CkQsnBN0gVbn4IYxmeVun9s
 HIrY1zv8oRmKPTPZ8Rod/YqPF7bMQboKf1Wzau/cB84eQPKv+068bRptlD3P9Djk
 QSWDBL9F1ghhYoBawNLlVA3SPHXz4VjGqxKiypgkz5JakIzrJHv12oq6rtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so324685b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877943; x=1751482743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
 b=J6HFcLCDo1pye/ywbbt1sRWpfS3o5ZqBjJId3Noc0bauCkW3idhipC+6xkE1Q+CgTj
 zLXYnMxEbsOoxFaAyGWHIVAf8OIotdx4FogWLqO0pS3h+yN41fK2hb1vYKeY7nm7c7l8
 2cd+3HAg9gyKcbvfV9XfunSLFc3IIBN45t/ha6qkSFU3pWPVsePtE9itdb74q6MQ1fO6
 WQ52fF2X+PhrDX1M16Y0SMsOZjfgWzuD50/anLtd9G8EBR7S2DW0V2e9xJOekUvHGu13
 +An8nJHTKL/iraYKNS1oLPQhuW+ONVysgNzUOPoBkbSctBteiZaatSmQgfKSiRCfc2OP
 9zNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOFjOZpBSluOqzhzW6oJJOY7vkJqF7DmRYxnmw2Nn350C5MqI0cmcjiVMQe+1B0LJBOVaD7yGEdVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZLa+UYXCVfkUJAGzEccdaO2NX9fn9DmA0uoElaWrweeg0IG3N
 XsP7KMvMkNTenp670pRqFBpwrOhnci21vxpPdn4BiKjFWtgS4fayw8aTpHB1DR4MEaUHc+rZeRo
 7F0D73vua8BxUs54C29Jo1RmjBQ9kFXZmPSWsGezjofTNzQW2S4zayHd77Mbfw3cu247N3JQ=
X-Gm-Gg: ASbGncs/zRVhjeFHUYkoPH3EFKQs9dDWRUfXJQjOEXskrsHgRJg79Y7YTAGmj/Xkh+k
 ntiwfc722YXDmIERCZ0YfufSrkV7ORrPpaZ9sW31P5TrE7fB4BpLIdisHswagvzh5hMDxBt13wa
 kWF38QdkyuEsp3s0TH4UHaBRo05gR1mgpRFimbuxoq6NkVPdr+VKBcjfRAI8eZrcAKzzDVYRnin
 6KJciYCx/5c/qbzy/5W29C+FliF8yvNZDde4dis1Zze4KQmcGJwxLn4OfzlmPpHD34HlrEKkOFB
 AfOLV2RWECofZ2np/lHfvf6050Mwx1ln
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-74ad45bb45bmr5615186b3a.16.1750877942976; 
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg8vNYWkF6glZsGu/qF4tKCYvJINSQzai59ELYbebz2aZfun5XKFQM14/85G3r1zrV/TUgLA==
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-74ad45bb45bmr5615157b3a.16.1750877942543; 
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e08cfbsm5259906b3a.18.2025.06.25.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 27/42] drm/msm: Crashdump support for sparse
Date: Wed, 25 Jun 2025 11:47:20 -0700
Message-ID: <20250625184918.124608-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lJSrGfgHNw3023_GdRc-0QVsZdQIel8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX7wa/c1bQRGcf
 69OANpNkbGgHMil9WW9uyv1ZbkEHdjYr7Yz4XK5ddTmv1ZgJK8LsnQ/5kNZki+vN+OG0AwN881D
 6slVYIJihq0vqz9PK8hAPIv5LoloM5iM/arBiCTH23O2q0JUi1JNUpN/Tf7bjJa3BwxnsL3kn0o
 NRK+hP5AEdTP4B9ynOQswJKFCRZMedISVfJd1BEBxm1xFuk49M07gU7FvZm6JKp6ZYkICS1wKsC
 EtbNAvbhynRdH4KhlpbVlmRgHI8ACIyj0QBZ1q0XxrEVNtEIKoiZInnattUI2IWcBIEcFn538Al
 noS9ReqLbjdgKJEvuk92/G/RxzLafb00vuh2ZnUHmD/KhgWpG7D2yIo7ClCzGbQqGq8BoyXY7XK
 6ixel8MZUFvEMvzz5MKC7yrt05QOrNeka2Jx+xKqtGrdn/qGTGBjYMd6d/7VtwV1A/n51xog
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46f7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lJSrGfgHNw3023_GdRc-0QVsZdQIel8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

