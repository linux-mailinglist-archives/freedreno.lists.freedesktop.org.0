Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1AAED09D
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E1D10E386;
	Sun, 29 Jun 2025 20:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPWB+XVG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFCE10E369
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIk985006080
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I4qWRLNE0J0
 R1zX7la3wdwz6YdoD5A69AfGQZd1gOIs=; b=MPWB+XVG5OtwHb7sUuW6DPsSGRq
 Smd2SKfP2PMen0zmPgM6MwS1DTjzCI2zL+SiprO5JvTL+W+Zg1CLpH2tziPsEb42
 zB907MkPm4ziBjM3tYoIPwjIUId0AOaFwwyAXF+CE5gymphQaQ4bDt7l3SrhLie+
 ygJqhOZ31vrpAn+yzXxRi8OlFES1ppbmEwdrGmiqKbhC6FZUoOR14hW/IlGlsBfz
 yLT1iw7JYl5pB4Rfibca97HXkx/XqpWxJ5x83IVAu3haD/gJxlh/A4gFgOPr6s36
 XvJFuJkvsigufsGqak3UCBM0rCGQGpagexxhUrTMipC8pFYCiTSLJz+vkLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2355651d204so29542235ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228232; x=1751833032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4qWRLNE0J0R1zX7la3wdwz6YdoD5A69AfGQZd1gOIs=;
 b=wHPXFZwNtbPpxaEE/kJ7WhLlo+MzY8hI8Q+SqMB2ZTZynGnO9BiaQhm91KQ9uJsiKv
 LStXZlItp4hF5God0lqNqDDF4EqeOmTGEeqtD5ZbOrovT1isMXwhQgsw8QKc6FXoCmLg
 ZlY04nmJDov8CxVgsmpUwYFZVAu7GVBnvZ4q/KW3xfWwyI/MYjKqqdoML+nulHs7Qgz8
 7CsN5V8gYiiUhgX9bx4lx3FWZTkVW2ABgtEEd+9GXxTDOa8BICmtFvMqgALydZmO2RSM
 7fJfFeBnWzUjEyBWPdqBa8mGWNa9e0Hv47vztN20/AR7v8SYV73UUrH7GeuCX4lWoX2i
 awzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjwUy3CvnqpDNimW+gcupRAoLm5WwJAHsf23ijwhWe1dHNlwo1/sFgBkYcmXTRskgrblP0EbP76bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZLCf4nKAl184gPV26fCRr/T+VKhYih2Hhc+mvZuyAA8unf8d7
 Z2JYNaN52VAslZKZ0ImRYDudNLDlMuOvnuSuNtE0e8BMyLwtrfn821Ky1tFLYMs0VwH5jaNJy96
 LlA6SvQaVrhLLa6JGMCP1KXwIgb3hj5kZkXKch6llpjYvWqVmT8ricOijtGUskNLkTCPu+dI=
X-Gm-Gg: ASbGncv+NZbZE/8ee4g5rrvad4jdYKwwkNJVcNpHgufm/3FRT+UW2gHTtVPHVDDM7Jz
 xtUBe42RHr/uvEFMVfLS5P4sNEY3XtPVik9nvLSS9DeSvPMPlw4RhswbEvc4jH4iQSF+syDxd5h
 uT8g/bb2sn0MiYuMhQFnUxSRUw+GyaqarljPnFqJqVOVXPBn2DCRaDORVKKz92q+6H2k57TnGFm
 6oLRdS+RsHrxYVThzM2pZc1vwsU165lCI5GFE+j4Twd0iqEGFxjcXBn7wyIMk2tFYa+CJklEeim
 aHlRDoV9QqAHTzJuY//UpvcYAyESwVW/Ew==
X-Received: by 2002:a17:903:481:b0:234:a44c:18d with SMTP id
 d9443c01a7336-23ac45c8ac9mr142686635ad.22.1751228232488; 
 Sun, 29 Jun 2025 13:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgqXWLpWh3u413uLHW7n8uV/SIdZHu7UXlZEtqI9HdxNrR6GQmrfMw5kPbpgEqNBCAovTHw==
X-Received: by 2002:a17:903:481:b0:234:a44c:18d with SMTP id
 d9443c01a7336-23ac45c8ac9mr142686435ad.22.1751228232046; 
 Sun, 29 Jun 2025 13:17:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bb29sm67006285ad.137.2025.06.29.13.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:11 -0700 (PDT)
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
Subject: [PATCH v9 37/42] drm/msm: Add VMA unmap reason
Date: Sun, 29 Jun 2025 13:13:20 -0700
Message-ID: <20250629201530.25775-38-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f49 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zvh7VyktdLLfEoY-qaYACi91dWluECVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX+Lzh6Piwm536
 4UC6EEhAtRNJpKN5XNiFI6J0nXfBS8Zxvsz/IM/rAwqn8faFHZllaqNp5UzEGMRDLIZUKMMYHEh
 2HGu2ap8eq+hKVygXJdx3+XI10MnIA/sIOqIwC70p3bOT+VSHdG6cHMR3K41j9MjSmlhaabPEPg
 0JvJpdNKGhAjXUuBIY7j0owncxp66MPr4LdQHUNLcF1Tol8R9UjC2fHrxOnlfyyi+NbWFqwgw8R
 Yvt8SWI81xwIkciAQ2Di0hN9TkNr75QWumb0HauxF+JAEDAWoAALcFuzMe6f/MmSGctto2rrz+h
 XePwADg0ZBe+ol1hqXwbCayPOnBFeTZ/Tic0KwD5c+YHGoLPkC71KTYtZy1Z9Vfkz3pR3EvDrp/
 TS3i1eT+Q+jnhzSH3e99HcxdYvrOBJEFYgZ2otrX05eOAPDgIwcYNDe5u5AJcPtsx07MWAoS
X-Proofpoint-GUID: zvh7VyktdLLfEoY-qaYACi91dWluECVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 77fdf53d3e33..e3ccda777ef3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -43,7 +43,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -57,7 +58,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -97,7 +98,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -425,7 +426,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -440,7 +442,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -617,7 +619,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -829,7 +831,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -867,7 +869,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1079,7 +1081,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 062d1b5477d6..ce5e90ba935b 100644
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
index 9564e40c542f..63f4d078e1a2 100644
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
2.50.0

