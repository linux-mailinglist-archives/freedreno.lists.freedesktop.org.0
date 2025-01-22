Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385EA1996E
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 21:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6596F10E74D;
	Wed, 22 Jan 2025 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFcnMq7B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8910E305
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 20:01:12 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7b6fdbcf42bso872685a.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 12:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737576072; x=1738180872; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uvSBZTv+Bn83Qgi3n8/RjQE01uKIcw895iDtbXzMRaM=;
 b=HFcnMq7B9WduQi9UBoxlKbUUNEoEf1SLlxS8DERqBrZPl+vcXi+1dA4EitTza0i5K7
 bdjUkTanLTk5OgbiZmY41+6N0v79v8YYFUNjd5YcHFky6qZASkygRtSO96d+ySrDFTGm
 Zs+jKISI/OFES5ZTpSO4p7tcWRRLa6vO3QVY7yjm31DaUWu394L1FItT1BScYCqc5+qP
 9lMv24MwZ8Z3MKSC2lawJ9TihFNdO8jTK3mpNE/ugX5adqkXg7g6vcOxha78/pEmu4Wp
 G1vaHOXdWs7pS4C4JC3rFFe42rR/tYX02NYmQ+ENB4H/WZDrJcgi5s5JoLQpe5wlgLHX
 8O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737576072; x=1738180872;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvSBZTv+Bn83Qgi3n8/RjQE01uKIcw895iDtbXzMRaM=;
 b=ZMEPzAudgKoU3uO/szdP5ywRjEwk+UnV6NV9Fv6SunIm+LAK6cHVNmCXyrU2NhKfE3
 FKbd8F2qPFxUoyu+eBjGuD5lcXDfGWvD/mmXrV8FpOiLez+4GDZGOpf4Ljj8gZaXx0s+
 JTVj21vSGvS77l3UlAuvlT6A6nQABR3VhhHOG/yo4+c3kbjr6+5XtCv2Ei3y5tWlnsXr
 pDRz7k0OYdn7YCVZPrpnG9/Vbf6mUDmp3F/7pe6RsfIxGWZMVLCaGJhYtr1X8RScDasp
 fi7dsJYKBwye8/kKxpyqpWczb0bCQddmkA0AR7Et6Njg5UJ9PuehvD0M7sCEx56QY8FB
 TiTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb5GgXlNIUeJq76Baoxzj4pYH5jBHvV+y1duZB8daWa+7zy/lE+Xt8ZUGsI/fnwDCeBDHp1EfU9Eg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKIPYukPqugCAPFJv2hQZNdq1v4pq6bI0itDdnl/HbWF2ysRSV
 Z9/vrVr9SLRzCshiq4f6zTkL4VDR0Ou+hR7L2MkQ83y0II2OvR9WCDpVQw==
X-Gm-Gg: ASbGncsK/AxUW1JCz36xJcnVREgOPbk4t+5tQXVaTuZ32H9tBqfBDmKlZeWQxpV2iNO
 E1tSESD3f7gmlVGsqiNABo3Ln7ntm/Z47rY/SURRa8B1YydlPZaar34F7D51xFRSJVYZA2Q0S1E
 BTH54peCgrKfnHk8OZZ+Yy6yeuEIFv8NRkBsDHf01r/PDuePW5ulSEtOrT/l9oDvF+p2PkaAzyN
 NY5OFxS6k/P6DCM+Liizt8dv71kP7uR2mou8r5xDbUeczN9IMh5f4zqGUUMinwKrOGW9cNlvmnk
 iaC5yrVAKt2ofItUg4gBPWWWBB+z
X-Google-Smtp-Source: AGHT+IG7pcOO4j8rcAXTAXAOFHFzbrJ+ShZfoiNI9k3XAbErfF6sb3mFVDmAynz5yJb92coD3wnqQQ==
X-Received: by 2002:a05:620a:394b:b0:7af:cac7:5017 with SMTP id
 af79cd13be357-7be8b2eaceamr237140485a.4.1737576071617; 
 Wed, 22 Jan 2025 12:01:11 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 12:01:11 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:01:00 -0500
Subject: [PATCH v3 3/3] drm/msm: Temporarily disable stall-on-fault after a
 page fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-3-0afa00158521@gmail.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
In-Reply-To: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=9275;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=1LEQ/SMNbwf2yI/kiLpEh729+NspG9MjxFycNdw8Mco=;
 b=A9/IQz3QphuH91aEBD88IGONhoh/I0uf9QAf2bM/Kp176OTv6KhhkKafFHl0Sv7zzoxyaJ6hY
 MPmB4Vx6LgoASfwb9x1YGfU/BJSXsIzB1PEk2zUafGAkpNmG1blCRpo
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

