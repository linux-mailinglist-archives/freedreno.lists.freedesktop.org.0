Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E0ABE203
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA2110E5AF;
	Tue, 20 May 2025 17:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHieWJX4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B010E594
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:04 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6eeceb05894so7984236d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763103; x=1748367903; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
 b=hHieWJX41fvdojIhJY4J1xpcnREJJBCtZkZ0sdWJkJZMoAgXbESwJvX8qFnZD5wUo4
 tWIKCoOypA74jZ2BZ8SjifBi85sog4zwbuwvDR8EHSYEvNKvZ5KM4USPZISZdJouEEhx
 PWFfaBpAUt4MSGxtMXWOTv8sySTFVpeqyG5VXc/wPk9i48vFcom1PZsdhBeCwPXFc5+O
 zhjtWhOYFOhpSmbQNk80N7FqDtXTxrSkhOqm8YrdFiKezaXHYI9ZGI0eJldUzZjj70+B
 1wjA3DbFEE2Nh9IM3dPKuQ3vGOH4jjBii842Kc766tmg/cKUYF96rzdwbOIu3oPq90cJ
 4bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763103; x=1748367903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
 b=lackJWqSue0VC/H/xjJpxuGPVxXyW817ApSzucwcsuhdggBEKzWm2WoBBSwZcDJfWN
 wgbMCPGCGAwlajDv4ExlUHtSQM9KCGW3X8O+HdkaRy+BKEyxVvT307B8O85emovxnRDQ
 mx4cddb9IksX8tC4fGi/biGgI4LYp36hk1Eq44LYOQkjgb68AuP4Y6TZsvAnUFlmX2Nh
 VyeVSeuczWwLJ/mebMAMeNqsO/Z8j/+yLIx1Xb7u06Xuvq7WL6ncSOI+QrzRnukzgWbz
 X7/l0xgtG58VY8kjSsAzU8ujqdsCHxxtzBiLaIXIYKsH91aRa8eTyxIge9cIgUxez51V
 MJvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBa0WE1RxJGcmCiz7xdl5ktASY3Hk5TppUijbb2H/jsYf+k8caE7tAGv2M5K6WE/bUA+A25JaWU2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6i36Wpw0+mTCQ93FfR05s8qQdxjbNSkwPs2qy/GwJau+Rfngj
 8FQCXsm1RrrckkR0OuMLwvodY1WeAjxoc22aU3WL1M7XOf9xd3XSqzpU
X-Gm-Gg: ASbGnctMRY+3EaF8Az9mDpO7odPGQwYqC+PvAMlFXoSOD/SaAXfede5plNKOaYveLSa
 U41ecTvJRNxhhUUgPGig+xG009rTJj/enzosQsVumnxOPDIuiMOWhomcVJHJmjS2lqR9/Sn90AS
 teUyh1xDWV6jkm0Bdp4fdbciXhyMT8V7gG709Qr5jntp0bfu0iRyIPtk8qvikdb3n4T97UOfZgM
 tO1zOvVz6pL2RVMAz9uQNallTiAvkNkPQoLHi2XIMEPY34b1FQQJOmM/CNSkM+t/DR912g5z4WR
 v1099ESlLi6jhfir9NhP3kW1K8WKS5xRwyrs0F2geqv1PJnL6MlYgqlvth1jJbvB08c0xt2V8XM
 hnTr0exv5yS/tPkV76AuoSn1P8ye4KQ==
X-Google-Smtp-Source: AGHT+IE97Zxos5az8cXO2o92+oaDSt/gpfACDdIypt80WhX1ZCXMDiAGP2cn+7N7wTHFzmRR7CT4jg==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b095:a79b with SMTP id
 6a1803df08f44-6f8b0847d1cmr100255236d6.3.1747763103301; 
 Tue, 20 May 2025 10:45:03 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:52 -0400
Subject: [PATCH v7 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-3-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=tD3WtT4vxh3vXzx33GeuNyl5hmvn+QJsiqPwD8bbM2tFraZ2f8cV83+Pw3p37JhvR3WUGpJVu
 Jc3NWPlszKkCay4kWpB4ilL1RekYJZqNSrPXTsclNz4Cevm67LPekiu
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

