Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB9ACF6CC
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1355E10E9E8;
	Thu,  5 Jun 2025 18:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkWZuV7a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E8710E9C6
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HKXXb027678
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GjwdFtRmZCc
 ujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=; b=kkWZuV7avWl80lhhB/hYQfk7lUC
 6ExfCDrzM83Xwna53MMUjXxiazcxrSxAsGzeE65ihvVDCymzW84/GWfwdqWB4sa5
 C16lWV87dXMvGc6HZ92FI0PbHMYkOmUt4wblVak9HqGGe0uen1FBf2BsjNJAEwjy
 /c/2iU+I+K3rbtane0VO8QWDqyaiWL2U2zoG66heRi0cbYyOQ/ikJvzek73kWwh1
 D1tjYiOrm5vT6Ymg9bWJWJJHwwtzugOwkPgijgVJ7wR4hEX1/5dzmXsnndVMLM3Z
 MHTIGDiCa1zKKVJTH9bQFm+f+vGZo7HFMibe5ROQ7oyFXdwou8/2Re7O8Ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so1170601b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148378; x=1749753178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjwdFtRmZCcujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=;
 b=lSY8juzrOQsfU7vNFSz1D5iXcqliKjvLtrXXdM9si9oCDm8U1YV7y1Z5oiS3C/o2PH
 B7TH2rJ28xvRg+L8zkDiNAi+YxlqzWhcL9h6b1JZhJqB1srojXsUXqEO8JCX3aS9vEj6
 gBq2hriSL0N0fBXq9lccKTAPW3GnC4iMftTu1afSyU9R2kZAYT5lR8AmH5lAsAfTmeO0
 grW3oh3IxMVD4RQ2rOwdva2hwBKezDrwZHM2oS5NL8FMT70bupDza6CGvhl+tnUfkuUI
 0HPNAoW5JARi+xA8cprkw3l/o4Dmu4bZBvkW842Msm6TneAEDtb8g96Adp71WMe+wemk
 blXw==
X-Gm-Message-State: AOJu0Ywtf1C7QZR7WPpqIhH8oF7AaHWbzVQmOiXAIRSb6lDnGqDtpsmG
 FjX3lYxBtXJM41RBaXF3wYs0j0XCA460xFEWNOQwXctzDu+myb7fS46BgKRSYOqwNm37Pve8+ye
 q97eKvwOqdW7WFdZT1swXK0ISj8EhW19iFWjzVCWz672PTV7g7Xol/KcmzlaM9+QtWjzZhgA=
X-Gm-Gg: ASbGncs5q2/G+9qr3vMq4o+ePvYIaTW5BHzsytOMawUlDT5E1BG6A6Ja7nYeDuIFcCj
 9BWQ5la08lqliG3w6ybKdGSOHxtH8VIxJpBrBLmWYekNeStdZBB526D/Ucm0jY6yax95wSlbQQI
 Jj953wVpQhLElziySzvkN68ziIYNsrip4qNffdzxTVq1suD0LBebS5D0Abojwi16p+6eDq8cDJI
 M85tz1b+ic7uznG1E8aFZ4vxNLcrJIPQ5/6zMMFx0dWfm4K4QJ54ZYcgWoxLACQFXoMQ2CRHfFo
 PCmxX1D6IKlH3Ua1cZOmQw==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id
 d2e1a72fcca58-748185160dcmr6346517b3a.8.1749148378399; 
 Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKpjDQOHpbnp+mogU9n35DFZViXAwwcqPGcim05ueVVuUmQIJFSRRzTywH2aBcEBZ1w/yng==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id
 d2e1a72fcca58-748185160dcmr6346484b3a.8.1749148378012; 
 Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcfa19sm13531812b3a.132.2025.06.05.11.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 21/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Thu,  5 Jun 2025 11:29:06 -0700
Message-ID: <20250605183111.163594-22-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Gf4-ySWUT5dRsZSmyuvKb2cl5y3k7TOu
X-Proofpoint-GUID: Gf4-ySWUT5dRsZSmyuvKb2cl5y3k7TOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfXyisUe0iDLPOD
 EsHI0P0xPJGbE9Bs9+RN2hhCxmzJZr2yd/OOgIYdXbhiaAYD8IMqipEgapvZwDValNnBxk2YaQp
 7Ip7ImGRTL4VOJApIzV+HWSQuKvqbgZJy1FzTiOFfCC1V+cNBh91wJqGUUqlo8UX7kEKOJnbMeH
 HXBL12EOEIx5I14ipLuHLMqWwuJpwFhEPSnJCy4QD6A4rErzzs//1BQ4ebmt3Pb7aJWPu4GXeXw
 mjS5Woqeaih9/p9UvNIoz61+yfMKtBtSEu+TuDhkm7QWLp2Gjz3z3vGb6NAkHqIPo3uZagfc2hV
 1bel3xTsUG7lZmzG/+kgVZAeVOageyov0bnXceUOGE4Hz8Rvr6FZXQMmxZi4qApOTRYe0ncp1e6
 2Gc41tgmdxRMDrVHQbBM7/WdmE/Iw8/r0S1tzpF4emVHw/51a4EbHnHJ+qiV/x/40a3JrHEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163
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

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ec1a7a837e52..5e8c419ed834 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9d58d6f643af..fe43fd4049de 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -679,6 +679,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0

