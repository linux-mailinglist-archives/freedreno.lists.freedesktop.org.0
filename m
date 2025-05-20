Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C816ABE35F
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460CA10E638;
	Tue, 20 May 2025 19:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdZHB+Cl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7010E62A
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:05 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c57f2f5a1bso64259785a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768145; x=1748372945; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
 b=fdZHB+ClfV25u5DmgUCggAZQTxaMot8VMCaadYzLc79+oM5yk0/QBEi0JQBSJRwd6p
 HbSf0JUWiX76QV1qOjfIqCga2z1rPNjw4t8kqd1Hy9olDOwitOm+pK/v+8qn+GdG+GJk
 oga7nrYWzdvQfrZ12LCqXsUJCitlTEMXGrFqJfx+HC1NzdIaBr0UJ0Qf5o9nJQQYlHIl
 19f4tEkv+S+wwSPP/ZJ35MxeyUX3PfGyNdQA90iFwZwzkhe/L6tH4GWD6ZnLh9LW/q7F
 19+s9ERGXUVjVxNvZBd34vYTqEUMjQLltPl5VWqjWMzFm+if7AmXrlvr70oXdsn6xHGc
 SPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768145; x=1748372945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
 b=d+efn2ir3qNTzPrKiOCrvIYJCs83H6KjkdzimqbhvBS7X8rsFsGON8JIeqMsD7w1zr
 iJze91ONv1XQcOqA3m8VelE1cqDKVfiPjxxS3trkr8iwpqfuylZBGECwSFtmC0fIJ90V
 +SlzwRVZL0oi46shN6kk2+9IrB0WRCwndC/qbvM5qK2QqNzbkA2lVnlDIubyU1L9N3Yl
 T+iVMA7UjjO93+MZwmXKktRtbiv1aQvrG3FMjbc6wHbQMzeRSrGMv7ZDxmQYpAd2L6md
 1gGfEHjOu2NF4o9blkSEZRRaXO1j6Cvd9EbdJ3kRos7cd5VU9u7ioApIxNixD/6CVLLx
 uUYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeQKu27TC/MMZhdytFcRMRe+hHuM3ma9CBzxOZAQjxkaLFd+T6kg4fsksANuqrhCge7xrjJGNASrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfoJ+uhBi288krVRjoMAfGJXNx/VykKnMfpyzfEX0s5N/udovQ
 1SK5GGExasyq+Ee/F1M/Yv0xdZgCkICVlqHl2U4yQ4J+lLUvd5p9cHR+
X-Gm-Gg: ASbGncvziPTeM5C6KO24WfnwR4p9itkpCgCD+zlRFzwLG2ATPO6S52OP2q8gdyVYrqn
 9tvNaoqeBqwrzeABgwnQ3mCNXWaaINRsB76Ir7g64ql6eChIWoKIbW9Pq7tgSyeXROWGJqxn4gS
 so35T/UzkyJosq+U/RKZ3hazyo+dUqYo/ztBHuB82YnVWT6lZgiSEDWYAqgo1Q1SMnvCO/OTvk3
 iNhltXtVeyeJHLKLfAVSBO1bIFL+V543uAwP91dRSymlLeXgiLGCAGCzDMoc1TIPOpfHBdxlF+o
 VAt2YEDk/yS22g7Eak4+pLbIE4t1Riy7XWGSHHoTS5ZSawcL5DfDvcJVy5AAKlkyOqY+BNhl7yU
 E47ykMQzuKnHF+Q2xb5LSDOOiRFtDKA==
X-Google-Smtp-Source: AGHT+IGTEuOT5AKSY9QNH3BI4uSkpEqMzwIX5HeR3aoY35A9UU3EKtm3GcLNIXZ3fsDigIbw6flk4w==
X-Received: by 2002:a05:622a:2c9:b0:474:fcf8:8f0e with SMTP id
 d75a77b69052e-494ae3736d5mr107613701cf.8.1747768144604; 
 Tue, 20 May 2025 12:09:04 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:09:04 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:57 -0400
Subject: [PATCH v8 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-4-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=6008;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
 b=B32zCFW6SjtAi/CSZwadfMTfzVtd5ahW7RYfl/ZOrAxW3x+ocg/HybRu5g3ZhTJm3x1MT8Sqx
 WcJt0qdXT4yBHPiW79Lj1VsiIe6m5qQgOqfSuL7uWBBsyLhmx41dhDo
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Now that we use a threaded IRQ, it should be safe to do this in the
fault handler.

We can also remove fault_info from struct msm_gpu and just pass it
directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c           | 20 +++++++++-----------
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++------
 3 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 26db1f4b5fb90930bdbd2f17682bf47e35870936..4a6dc29ff7071940e440297f5fbbe4e2d06c3ffd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -257,14 +257,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	const char *type = "UNKNOWN";
 	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
 
-	/*
-	 * If we aren't going to be resuming later from fault_worker, then do
-	 * it now.
-	 */
-	if (!do_devcoredump) {
-		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-	}
-
 	/*
 	 * Print a default message if we couldn't get the data from the
 	 * adreno-smmu-priv
@@ -291,16 +283,18 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
 
 	if (do_devcoredump) {
+		struct msm_gpu_fault_info fault_info = {};
+
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		timer_delete(&gpu->hangcheck_timer);
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
-		gpu->fault_info.iova  = iova;
-		gpu->fault_info.flags = flags;
-		gpu->fault_info.type  = type;
-		gpu->fault_info.block = block;
+		fault_info.ttbr0 = info->ttbr0;
+		fault_info.iova  = iova;
+		fault_info.flags = flags;
+		fault_info.type  = type;
+		fault_info.block = block;
 
-		kthread_queue_work(gpu->worker, &gpu->fault_work);
+		msm_gpu_fault_crashstate_capture(gpu, &fault_info);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af10b90ef733b05f5b0295c0445f38..457f019d507e954daeb609c313d37ee64fd492f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -257,7 +257,8 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 }
 
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 	struct msm_gpu_state *state;
 
@@ -276,7 +277,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
-	state->fault_info = gpu->fault_info;
+	if (fault_info)
+		state->fault_info = *fault_info;
 
 	if (submit) {
 		int i;
@@ -308,7 +310,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 }
 #else
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 }
 #endif
@@ -405,7 +408,7 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
 	kfree(cmd);
 	kfree(comm);
@@ -459,9 +462,8 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
-static void fault_worker(struct kthread_work *work)
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info)
 {
-	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
@@ -484,16 +486,13 @@ static void fault_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	kfree(cmd);
 	kfree(comm);
 
 resume_smmu:
-	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-
 	mutex_unlock(&gpu->lock);
 }
 
@@ -882,7 +881,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
-	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579c08f7b98d4461a75757d1093734a..bed0692f5adb30e50d0448640a329158d1ffe5e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -253,12 +253,6 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
 	struct timer_list hangcheck_timer;
 
-	/* Fault info for most recent iova fault: */
-	struct msm_gpu_fault_info fault_info;
-
-	/* work for handling GPU ioval faults: */
-	struct kthread_work fault_work;
-
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
@@ -705,6 +699,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 }
 
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
  * support expanded privileges

-- 
2.47.1

