Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA5AB905F
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 21:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08F410E95E;
	Thu, 15 May 2025 19:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GajboyiU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8AB10E95D
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 19:59:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c548db0aa0so21741085a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339181; x=1747943981; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
 b=GajboyiUJa2IZ75Ah0gV2GDaJxoR0aKbtohuPylKGLhsSyQSzkkn/AHUvaxDhU56A8
 maMlFDUGkRTWqm3vI2CnCl4U0zNxbLi62KxDPAtbfAQvZDmv6uvk6fsEPENv4ANbiFbY
 wKJsnTHxbyNBHRJVVZyAQ9qGuPnBQ3Jp5GxNbg3HpaSD5KAdzOc+9vJtSDmGLN7RGk8d
 yQh9+uPf5Aoz//yCjbXgajwf6uvcB9Gw7JrNjuJkGxWLoUCGp//jm2YOn5Ffi9gTEyJc
 HVMrJ2rKTQpr3XL3wc0b/9HJPYaOCZP1vn4e88c+h+FxgiRyRZNt9H0VcakkG703pX5M
 Kz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339181; x=1747943981;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
 b=J5hi0CVlh6JovC5Jrmrm2ApbHxVdZqDrBWJVxgzy9oVMtL1qkLoakDFXtVlUu5Hen2
 88wTKlN47NNPkAkfwNpydHa0o3DNiOLKJztBp8JT6SAItoGYmb6ATV4KuFwjP9vpQqD2
 G+Gr3WJx6t7RUTaI2eddrgKGfW3MlUARlYI9SB3zmVZ6IhjWf2YFv7TfQ80SUTO5Hijg
 vvbl7xdIDszMRiNejI3lZxAvGKze4A56bD2m9BHO0SrmyjLO/ZohUMOx22QF7A3a8/P2
 veVtlBIk6MmKp9AQrToDPGqq7T45Zmk4uSA03KeiVi995/4GO/hA7P2+7DsWlwLLvpp8
 r8DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH+6JJ/tV0RmcoOSrjee26la10xf9W2+6F3Jig2NfptP83jZFAKZumJLbVBL+Q/7VfKztd2bf3cY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyINE64g1d7y6SEBo7UTMIA6hchxer49OJQelo+gS5VSMfwnkVD
 OTiMag5dSXGRlSqr8F3OQKEHi8ZwGGF6xUOxvk57R5B8XOBDBBz19ght
X-Gm-Gg: ASbGncvxNeY9eLH3pU63/iLEjpVT4ZhIuOFih71ll4KPsfpo26qliyJEh+EDJCG1HWo
 fxlAXn1NkC1bvg7lHuwWTclIxML6bP3QCUwEKa9vVXhHC3hmJMf1pQTxmhSjzzeqm4rMnaE1oWq
 BUByM6WdjvYNR19hvfqhIbdbdW/1k1fCFXXy0gbClAa/rQg5eAX/QAKPVAejddQlgh1p4sV82Bn
 mW89uvc2eTBoMhNH5B9g1pgj6gye0g11gTsKzQ/GvEbkgc78GvfIrmK7QcED1IFu5E+/M6Y4Brf
 l4dD+SKlL8LEFHI2un8zBCopMzYMfugrUxOTlTzzPwAMhlGchzCwYj2uPOlERGK9kC476OagZqP
 nMhe+rn3Us7RiWDeyRC8=
X-Google-Smtp-Source: AGHT+IFDWp8u+QjgmXSWCzrAKUKVyvuRDbgutIyJGTYJ63yX5WXLYpLuZEG+9WHmxaOHRSYMoJ0INw==
X-Received: by 2002:a05:622a:1306:b0:474:e664:691b with SMTP id
 d75a77b69052e-494ae37764emr4557401cf.8.1747339180611; 
 Thu, 15 May 2025 12:59:40 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:59:40 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:45 -0400
Subject: [PATCH v6 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-3-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=3349;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NuuNOSzcg6T6eP7lLDMW2wQqpv+M7MyGEuNFao145fo=;
 b=G8f7cSFchFa6Ol5NZmbPn25aQKQkCTssSAZn+8lrwlFIh1x96h6u6Eq2OveCkRVCprigujkFM
 gF8bATUpx0qDSrjfTkYolsLQIxjAjr3aU2RLL0cOv0MsHcy5zrhpUHQ
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

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 +++++++++++++++++++++++++++---
 include/linux/adreno-smmu-priv.h           |  6 +++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d71404ad90376b2c258d67e07ec380674961a429..98927be42bd1af25dcc3f667cb75d250a320c447 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -78,12 +78,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
+	unsigned long flags;
 
 	if (enabled)
-		qsmmu->stall_enabled |= BIT(cfg->cbndx);
+		qsmmu->stall_enabled |= mask;
 	else
-		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
+		qsmmu->stall_enabled &= ~mask;
+
+	/*
+	 * If the device is on and we changed the setting, update the register.
+	 * The spec pseudocode says that CFCFG is resampled after a fault, and
+	 * we believe that no implementations cache it in the TLB, so it should
+	 * be safe to change it without a TLB invalidation.
+	 */
+	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
+		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d8eedcc42a03a9d303700f62f8cf2..8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -45,9 +45,9 @@ struct adreno_smmu_fault_info {
  *                 TTBR0 translation is enabled with the specified cfg
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
- * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
- *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
- *                 the GPU driver must call resume_translation()
+ * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
+ *                 stalling on fault is enabled, the GPU driver must call
+ *                 resume_translation()
  * @resume_translation: Resume translation after a fault
  *
  *

-- 
2.47.1

