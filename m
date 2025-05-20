Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F7ABE204
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C410E5BD;
	Tue, 20 May 2025 17:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z9P0QUKc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96E010E5AF
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:05 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6f8b0f7c42dso9874386d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763105; x=1748367905; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
 b=Z9P0QUKcW0UEgtdwz9Lrvl7vZXuNrQUrq7N/3VeNielKvTWnjqm6qx2OsyW70cIA3c
 yhIcGqYmDE4QMf7P3G47jkD9TkLH6i2e55jjsVLgN33yy4Ys1ulFIPMacln2n1OQZlLm
 A+CCXlmmL+vJjYC0Tnbcv1pxChp+HFfR1bgCvkaY/+m/EkgrMZ0Qwy6amaN8VQDfBOqf
 R0uvDhunBFlAVzVkEpDGoa2l2vzxCY/fq7j4xcjk8EGC/BivHxfoJfBj5KKmGU4VZih7
 IbRAK6duhcX24JPiIss0VBFptcrc0xaPD8iC8ppqg2lP8Ogln5l5y5GWoTpvB0VoMWIN
 Mdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763105; x=1748367905;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
 b=EtI/pua6qO5okiUd1P1i7KXMbG5tTZB9VJZJijUaGPhgIvte9Zi3SIuCowKIXW2eC5
 cFq6/OXpdM5VZzAnHzqGsErGQHJgqcvmb6V41aV6KYsJvJ3LdtA4a/eqvhoTYWBcRjGX
 JWTQsxiVrzakgGVN8ZVWJ+aPLzXaJnqbQaKnoU6l5BthxEwDBrv+Tk7E717ZvcltNnwA
 qGm4aztaHtLl/77IcCa6IYDBYrI9o1CcBSWIiJsK6q1StM29Z7GPOCN/pW39MmqoixM/
 zntO1EmkVfSh1FiAoGFFUk7aLeqt5mK4rEi3vYsgjvYu3Kq6IjaBUJ1h+IIEC/xmS1o7
 MNzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG3jPvrJVAGbz4lRMhEYFgyDeRSpxKY9nT8YJrZvjKhsLljpLbEzFr2CAmN+eZhBqTjB2lFbsRlgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG/z3hvn4hthEsUpu6fOuHA1ljXtzbYlJzOyxv2zxfJSo4ydBg
 uvUlVQG+VywzWbetei2Tpyo7f6AjlY4VK7fAkyoAdTiN/4opAmY/nqxH1GdpLtlp
X-Gm-Gg: ASbGncuh2XjwxYc7g7xpLIaSgkJs6FOG9nthFjHuszPoeiyD4aNp7mI3Td+7QJFzLjX
 ddAHCCuXwSXrqLqJ5O41QLWhdMxS3A9XVsuqbJjmtYLtFIqFtgiM2pcwNjXgi1qf5j9/t7Ali31
 Qe6Rh10jRM4j7h8cBwVlL8LAuhBsg4AafhVRkW0Y+2FK+d4NJJRtcc+ydWee1/oiVNRfEhVdd5C
 0OZDw3hyRiV7NRV77pZmRMK8nBXdTGncGonoQXDTTpm9LD5+qMjCXCkv1rSdp6hz0zTZc6e8hiX
 N2uy7hvn5LJaLdcZfBzM5ci+cJFpdiLOu1aN5/zDZtVcGIfWm7y9If6nJKydIJzOLYWuKXER8FK
 7zagskUbaEgfRjD0H1tY=
X-Google-Smtp-Source: AGHT+IEyEUyH2vl1JTCDZI6jpmWqWoPCvlggrK4ph7zQMR3tU98Bv33QLELDeAy8ZRJ0aZSyr67kCw==
X-Received: by 2002:a05:6214:1cce:b0:6e6:5cad:5ce8 with SMTP id
 6a1803df08f44-6f8b0903d96mr87113196d6.6.1747763104581; 
 Tue, 20 May 2025 10:45:04 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:04 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:53 -0400
Subject: [PATCH v7 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-4-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=6008;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
 b=Xbbc65pCLYyCTay/ace0inHb9u2gnbjiBQZT8I8BJ7JLe66r3VHZSlBkbYGTPfcn0j9dxIYsI
 MFFMeqbGxduCj1nFzecw6hgKb69GY0r6oorsy/XMU2zdZFC//qYGoFg
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

