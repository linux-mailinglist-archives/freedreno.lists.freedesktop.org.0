Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E6ABE201
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D94610E576;
	Tue, 20 May 2025 17:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Di98mvEF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7BA10E576
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:02 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6f8adf56370so9292826d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763101; x=1748367901; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
 b=Di98mvEFeUBH0KYRJrU9UQFDNQTg0zx1uojabeZQfmu0+lq5JtHN/eQISYP10Ax213
 emr2q+WkSWFARzyIPaKt4IlF6TSUim5MNc2FXkK4s+nOOZHCiWTtYcEc/5dKpNS0xwVb
 6GRhvrq56vqoJH4yHNlC/xdjB0hnUyJQtEzAjXQCguqrlXD1/x7P4dE7IER8opAvmbdj
 5GV+3A1YHmlVXITr1mgm122B0X33FeCGZL9a26pQE/agTWBFiagv2m1cm+hsfbUX9R77
 nqtRvnEscVkTTpKhRx8o4tz2EcCYHFJAfEiSOim0lL1e1mEuVtRauckRPlZbwwiD5UCc
 WDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763101; x=1748367901;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
 b=mfDB/JAfZgHcuf9pF2j5oJmD45b+E2FStXV5JPZTdcYFIyqnCpGPHFX3odWA6y2CG9
 VaZBG+K2hawGHSPeGIasmT1ej6e4t84cbJ5Dq/dE6aZdSB+Z/w7jcCBZuwgu9O6yRo/a
 Loyuhr8topECGs1kNZ5NGsOXYTLY8f7gXlgN8UGKoIOi1rCDJcrnjic2BZH6yeHE1nMZ
 nVSA1eU53kSWigqc0LNp4A+b5dLRwkPFTFQoazWu7/5RW0DN4haCP17g6GccPky+PySU
 8a22nPMKtDPvcB4AZ2JfuypM380HGjnJ7MRuVACI+7ukMaqfm9bxKuO+ONA2vzIhe61S
 zm+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxoVXVafe/j5G5h5Q5AAPGnFSALkaqvpwhsrjZIL/EFS1n0cl+V1OJJbElDS9OXkPAMZLWxrlJCK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2NPQQ6OoXlP8j36QoxeVklp/znk7h23T+1Kdbk8TlRYsPafLP
 N9qJ8lTEIaej5IP/9CN6w/FrN+tW7eess4zAbQNrE3I5jady+fNa+Nqh5QCQ8znq
X-Gm-Gg: ASbGncu+2NHFh1392GHn6tl2yXD1LYgpHuI/v1M+N03WieImgtzanj0NEX3oqJHCskv
 UUvduzMNbaT7Dyl6mBWDQWS+ejPR6JRJF+KI2SqxF0ynfg66G+/h0/fFxEWuR+hXiFLSIVL3V1e
 3er2bR0ONJHu6ti0XVEuOmkXJGFMmiRk4i2sqGDkLrnuHNRP6j8fvLwgmt8MnJAEVht8RUWTNVj
 1BZM1lpfN1nHcGRBymyKh+Revl6WmGSRhBCt1g1JVxF79gMb59Q92W/LDGxWUliil2UCHEWiakJ
 8k+QZux675lvo3Yb6owvHT+JM2p+7N8RIqhAN9hIH1LDnHLILb9+xC8ePRjKXoLDF5VMNXe3gl3
 aBLxvG8ITLHCzYxcai8w=
X-Google-Smtp-Source: AGHT+IGqCzG1SvNWszzrmmzUY2oSx7dYJcoW7SuKzN1obqGThnOW42g+lUzHl4o0PdCvhz4+UPzvxA==
X-Received: by 2002:a05:6214:29c7:b0:6f8:e361:78aa with SMTP id
 6a1803df08f44-6f8e3617c79mr23828486d6.8.1747763101074; 
 Tue, 20 May 2025 10:45:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:00 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:50 -0400
Subject: [PATCH v7 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-1-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=JmZsTt+6O7fNx0yDUqUsXkrhtOsb8qvW7BpJuQ7B23u1tzp4qHdYnvwbwbDnWJiZvcItArAbQ
 1T514ek8rm7BoPLevyDE8Ux2jAjR0ELikP8fAA06vsIo8AQ7PBSk64A
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

The recommended flow for stall-on-fault in SMMUv2 is the following:

1. Resolve the fault.
2. Write to FSR to clear the fault bits.
3. Write RESUME to retry or fail the transaction.

MMU500 is designed with this sequence in mind. For example,
experimentally we have seen on MMU500 that writing RESUME does not clear
FSR.SS unless the original fault is cleared in FSR, so 2 must come
before 3. FSR.SS is allowed to signal a fault (and does on MMU500) so
that if we try to do 2 -> 1 -> 3 (while exiting from the fault handler
after 2) we can get duplicate faults without hacks to disable
interrupts.

However, resolving the fault typically requires lengthy operations that
can stall, like bringing in pages from disk. The only current user,
drm/msm, dumps GPU state before failing the transaction which indeed can
stall. Therefore, from now on we will require implementations that want
to use stall-on-fault to also enable threaded IRQs. Do that with the
Adreno MMU implementations.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..4d3b99babd3584ec971bef30cd533c35904fe7f5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -585,6 +585,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -594,6 +595,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1

