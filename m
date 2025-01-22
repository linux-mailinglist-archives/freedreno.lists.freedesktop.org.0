Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A4A1996D
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 21:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1D510E305;
	Wed, 22 Jan 2025 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZzGx5kO5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243410E305
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 20:01:10 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7b6ffda45f3so1396285a.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737576069; x=1738180869; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C0W+ZEfLiMkXEH7rt2/GiovuzxyzO0s3Xlcxt3/DbVg=;
 b=ZzGx5kO517+Se/wGAprX5YbGCamnmPLKn/i0OVgeEKXQlT0l05FTIAE1Bc3jgoF7Ew
 gbRR2UEzEo/WPxNWl5A0rUJiuwCsCNqUQdzZ60iIEyyG0RBZKxoU9F8xqy11y/hDvPX9
 WFPaYU/LGGqsDGm5WmT44/P6bArS4bHW0TOTzyD87ixsQ2hjUo+FB9o9nws7a8D6/ttq
 7nOTMV/VP0oucGjC35I+XvKYcL4V7Qt/zoXrEU9CYsieDWBHWdbQ7opHwA/AD+iSS23x
 cAr6vFk06UyO32Amy2K7AxhTkespKbMFOt7ZfEXaBvXj1Ds/WAo/C8kTYAjgmP+ElXab
 nFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737576069; x=1738180869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0W+ZEfLiMkXEH7rt2/GiovuzxyzO0s3Xlcxt3/DbVg=;
 b=vxXgzmDuwPWCnEGHuQkRNC51CftzNJ+5ganWgBjPQS1ld1qvZ9ELYa+3hiKNCXj2sH
 Z4UOrwnul67H2RCovnr9vRcPdBOq9NMnhBSCnpKTB8Oi2wZnAk3UprLF8h1Vx4It8b5Q
 /SPrbWEbW2Bl+RusCUc/S3YDoVDZN0D90ScLfI1eTbBrVZVyRhsHTcxvJIknVZ3MNDPn
 q/YBi/5ve2gfHzRCihFaQQ1S0qE0nk6gKqaG5ppTMfDyLVamQPthVvBjBN0INnSVT+8n
 kr2nWp/87FejOE5BIMCLxY8ay8PEwmFANZWxRwugMqBKv5uPtBet4AFb5wp6pZvTW7qy
 oTVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnR/pDp2m1w/A73lQE75lZa2AfOPIqYL8bbrRySyx77inAfNTsUjjdsRIuVSnIyz5vCbj7kRZ1ock=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGsx8q7YfWLoJYJnmrS/9znOaj1YMZCNCJcRqI4Kb8qes+fDu7
 srvFqLy2oETbIeyc42xIOuIULQvYNDHcC18mYW2Be0729hq33pYz3oxjFw==
X-Gm-Gg: ASbGncusOCqxAFtmM+RgIQUrG9w8GD5XDGlfY+XYZym3CFcnij81sZShHtA7zY1OIho
 TvnTjprTjuFJUAabHpZK1kybAl7+RB/bwuzbkWRpCn9ahokp9Oz+QkaqORysVXAFOnA7xfMaTdg
 kA3dga1WnXZdyAO+a+bMRF5uKzBn7EpvkJU5SdV2TPvXc57VwH1LBB29LJ9aFiLvzXCDPEjF4+N
 XWzMTNCPAx7/1p05j9bWTagVVbb13RuRXn6yTRCtOxyjQIl1OGQHCBZm+gyq8sBFmdIlpRiiQXr
 fyDbLaUYeHe+x/eYyDvMNAUpYDcE
X-Google-Smtp-Source: AGHT+IH7Bb216J6U5VF2T1X3drcXM9V1TK2n9v5TtKhVnuUToiXKlxArzXqCFTvaC3c4LRNMangaew==
X-Received: by 2002:a05:620a:2893:b0:7b1:3bf8:b3c4 with SMTP id
 af79cd13be357-7be63158aa9mr1312874885a.0.1737576069547; 
 Wed, 22 Jan 2025 12:01:09 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 12:01:09 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:00:58 -0500
Subject: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=5809;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=LZOQxUUGdQqLBW3ZuPFFeTY2r3+nASK7HMPqbv/N5EE=;
 b=+NXIUeaospHwBoU1GxlEI04bEiPY7s3tZ+XXIo6zrznDjds++HImSxpVTUy3AAj3qlRlGR+0D
 8GDZdqn+QNSDR9v9/8qj5NGy4z/lrwbX5MhDaoec++7JU7xDAILX6pc
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

On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
asserts an interrupt. The only way to clear that bit is to resume the
transaction by writing SMMU_CBn_RESUME, but typically resuming the
transaction requires complex operations (copying in pages, etc.) that
can't be done in IRQ context. drm/msm already has a problem, because
its fault handler sometimes schedules a job to dump the GPU state and
doesn't resume translation until this is complete.

Work around this by disabling context fault interrupts until after the
transaction is resumed. Because other context banks can share an IRQ
line, we may still get an interrupt intended for another context bank,
but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
it assuming that interrupts are disabled which is accomplished by
removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
asserted unless an external user enabled stall-on-fault, and they are
expected to resume the translation and re-enable interrupts.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..7d86e9972094eb4d304b24259f4ed9a4820cabc7 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
+	u32 reg = 0, sctlr;
+	unsigned long flags;
 
 	if (terminate)
 		reg |= ARM_SMMU_RESUME_TERMINATE;
 
+	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
+
+	/*
+	 * Re-enable interrupts after they were disabled by
+	 * arm_smmu_context_fault().
+	 */
+	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+	sctlr |= ARM_SMMU_SCTLR_CFIE;
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
+
+	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 }
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c5256452b2b2efa928f1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
+	/*
+	 * On some implementations FSR.SS asserts a context fault
+	 * interrupt. We do not want this behavior, because resolving the
+	 * original context fault typically requires operations that cannot be
+	 * performed in IRQ context but leaving the stall unacknowledged will
+	 * immediately lead to another spurious interrupt as FSR.SS is still
+	 * set. Work around this by disabling interrupts for this context bank.
+	 * It's expected that interrupts are re-enabled after resuming the
+	 * translation.
+	 *
+	 * We have to do this before report_iommu_fault() so that we don't
+	 * leave interrupts disabled in case the downstream user decides the
+	 * fault can be resolved inside its fault handler.
+	 *
+	 * There is a possible race if there are multiple context banks sharing
+	 * the same interrupt and both signal an interrupt in between writing
+	 * RESUME and SCTLR. We could disable interrupts here before we
+	 * re-enable them in the resume handler, leaving interrupts enabled.
+	 * Lock the write to serialize it with the resume handler.
+	 */
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		u32 val;
+
+		spin_lock(&smmu_domain->cb_lock);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock(&smmu_domain->cb_lock);
+	}
+
+	/*
+	 * The SMMUv2 architecture specification says that if stall-on-fault is
+	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
+	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
+	 * first before running the user's fault handler to make sure we follow
+	 * this sequence. It should be ok if there is another fault in the
+	 * meantime because we have already read the fault info.
+	 */
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1

