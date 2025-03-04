Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD90A4E71D
	for <lists+freedreno@lfdr.de>; Tue,  4 Mar 2025 17:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7410E653;
	Tue,  4 Mar 2025 16:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdUmTWSe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD7F10E652
 for <freedreno@lists.freedesktop.org>; Tue,  4 Mar 2025 16:57:23 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7c3d85d5dc0so750385a.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Mar 2025 08:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741107443; x=1741712243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a8S9dBjNxZ5kSWclYX8MM4Du3QFxwWnxkd8aNT+KTuk=;
 b=gdUmTWSeJ59a/vaphZrR7lU4ODW/H+5vmFHKfIWaDL7gQGJOhLDfVGTiBFbe8+pBl2
 8owWNq7lUcQxafGtwzlFVRykU/AMPWEQ3LbixnD59flvL6GaO90c0x0G6pbE0KA3Xru+
 5mCYMEY4K/kTlE/01xelYIhAcgVgGjGpIKaahc+eU4Nc9RoggCjOiISLIKCuOg9jFZ7F
 u8OSMvB/Wn0wDzm9S+ft6Y0o+iNSjkjROlKgvZ+39tyKLkQ8r29TCP0lUdw3kr2NXKeb
 2tFW8SNz8e2HGmJODFWj7kRK6aC1Dhuvvw7MtWgESa5ttNHHX+NkxfMOuZU9gU1N2d5s
 mTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741107443; x=1741712243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8S9dBjNxZ5kSWclYX8MM4Du3QFxwWnxkd8aNT+KTuk=;
 b=ZDbWhPvqfXx1Kh3BuZcfkws1r97ktY6ZLqV+s5YlGO3VK6jv9p0oGA02qwDXAFbi5R
 mm3w0TD74WwnETf54uJy68jVBYtWjmeGY3VkLHgPkM/M78ps7GzIlWUCMe/MWzwqQNot
 ZKKNmcVZWD5s2PVplaihoQuAzoyhfRU+pGxDuevhJjCNurmYzkdZoGNUyheeO+wcTdOW
 s5O0V3RYaEPOKNv4pdc+sOPfUsMiw8odlGmrhPbJ74FF2qpZbU2r2VswtjmX39/qC6Rl
 FL0gJt6tWk1uEZeeoUNoU23VUQr6tsZ7rMLsZjLNul7UhZTjBT0s+5qt4/l8AcrdRegk
 LzEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuzllruhVFyTfUb8JTMlUwsLTOkFi6IBzIfb1KRSm20geTJ87XmOekTKqB9B44aBuqPLYi65mxCkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySFWNLjenCNy9hTz8aQcXJ0+5AHg2666v1xxntPKkugMz4obSo
 U665ekOzs4RWoWtCTJxHFbzImyZ+DxJBiHVUQfjjZokVfP2icG2s
X-Gm-Gg: ASbGnct0LmrXnzN5mnn7SWqtzqxgXw1QTTn5K2YPCeypXH0SMFL01fkRpdNBxMzxBqh
 k6+B8e1rtDHI72+YSqIPmVXzwFX+ZT98EmiO7wkr8xi5kaSZ/17zCGaIDOiq840LPqQ1z+VtxbR
 L1nxjku3fV8Z1gDrK50YCWQBS+nlbTJOkmm8jN+JFpKy1dqCeYCymx3Pdn8tQPRh1d48mlsSmFl
 h/kb2PYHGS4b1fAsdyINsXczowxxqTprc4z5Ef7ngdagwldlXYSI/HGkRCMGcZLuZp+b/Zd8C7D
 C25jUTXwMfNzrN8OEnaLkTW2rgVW8nOikpDmHsE0OaO/jkjW+Hten1ZNiRgmWfB2GktNB8GiHoU
 XBmk=
X-Google-Smtp-Source: AGHT+IH8E2+NNMucN2iWnEvCfvVSv1/1e2v1p1j23JiywBOdc8vK1VN/pksuByNIEL9Gc/4zzxsiYQ==
X-Received: by 2002:a05:620a:1721:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7c3d3a05813mr103204585a.14.1741107442690; 
 Tue, 04 Mar 2025 08:57:22 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:57:22 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:48 -0500
Subject: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=5819;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wzb+Csa73ZgNo4khyGvM8YgSCeUmNILS584s12qUf78=;
 b=h8YQvcJJIa8Q4NcAJtFPmlRqE4hYKd2Xj6cZY31JoaG29+/XgnzrAdUOk7ztfKNMoB2iXBQyP
 oqAOUu9lBlwBs7aw4xmzLre3EIEDVUKGbqxEWsi5g+cX8DcYXM7eTlW
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

In some cases drm/msm has to resume a stalled transaction directly in
its fault handler. Experimentally this doesn't work on SMMU500 if the
fault hasn't already been acknowledged by clearing FSR. Rather than
trying to clear FSR in msm's fault handler and implementing a
tricky handshake to avoid accidentally clearing FSR twice, we want to
clear FSR before calling the fault handlers, but this means that the
contents of registers can change underneath us in the fault handler and
msm currently uses a private function to read the register contents for
its own purposes in its fault handler, such as using the
implementation-defined FSYNR1 to determine which block caused the fault.
Fix this by making msm use the register values already read by arm-smmu
itself before clearing FSR rather than messing around with reading
registers directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..186d6ad4fd1c990398df4dec53f4d58ada9e658c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -62,16 +62,15 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 		struct adreno_smmu_fault_info *info)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-
-	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
-	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
-	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
-	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
-	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
-	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
-	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
+
+	info->fsr = cfi->fsr;
+	info->fsynr0 = cfi->fsynr0;
+	info->fsynr1 = cfi->fsynr1;
+	info->far = cfi->iova;
+	info->cbfrsynra = cfi->cbfrsynra;
+	info->ttbr0 = cfi->ttbr0;
+	info->contextidr = cfi->contextidr;
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index a9213e0f1579d1e3be0bfba75eea1d5de23117de..498b96e95cb4fdb67c246ef13de1eb8f40d68f7d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -453,26 +453,26 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 {
-	struct arm_smmu_context_fault_info cfi;
 	struct arm_smmu_domain *smmu_domain = dev;
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
-	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
+	arm_smmu_read_context_fault_info(smmu, idx, cfi);
 
-	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
+	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
+		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
-		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
+		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_NESTED,
 };
 
+struct arm_smmu_context_fault_info {
+	unsigned long iova;
+	u64 ttbr0;
+	u32 fsr;
+	u32 fsynr0;
+	u32 fsynr1;
+	u32 cbfrsynra;
+	u32 contextidr;
+};
+
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
@@ -380,6 +390,7 @@ struct arm_smmu_domain {
 	const struct iommu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_context_fault_info cfi;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
@@ -541,16 +552,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
-struct arm_smmu_context_fault_info {
-	unsigned long iova;
-	u64 ttbr0;
-	u32 fsr;
-	u32 fsynr0;
-	u32 fsynr1;
-	u32 cbfrsynra;
-	u32 contextidr;
-};
-
 void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
 				      struct arm_smmu_context_fault_info *cfi);
 

-- 
2.47.1