When things go wrong, the GPU is capable of quickly generating millions
of faulting translation requests per second. When that happens, in the
stall-on-fault model each access will stall until it wins the race to
signal the fault and then the RESUME register is written. This slows
processing page faults to a crawl as the GPU can generate faults much
faster than the CPU can acknowledge them. It also means that all
available resources in the SMMU are saturated waiting for the stalled
transactions, so that other transactions such as transactions generated
by the GMU, which shares a context bank with the GPU, cannot proceed.
This causes a GMU watchdog timeout, which leads to a failed reset
because GX cannot collapse when there is a transaction pending and a
permanently hung GPU.

On older platforms with qcom,smmu-v2, it seems that when one transaction
is stalled subsequent faulting transactions are terminated, which avoids
this problem, but the MMU-500 follows the spec here.

To work around these problem, disable stall-on-fault as soon as we get a
page fault until a cooldown period after pagefaults stop. This allows
the GMU some guaranteed time to continue working. We only use
stall-on-fault to halt the GPU while we collect a devcoredump and we
always terminate the transaction afterward, so it's fine to miss some
subsequent page faults. We also keep it disabled so long as the current
devcoredump hasn't been deleted, because in that case we likely won't
capture another one if there's a fault.

After this commit HFI messages still occasionally time out, because the
crashdump handler doesn't run fast enough to let the GMU resume, but the
driver seems to recover from it. This will probably go away after the
HFI timeout is increased.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 24 +++++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..670141531112c9d29cef8ef1fd51b74759fdd6d2 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..5a34cd2109a2d74c92841448a61ccb0d4f34e264 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
@@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	/*
 	 * Toggle concurrent binning for pagetable switch and set the thread to
 	 * BR since only it can execute the pagetable switch packets.
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f326597808eb28b4c6822cbd41a26e555eb9..bac586101dc0494f46b069a8440a45825dfe9b5e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,16 +246,53 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	unsigned long flags;
+
+	/*
+	 * Wait until the cooldown period has passed and we would actually
+	 * collect a crashdump to re-enable stall-on-fault.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
+	if (!adreno_gpu->stall_enabled &&
+			ktime_after(ktime_get(), adreno_gpu->stall_reenable_time) &&
+			!READ_ONCE(gpu->crashstate)) {
+		adreno_gpu->stall_enabled = true;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true);
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
+}
+
 #define ARM_SMMU_FSR_TF                 BIT(1)
 #define ARM_SMMU_FSR_PF			BIT(3)
 #define ARM_SMMU_FSR_EF			BIT(4)
+#define ARM_SMMU_FSR_SS			BIT(30)
 
 int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const char *type = "UNKNOWN";
-	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+	bool do_devcoredump = info && (info->fsr & ARM_SMMU_FSR_SS) &&
+		!READ_ONCE(gpu->crashstate);
+	unsigned long irq_flags;
+
+	/*
+	 * In case there is a subsequent storm of pagefaults, disable
+	 * stall-on-fault for at least half a second.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
+	if (adreno_gpu->stall_enabled) {
+		adreno_gpu->stall_enabled = false;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, false);
+	}
+	adreno_gpu->stall_reenable_time = ktime_add_ms(ktime_get(), 500);
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
 
 	/*
 	 * If we aren't going to be resuming later from fault_worker, then do
@@ -1143,6 +1180,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
 
+	spin_lock_init(&adreno_gpu->fault_stall_lock);
+	adreno_gpu->stall_enabled = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index dcf454629ce037b2a8274a6699674ad754ce1f07..a528036b46216bd898f6d48c5fb0555c4c4b053b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -205,6 +205,28 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	/**
+	 * fault_stall_lock:
+	 *
+	 * Serialize changes to stall-on-fault state.
+	 */
+	spinlock_t fault_stall_lock;
+
+	/**
+	 * fault_stall_reenable_time:
+	 *
+	 * if stall_enabled is false, when to reenable stall-on-fault.
+	 */
+	ktime_t stall_reenable_time;
+
+	/**
+	 * stall_enabled:
+	 *
+	 * Whether stall-on-fault is currently enabled.
+	 */
+	bool stall_enabled;
+
+
 	struct {
 		/**
 		 * @rgb565_predicator: Unknown, introduced with A650 family,
@@ -629,6 +651,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b51527bf15748b3ada71 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct msm_mmu *mmu)
 		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
 }
 
+static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+
+	if (adreno_smmu->set_stall)
+		adreno_smmu->set_stall(adreno_smmu->cookie, enable);
+}
+
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs = {
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
 		.resume_translation = msm_iommu_resume_translation,
+		.set_stall = msm_iommu_set_stall,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b767b16ed0cee806406cf 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -16,6 +16,7 @@ struct msm_mmu_funcs {
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
+	void (*set_stall)(struct msm_mmu *mmu, bool enable);
 };
 
 enum msm_mmu_type {

-- 
2.47.1

