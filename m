Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD3AECD5F
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71810E348;
	Sun, 29 Jun 2025 14:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah42uKy6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41C10E348
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAoIL2013790
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=B7t3J9Gz7Wr
 bwv2GHFeD9oavvwiDOSYnGrAA3GiBoCM=; b=Ah42uKy6WruGMZPvQ/PiGa29l6g
 YYtcA8xtYb9JeXCglgN6Aw9O1jiWeyCHQny5UJM2GznwXRbUKltl7VrQ6fRPrx30
 t4ZDQLAqBN26JP1p+HTTpRIVEyXxiMDOqvXIyrC44iBz8GYH7vOJW8+IQJkC5aGE
 yTmoT/Tbr8N2q8tmRwTDbPqaEqmPMh4GIYr4YHaks1eU0rX6MSuWSDdSaZK1A2SO
 J/tBY9TlipbFZvNgls7ycn+EjfMVkKL91XSL5KqU/kPcqd/l4ZDsgqjWsBjUXXx0
 sFTGAXLaDpdy0k04Hgj8jkM1VKg/eAf9DYF40/Vp/W4RRCVB1vjuSY3/zrg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2f0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so2524513b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206101; x=1751810901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7t3J9Gz7Wrbwv2GHFeD9oavvwiDOSYnGrAA3GiBoCM=;
 b=eGtEJ+WV0GtEDQCnH4+Qi+aaFQX6FM9hzzKXOY2SqAg1dUNhkZ3Rf6g6Kp7ca5m0xo
 MXM+98sVhq4p1FsMpqe8kaphaAb2I/j1Ho8ObxMt1D9LR7RSMgXNmc7dSQPCCE0hzaH7
 wH6EyxCaN0TsPXpfLfQhBIO0JfOLIkefQyjjFEWpqe9Br3lUESJKDj9+flozEMOHDjXV
 7CmSz80YDN/zzeV+Wcl3JxgZ/A3ibWTksNRNKLKdzSPqji63IV2cR/aBSEYb1LyVwYFl
 DZ438JxJhLk3ycoYPEEsev/H+Tq/go8oeI7p1vMhdFrEFQtjIp7Q65MJgQOygqJxIJvo
 fpTg==
X-Gm-Message-State: AOJu0YzzY7E2BSw72fzEJfoqOpU5zxEfxFjWhFk8FaCJnWKHJTfVdIim
 MJXEnfFnQQnSI9kOABN0gXg4E7Tzco09l8N+NBvMo6mi9s9c9vOT87Prepvw/CHDVMbRfjc+RQ9
 yMvLRW+NVPpmbOQddRlA8iH/eF6TFuqKX+jZFj1AGp25oh6CDFLVxPmKNSPTzUVBB2IOA0n0=
X-Gm-Gg: ASbGncvqRGmebsjv+FAjEIVCaHe4dLihvFS0V/LTu4dnPm+6KPphkrtlmGUth5u/83l
 5ZqpaHNvgwP8hCEdVdBuut1yuZbG1jfIXFQ+f0wSTCL627rNQR6K8wIjUy9EdpCPc1jUJvBnvE5
 2uJaoQsCa1OT/+4oxdlhVn/S5fVGzCkiXOL8GGeVnyAwaETFqMRDw3+cEp8X5DEdrgaZ3PyjpNJ
 MHWHat/D/1QVMRLMZMdQDoUZuwmbGrKHV2MFpnTviiV9hr7POMzuD5dAdLxcZsjWRU+uw4eo6kY
 4jXyZr8EnyDkekZ8Hqv46F/5AUlRKsO1
X-Received: by 2002:a05:6a00:1914:b0:748:ef3d:3247 with SMTP id
 d2e1a72fcca58-74af7046bd3mr14810403b3a.20.1751206101466; 
 Sun, 29 Jun 2025 07:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeFPIiwhi3m4DwFAWJK1g1uk8hI6kROjrLRrGCACj+Y91U6WovNlDgcMK9sTU7GMpxFYpzZg==
X-Received: by 2002:a05:6a00:1914:b0:748:ef3d:3247 with SMTP id
 d2e1a72fcca58-74af7046bd3mr14810360b3a.20.1751206101057; 
 Sun, 29 Jun 2025 07:08:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cffd8sm7213107b3a.137.2025.06.29.07.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
Date: Sun, 29 Jun 2025 07:03:45 -0700
Message-ID: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5C_Z6DoM_mdQm8Vo97z9-fsk3LD5yboY
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148d6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=9ew1I-5mWBoiHqGEK3IA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5C_Z6DoM_mdQm8Vo97z9-fsk3LD5yboY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX8whHlFxbwhv1
 Wov84OKKUfjU69DcLC8pqzlIXtFsbckv0GHJ/GT11I1lieTqNU4b3UxBTXara+DqGCAMUm52ciX
 iDrilKY+MRQAkCEAnEmG+wWX2T5SyrVItIM1DtyHZiQ7EpYo6XnxOC6wtCwjp1N72PRp+XJqxkF
 C/tQgNCtp8HfjTw5R03N/UAgHZSr48ck/WBCa1jo9+Pq4my9swNUjtKVcfmJmj0qwSwvnJH+XVq
 qDirYML12SYd1Chd3frzbdp0T/ZMk9AHW0ej+kEsP+gzWsm4aYRIN3lb8ovZ+WA1COodQtZTNv5
 sXN/xpovhCGYBGlHK5BE2vGKSOw205ibAKylbrgcGIq8PhkaJe20D68JXha3UfsliWWsKA9LuDk
 GGv+9NCqYlE6Zo2NqzWiDvEzJojVTIf5blKBmyiHyWF0BRu7KSJnkulOgU3FSNcqHWIBQUuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h     |  3 +++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 907ebf5073e6..bb3a6e8320c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1089,10 +1091,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			to_msm_vm(job->vm)->sched.job_scheduled,
+			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1428,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b2a96544f92a..8bb8bd080cb0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -549,6 +549,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -563,6 +565,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.50.0

