Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD165ACF6F1
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F8210E9F0;
	Thu,  5 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt+kGGO5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547FB10E985
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GwPiu004160
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aq5Mlb2wvM6
 cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=; b=Qt+kGGO5q7zuA0bUvX990t53AK2
 aorO+Z98d+v2HySgmc1Jfv4IpuLsqOC2N5HGaIV8myIW+CyAo8cuSyiuCcmlNod3
 BynZ9OJJ6UtF+LnCg1MEyCPjAt3YIQa8LBnGz78er7c4lHi2eL7LEERSaPJCzSgf
 LWJmsihV6AN/SJrIG4pCQu0v57sUXC2Q5xg4+GUx6OUCnFzZX7kdiLKpu7tjwfh1
 JjnqaYGk/OVU6Cz9wEdhTPwEhtgYrME8sOxA0GHmqSfP4ezA+TG6uwmENHbcNvFk
 LxyNgqJ3PzQMzNOQojJwa3mURpQmYl+A7Iqtm1N8PoTuK4qVzKPLiigyYiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me1s2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235842baba4so12088335ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148405; x=1749753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aq5Mlb2wvM6cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=;
 b=GAdmeW60CbOQuyQSbRKCi3jpJQiB7c7DQEpHuRmJet4dTOVdT+hp/NumvWbobnLdJi
 29d0sZWBbYLM7gaxG7JFoXVR4kbkPu9xLlw7f2XAu17OPYx5X5gOu6Pnq9BWiq+fPu6G
 6AxMz4LViHanJLgL2JoAqGrYesdOoBuL/DCVl7anpz6Xr9wNOit0fLT18Ty4j8ssUxUt
 INxXaiiiRYgiU9JCpY+s14ZnaXDGUEghKbBlz4BIHVXTx33PQkjPpywzyKmHie+ISuIC
 CdOBTHwWNJVPY/B6OfIap769gZ6qC+mN/7AXRKrPAbY3bdMLgYTEOgdikAPtlep1tKrP
 UGDw==
X-Gm-Message-State: AOJu0Ywx/KOHNL+IMbrbwCVrV7NghcSdRAGKnGs8LH7RfhwXtSwNPOm8
 sSI9Y7h189Lv8ryh/mU2HPV72P/SpGca9bJJCp0DAvOIk7nTs+sRBkzIVWw4AhcdtFWG1mzUNg0
 IBBrPkHqKYABD4gb+vBeXMPsJnjJ6KWimU8V3t7CxBMyCTW139Ai4DlAwx/tq2kf0winXYho=
X-Gm-Gg: ASbGncuJVuC9KaESZBOeVMXAgQTAsBMK66gZF1yQychF04fZfOItRuBaKgliJCzeEbI
 Q2GaOzCrDWVl7gWhMpGekFl0bUOmYnUivIIrRmBnbmpgUdci3Jcrb2Nsmfx32jM0shHVs3tIk4V
 rrgGjLDOihFHv6E54I2kVYgi1XdFunzV2XvjHNQCZSYmnvidWStvZ3247UdWW13x/kISnHH3FBm
 Dp7rYAiHaf8uS03v9CZPWtZf3twbeXx2i3C/7rHqa3j+SDVZPo/cUQNc4KF1mtefHEvKuJR9wNK
 6ttchzgzVUjCuDILLZXEjw==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id
 d9443c01a7336-23601ed546dmr4754015ad.43.1749148404764; 
 Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv4pHc4fnYu4s1RXNlIzNDDJsXYuIILJZfiVF+w0RPFujOSg/3fi9tGM3rphg+6/s7TBErbQ==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id
 d9443c01a7336-23601ed546dmr4753535ad.43.1749148404374; 
 Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf47c0sm122369965ad.175.2025.06.05.11.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 40/40] drm/msm: Add VM_BIND throttling
Date: Thu,  5 Jun 2025 11:29:25 -0700
Message-ID: <20250605183111.163594-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xb5Vvkxl5k2Xf9Kxzbbu43M2-qC5sOsM
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=6841e30e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=x_1jt8ETcTvhpFk4nSoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: xb5Vvkxl5k2Xf9Kxzbbu43M2-qC5sOsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX6A93PsxzfaOS
 kq5EFDjg2hF06JRL8qKj9P7aP9BGCsh59xkgEIdkvmHoM+zkaTJl6y69k/lshvhJW8eJXuJeImv
 xarUWIF7NIh9DHEItAXnuCo9NuSJ07gQcH0vXb0VOoG6YOtaFTs59M+XfphhA6r4+C2AC8PLH39
 v/sJqLdWc77ck1tJ6C23ZwLXI5zJCT6l2cMP7fw40cBTx3LB8I43j2NIdxrYfSOJw9HbaTqmsB/
 dKgcziurpVQLqtuWdc9hUAb9oIUCec2VEeu5VxuH/7cbix+XOWGqKa8aEmnEY+zW9dfOtM7gB0q
 ex99Rc8A9aMghQuqu90lh7tR1m8pUDmLfLq5lVjzCIpCdYgfIpDS6OpNfcahjwQuT/o4A0vJPVZ
 9HB5aR89C/Tk4lkOwd+eUPMdCa4Mkopt+dmBuJq0A/qvghSynvrcWEyE7zier5vrzZS8Cfnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166
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
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h     |  3 +++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b6de87e5c3f7..83f6f95b4865 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1087,10 +1089,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
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
@@ -1119,6 +1122,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
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
@@ -1389,7 +1406,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 31b83e9e3673..5508885d865f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -555,6 +555,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -569,6 +571,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.49.0

