Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE1AED04B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D5210E11E;
	Sun, 29 Jun 2025 20:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7N3heOc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51C10E0EE
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFVXno029771
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
 j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=E7N3heOcx/wkizhHj/1SljOU1k1
 ZwEoyYKAwIV25v7ul4WeTbDK7Uz8du6VG7PEDFesXihyu5H1DFCPjpJMHW553nZf
 h5tf6u6wdMD9oIC4+P0BijzKS3o59vqc6pcZhIcdIvrpLctByQ7nhgifAX5vr/UQ
 OhNDYL02ZqJ415UASVkiEZh4ioUJl6oOTqPwFyW0G0yf7XRmTpGwuVACSkXy0Nwc
 etZoKq8Xufvh3tHS+WKLTycFtdnfXexcAwsMrJSW7+sLu72Fw95dDV988tIaftTX
 Z2irKmDx5PX3Zw0bDb6LUYfHRCNEboeOIyYTssYDc/We7NRMpbE1K8M9rbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62m9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2358de17665so9785355ad.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228155; x=1751832955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
 b=jYtx6WRxOCADyLixj3PitAevDyVZA1XnYwJGqwwQ3iMG7MOje/Zl98uhinKvD/Up46
 SUgAwR5UOuvKlPmlsSNGfKU6nvGCkU1CbTqgw8AdLTzc+8EgUL9t1BLES9Y/RI8QwVGU
 hdV8MUBfuXHnLeMA1MwTKI5LJ4Ef2KJLwmVgm+9YrKtONimxg6yYtpjPGFdaEDWjR8mP
 v7TT+eJbpseaj8Xg68VDvuyg8zuD7lTrm/UIMY6IdZAJWBn3s/Cn2v4yPwmaZpb8yU/b
 0hkkwLipDuao7F9oJq5I64gHELDv/mGZZaXsOOqyQB2ftdXA1FaFDe2O2Bo3ldBkVSYh
 7XYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0h70xSgsn4tVudl142+cCqYiFzIBUcncZ57YSKsvMccCSnTQRPrdd2T5JRvUcVqfnlVvbBQF5vsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybHbMIHQd1P2jc2nmKPLdFsO9V5PPsHu0sEG8+NjdtzpM5VPpW
 bDfdmizvgkXnBjkMZoVxNbbLgFXfA0IJrmbBkjMFmQvHmZzAJrQQsk8qHWY7k+yBbxCMrCQBWsM
 ZRWg2IDfcOt4sZgB8qDRy6/50lt6PcKbS6BxnxswxKjjBfOZ0EiY9+TQAMz1kBVjMLMxHQ2k=
X-Gm-Gg: ASbGncvaLAU564N4R6yGYBlCIiKZpzng63LlmXRIRwrS5/lxzOU+MhOdgSeYUfzHU4Q
 BHegGIviwgyk3p3XEJ5yAof1N3dCOz1FHOd8f+lDVLQaS/3rZ+P1G8Nu5IW6VzoNYMSrf7X2XCr
 pJAUZnYplP+xKz9TFLZNAWedhTpCN17mRz2NZHYosntHyCJ4aIwk4kKurAJSViDPmd6AyYIGSp8
 Am9lhA6ei/9E+2qPJIJMm2kuz+GHKdToJw2weAYWhj24npSngByF4HIJebp8BDljpg7tN90sL5V
 PAZDnqkVtedHS0uTZmwcT51CDy67frSstA==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id
 d9443c01a7336-23ac3dec40amr193803135ad.5.1751228154676; 
 Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YzmMzYaVmo4a1PENReEL/5V/swGt42s5m7GGennouRebdx4cHCuSsKP1wUZ1/kFFwcF0lQ==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id
 d9443c01a7336-23ac3dec40amr193802645ad.5.1751228154205; 
 Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f2569sm66066195ad.64.2025.06.29.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:15:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 13:12:48 -0700
Message-ID: <20250629201530.25775-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXw+adVz8vWADA
 BuuG9K17VcZEZNtPtCP3577igC1CI1keyUpkjdv2GcNjEiL7UmC0z4PUi4eCt8R1OTVNYw32ebD
 m3dKFf2OEqdEd1DQ1pIsJK39rxIEyiMYYllm5Y7ZBUglFh0MB/HMxoVo+7W79eR3tCS1bMz7xP2
 Rp2hk0XlGcfweow1S+/LUNMrwPEJxrtwbS4Lz/SYUhDdLYLiLpfkV/yHEH6VaVmxqWqf7H1ZMP1
 37A0P8sKbvWFIQZAUUeOE4eVWCF0eBA+NyXjHtCQJWK3DnX3kfuRjEH3RglIcDT3TB9PiPkuRAB
 reGIIuSRWcvgWIDfhU3HXeFqs3m5fNi1Kb0GHx+vPYgmPDTJ3OThCrCMir6HRPIFlZ0IudFUlHF
 g+ubSfx6DVF1G5XBjvEKn11CFHBtmPcXkJ8ZTtwcgNQ2NQsejiflUIhWayk6EAf4tqPxhhmd
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619efb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jzDeBGmovs1T2MxWO7iNEYEfFFNQQgpj
X-Proofpoint-ORIG-GUID: jzDeBGmovs1T2MxWO7iNEYEfFFNQQgpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

