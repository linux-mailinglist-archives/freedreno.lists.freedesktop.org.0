Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27182A1576D
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 19:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091D310EB6D;
	Fri, 17 Jan 2025 18:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1P/6lo2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99B710E313
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 18:47:41 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6d8de4407f3so3525306d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 10:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737139661; x=1737744461; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
 b=X1P/6lo2lfjgJRpWx4QoILAElcAlDwBYLP1eTeKEYGeLnv/ClEkZ9uK2Zfeot0CV8f
 Ec5zG/+inhuduwhqjv6U9ZlZkCNTLQ6gQ+gsoyGABYyQOghhS1uDVZT4VEFG9iR17eSr
 +OTXTwfV9McZ12xmFFu+2YPFfHhltATh6NBqk2TgbFn2p8nWRn8dZcxvJFX85MfXrMVw
 5vZxueIB/8GblcVUZ0KnAy+7/lGFF7wGm/pJGX/FK8D7qLdQ8eukdrLvScTFhMDWoHTY
 CAKEyvqL21q5hcMRwWWkPFp67cVx3+cy0NYGzMOv3ejAUdY+XYIKKa1++rSbqQ4UXXgX
 hJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737139661; x=1737744461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
 b=tdV98/hFDVThe5DwtT+s4BhPC5HSgsFMS/5lUQ8r/YuG4cndYxzwt+bFSOJCCF9l2x
 1dGAfaw+vI/4kt6j6AEVix5vjU0LvLRkQRGnFh8gRQOjCq3RlL6zhXyYS2i7NxiosXLZ
 u1Ic39C2BTXEn5+75FEvADDCMiM59C7bqOLfQb5OJ2m+7lPyGOF23X5eNExKEjT6dJUN
 qISF0IRakzKpBcGYyHnnd1uunB0x3wgxWTlf0WGks6FA5mLjVm4HeovTXBHgPSblf/GQ
 dRPcmWKSeb47Yj92jhcliG4e9mrn5y4R0R1zTVd+rp96pvl2qyv9/x5ajUjdZnDMHtnj
 jfNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxlKIKsD3snxZBxSG1EkzmSNb0sTGUuyxPkCSeXesPk4A0GmdjCMrXeAYZVIA1HtbSO9VLjgM7Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXCTBEZ/LalfkrpYhlAk0A6FcG5PiwFLPSzru+05t6NpR7jgTk
 oHEpfSVNwNSi59nkAm/eN2oLPOkP9hu32Ul6wn/opZs9Fy5GaDj0
X-Gm-Gg: ASbGncvQOsF9PCA2nn9NganMxMM4xdwU3lzybsmidP4jUkoDAn0OyrHL1gYoZOUqoOI
 jR1+fKEL3FkCVIA2AGzsp3oDNqheu+XNYbz9pjR8CkMH3aiPV50FhY0GBwk12eFHPMWhJGMoyG6
 V/qh7mE/a8ixnsBZZxxKRClAIwLVA6P3A/DulO3dCRJ3AsVv3VRc++Zw2oZsYAn6rAACSNRz3t0
 IFCqcC4GXrAcdFb+dZRo+SOC1T1zvT766ZFvclOxOQorJgV7la5vItyrzzoBYBdxLJICDbohcbD
 MX/g70/IwbAuJ2w=
X-Google-Smtp-Source: AGHT+IFkED0JQTC0Xpd5G1Q8mAnhBtwFYNMO1jthK556QYFx0lYcOPWbJ2YYI/wogCp8QUtnRASS4Q==
X-Received: by 2002:a05:6214:528b:b0:6d8:7d84:a514 with SMTP id
 6a1803df08f44-6e1b2175b9dmr23314216d6.5.1737139659256; 
 Fri, 17 Jan 2025 10:47:39 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 10:47:38 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:08 -0500
Subject: [PATCH 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-2-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2114;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=JyOLVh0gEkcPnnA/qjt0Kfj3pqe9UFDopPZk8F1e/x0=;
 b=Z8mukskVxG/5911ObuOE8aZjxBMyoMMxQL49HUEn1UzKTTkKUCl1YqM1Kdm1q24jL47h7A9xL
 sQTHHPy79i0CWIRIUNZjb06P1taEZ4QbjZs13mX8cjDTJoodH+OmmrC
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
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ee2fdf7e79a6d04bc2700e454253c96b573c5569..54be27f7b49d78b7542fd714d6aade2b23c65fc0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,37 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
 
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
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		/*
+		 * If doing this in the context fault handler, make sure the
+		 * update lands before we acknowledge the fault.
+		 */
+		wmb();
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1

