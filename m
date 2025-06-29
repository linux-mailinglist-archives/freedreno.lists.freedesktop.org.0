Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABBAED07D
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824F410E37C;
	Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEYYvRIg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5810E362
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJrsxk018384
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
 a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=lEYYvRIgJ/c+BzHgUGEWGBUactw
 3eZJLwb+PAuIaqgaRr436pNFshpMcEnkTbOPxM17OBCArFDyCQuWtEgWNPMllkk0
 iyakN/9IpTVaPK7Qcf2nbfKs/XwlxTQj8SEUwv4Fk6TIhiPV1ZipG77FGKATDpPI
 /+u2zu4yFg/I9/JXACVNZqEwbCGhkVHrjSpsTHlTNDWEWvZIwy/uqCq2L5Xgun5h
 vUZql0vbMSKbZRDSWXJclHDsEEGUrmPE1J4YmwGE/kj1L+ZlsdqFQjX8N/bocez8
 milxFHUbUrn6kUZp4hi+eVy0ddKW4BYYVZtCjQUTHHqvp0+8CR9zaoKdCbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso1960874a91.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228211; x=1751833011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
 b=r2DmWTGqVKQtPrXo1f1QXx0j0X8XNVmAgfoG6FoBFLHBDHTRZDP0X+wCKJWRurt6mi
 IGAJJL5lYbfM4Jw24U6QjOcqL5sFoDBwM71cEKiXg1oCmdICaDzySIhKJexycT1HCv14
 6U8gCTM/zKgcO+q8+cO1EJuiLj6np0ZTeiQWqUbZOqzorOr+u996/McOwYd4r2kLXFrW
 THxB4+WnPJnZBX3lxggq1LoEsWSofcBQ/TVD8tuPz8olT1l2aGLXRZNlOnYFdpYyu8eH
 cc+/p4caALvGczT4cUFUObOFp2JQ13+YfLOaaiRZIUAvclPh/KNekNcALQXfs98ubVST
 psMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV72mlxg9+Kh/P03DhWGusvkmEuXISMaFejkHw0mRTeFC1xQC0/dEt/wTI3Bh4sV/LHRbT96qGkHtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydH1IvF43B90UF2EFmrSljm2cGuHjH0k4lsBwsuvLcp5wk+s9J
 wCZciTRwP/r39OUIvpR38UYdRO6QlIYH+ZgxaKtSOF3KDvLhYvUEnan048Z7VKisvnUp6+lim6a
 gUm0MwhJ6ZQ6g12y0WjQoJHGyVZUG8h8BnXL8hzA+QpyGSDe367z6tV+/E1SqxctoAknGG6U=
X-Gm-Gg: ASbGncsSyWB8r/0rb2jGXIJX0wjrqTf1n1pran+4GqMTubFpf9eiDwO1Rq+LjqqX1cJ
 QeIj+TKimrrc+dEyxpOr39RMxa/Y5IUCVHRLtaoamDLrCTsSRc8i7DvPsPVYzHO3l/5WUju1CoT
 aKOxQIwISJcVLdcQ6/pQdGLuNCxQu+TrtQkMTLz88DJk6g7xCbek82ygVXODi0PL9t1/iEiIA+D
 l+pt2cXy9eUh3PJrsGKXfIAeRbiPM5ITLT4+TU+TrKJcNHJgbrUYY1s95eM/Tt+nV47cDfN0Rek
 hsxY9M6e7rKpTWGWwIA1pOcL2/25sVqKMg==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id
 98e67ed59e1d1-318c8ecd239mr16401480a91.7.1751228210954; 
 Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGajrdA6tIMydlgInm0aLxoXdGIewbBhz8hKgUeWqXuQe48LacCfrSpFmOEQkovD6sQvePVjQ==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id
 98e67ed59e1d1-318c8ecd239mr16401441a91.7.1751228210493; 
 Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c5a8csm64859905ad.223.2025.06.29.13.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
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
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 13:13:06 -0700
Message-ID: <20250629201530.25775-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX6dXon6Fu/61L
 2rWHENNACcoGiuT+iRvWC1Q8TzN9vRBkRGcd4LNrewq3hWru8vK8YXlefTm9N4gXhdlXzTNnXJt
 eFcOF0x5UC8NT0oNm8JiIFctFpS+9DKoQIvbIm/gBUL/FWJ4d3BHxnoLnypg85hH4zeg0zIdVMD
 69EKYYV1HZKw3ud/Q0APmrieaeoK6eZfadClFPmqZlLyrGySBThEBea7LnaSt8Ot794ZMGqtqIT
 LMyUF71Z/N4FRGPgc3gbSbkDcYuqX6Yal2YQj6OHgWG4F7Z8q4DzY+7JqNAA0bERgt3TLlgDpzT
 H67Azfp1GOSxiXhxtMLvdbR5+PBzcqJMiYWzkrccGwBj6zKP/ivauCwOoWxJzd8g+3WmwTJsfNj
 7saS7sCJ2beLjoTPAILFRz2hkcqHjirSKNXaJLrAaFogsysZjzUiWsgPVxZHW3jeTJgXQ54E
X-Proofpoint-ORIG-GUID: 8jQSPmLN_gHRODgH8QFBDaxmhYibclIW
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f33 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8jQSPmLN_gHRODgH8QFBDaxmhYibclIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b5bf21f62f9d..f2631a8c62b9 100644
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
index 068ca618376c..9562b6343e13 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -681,6 +681,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c08c942d85a0..0846f6c5169f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -389,8 +389,20 @@ static void recover_worker(struct kthread_work *work)
 
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
2.50.0

