Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B886628699
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CBD10E300;
	Mon, 14 Nov 2022 17:06:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574DE10E2F7
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:43 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d20so14024996ljc.12
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkB+OW5gQvtUckPAf5pe2SDM/ZhPU3JSoshAUjdn34I=;
 b=IswsjxOOufQ5uUM9UBgvbMBKS2mh+Gck2LPC8FnHyHO75f88zVraxNOjVjto0RqwgB
 WnQJu+MSOf4AJ4M/BV7OmYrpcrrztjZICUsYkr6okBp/cy+pGLq9qNXW4qTOoR1YpBvE
 f+nvJGc4h+/uKY5K7dEZdWdU0dlgcQlUjB1Bn6pfmFcq6hu9o3wyv0fIEH9raEnmS3pN
 9QmOXX/+LqAgat32X4NJXRR0qrIC24PlIaVxL3QuKWgkqzP05wz3AvGyCPHVCqBcNXp/
 Vu7negQeiBry0huOqWZ7Xp7akK+M3cWigUoYFwxHLF7d/h+e5uLXOjd+gAQA0rf7Hcvv
 A4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkB+OW5gQvtUckPAf5pe2SDM/ZhPU3JSoshAUjdn34I=;
 b=7XjvjOtR/zhCk1tKcGZxtRjSpR0R/Fc0K7OqWujAEXKDlFu0Jcp/hkHEvSYyVbDYSf
 6+QKjA9kB0cncu4buKGSrNUlUunrGetD0Kb8SKqbaJZPAasEp6yGK48uS83TnJwfP4r+
 6yXqgoi0p/X7g+m9sGzpntF87NisurUYnB9yeqVAiuw55OKLBEsF/U7OX4wc3PEFedwC
 mpKaZ0e/KdA4qOaVF4qzGiR8ZC2ZxBHDzUTAQwhs0kVcVhdZ/TULZZSm126CIxerSAj+
 BHxa4nsSNJTJSBYAS4XywmGtd4Nfv6qLZLgwi/FxxNQQ+1X+jbaWT1izyQ7nzLozcFaQ
 PH4Q==
X-Gm-Message-State: ANoB5pnV61CI3kY6PuskDdFzW5z3I+ENvPNAmLUSf354TiTvH7ShOice
 vLgn+J9EYH+IV1def1h0oGtFDA==
X-Google-Smtp-Source: AA0mqf7ZTOQ5iikcPt8w4dfnD40+yWQCIUPvKjgNeWYyiNQp4/584Xx0+qw44l0FbdnT1lgWqI3GcQ==
X-Received: by 2002:a05:651c:388:b0:277:75fb:1fc5 with SMTP id
 e8-20020a05651c038800b0027775fb1fc5mr4501286ljp.405.1668445601440; 
 Mon, 14 Nov 2022 09:06:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:31 +0300
Message-Id: <20221114170635.1406534-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 06/10] iommu/arm-smmu-qcom: Move the qcom,
 adreno-smmu check into qcom_smmu_create
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

Move special handling of qcom,adreno-smmu into qcom_smmu_create()
function. This allows us to further customize the Adreno SMMU
implementation.

Note, this also adds two entries to the qcom_smmu_impl_of_match table.
They were used with the qcom,adreno-smmu compat and were handled by the
removed clause.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 32 ++++++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a7bd49e44bca..e61194127772 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -407,13 +407,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		const struct qcom_smmu_match_data *data)
 {
+	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
 
-	impl = data->impl;
+	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
+		impl = data->adreno_impl;
+	else
+		impl = data->impl;
+
 	if (!impl)
 		return smmu;
 
@@ -431,15 +436,22 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	return &qsmmu->smmu;
 }
 
-static const struct qcom_smmu_match_data qcom_smmu_data = {
-	.impl = &qcom_smmu_impl,
+/*
+ * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
+ * there are not enough context banks.
+ */
+static const struct qcom_smmu_match_data msm8996_smmu_data = {
+	.impl = NULL,
+	.adreno_impl = &qcom_adreno_smmu_impl,
 };
 
-static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
-	.impl = &qcom_adreno_smmu_impl,
+static const struct qcom_smmu_match_data qcom_smmu_data = {
+	.impl = &qcom_smmu_impl,
+	.adreno_impl = &qcom_adreno_smmu_impl,
 };
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_data  },
@@ -448,6 +460,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
@@ -481,15 +494,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	}
 #endif
 
-	/*
-	 * Do not change this order of implementation, i.e., first adreno
-	 * smmu impl and then apss smmu since we can have both implementing
-	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
-	 * features if the order is changed.
-	 */
-	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
-		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
-
 	match = of_match_node(qcom_smmu_impl_of_match, np);
 	if (match)
 		return qcom_smmu_create(smmu, match->data);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 2424f10b7110..424d8d342ce0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -16,6 +16,7 @@ struct qcom_smmu {
 
 struct qcom_smmu_match_data {
 	const struct arm_smmu_impl *impl;
+	const struct arm_smmu_impl *adreno_impl;
 };
 
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-- 
2.35.1

