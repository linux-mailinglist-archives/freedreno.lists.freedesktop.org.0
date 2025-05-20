Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A6ABE202
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083A10E594;
	Tue, 20 May 2025 17:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fxfulRtV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7410E594
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:03 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6f8adf56370so9292896d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763102; x=1748367902; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
 b=fxfulRtVLLY9sYcH/+Zj6AXtoloduOGlrwJ+qrem/2cLHz0h9K3Rv5VeaGWGp2ql8+
 kbdxhXluEBP1A8rILr2P5XR5Ga2a9yJd50XYTOqxGG15qJvNHMIt1iqDnf11G6KhuGFH
 jvKiXc78phCuwYSdqWBJw+5ZyTeqYA2Gv90ps8BCcIJtUQ4lm924gOu311cDW0HcP9m0
 N4xLpbrhnYdrFY3LO8PFneuU3WY5tLAMmQPNNF+VRMUahYA6z6o6TWY7FRDICNQU/72F
 xOHj95XPLCXqmylFj3JIXGSmmY9qF6uriPKwRc6WncA7xqyg0XaROhQnjGOQwf8SXhP/
 bomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763102; x=1748367902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
 b=eXmEg7NWljOPNi6lSJHcnEG+vrCj7212PsPSffjGKt6TYFPZCPCoFR0adQYUwD0vtX
 OldxE3dD66cCyEhMgbUoQgkgH/OqsUF/EW62PyOboHieDWM41Lme+3u789Vg7PCHuo+2
 3kyrwGJIY/repqYzNk6lP3xbHry904GOYgIHs48/XfGnDmUSKZBpR7hcTOIwX803yO+g
 jUu2jcTDfxKWf72VaS4BxGwk0IBUrQq8L1d7vqeKu3VxBML+H2ZJmpRaQW1LlLiH3/CG
 1bYg5p//8449xmbJdt0dhW5FkWrjbpcrw7ZgvVQL0UivaJnhAYnJPrXNnat0oRrqsjRY
 DdVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6xlXNjQH5Ae3i72JbtxqQg2SGKPTJoCeeuWv4SL9frf6P4AebxVznM36hBaJUuCWnFu6hK1YH8+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjbqqerQbUQXtvGJnav7iiv3ZKiq0fnOSZyN7JO8mDjqlR0Wpo
 AM1abp4De7OUm/+HgSadZIOZsFhaVKDzbQ8lTR6vaSpiylxeB9UI+6De
X-Gm-Gg: ASbGncuxXaK0CcGTsZjCDW7uTKK/yH1fnmcZZn/UG/xp2xJMk6nA1QXvSZmb31BYvuq
 ETOUJoZdszWeVINFjzb0dWI26nhZmRqEyCrGDZWM8WRe/L9XGvVpqRT2bNxh/Bm+C1x8gt2i7Yc
 oEZhcPRd2cBaENBZtpRcZkcls5tP2yryM4zqAWT2WxwaIqUVyYlon7+mQQYpVLwruGnPyS9o2cJ
 DNoz3qe4caSOvv2Ft/RbYAKnII022V4hpI5OX72+OkP4mqozzAHTuOAnzFfLCvNURHiPJldiq+v
 +mX1LEY7TZVctEkYY1inVKuQ93y8v9nC4eoQxtfi6ssPCZY6zkH2VHX3QGUxduTRZsx2vo02mDC
 nTZm/ZfBHik0sjbs2vH4=
X-Google-Smtp-Source: AGHT+IGHjNqtL4ML4K6mgFG8Y9ysSdvcdDlvh9TXE8IuhX0uhbekGYa67m2VZbTWJPgCHebVjAgMOg==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id
 6a1803df08f44-6f8c773156emr75941506d6.10.1747763102259; 
 Tue, 20 May 2025 10:45:02 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:01 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:51 -0400
Subject: [PATCH v7 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-2-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=5304;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
 b=PbqlKooG9WJYSUN66hnuD7Hs/WXVtPXW5O42qPXoWh9DeILsAkZl1dC2cj4pxrwKSl2Dy/a6j
 6Xw2i7fjiClCzQcHWFkZHeFDoj6GJLgXfQwNHeoaudrBrkhd0nC7Eg+
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

