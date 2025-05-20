Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2AABE35E
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B310E5FB;
	Tue, 20 May 2025 19:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z4h1EROD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394910E5D9
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c5445cb72dso59874185a.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768143; x=1748372943; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
 b=Z4h1ERODJJZAc47MgaYjTT1ho87aW9RQYdxmz4xEMDd2Tw2khx59lfAyTO2TfJwn5E
 ElMdvx+rcdsitXP/fi+on7H5wuGew/KAoQoTftbVds/9AN/iLs00kGK5+BbcJoPzVftd
 Esyw2MFkLlaSHKav1hwGtTUtu7b/b9jLIrlgTnP6ThnuWLZ9g27WHoKl5s3tL5WBh2B0
 n7yt1/7/QhU3CwuL7icU9R+Y71gu3hWgni6wC4yFGTexfxjzUbmbfinO0L4KPk15SEkC
 fdcu383SSbDunv9Nl2L3eqWNWuhFTW7mRqS5RpJibTVx7KTbJnBGv+t9twHnByqR8Vky
 dfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768143; x=1748372943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
 b=w2Xn8VQozmDv0oqf6VII+FB/iPNdZLm1XbCAJ+1kDlk/owy1j7x4cgZq898cK3SE4I
 7ZKcf/3LdndCCMhTF2cjvEmpHZtStf3IEuowbYoM3W3EWKISlyaymY4SWQM1N3pYq6EL
 P+NAGLG1K6iPzAnVgeZC+3fMYycHQAcROC7qzcrwuoGescRnq617DKwmSDvmXcoWNaQa
 ZSYeK89Y44lrd9YAo5mUWlXJv+GnDbHSAjM1ZWAxLAM4mF5grMd6iKVBguARcX62xypp
 rmyW0d8DpSXhCHDqxStpYiXHPWuWV1Tlw/NoeTELdv5y2CAIwk2xGNJawjWEFtgCLdcp
 3G1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXijoc9jGB0E/h5OBOe0HCXXCeYUuPfGXVWP6qTu4Kk9iOv7KydLfS/WHrI9PKiElBGrk8A98vY3L4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRrWkXe92jmjdZDBYdpmn2CDSBFUmccowdsxHtzfG3LgSu/wEI
 ftVk7Nbe0+kfa4G13UZeCSQBTdrmsbL5p8P9ir8r3V+9WRlg98f5oUpl
X-Gm-Gg: ASbGnctVPbf5eEu5eBe9cgix6hXa4pMCIDCUXrF9/XSem/1GweoWW915NaR55XlaoCL
 /ZCviFEZaVKga7I31Zhkm/xhSK4lHftUM02xTW1CuecaAcLrhnAEefQbJf5uaAzHxOUBM1i8sax
 rdetr9yIkJkWcxY9YhbJKMHrJ0Y+FdKykVT1LyoIStEElHQkRANEPoMU3+ZWFVEWQhULluZv7GI
 LdPJIP+i7DEJSt34HgcFFWbOg8DI5yGRxAwBxjPJ+sMBzF5mjUFEoG7c3pGtkY+MBVPtMHAtK73
 GcILsqjWDWzl7oO4G3pRBPY0DGWcH4EbmPJ0ymLQETiCTGtEBj+3rf4Elc7PKnymGYAfhBdfL04
 veUCO+8W6E183ExllyXY=
X-Google-Smtp-Source: AGHT+IGIrgJ2dmANNY3EjX9kZvxGmi8VdnrE3uOp5o3gsUKwQp+d16sgiHehsoeADCEn10ddqVWxMg==
X-Received: by 2002:a05:622a:587:b0:48b:6eeb:f98e with SMTP id
 d75a77b69052e-494ae330988mr104811741cf.2.1747768142906; 
 Tue, 20 May 2025 12:09:02 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:09:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:56 -0400
Subject: [PATCH v8 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-3-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=Gva2s5Z7Ds/ygUrvduDeZ/TWE6RzxCRXnJg0Zhx6Z4wRmr7VRKNIHU/2xJaO+oPPC4dZhG1Tb
 GdN7Dm+NI2yANHk93Y3MujPoXjVnGL92q+a8IWtX3FmhfkHr+wCKih3
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
index c84730d33a30c013a37e603d10319fb83203eaa5..f7430c131c21f40308df36fe25fe75d31558c817 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index abec23c7744f49bea70f3352da9385304ed3702e..d83c9175828f792f1f43bcc8056102a43d822c96 100644
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
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident

-- 
2.47.1

