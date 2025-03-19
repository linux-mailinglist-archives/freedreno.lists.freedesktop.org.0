Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62640A6900E
	for <lists+freedreno@lfdr.de>; Wed, 19 Mar 2025 15:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2811D10E511;
	Wed, 19 Mar 2025 14:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dIgydoc3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057810E511
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 14:44:12 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7c5528c98bdso28944085a.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742395452; x=1743000252; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
 b=dIgydoc3/0VFflngR3ueYSi7TmQjayczw0lcgH1Ct77YokLfimmC9l63fJvS0SLoFl
 q2+HWVJ4XsqvZS5WzsaC8nCBfLxfi9lb4lGfHXQb+7DBl0/bLLJxk/HiwDKhxYf5Q6Vi
 lvi/EOLkDc5GR079XeFwfxwonhMHJ3NkuaR1lCIIDHzC3MW8aCA6CT6tOV0hYcg2wwhH
 52zc8kOHBVewX+jdCiY7VdyNaZVRp2QsS3CBcpB9Q9iTlfJVZGeN35qBoiGQ479+hSD5
 bJWbsLS5ftCJMqUC981jPgx6w/s7sUC31rbsvyHTs1iE7nO+NqRSEZKbeIpurNS+QRqB
 79Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742395452; x=1743000252;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
 b=tkWYtDAFUwGEPKR3mAzZmL1jJlWYXx6Mcz41dtD7KFo/6Aw2CSxDztQC/03J+wZPH3
 lXSZtflcB3v/O4Zemt3GKSmbflh160XEmZLfOBd7q2v2zlXVr/S9j1sNaJXCLJjGGvD+
 TNjd2cLngPqhWS7tS/sBTMvliE+Xk1l69P3OgLDnFStBe2FRsbqwSCTsO0uhRsqd3Eod
 Yp2ThQp/J9ah/RDfknwUyGf0auQ03VBg+KzbZ7TlKzNukDU7dKYST6fKHvpoiyIBaLVV
 XjEAdMbebRUFq/9113HoVevzrSLdA5RqJYrHPzxQ7F69hCdYSp2x9xPLEbr5m78EXC0q
 wodg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXnqcVuwoIu3ri1SC3a8IJQaeqkJjVZ8bC/UCCp9bxgnmqvIaHMJoZu39D+0QtrUaOevmVtzkGNg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHgl36fujVR0UZ+VBg60PrHgqdVDSdR99v8jkpyhu9IMNxgZ2Z
 V2IUtjevhY8YgPteVvR2xyJ+rQux7+uXponip7zXyNuXD3FRlV1jXegkY4UL
X-Gm-Gg: ASbGnctIuHGyOq7jpOv0JQcsIHifC3rs6ieZj5LBc7YOFdrJc56e7eJ6MDcQfvM71ki
 icYLrOSHqWq25jgqZf7xQ0U4nw7miBKAUgBKFqqtaLNPrWvZuS/1FBHkD4+QTIrlRVar2Ihd7nR
 0KcOMoONSOjslqTDtyFXaSXikkScAl5IC9sN7qf9s63D10V2gkUF/qkhSnWmgZGady/4mJBPoH2
 leYWuPQnyzS3Vq1a2+QvtAtrgf4nrz/D7TlaOiCLrtU0SrQaaBk8bTOuxN2+u8LqwVdaUCbqAxf
 QGu+TJDSMIt0mmflHN0xV8feIIdl3EpUHug7HNCPow7eAEgoSlfrdNyfoQOeLOMZsOmi2bgWgx3
 vv70=
X-Google-Smtp-Source: AGHT+IEpDQ6Iq7EL34BOyUpZMWjHvcPvh/lkrIFcpZHlUwWtyFmoiBx6pZ8T713YT9KI50QLqxMdOA==
X-Received: by 2002:a05:620a:25cb:b0:7c3:e399:3289 with SMTP id
 af79cd13be357-7c5a83d609amr122312985a.4.1742395451490; 
 Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:03 -0400
Subject: [PATCH v5 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-4-97561209dd8c@gmail.com>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=2356;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=dyr7GkrtgLsig+n5TUngdYzO6eV3oK7bTiLJtUDHAnM=;
 b=RKN5nvvDGIxbm5UBumrBYsNQjDxpkr0KCnP1Iaw92xOCRP/yvUGsivMyDJOaRMEhdhlM/3hlS
 Gw3WyY2nTiICpPLJZ1sNNIRZU6cstKEpnuXrASFBZYibV9DoVEO/0gX
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
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a428e53add08d451fb2152e3ab80e0fba936e214..f6bb405573be0ed480a2587a5a780dd711b8d2aa 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -77,12 +77,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1

