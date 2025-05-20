Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C382ABE35C
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3426A10E5CE;
	Tue, 20 May 2025 19:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WjsukMMO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC510E5C5
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:01 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-49b3b0191f2so768571cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768140; x=1748372940; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
 b=WjsukMMO51ClFDSfToj3PpLe1tQp0xDVVSdGXV4JG7/olYGkol87LEeELI5DBVXx/S
 oIo6LMxI3cgUCg74D2FScu7OQsnwue128jPdMfn8Co2RUxxDAdNpH/kCoHpNisRDzIN1
 thYQsc5NBZeltXdjDW1zeCxyNaoDQiSsOp8WOE8GqFIidhM5FBYIme/7xcnZ3ulED7F4
 +uLn1rAP7ms34kHFdQgvOHAFESzxouWmVNQPXfeuTtvMUvWuT+9wTpOSSkN5sv9Wh9ds
 GyeCRSufYKvoGo5gbmJCvEtgn3M9XRkBE7Arq8OKMc4Aex6D/IMazmHqO+FmxrGeyCYO
 PovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768140; x=1748372940;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
 b=ik3Dovj65gqrpMcdFeEGt3YsqmIBlTy22YfZhrj9m23gpVypERnR6MLwkbj2NQ56gF
 Tsb794OclivcQ2hAi7+KYNx5zd8ugcjzVt+4ZOvI+DQDI+TGrPZ/1erumckN2Lo3tIcN
 JE3n/rbfD/cPAENex8NnWMZVPcL2YzEsk4jWLEe6yG2bulUsOMmpYpR7O5LZDO98pDeJ
 aQIfHGMhPJVwmx6wt9V9WoQ2f+pNPHFgAxsxcjQHGBvXUXnw0mZay+RffaJ7WMhxhIlv
 oRigGM2FtaX2RujPw2kZT0AlA+aeiFYEiDW44PcABKtYQNivRkIPry30H0Bnsmk+tCZr
 jjpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpS2Vf5viXdXOlpVyIZW6WMuAyvCDWLLTbj/oNLHpqOzhxvt2sIIUrRQGl6hJ0BlMsxX8QTJAa/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI2na5X8MVrCuBefmotCtA0LPCL6XodF4mX5E2PdThpVedUuzv
 Mw9mCA6vf9gl2KOGcwipPHW5XGLhy8rbj6KGQqWjPi9H44nfytKRngnO
X-Gm-Gg: ASbGncvmnnKE1USm6cCEAtqZXG9KMzRG13B4BPk9KOFMlB8+d5MLYdeptmOGN/gKk1j
 JrJUoQ5BspjjQ+P7Nuoc4MWQdJe6phqy5J+DOwS29SRgiz2x2cyeomCz5V51O1kuwsW5cbu0TSo
 swgus3d81C4ERVoI7YqSwjgp0aNsXBiXwrt+z0NwJbsMEp1MVRyqTL3WURSwbLlt5+H63dBgPYN
 4PhkUz7EjBK1u7pw7J/tpPrgV3igp/sq4NN4TQPIlD9hYPust/MrzBRlXTHikPt3Wsnplkprxnk
 RLPuWun2vi15J3wIw2eHl7zPa/BL2WQKUMVV/Xmrc5s+T0sShg2L7dHM/oPyV9k9Tk98d9wV2Bd
 sNG6up7MAu5CaGA+wAXelZEwYkdKCQg==
X-Google-Smtp-Source: AGHT+IHrhoVKr8ZuMW3LLmVacxqlRwznTBlrPPx7593+XpI6zjzFhRF7/0TUgT772pugTudEsg+iFQ==
X-Received: by 2002:a05:622a:22a4:b0:494:b869:ac06 with SMTP id
 d75a77b69052e-494b869b287mr85977441cf.6.1747768140371; 
 Tue, 20 May 2025 12:09:00 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:08:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:54 -0400
Subject: [PATCH v8 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-1-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=ViPeijvXoIUFv2QAC6sXPESomfVyzJ6s9UWCJTU2K3EndiqfiDH0VcJPIhmS25TOOhh6IVZsY
 tWgr3r9EDqOCOO+X64zLIEayNFmirrauIr4/BJjbDt38yQUW2T81wXA
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

