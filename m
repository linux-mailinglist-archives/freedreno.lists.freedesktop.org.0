Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCCACF69E
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45210E8A8;
	Thu,  5 Jun 2025 18:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0iRk1uN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719210E8A8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558vsJC011530
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
 sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=F0iRk1uNT/wx0mzuCe7xK/aMnDy
 vhMRE7SuFAmZZQuUWa802yiJynMvI6vtkWKAefljtPIeMsJpEYEp6wUNCFhICZ36
 SYxZBJoBcQc9UoMlmDi/hOs3Rx66DBHahSAfucZso9Cu5MMr8/FImGGwwtZO0+gy
 0pjWyjr+ZqDsEPwtQOeT8aoEGluB82SJIseTJ2pxfKKve4eXCCwe64iSPfUexcX3
 gGsBjg+AOxJr4SZ2YYlBKpVrQxBBPxr9yPvYdcIKcKwFgasIiAqzDqjDFs1bct4R
 h68mp/8X1E//Yg4oh02W72BYXK/6/8emxlWAU+z5QH3VsRfWwyH3EcywW6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg057-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311f4f2e6baso1460704a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148332; x=1749753132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
 b=mTu9W2dcbVg0MAESwxex9RYkRbYaHfmy+KXrkqyzl8QHqmDOrNPa2Ai3T9ZpiJHbP7
 5XNhuCTvNKwG1Qxd2YPy+s9T42nrpNd3gu4HXa5zuZUuyKxsGSsyHUiSZK8M2Rhc29N5
 EvphWkToRq4ocrhbMq3Rz/AlrAmf5c715l4/Hr1Wjgiyd05thljBHd2toZ4me0LmCmT2
 bOJT7i5ahOlk8IGR97SCUEr4NamCpR7P1YONdcutuNd9XdJrdukBE3S3r9Iy+/w5ZuuU
 kaE1iG68XzGQbO/TO4BDO8zY0MkADLb7GeckifrLBMaT2Uq/BcZn5eOmDnaofh7/cHOj
 lI9g==
X-Gm-Message-State: AOJu0Yz2f/xhGVFzHyChbooXRzZ4wphxK4H+4Kxka8DJf4ioYM1NTmie
 o+Btq+7tWMzGaVdKOx08us2w8q4IUfh44SMekAb42GVek4Ei5thx9FD4ji55C6ehA7xxSRdx6Bj
 DZyfXOoxr+CKZTqQlnACiBnRNmC63aGlNmNUtjOrAQOI2Vum8sfj2n868arwJavTrtLfgKgI=
X-Gm-Gg: ASbGnct/jjGHPC8f1NzZusDuxVxyjV82WSIepmKuSiSBgHluhyADjBP614eq8Tg3zyb
 BJa9dtIFmXBWJx/I+SDcKNO/ae4A0go0DoYpTpFDbV1fx/qrccrIeVkfGnzLr1stqHHpMHYu+Zo
 cwIafw1tUUuSbxc7aZd09O9UvaSrElqEGlHR7xR648EFCOO/24lI4zwuELmpTFnZeaGDneU2Sai
 2BQjYfNjPogUtfE93vxOkEwPWwcm9C4ses0YwT+6Y5WhP+Ki5SwyVyXPCL5AcoA2ERS0MLuazyC
 IL22M0LktEoppIPgCwhvZg==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id
 98e67ed59e1d1-3134788faefmr998039a91.33.1749148332196; 
 Thu, 05 Jun 2025 11:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKBDew32EdipW62Q0cflXApQbfZYLbCKMDJJCflNU0zpokfB0+AAOj2B64JXMPgxhpvo9fg==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id
 98e67ed59e1d1-3134788faefmr997991a91.33.1749148331774; 
 Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132ad9a4aasm1558718a91.1.2025.06.05.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/40] drm/msm: Improve msm_context comments
Date: Thu,  5 Jun 2025 11:28:48 -0700
Message-ID: <20250605183111.163594-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VBOe0oLiRje2jo3vOAvfu-0VTSsxPWAN
X-Proofpoint-GUID: VBOe0oLiRje2jo3vOAvfu-0VTSsxPWAN
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e2ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX71vjhYmh8NFZ
 Wpy2tYFdptWdXs4Ij2eYiZ55AjflsmBmhQnjLRak97F9ucd+3x+grx/7Xpna1Mx9Ij7Hri8CE53
 dzVJzktirQOfp84IEhKRDHkbG+5vgSOr3xSKjPhju7C2oWdGm624HSYnINmB5lEHhDuydJEm+py
 cJ9xxskEnqEBaE9sfESrEbT+w78Nkk4IfZrOnNLy6n85+yRcU5JO5xQe8NEyJRwHVSIgaWFhkDA
 lixAitBsOpTkgOZMNKYJbOgbBQdpGkwfSIRFcey7+ncC/NgGIgiV+CM1Xjsp4Y6TM7zZjRXtCq7
 pGB8IOSn8L7ZzlbR1lWXsiObjpfoCpIRIFJ+U9R3L3FjrNE7mLYYnI4QmIx8VUaAZSq/9duCW4A
 R3T05zunpVu0y9GrSuAqRVYCylQgYELzvR9qVfg6EzkZfSO8x8ZYbA6wC4crbf3cazw8MAqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0

