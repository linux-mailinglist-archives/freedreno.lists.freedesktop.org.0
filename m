Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF8A4E71F
	for <lists+freedreno@lfdr.de>; Tue,  4 Mar 2025 17:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9352410E652;
	Tue,  4 Mar 2025 16:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LICEjolA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9410E389
 for <freedreno@lists.freedesktop.org>; Tue,  4 Mar 2025 16:57:24 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e887999a66so3873556d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Mar 2025 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741107444; x=1741712244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=;
 b=LICEjolAbQ3E46hKvAI5pbXF4B5kdSpJj99NXNwayEGRYv/sosJCKIi7JCeAgsCQA7
 J3kC+Z/QHjQOumJRnaxPQOYC9DIkJbA0LJksf2BIiHHkm6dPIFGdQpeslm9+IiXMZ4Ij
 dsU/0DydZG7oSPGDS9Y5L9YZ8g3bHOYnMO2ZRsfXC+qRO67byy8Q/PpVMgFiXU2HzOsj
 i+4H4Rgw4Q7TkaqHoL1WXTwRJhSQS96p0vaTNS8u+TMKaJL1ZGUJD3h7AsKv2GNjI3Q7
 IqZlxeGFukOowqwnoJh9Oa0r+l/gniZeayYeMoU1GASvcgczk1c/Ks1z2YIvn4CuMrLP
 Y/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741107444; x=1741712244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=;
 b=f3bQHp39ovuWh6o1TsP0pfWP2lbVUZ9VvALMsrKbbGThaj6wEEBxa80q8Bddn3yU7J
 oMUtBKGP403ulqsWyERegiLLLqLCBzxy7d5aPiAV3OTBid8WBbcYwsF5cXIDHGsTno64
 8j6IHn2rDcZR3w+YVAflWp0w+2tuaVDonLTwfRdflLbqg8gYs8loyXnVZ2NTYVLVJmt5
 B0If2R/MiEhdr4DTo7PJU1dpNDwpi9130nScvjvXUc0/XEPOVqIELYthiGtqXDeLItCO
 nvAqHfxlv8MiRKvJ9v3MhicLpRSGyDRCfAYf3hn8DwNfmWTwF3ExSplIllo+8NGZ9agn
 FRYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VdeWXY4YBYg4CtROLYnMTRF/krwg3CoOzSDkVLxf+drBt5V3k0tK9DvxmwTMhBVwMt83B2+/BTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1xtOWWBOriUMvNxiUbY6pvmNRE9k9tdc2mG+36QXftJegzwJ/
 nLZRDTTMz0ew+a6UqUkXu33ft2JLzm7i2jzp6UDsh6/ZoDSGmDc4
X-Gm-Gg: ASbGncsg2ldLMxOm599lI56ESihHfG2k0iNSOaLDMIg7elXav4ihTvstTvLB+JIEhvm
 CAYjtUL4JNP0SPACnesAyJApDYZIJZqWpAPoTlCPcfHiDIZS0QIOyNtinyaMqHSwGrlSebnPGUz
 hY1BpJoRY04EeSgVmmWNVQXNQ1NIbyHk95JJPMv62DWo+xIjWLrEWqUp/w34JuLtgJkee0UwUCP
 dt75yaUuPYVc58xiENtq+VcQUUCUD/8n+Rhgapo8MMnb8PftEh41g10L/0Cigzz9g6A4iA/pDD7
 F20kzo5EpPWOfmcz5lxX3oWk0g2IXWeWYkGNDhsBBY6NXUZX0+DqQwMeWkvRn6IlkHqmPFfAVlm
 9rbE=
X-Google-Smtp-Source: AGHT+IGX+RhV/Giv/+riLU1NZc5RpUqeZvB0d4P0/Z/QJ0oUGooasJgjc40zbomuWlTikveGaN/ADw==
X-Received: by 2002:a05:6214:f02:b0:6d9:2fac:c208 with SMTP id
 6a1803df08f44-6e8dc252aa1mr16326906d6.6.1741107443720; 
 Tue, 04 Mar 2025 08:57:23 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:57:23 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:49 -0500
Subject: [PATCH v4 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=5777;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lREsE9qBpuBOvxRn1Al6spv7zBw81cKds9oUzoZ9Rk0=;
 b=Edw7Jd3oWdgjh3lOT944zup9heTrKBEqqSb98hqpPcYfCRyt0+NAdBSz2Lfz/IGq7oUaZQXZa
 chdOfLLBveDA6Q0x3oHRtGMbFmfc5pEBYPcsS4SMF6TGji2fHYSunZL
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
index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3ab80e0fba936e214 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
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
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 498b96e95cb4fdb67c246ef13de1eb8f40d68f7d..284079ef95cd2deeb71816a284850523897badd8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -466,13 +466,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
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
+	if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
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
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
 		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 411d807e0a7033833716635efb3968a0bd3ff237..4235b772c2cb032778816578c9e6644512543a5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1

