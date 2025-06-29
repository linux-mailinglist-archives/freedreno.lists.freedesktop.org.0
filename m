Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C929AECD11
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17710E29B;
	Sun, 29 Jun 2025 14:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaEk47AB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55EC10E299
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TD0DXR002817
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
 j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=NaEk47ABuRzh6W5uqQPjv9TLdxf
 1PWwpI+Y+sqgKLCgOLoTOydS2tRKxmDgP804/pnd5VpgFzDKLHA3cy6BlXYPIQBv
 BsuXKWtP80gY6HkSxV+ze+Q58fD4ndag/1O4NK1894Kla8jD6GKZGUS+BGmfYBzd
 S1GCuS1Ps8LNGfHPEDWf/ysDhCcFZMK+FZebQUmlSso7DPNw7SYq3xkw7nDDrJs0
 bUyuupBqg3yC/C5OPfaahQY3YkVtb9bGQyy7+qrCiYTSJHIGONXRp/gG/gTNTzlt
 dlne/8NTDRTazDYqEnsppUpO+m9b9pcDxfTcGXeF1FKC6OCi2P77UPyZcxg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpt4f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7394772635dso2703433b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206026; x=1751810826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
 b=w+Cb1i3+qR0o4dg6ms/p6t38ZdsSDiGDz6s0SPQXUNLBuyyuQX/ufS3L2mb+M00juu
 4yvKb4+3ROlkJGZpyDFcpvOWLyR0QntOTU7mQrvmzAG+o+6sUJa9tPm74xNQTWUZuXKj
 ySfsfuHPmCmRZeaXhn6WsvZGnePrAe5LY3h/pvLfyWSxQhhz4G37V1FOUhphtBuigCw9
 R4udFpyMAr5h7O524cpG3Le82z4adDqfbBQuGXh72oJr2U4MofcAUkyKZK5Mmy8bSfct
 pXE0sVZCSAz7/U5WI9YYqC9lelDFbrIQVdTwiEFubfXU1YAU3RoWvfjTHmVNU4gsA9Mn
 kgyw==
X-Gm-Message-State: AOJu0YxK5tGFSJiiN6se6ymUJ6AgpEY8OX5GINHAG/l/33ZrPxODpoPd
 NjNa7Qhtv0XHmax64B6KNBuFxBeZVAvmQZbpzXh1sa1fE6eRbYhLwaQZBeg9JAlZ0GVbZIYJ3wn
 4kju6ZuJiMYQk6TSCDtnQyWTQ+dmHw1FptG353UhVa3MWUrL6nF6qYTPfTfnORk1dLHbG79E=
X-Gm-Gg: ASbGncuIPzE6aXfq5YKkfFNrAFLd5WNrP8QsPHOlXeuYVWA8G1ZRWzwXu1djWtIay+I
 VwAcMfrQAsRyZUWfpty04Bhyxvv/ICE+w1z+B4zlLdbuALSTn4vC25u67BuZeio02fm0cwByVFv
 1TtvL7+Etyer0oWnRc39CLdTeqdzx9aTc3f6Da0odOxQx8hhqLzUp9z66wawNFkOpA0cXTLkHVa
 zfNCHrW6/3UFdzERBTz/FEFMgsWkY58eK7VVQrO/uEr08Y41ZHGr1/RoB2UDFngzEKt0suDy3c0
 RA2iFCM5SKqVa5119XeIWsf1AJZk7cZy
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id
 d2e1a72fcca58-74af6f081bemr13138732b3a.11.1751206026232; 
 Sun, 29 Jun 2025 07:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIXYyPL2Cjmw2iox/a/szKCrDIPjBJFXEGszT8sAnkZ3Ckn55G7xC/dDATm2HWxiGpLH3gg==
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id
 d2e1a72fcca58-74af6f081bemr13138702b3a.11.1751206025796; 
 Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da944sm5863172a12.60.2025.06.29.07.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 07:03:08 -0700
Message-ID: <20250629140537.30850-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+dXyXnTG2JXJ
 kZ+rHqysG7+g9cyh8PILAu5/OO1ogaIV5zWe7lTq4tLE6+PHoYKwvTJphLkRsPqrPzcgD+VYJuf
 AwCJa8kOmsqMEU0NYW8EK6MIIdEvNzZiFLJDE33VS5ZddBi2DZrHAmRxmb40fOwSTWiE52r0VXt
 y32GKbpkwm5gjA2zrbSKYjZGhuRwI88+KPYsWGiy1TgXTjl+CZ/1jgOR2Yp9ydcHydm8NB6EiZt
 p5yPL34Q3ygunfhD+rSFR/9Xx3WN1SsIBLFuQL1YM6KXq2k3S6TYZeo4JdvVFG3BRD1ZGdrxMML
 PLzqLOdxKxfhlPF02L7iqmIhxEKlj27C9mpI1lIAFMN6UdwMcfwQnW4v32PpMEv0+6wEzS3ShZ0
 vGY94xiUjbRwBuAZtxXLusEIIt6kVSSO7PWA2A2ksUS2cWMpB1260rY1O7au7shkGMJEE4wj
X-Proofpoint-ORIG-GUID: VW3NzEaGQeB1qbITiAKH7osUO8yaVEPS
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=6861488b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: VW3NzEaGQeB1qbITiAKH7osUO8yaVEPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 937b7cdddadd..d30a1eedfda6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -342,25 +342,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -378,21 +392,21 @@ struct msm_context {
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
@@ -400,7 +414,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -408,7 +422,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -421,7 +435,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.50.0

