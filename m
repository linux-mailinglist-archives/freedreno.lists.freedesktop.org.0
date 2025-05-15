Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0700AB9061
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 21:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F49A10E961;
	Thu, 15 May 2025 19:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFaUgviH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D19B10E961
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 19:59:45 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7cd43fd56bcso11343485a.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339184; x=1747943984; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fd/EGrO+9uXzlxi3REUypu7vq+Jf3DrTSqeTleo3q/E=;
 b=HFaUgviH5jpZTpwXJQcsWQlOvzl/AVHYfiWho0rlzRRUh3G9RYCyScRwvzPvvjrYs6
 ZlqObbM9T85oGnnBfBRtTc7WYvw09AW2252gGiNQ9ShEPXA7U61wGNhKrREkpEdyKlgg
 5X7/DyZhsui8hZm6Dqkxa48AybD+3NRDh3pg4j5f2QGl85i6/zhsv+ZLa7A3LLEpppbl
 /8qHpyovIW1KvUGDOXEfBT2Wugw4P2wdxLbr46xk3I+LlHHkrB9nDniotMFec/MTVDhM
 E9zWNeM3DD3/h6TO7C3iHYCUdY4hVW/MUI2yga4vo1MaXED7h5JuDltMSf+aR2yVgy35
 zWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339184; x=1747943984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fd/EGrO+9uXzlxi3REUypu7vq+Jf3DrTSqeTleo3q/E=;
 b=H2059x7QoMRGwYWFigPHkeJI2iwwQwVIDoHuwZlp64bY8FEQ/yKx9iijFpQmQW7Sgj
 HNgGizoSWOyL15uuEdQQJYNMhU70v12lH9xheH45BF6u1/lkCtf6T+Be7LCgO6tnza1a
 zEwXjjZVDTjKgWF4OUYkfydkkknibLQDXCSGJHqr38B6l+SExx/2kJ3xAXxdIf20uouR
 iVzs+x01W9uczJZUkxxY3PwRaerFAij1kGsb4USNBJUpsQ/aWnImkRQ2K/M6r3de9ANM
 RYc8lICQrU2GBfiAtyFHsBrgfRtnqjpS9oKgN1tODOPpP5TaZrTgCZohJ3auIGjIfwkj
 yzdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOes//PZFeP4rrFDnUe/oen8WfDZRBaQGYaVEsmF+bE1SZGjdxD+Dh7bXDPKOyiuVDNJSur+HH0Uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQTdwNPfYLXDdtZspYON2yr/Y4OYduuHsp8bPFoiSPfENQ1NPN
 vqK4E9ikJqHqS8AjMdTM5QAsDftblD1q2/Y5sASrbsU5sGlNDuiQ/Uxc
X-Gm-Gg: ASbGncs5rC1Qg/wMATkIIK8XuF7QK9/EZ7jFTcqBYXcq/NEOHV4KWS7LXWFWciL6PQG
 nw/FD1dih8IqbR9uuVbLG190hmgFSS+jxOehYs4VXZXJn3D+3ygwH7+YXM9ddClhzuFDZiTGjYS
 HrUKejffjqclVB59pRgnHsHN8208Kx6iHNEXvLSiDK1QVVh5s2rIHvlRTOFTRx1T9Oc4GxEiDTF
 XOWtNLWfQUMHcFAA5KFF4K3dKxEzm6eRhCApmFmV3mkmBnpETIZof8TLaUPpJi//bpxv+EaoaNN
 slt9nEtx8ysidN2l+lGseofAW9LjyQIQAc/TC4K7yVkNfyo/4DX3ZN60EQr9wMG/iZubiMEKM1X
 QGiVgW+Wmaey4I5RNADA=
X-Google-Smtp-Source: AGHT+IF8YIC9Ex4pxYeedcw0jfDcO9HWblbPpClqsPYD4WPdH/sEnsxMKO+7sd168rPBtJtPlpo3QQ==
X-Received: by 2002:a05:622a:1187:b0:472:1d00:1faa with SMTP id
 d75a77b69052e-494ae41e431mr3762321cf.13.1747339184097; 
 Thu, 15 May 2025 12:59:44 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:59:43 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:48 -0400
Subject: [PATCH v6 6/7] drm/msm: Temporarily disable stall-on-fault after a
 page fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-6-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=9314;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=XDat35dt/dDukTsWdH1MBBUUHthSNEu3I/DA3lM5PIg=;
 b=ao3tYqcpYwbKNa0+M6PWENOF6lFAgfGIFjyTzfnNBr026jVKERng7CMu3Nb9yw+2OJviON7Gb
 y5sWa0AN0isCc0WrfJrZkAjcForzNgigcMmj165r2eiDSAg57lTr8pO
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
by the GMU, which shares translation resources with the GPU, cannot
proceed. This causes a GMU watchdog timeout, which leads to a failed
reset because GX cannot collapse when there is a transaction pending and
a permanently hung GPU.

On older platforms with qcom,smmu-v2, it seems that when one transaction
is stalled subsequent faulting transactions are terminated, which avoids
this problem, but the MMU-500 follows the spec here.

To work around these problems, disable stall-on-fault as soon as we get a
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
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 26 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 83 insertions(+), 1 deletion(-)

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
index 1a4069a73aa42821cb9af7871e6ff8ec7b44d1ef..b3ec1bbeedd3fec3028092b59d2256b3956d6cbd 100644
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
 	 * Print a default message if we couldn't get the data from the
@@ -1137,6 +1174,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
 
+	spin_lock_init(&adreno_gpu->fault_stall_lock);
+	adreno_gpu->stall_enabled = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index dcf454629ce037b2a8274a6699674ad754ce1f07..868d22fde1396def35e2f46bc2b2f4eff611d8fd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -205,6 +205,30 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	/**
+	 * @fault_stall_lock:
+	 *
+	 * Serialize changes to stall-on-fault state.
+	 */
+	spinlock_t fault_stall_lock;
+
+	/**
+	 * @fault_stall_reenable_time:
+	 *
+	 * If stall_enabled is false, when to reenable stall-on-fault.
+	 * Protected by @fault_stall_lock.
+	 */
+	ktime_t stall_reenable_time;
+
+	/**
+	 * @stall_enabled:
+	 *
+	 * Whether stall-on-fault is currently enabled. Protected by
+	 * @fault_stall_lock.
+	 */
+	bool stall_enabled;
+
+
 	struct {
 		/**
 		 * @rgb565_predicator: Unknown, introduced with A650 family,
@@ -629,6 +653,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c6fed9bcb0021a5ad25d8487db1cc05869668c3e..a1506cc3e33bbb36bc0a8d7ef90b59940b8d5244 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -339,6 +339,14 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
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
@@ -386,6 +394,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
+		.set_stall = msm_iommu_set_stall,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index f118de637b1b35acba76a92c2cca1de9b2fad5a0..e541c3cfa334c48a530199cd8f9c3572a88339ed 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,6 +15,7 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
+	void (*set_stall)(struct msm_mmu *mmu, bool enable);
 };
 
 enum msm_mmu_type {

-- 
2.47.1

