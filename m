Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CBAA4E721
	for <lists+freedreno@lfdr.de>; Tue,  4 Mar 2025 17:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9110E65A;
	Tue,  4 Mar 2025 16:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNiUevh1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B8F10E652
 for <freedreno@lists.freedesktop.org>; Tue,  4 Mar 2025 16:57:25 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6e8969029aeso8820286d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Mar 2025 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741107445; x=1741712245; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=;
 b=SNiUevh12pn8Kvm1hFRlVhJM2BuodPpjZnuR9pJfZQyRkZs2wvjz5LYrhVsArJ1nw3
 9Esj6gkuDFxNaRmfJHY1NVUV/zEVNL6biowidDPEhjY7ELEr3i/SmWplzoT8Wlkvavqi
 m/Q9v9oPbrqGTbNyKalml8gekW7fwEfovQI/ofjsOEzdYradKNygV5yqFTVV3p9v3XoV
 5u6HB5up87U4o+hSRdUY2x2bpFtcsssU1OxQGAjIfv/y9kB3fDJBxbTkZHPOge/65cTS
 Rus6VO3iR5CDmzcObhoQRsaJDpAkhAqI5bQCl5bsgmi+boozL0Xe1iHY7k6nNqd9fqEC
 ed5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741107445; x=1741712245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=;
 b=IxAtGpe908ihRpolOzDqVRHbLURJhJTu7N0wRfBSTvOne5IU2U3TRMdq1gjZQq2vDq
 1tUzG7Tgav6oM007XJ7LYDa2hdjin6eBNHPqeoWcBQailYikgztfkcWkaShWpI0Y+76S
 sPe2RZga+47YelKta6Xv7k2UBsiHuLjYD9k6C6Uz8Y6xAb6FxaIxz6LwvGjhwyYKwY3/
 DIWNfIDa7zLzAY6PAj2qbsjvwypwqucFmPU7nqTRfa795Y1zrD3kp/297TSK5SOLrV2u
 W+CAbF5aLennuiJdA59RW3dpmLD3JdaiiSKOpXPIVtVl9FZP4hKiy/0R1h/1BcFNwmK3
 qsGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkWbMZVqP3nyWW0rMyuTe9QlNqlFGoplkrOc8/8+8o0pIBbsrZm6DvMkfGuqSnFVJ/HP1NZH5vSG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRedxYghPCr17Rh633NTizc/wnw4HcTUTLRbUbhtvfCVnxWLQ2
 oOHmjv/bXAmbSFzxuWQkkXHxGynvUnPshUT6bHrxzmhGSlBkYsVO
X-Gm-Gg: ASbGnct9e4YxKwXhh0IY5n/pVQl4a3j/zSaszUY1Vv7MrBs4x7ijQB4+37m7OWKD9Ss
 dbGRYYG8O50KcziLz6xDNAgfP2742BMSEb6AD1eYGayP8TEC74R4y3VMpV900YJHccQjMGIvGNP
 9VHB0VzxgTT6tkt8VdvjspS3MwdvDE+komPdU3GVxXgriFQD8KrTz7w19zHIQ/mCpVBec1szALA
 YCE29CeDy2GwAdTlJXMKKTYm0/ODHffVw64a2t3/O/GJeS8ky2fr3mt582mmACUiTIPJG0p63p/
 urYCb+eqCS6uDMomGx7UQLyUQEs3JkUqdNoo8x3xw8mqBl+SktAhMYvbmXo2SUChXOAUzZ5162E
 7pBA=
X-Google-Smtp-Source: AGHT+IFmTBw/x9z2AhNxbshhDZU2/MsdlMTKQxvGcWNlN4YbSO4kS6CeUKvMP93Gc8bji+QnPDvufA==
X-Received: by 2002:a05:620a:444a:b0:7c3:c406:ec10 with SMTP id
 af79cd13be357-7c3cd6830d9mr199306785a.14.1741107444924; 
 Tue, 04 Mar 2025 08:57:24 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:57:24 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:50 -0500
Subject: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=2106;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Me/D1+KhPPoLdXUQArYzWEOMKf4DNFEbfunwhGA1eSQ=;
 b=DcKFFyeJYU3dr7n7hyZuWkoVwCLwEf5oGUfH1stJNBPTrVCxsAWbmfPuZC7lLD7dJuFdZgFWN
 OMJ3w0DnCjKD1p7njjA8uCVBeD9sfqthO9aIDeLec9/kH02MUzU55kr
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
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1

