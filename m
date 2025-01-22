Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124CA19970
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 21:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9010E74D;
	Wed, 22 Jan 2025 20:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F6TNAV/w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8810E74D
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 20:02:11 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7b6fcf01742so1129585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737576070; x=1738180870; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
 b=F6TNAV/wl/3M1G51hOWhwuH87RgmL6mnyxEpPsA2M2Xc2y3lRorjt1YXOI4VIzykwZ
 9T2zuuI9KAY3FB0at7FhQU+L+ujsMGGk4lkpCcytREr79/MCuXF4V6X5A9++70SrQK7L
 eFcg9ppRnYKRAJ4vGnM15kq+09g7eMrkPLza92wZO0vxfPq8Og1cuTpxMAirlL+qY/Y9
 yDkPlJpiVjVdwBoR5fZQfsT/dIEnVVbU2j9r/TNhigImD+9gSlD50+KHpMFgHQtbuEEN
 p5cqsiiZWqS+CERgOqbzyxvXlgI81qrBUoWjHfGm+RkJRrFGjuAV30FPcP34Lr07+5O+
 J5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737576070; x=1738180870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
 b=CHKvC4BXUClJg3I2UiCaYQfu/N9mAVIMqFtyRr9RltJ/rZnO/0Ze91DwJh5gaDXFl5
 8fW2kEYZBugiSbH0jepD3VgijHrAkTKFWabEtJ/j13wM93H6b3EQU5AE1Hgydhu9yMMg
 o7Xx1egvDeJWUNZCulzUnF5eNNDvuOxt56k1z70MaCOepMdRtqho/jpYVmkWtQ5eXE02
 DxcIHeGxWr11Ja9gaSYGYu946+Y2V5oOtpqe1XKh48ys9G7ArAJR5khIzh26pkSMrRkv
 Xfi3seOcZxC6apVbiiDNrRbG0jXSpJpnnuUV4ghq6eh8Kz+AVWba6+y7s0GVSCG4ev7p
 NDew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ogLrazvHYrqggp1jqVVnyWFyhdoUnd1y8zvrWHNndg9693EC+apFVtuUHs9WhKQYevM1bEMcKR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgMm7chnp+IAUA5FXbWsVSowkxoUIcpNtRrryeCzSJ1vNcN0W4
 NcWi1ThETc3957XKv1oy9hVvBUChCLtkYF62lSrhQ/HgQFIGDq5DLmzThw==
X-Gm-Gg: ASbGncv/PwjGttkevS0q9mMYekrRZSK1UCYDkv8BlwL9I4hIStjBsNNNN+Ylj6haYP+
 2q3tDo7NIO7du3S7Qrbv5hFA8KjVqpauTYuNKFf5m51VF9tRDquqVgs6K8g7cjpltux6LkiyWKK
 2ZKl89RcwoEQcnIK/6cFm9vk26LtdvTQ2NP6ekLwcQV14pCtLK9C3rbDX+CxnHwuYZTYdav1/Yu
 CEu4ib+KGKSn8QwK71rzQDDhzsq9ahNABc89fZr+iip2Eqph5xXeuSB7q9ej2vYk4HRxAWbpB6T
 b+uUUap0GGdWv6DOS+gIjNi6ecch
X-Google-Smtp-Source: AGHT+IFbsQgN+OYWoJ8tGUrhqTk3b6gEBJi7yaE4oLpHOAjzYS5P1remXjUXmLoR8liW70biIpVbJQ==
X-Received: by 2002:a05:620a:1911:b0:7be:3cf2:5b46 with SMTP id
 af79cd13be357-7be6320bc70mr1391147185a.8.1737576070653; 
 Wed, 22 Jan 2025 12:01:10 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 12:01:10 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:00:59 -0500
Subject: [PATCH v3 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-2-0afa00158521@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=UtLt9Gxw8iQpbRsxeRyHyMb7Pm7ArBDOREehdF+WX9yPMugQJ3Icy/92gYrtsug8VrkLc1is8
 CiXL67DhVUCAGFOPZCD8bglUB3zCsRgXLnoLC4DgfCG1QTviaTVY5MT
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

