Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3EAED09B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7410E385;
	Sun, 29 Jun 2025 20:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjChzmTf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53E10E37D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJuPVA026473
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=H+PwAR+LcFx
 tNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=; b=VjChzmTfPSxjfWmUMp8tV9s2/Gs
 ED6SfbfXB3F/E1CCpfu9EBlCJ38Ss1XUqy9YwMPQ1Mr6zPYXSaowRap1J3otU0oy
 TgBqYzYwAtGP7HyACUvsGLA4IHCOJ+a1G4AvndsSR/y5TVFTdAiQ3wqKjIXDSLHO
 7mMrQW0/+KFhclAidNpWzt3WWnaSPhga269VtS8dV+KO4uvsDXwqzupEMD0jQrY6
 PvxnXzO3djtea/hGuztR7db1ENiiTZ3Rc+/sM7g3L5JhJpVyUb/KA+M/61xKladK
 LtxkI+6DXrKEIeyR6CgKnlosfAYlYjWpfZz9idw/h2o2ykzZZAgiJLbtkTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpthay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74858256d38so1281511b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228240; x=1751833040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+PwAR+LcFxtNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=;
 b=lkzTDGmkL+pY7WpcQ8Vi9a5kRmwONHKAYlD03+R03Wi0BCPVdtM0WMGdM2dVyVo1wg
 2rHdLkKRw5s7W3sRCqtjdMYojQa5WukhLSTlf7a6xRIjBXQ+bHQgWfRDXtrWQtgjS/Up
 NBTWASWfjuvCLgDTXTyMVopiB6Rugl6bQaqPxA+8NhZaZTbDU13QZbci6+QNphMUnIFR
 o5NfFCqwwfO5wN4DLoeeonU3yHyYoFeG139sAcSs1ShrxI4m5e4PP6mhMDRLGJjoK/ry
 /RftO4MuEGrlQcaXBbcOyKzMKx+ECXRFoDaOjVm6FloqgngbGV4z7xHrP49/JODc7tVv
 iPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLwa6QNOj5Kn/yFIuMa3pSmt5IPPTfKexHoYIZSpsxgdQFwlUnW7HkiRWROyzijCk9gugWS0o9xHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEUtKqHoeYDegiPUhWUlKYJtYE3VY0Gw16+nN5Il6JaP3wMMbd
 oNF7hN4+4i7LN8Kqcpv6R/OA19vAM4pns+33BNpuuzCZC1fJUouzZ/J/K3hCu2GEwTOZwzZLzfF
 q2Lz0idtlgYkOjkNjeUIzBaxVuapfv7otUM0CJWc9OYN/a43lqbmhqdXrND7+V8glOAIYbYA=
X-Gm-Gg: ASbGncvIKkFRKvofYoBMDfm7x3ez9uYTc9/nW0+l93FO2HCler2Loe6ey8oqzQBsQZv
 vqnh5qvdQyIrCNV0fqoiP0t46upD9KsScZQsvz4JJ6LxwcAl0lhA/74pDfXpGHSV1fv0n3Hqp0Q
 1uLJmmpM3UJfnkcYb4okDtouMa81d2zlSKE9aZXUAmEbGt3ZxhPqJ3m55aGinZKFyqIM/a+bGzZ
 7jo5K7N3dB+KQNjsrwcFgPv9TXt0UOG0D0ldDb4E9+yuEeanEE5dpHl11UhhwpzBi7U38xpoWFJ
 LX3iP8DzvUIu001biTUIPplii4wAdvB7kA==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id
 adf61e73a8af0-220a16a31b8mr16389645637.19.1751228239766; 
 Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+DNxLLr1TV8ybCvuLW2bEtYQJQDNo3DFmHJc+uBq6Qmv0Y0YvTITh2swb06/IBU6JeCCoDQ==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id
 adf61e73a8af0-220a16a31b8mr16389620637.19.1751228239357; 
 Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5806380sm7545854b3a.172.2025.06.29.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 42/42] drm/msm: Add VM_BIND throttling
Date: Sun, 29 Jun 2025 13:13:25 -0700
Message-ID: <20250629201530.25775-43-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXzyai/MThHZB5
 mY2Q5s0VVxwAezuxz5X+c6V+TK5Emwe3DqiFPg3p37j2tErKTjjqaxSfHlSM2ZsnLGJGJzgf7uN
 O6TK2l0MMDW2RsCU+J4cBxTySzvzF1rXd3jIN9BdMu9alaqNAoHi7lCF48g0OPCV9TOh2KlLGqy
 uAPgezdiPM832SyZMbcfhDbgYP+jdOruPN0d9AXkkCZIgAV6fyyGKcQgJ/zrC24+MmjMhRxnGPb
 PkTLVK2RzUgYMxm/XMoPb4B/2XCS3oCCaLybMkzVTdmxYSZeN0vcN1lLuD2J31vgELKIDlWcNlh
 A8Yq1WNe/oQfGjPg+wuEGFUudhhvKtQOUUh5XOTg6VpH2nFqhCbUhP3dLB4arvVFHIukENyeBhb
 V4v8BbxzNQsKyuYbODY2phAxqZI9H9+7drUJEgXOY/kOx3+CmeTq7TEDzI3YcLJC89IlAXb9
X-Proofpoint-ORIG-GUID: jPbkX-ByKbySmd8_oa13XL8339wtzrXP
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f50 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EjYnvkII5fvYeB9zoMQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: jPbkX-ByKbySmd8_oa13XL8339wtzrXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5c0c59e4835c..88239da1cd72 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -75,6 +75,26 @@ struct msm_gem_vm {
 	 */
 	struct drm_gpu_scheduler sched;
 
+	/**
+	 * @prealloc_throttle: Used to throttle VM_BIND ops if too much pre-
+	 * allocated memory is in flight.
+	 *
+	 * Because we have to pre-allocate pgtable pages for the worst case
+	 * (ie. new mappings do not share any PTEs with existing mappings)
+	 * we could end up consuming a lot of resources transiently.  The
+	 * prealloc_throttle puts an upper bound on that.
+	 */
+	struct {
+		/** @wait: Notified when preallocated resources are released */
+		wait_queue_head_t wait;
+
+		/**
+		 * @in_flight: The # of preallocated pgtable pages in-flight
+		 * for queued VM_BIND jobs.
+		 */
+		atomic_t in_flight;
+	} prealloc_throttle;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 63f4d078e1a2..49f460e4302e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -721,6 +723,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 		kfree(op);
 	}
 
+	wake_up(&vm->prealloc_throttle.wait);
+
 	kfree(job);
 }
 
@@ -783,6 +787,8 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		ret = drm_sched_init(&vm->sched, &args);
 		if (ret)
 			goto err_free_dummy;
+
+		init_waitqueue_head(&vm->prealloc_throttle.wait);
 	}
 
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
@@ -1089,10 +1095,12 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1129,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			vm->prealloc_throttle.wait,
+			atomic_read(&vm->prealloc_throttle.in_flight) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1433,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
-- 
2.50.0

