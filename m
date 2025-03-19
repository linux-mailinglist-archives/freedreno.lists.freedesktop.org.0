Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804BA6900D
	for <lists+freedreno@lfdr.de>; Wed, 19 Mar 2025 15:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AFF10E306;
	Wed, 19 Mar 2025 14:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BzX/9sUi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11ED10E256
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 14:44:10 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c53c6c28c4so104972885a.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742395450; x=1743000250; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
 b=BzX/9sUik0C2puRwrSFGNvfvHH0Eqj8w5vcZNzYs8343lDP3q9FHlUO6mvuUHW1Zhc
 TZyJEDLkgG3vU052KYoZ17dKeOkGkU9Q4BJZMXe1n1dkgUIDdiOwSE40JCxbn46c1Loo
 JL14VpsJdVyUZ5A0Yt3fzNywd1GYS/q9j6cDew82yw9JVeqnaMTDbZBJMeyGSJtYVazZ
 5m4P2TSu0bnj7wu4/ll8iFazx58cii9InpLOHv1WEJbOxklakvu/ZTGNStuUHaJyOQyT
 BagFRIvktA6MNnpGnheO7FjTO+HAl2ssSvnKQm31yLv1PxQ6bpHwdUu7bOcrmfSLg/ex
 OTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742395450; x=1743000250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
 b=nouxlA0f3VIy+KWASe79rC6gxxaqv0L1eEj71HZE8n9M/1nPuanr7daPNGuLazXtuv
 jnvieo4SnsKvw+mr6/3ak87TlEkPlmTV/hw7ZXb+0m37y95geOtTH8EbmFPpw+0OVI/f
 qSDpoVJXUwCHGMm78a418+K+mwo1A9jsZ7817gM4zE08Qta2lrYFP/BjJag3iIPUVLmf
 6C6g9IPhrf9wTwVJS9dLb5L5PJ8m/L81uNPkWn9ljwr4ceQnuf/FAevlE1W++qGAQ+Gt
 RHb7rpZoEVKjEqTy8BKp1q1MZux6enCbV0PgE2xIR9iVFD0vAX9hL4KT3rWPe2IiqsoF
 WfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0/i7dHo49s+4fHggGK5N7vQFs5ZgzLSD/ujFoH0xkRl0j4NoBuGfu/0UEv0kER5sB5ALGCxiYqzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztLYcofW7U5TOnTwT6Wrx3pv1koa1XB8JI0BUGa2HVThsc2fBx
 5FC/grFg8kHqBexfg6jYBSZHuDlki0B6cSx4ft9GftfN3iYM011SjGQ1pUBh
X-Gm-Gg: ASbGncsxf+lNgFsKX7FBZ2XN8U+ADxAx/y2g34eI5oprdezJCYwXHV8kvE7AIFnMcai
 4ke7OnkF6LOOf0Mh67Cqn6LSkcj+p1Wu2hDZnDdaP0oFtFE1aMsrb6HQrDBIPAVCYke/Kl0n7LQ
 raQYqnoogEXX96MvA0ejuiGSaD9MD4GV3ihMb5MYMYeWcfT9n05Sr+cyy7fiAE0UUGAy9Dg9OR9
 MlcW9uvVHix0PySA087/sPw9m7XVsuuDkMy0byP87X2+EUUQY6SUbC+td9mTPU3RERVeISuw4jU
 05o7j8+s56wUE1boObIKClW6JwpLVPd2mlQ7NMxP5ydnrefA1Pcr0dwKJ/GwaHmpZENMHxxVs6v
 iLIs=
X-Google-Smtp-Source: AGHT+IFNRUs3nv+7+hsvhyD1099wEYjZlC8bdXc8Jfmcl+lTK2hcYAEosbvXtZXZvJ/hQAwsmaiwrg==
X-Received: by 2002:a05:620a:2485:b0:7c0:b018:5930 with SMTP id
 af79cd13be357-7c5a849ceb4mr150552885a.15.1742395449476; 
 Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:01 -0400
Subject: [PATCH v5 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-2-97561209dd8c@gmail.com>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=5867;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tTTpB0Ao5UrDtWkZT9tEFwgF3Yy2+aFm7zr2QcY9Sdk=;
 b=SbxyVBfCazjMcZnOBvSnP6XYVUpV1d+ECUu5MQSlhmDcQ2Sqe2AtsfGxR81gtgborBDdYHY9U
 6zMkNpecHzPArS1lpqtpzbf/QtWVL0UWm99pJ9QFFbo6w9vGuBQfa1U
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
Reviewed-by: Rob Clark <robdclark@gmail.com>
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
index a02078eb968b81a35c1c086ed7007ea2a453ef94..c7b5d7c093e71050d29a834c8d33125e96b04d81 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -457,26 +457,26 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 
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
 
-	arm_smmu_read_context_fault_info(smmu_domain, &cfi);
+	arm_smmu_read_context_fault_info(smmu_domain, cfi);
 
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
index ef6915a0d9f62b0a1734a3ee57ea422615036094..ff84ce3b8d8567d3402e945e8277ca2a87df9a4e 100644
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
 void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_context_fault_info *cfi);
 

-- 
2.47.1

