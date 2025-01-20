Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DDA16F85
	for <lists+freedreno@lfdr.de>; Mon, 20 Jan 2025 16:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249A10E438;
	Mon, 20 Jan 2025 15:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OyJ4iYZB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC69710E43D
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jan 2025 15:46:50 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-467688ec2e4so3037461cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jan 2025 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737388010; x=1737992810; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
 b=OyJ4iYZBt8fPtuG/I02T4AuLl3ANFAlb0E8Uy1bqg022cbe7Zac5lpmZIhimrRYKxM
 dD8nu7+X1vrgJuwSXyn5JGVzhRndXjvWa4GL1CxVIpCbDbuxQ5kUkpGfcFCn/kvdevPM
 PIfdUk5vSbS7HPUZEPbW+18nHcxK4ytEeR4YG4jxwWuLEwz/0yqW9OglAHnZQQgx1FlY
 fQDseXG3ICsO0zmnf2NNnOFBTp4OZst6cx8k7RRRBPGkYGBbj6dbIhttXj0ZvLbnMeRz
 ly7xr6DA0xtoa4cqeeFDnkoxcDEL36BqtqzKDZS3QCoCeccbZtMCwFw6aljkxqzDDypq
 NXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737388010; x=1737992810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
 b=RV7I7dhSZJKrImG6ViJfolW8FEnFPtgfFPQpWBaI+bTWtmjJz3KWJBHNnrn1gdxLpz
 SjCW3tVComQhJ5B4OC6hbjtBmT7EyKlzk99vVwwNnNg79PG5imNrL0RSjX90pV18uRmt
 IF3xWNzchxl5xj0TBIJHSQQbhUt3gO2caCGkUNjAQB6THRZe34XfxW0nnLF3h3iR3Yr7
 lQn8OIQNVCiK0MGjkb15kGE0JHFglLjuIUVWwHKXsZ6EnCDgQ0P4i1R4flVK/HQZTY0t
 8+pXkXDb4YQjcS1itSSmCZ3URxYR9H6vMuib1Tn8eX+ITgwF2euqVS9pMhewkLgG7deV
 KWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV65fsl+VPtmuqZLoGhYR8bsMPYt0m9mShta8zf+bTwEZlWf61/pr/+VOLPaleMScPLi01yxo9DKw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJm/ljxPI0/9dkt6I/nY3GEIdeKJyG4nyF6Rs1/G4gXz2FgqxZ
 zDzKlWelQiy+P7gLZ+GvRfjzThP/2XJ5UN7xgnJajn9azNYBJEIl
X-Gm-Gg: ASbGncvdPgWGPsyElY+UWLNszFZN10sv9qfarHJy+V9+hy/ZABWW2/8nKAFQ+XxT3RL
 lg9rSBnQKmqJ8XNRyQ/FffJMAGzWhpHtj4Dvd3Ls4JAV6+4EHD17qlEq+sSuCbtCxIblotASqnM
 eXBbcRJ+njuLkf8LAtP83xBIjaWw3hAILVSu5DAtkMBhngHd/mfSVow6k4HQ84ROXP+xrXO4Vtr
 cCkRsrLtNXJVTQfUbhe0qeoZczqPYgcHCdHM1Zmq9yzY7dsrJaV+IAjzC2fQHRv9sMR5PaQLeVO
 T01+5XB2Yyad6dd/6gpySB7fyrX9
X-Google-Smtp-Source: AGHT+IGO83HWcFHvsj2Z+GtJHgpwBYQ5v8L6QYl9DTIkrCF/MppDtKtDUAn/rsAhdmobjhxCpwFbMA==
X-Received: by 2002:a05:622a:608a:b0:46e:12fc:6c83 with SMTP id
 d75a77b69052e-46e12fc733cmr80827391cf.0.1737388009957; 
 Mon, 20 Jan 2025 07:46:49 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 07:46:49 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 20 Jan 2025 10:46:46 -0500
Subject: [PATCH v2 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-2-d636c4027042@gmail.com>
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
In-Reply-To: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=1hM2Wj1hNgl2mwr4iWI4WCaP5p+MmlgGs0igxClq5lMDY3J0i7z9MPcdLw38a+qq6t3MdsGRN
 stHBB5mOzQLDWO2MTNS3tPbd/ElnrF/+O0xip/h7iEzq0A8p8RLFyl4
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
index 7d86e9972094eb4d304b24259f4ed9a4820cabc7..6693d8f8e3ae4e970ca9d7f549321ab4f59e8b32 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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

