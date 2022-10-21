Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE6607CF5
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 18:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FA710E53E;
	Fri, 21 Oct 2022 16:55:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5BB10E53E
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 16:55:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g7so6184882lfv.5
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R20V3yfkrUP6/lROP/c6xfh9kgofHKni16w9tt+lh1I=;
 b=HR/Eg71dN6Z94vqDP0qVQrPyEUO1yTQYRmPJyiwie0KvPifnol9hPPPJ126FVyHCBX
 9pYeEqCjvsSytMDpUxg3vld53GiRZ4GIFBdQoDIVNUxbZQXmy5Um0t1Av2t60Q9wP31b
 fyazrIYLoJbXNERT2FAROQKtwxu0AL6QcH3CJUWioYuaHlo3RW4bP+E4yd8uMrFNXHvw
 h5051iRG6ZLABRVvL1qMCJp5MirCC3DxdLVgrnYQ+f9OtfWWiP+tCmfTpZI9oAua4cys
 lYXjzrjMBNqgfzcpWkMkGUbpxs4ZK+djwxK1wnrUL2ZrGkoH6VGYFXr1TyqNRFlKYfA7
 8W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R20V3yfkrUP6/lROP/c6xfh9kgofHKni16w9tt+lh1I=;
 b=ePadNazu5YD94fSYcw9kBJB01czb9rAwClRR1iPGnkaAqklV9fbLWo/9Qc0m86PqhZ
 ViYDcMOP9gDktIiCWgWVufvxyQC/TJVsyaDCmM3sqskE0jctsF2n2FpAh8BnKskp3P/3
 XLJfl62aXVI1vxoG/oDIQskS7Ec3R4gTfsge9HuwxFpdke5CZdIzFEgbTARcOTkP3jNg
 QvXZ6H6KzJd6cVnsqFTjRjP5TVlkJY/Jwi1eaqkALB10FVlcWCxM/rgsYKcSAp+lHFiM
 mmciDOJM/JtxKEMz6xqeLOXmrxWvfzKu0ErpxzpxAS4D52nh9yguKB01S5dV5xIUzsxq
 DcGw==
X-Gm-Message-State: ACrzQf1oBzkXx++DLeq/YzNW8NhSeCYeMm1PMntZJBQwynCh0ta8N4lc
 VJAtDz2fVqI0BwsPco1XjH/q0B+tjGBqBVuM
X-Google-Smtp-Source: AMsMyM6F9QRR8Rb5ZhpSgEddG1MHahxDn3EbBDX4LQbGaYGcq9QruT+pDoyf0bs+dQVFGQPJjNptlA==
X-Received: by 2002:ac2:5616:0:b0:4a2:61f6:85e9 with SMTP id
 v22-20020ac25616000000b004a261f685e9mr6839567lfd.419.1666371348373; 
 Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Oct 2022 19:55:33 +0300
Message-Id: <20221021165534.2334329-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 8/9] iommu/arm-smmu-qcom: Stop using mmu500
 reset for v2 MMUs
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The arm_mmu500_reset() writes into registers specific for MMU500. For
the generic ARM SMMU v2 these registers (sACR) are defined as
'implementation defined'. Downstream Qualcomm driver for SMMUv2 doesn't
touch them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 ++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 20cbb39cb670..9abc40c00f3e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -376,7 +376,15 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static const struct arm_smmu_impl qcom_smmu_impl = {
+static const struct arm_smmu_impl qcom_smmu_v2_impl = {
+	.init_context = qcom_smmu_init_context,
+	.cfg_probe = qcom_smmu_cfg_probe,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.write_s2cr = qcom_smmu_write_s2cr,
+	.tlb_sync = qcom_smmu_tlb_sync,
+};
+
+static const struct arm_smmu_impl qcom_smmu_500_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
@@ -394,7 +402,15 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 	.tlb_sync = qcom_smmu_tlb_sync,
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
+static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
+	.init_context = qcom_adreno_smmu_init_context,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+	.write_sctlr = qcom_adreno_smmu_write_sctlr,
+	.tlb_sync = qcom_smmu_tlb_sync,
+};
+
+static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = arm_mmu500_reset,
@@ -452,12 +468,17 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
  */
 static const struct qcom_smmu_match_data msm8996_smmu_data = {
 	.impl = NULL,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.adreno_impl = &qcom_adreno_smmu_v2_impl,
+};
+
+static const struct qcom_smmu_match_data qcom_smmu_v2_data = {
+	.impl = &qcom_smmu_v2_impl,
+	.adreno_impl = &qcom_adreno_smmu_v2_impl,
 };
 
 static const struct qcom_smmu_match_data qcom_smmu_data = {
-	.impl = &qcom_smmu_impl,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
 };
 
 static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
@@ -467,21 +488,21 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 };
 
 static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
-	.impl = &qcom_smmu_impl,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
-	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
-	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.35.1

