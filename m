Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410BABE35D
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A3C10E5D9;
	Tue, 20 May 2025 19:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZgeKa7hC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C2610E5D9
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c5a3334fddso92592085a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768142; x=1748372942; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
 b=ZgeKa7hClf6wHBHYaCDGX+P1j588npDJCi5IDp8n9FxUjDvQdRYf6qhqoKoRfBJ1Ow
 1rqQrBqaY+U2C8q/L1l277nplgLlNJ/DSTjHVRyeTNuKWykJ19DiPCVwA9mfMkoqnloi
 0mBVWrOyjypHE+S9ML1XxdfmSaNV13um3wUshGtIZ3c1QlU9cw0WF5oGzt7IZD9SUes9
 F0i0QfqCjAcVUBw/AVtTLZRHvXNeAbHFUfPnj4LAYVFtzESUfOtA5g2zpBdSxdR11716
 UrcbrWju/YrSoS/IEfXb4IZaWKC0tvQVcI2OhUAGjuzMbqJSgfn1m9TPhNwzjpul1ah2
 BiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768142; x=1748372942;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
 b=YsLJE0D8FB1i06hH+Bzl/XGd6cc2aw0SrIBeOJPa9FEjObyhacO1YzMXRd1RgXUYNO
 JLvPeNoPFpdMAeBvVhvSOcx6/s2Lvmjlkg0yOdklzoaHaRbWwuAOEY4Olp+W2USKv+xU
 J2XjwVUVoACluv8CuUY1URc7paL3G4MVTU4JPalJJdKZrASDsuJV2ZY6ZVl8fc6quRTA
 RvNOD1R/ivin1PQvTDBHhDPviffLRQda7nAbvHoZrXMqbIfZSNPtXZJwBS06EnPKMtJ7
 dWPqUgoy778+I0M0D1NZIr63atNU08bWOb0OrKmcHfK5vCLGEanshh15eQOaKIB60Vy8
 lHfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnXDtYJz+HjF1PuoPzt6DKawlvNNE4XLHf/+qmp0ovStYXQLcvyKbz26UYlql24q/7sACvE/cICqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHmihfLxnlfbK9+c903oj2PgX1sgQ5Zmw4JXvv9hMmneye3Azc
 fwT497YxDSZwve6nmF/Q8YvqacT6gyCvFyE1gELQGWmqOdsI3H9QocyO
X-Gm-Gg: ASbGncvg5uKS4xiNXgXTu+bAdNL9rVZoG4X3f+iZdPmTp/pVfWsulePrjnKZLdU5ObF
 gnKcotSBxuMMSaZV2POUj/8Kdt0D9aFcEq6KrhF8WRegpQSU/xxoce4Df/a3trveFeOeprOE5Ze
 8TXwIYdP+j6WDMRlNBVLgnvWmxKHtpo/YX7m4+/UDqJiwFXgEl01jbOCKiHrlVwPiiZqDZSsBsa
 JO6vVljbp46+FepGhOxaN/IUbdUU5dEfzEIFco6w3UwocyDWpTCRVavukNQ87NPA5lwlJfWJiOP
 R5EBxXwe0BkNXNBncsSFAkPF06QPLHIHe2nzheIFjJ7hgzhdgGz2O3KSU0ErlSFA1XyHFqbwqYN
 FQf25yBpZIngLuvXjH4I=
X-Google-Smtp-Source: AGHT+IFjLmYqaKLHPS+01zHa2///cFu/CXjL/ulMSueMZ2cjR11HyScFFNVGZ0K50+a/0b0pvW5/Nw==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id
 d75a77b69052e-494ae3f24abmr103477651cf.12.1747768141896; 
 Tue, 20 May 2025 12:09:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:09:01 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:55 -0400
Subject: [PATCH v8 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-2-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=5304;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
 b=R9Qrdk+aCSBCIG9HTDvSktf7A7GtrulqV4E10X0kJ7Yd5pExhrEumGzEbGK+ajvv2fm2NcdnU
 zCVQ7U/1Bn6Coy3wGGCl4TjDEVPJPXR5CoRuRTG6lRNa2ucwCE6WGoU
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

The upper layer fault handler is now expected to handle everything
required to retry the transaction or dump state related to it, since we
enable threaded IRQs. This means that we can take charge of writing
RESUME, making sure that we always write it after writing FSR as
recommended by the specification.

The iommu handler should write -EAGAIN if a transaction needs to be
retried. This avoids tricky cross-tree changes in drm/msm, since it
never wants to retry the transaction and it already returns 0 from its
fault handler. Therefore it will continue to correctly terminate the
transaction without any changes required.

devcoredumps from drm/msm will temporarily be broken until it is fixed
to collect devcoredumps inside its fault handler, but fixing that first
would actually be worse because MMU-500 ignores writes to RESUME unless
all fields of FSR (except SS of course) are clear and raises an
interrupt when only SS is asserted. Right now, things happen to work
most of the time if we collect a devcoredump, because RESUME is written
asynchronously in the fault worker after the fault handler clears FSR
and finishes, although there will be some spurious faults, but if this
is changed before this commit fixes the FSR/RESUME write order then SS
will never be cleared, the interrupt will never be cleared, and the
whole system will hang every time a fault happens. It will therefore
help bisectability if this commit goes first.

I've changed the TBU path to also accept -EAGAIN and do the same thing,
while keeping the old -EBUSY behavior. Although the old path was broken
because you'd get a storm of interrupts due to returning IRQ_NONE that
would eventually result in the interrupt being disabled, and I think it
was dead code anyway, so it should eventually be deleted. Note that
drm/msm never uses TBU so this is untested.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index d03b2239baad48680eb6c3201c85f924ec4a0e07..65e0ef6539fe70aabffa0c8fbe444c34c620d367 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+		}
+
 		return IRQ_HANDLED;
 	}
 
@@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
+	} else if (tmp == -EAGAIN) {
+		ret = IRQ_HANDLED;
+		resume = 0;
 	} else {
 		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 4d3b99babd3584ec971bef30cd533c35904fe7f5..c84730d33a30c013a37e603d10319fb83203eaa5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -120,19 +120,6 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
 }
 
-static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
-{
-	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
-
-	if (terminate)
-		reg |= ARM_SMMU_RESUME_TERMINATE;
-
-	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
-}
-
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
@@ -337,7 +324,6 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8f439c265a23f16bd11801a93dae12fd476ddfb2..8d95b14c7d5a4040bb8add56475e297beb16b162 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -474,6 +474,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+	}
+
 	return IRQ_HANDLED;
 }
 

-- 
2.47.1

