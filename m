Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A331AAED085
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADE910E382;
	Sun, 29 Jun 2025 20:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLAWhJFP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CF210E37E
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAvTDU018611
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
 eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=NLAWhJFPbq39BjypQRne8ydDAaM
 OolAh9mjryiU5IR4UO0JxAmwV0D6/5e0bkjZyAn4KbFUEBpTylJaCPQfzuVtn5pi
 oG82sdajtE6GsEAoWing/jw5mB0wt7984SDNjudPS1d0IlV2wMF6wq4xKQyt58DN
 6h71dEw34Er6vX41qI+u9uno4j9MvDUmTM+xI6ckWCO8MKbzlvEY48S4rR1l2PbP
 MVzhAhWYp/oGyXsWq1aVItSEctqXm/z5Xr5fThOb80h6CzH7ONP2hZe74tuue6xA
 TJjzAOHlDH1/UZn+ltJdl0GEedUwV749oaKtTamMawopr84fqDV/xlvYDLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2tk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237e6963f70so54090775ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228216; x=1751833016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
 b=U+3jh5JsCn6Nb9dOQrrLCrE8dSHJr2QN5invOBuuk5BORqde+MbPebjZ8mLGTzEoo/
 TI9jf2zQbjyTPggT/LThMWtfycNfvwujgQT+IdyfDy/jINODkHtixJSGlaryOMrskGhQ
 CN7xDTsxr+W69P6N2ba2xXs+W7nxO0bLw+hosYL3DkuRcBFeStfF3vvz/Ir6ML65glpX
 8SAyiWOOIDRZBpEOjY5fBPhj77qV1q75o1+2S8Ior7J0tK+WZLyvxsmV1sPCfZZePDRS
 o/0B5zEl4zzS21sUB6oB6rOnaQL72keMFxdJ4WcsB/98DWroA4vN+n/rS3qsgJ+Kxonf
 agEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFTSvwKSsCiA2wtpHO+XnshBI2LGvsPQ42QwQnXilM8VX0lL55fgoc65ymYJH4PSe1Van1odK9CC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkyeHcj+iNB68RdHrM7iqSEyCOTG3zmp8+DWmuteCqKQh4hXcs
 xy7i7bFu5DHtsNvFikXxZYTA5BSV/ZNqU/wLZ8ls2m1UGHtkax3asvufGzdeVI8SYGzJ5yrNrQn
 kOOvVrJtli08D3dTPaWrWi1GVnB9t68+FbTW0wqkg+wqKG9uzvZWqKPcJh/gGT0L5FaCUWwkkYC
 daaEQ=
X-Gm-Gg: ASbGnculyuwcfo2W+KjRLr0IOR23gjf7W+K9O/CtUsguFFKV3KdlHo+sNJllaNcqBad
 f2mZoi3gF/pBDfgdeio9AyeIoK0v1n+8gU5d9pIcUd/n5S3rd6VIrSIek0BGe/h1dUdYkNWX7W5
 IDmm5T8fUOH5S5+yyO00B+WjA3D8xMnnw60zDPR9gJODnmvu82iF96pdZQ5oQ3ay/2KQ3Nbp2XG
 9fRatdvpJipmc/WSaU3I8BiV1kp/Qa0lR5AOQIHD9+kVUOeu1owLiJhh8uD9M4k0oXR8Z6xuiCw
 8bBa8LERf6Ym/3t0Xydtnri1x3472l7HOQ==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id
 d9443c01a7336-23ac40da316mr169235145ad.12.1751228216391; 
 Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaWGPydQV216i89tCogIBG6+vmTYkFs0wd5R8OzSvv9tHVI2ml64sOXsCCbBPTAcj30aV1kw==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id
 d9443c01a7336-23ac40da316mr169234945ad.12.1751228215987; 
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b833bsm67473705ad.180.2025.06.29.13.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 13:13:10 -0700
Message-ID: <20250629201530.25775-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619f39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX9jZb8IfYCXMq
 dTkpshNAMnaIwmYwX75OQj+ztuyAUQQ5amjyyc+zeFIrI0Iwh+vY+MM5qjXYjWft3Oz/SUEXeZE
 mFuuPALhOa3JCDtNlmB8jiQ9enZXhTTkX+s0isfwRHF1uD/LZ/A0rM9nufTVk+sWllyPpU502nk
 nJekj40vO4t1bZBuiBZM3DMCSTaUd+rUkcToH3DQV8Vv7yOQkKTNPNdeIBfj57/1Y8pXMIosCBb
 iT1sC+9XJG4f9vdBCzlSIYCE5BZ0MY834koWorEtQeK5n3EVQ8Am+QleShuLR+yQZCufRuEXgSw
 FezU2XbokDWS5zziiw4J7EOk/7gm/af1hzWX2XRG1/BByTXFF0leyRldBebHfHjBdHtRAb6INtL
 4FVEfmZkfb6YqmF+njYuQsVkAnpmGQ1C48pa33WsiAFmynnIjcUjFr5+VBMSg81ITDevRpy4
X-Proofpoint-ORIG-GUID: GBw7BtZA9_MOvWsSsCUjCa5F5YouskTF
X-Proofpoint-GUID: GBw7BtZA9_MOvWsSsCUjCa5F5YouskTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171
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

