Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0C628697
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50D210E2FE;
	Mon, 14 Nov 2022 17:06:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4610E2F6
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k19so14068548lji.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUpOXZplYygOFJYQ/Eovt7Mfl+x2PVcVjO1mYmiWcnw=;
 b=hR4olOQCeOJ3leKrvuAX8Za3AY0LVQDDpbj7rSxQSmSbYsIa3m4frYC0gamfKtigCr
 t7Z9bf2Yh4GWsXeU4BwOLgfCkyt/8woJHmkkO9f9L2A3unhIPnb5ouKtCfPs+d0PFH9x
 tEriGhHJd4t2JaAiv4TpD2RFjB6gWkMoV6Ue273LuOifG9LanUFTlE/NXjmJpXS80Qt2
 aY8qtjKms5N9y1PTEYI7dhKee7afQ8daJq+OQPGVc4EZXD0kFVu9/Pj6Ut5PNmVoaqHZ
 S6I2chJeM9YC0Cj2mWj1hzhiqifdoibX6pWvuHMJmjgM5DYrCa6bWLHPMSMEx/XMF1lv
 uf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EUpOXZplYygOFJYQ/Eovt7Mfl+x2PVcVjO1mYmiWcnw=;
 b=QIyRmAL7WGk8aDfGBjHqn0KWafm/Fqnf+LnOxDmv62g3/Cjvtz48ZybXvXJyfzao5F
 4irf2Fw5A9PNNWBZMA+uvLV6D5w2ykMGJr73IcDptEPOeZMga+QutsZAzhzGj9hogi5s
 2FHVrT5tFK11oHw431LEqI0H33BsUyOKzr7+nJiWuReGlncrzzm2xVUjmTp9+YK6EYXM
 ocT6t8lXP7wFJlpmnSgfslom9lBXoWfI4mEzqaTwrWUmJtk/jVCSSF3S9B6r5eWnt5w2
 aUX5sjJZgy+K027rh2gYK+Xg5gYp0eOoUXFqli7AiayzGQmFWjnEq0XxiHjY/kL0ihlP
 yvGA==
X-Gm-Message-State: ANoB5pnt2QPZfvqzXKR+XjG34MghMNntWhbMQtmp+qb0QWrGYeeDzbxh
 y/spLrNkOgWyudMcIvPnadieOg==
X-Google-Smtp-Source: AA0mqf7FYagvYU1fN9spwrg5NIANTgK9iGRQ8UaQGkw87Xfpaz3rc+dF88YYRTV43mjySDrt0EphWQ==
X-Received: by 2002:a05:651c:553:b0:26d:e6c4:1df7 with SMTP id
 q19-20020a05651c055300b0026de6c41df7mr4841683ljp.89.1668445600688; 
 Mon, 14 Nov 2022 09:06:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:30 +0300
Message-Id: <20221114170635.1406534-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 05/10] iommu/arm-smmu-qcom: Move
 implementation data into match data
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

In preparation to rework of the implementation and configuration
details, make qcom_smmu_create() accept new qcom_smmu_match_data
structure pointer. Make implementation a field in this struct.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 62 ++++++++++++++--------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 ++
 2 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 0f4eaf217983..a7bd49e44bca 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -405,10 +405,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
-		const struct arm_smmu_impl *impl)
+		const struct qcom_smmu_match_data *data)
 {
+	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
+	if (!data)
+		return ERR_PTR(-EINVAL);
+
+	impl = data->impl;
+	if (!impl)
+		return smmu;
+
 	/* Check to make sure qcom_scm has finished probing */
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -423,24 +431,32 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	return &qsmmu->smmu;
 }
 
+static const struct qcom_smmu_match_data qcom_smmu_data = {
+	.impl = &qcom_smmu_impl,
+};
+
+static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
+	.impl = &qcom_adreno_smmu_impl,
+};
+
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
-	{ .compatible = "qcom,msm8998-smmu-v2" },
-	{ .compatible = "qcom,qcm2290-smmu-500" },
-	{ .compatible = "qcom,qdu1000-smmu-500" },
-	{ .compatible = "qcom,sc7180-smmu-500" },
-	{ .compatible = "qcom,sc7280-smmu-500" },
-	{ .compatible = "qcom,sc8180x-smmu-500" },
-	{ .compatible = "qcom,sc8280xp-smmu-500" },
-	{ .compatible = "qcom,sdm630-smmu-v2" },
-	{ .compatible = "qcom,sdm845-smmu-500" },
-	{ .compatible = "qcom,sm6115-smmu-500" },
-	{ .compatible = "qcom,sm6125-smmu-500" },
-	{ .compatible = "qcom,sm6350-smmu-500" },
-	{ .compatible = "qcom,sm6375-smmu-500" },
-	{ .compatible = "qcom,sm8150-smmu-500" },
-	{ .compatible = "qcom,sm8250-smmu-500" },
-	{ .compatible = "qcom,sm8350-smmu-500" },
-	{ .compatible = "qcom,sm8450-smmu-500" },
+	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_data  },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
 	{ }
 };
 
@@ -455,12 +471,13 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
+	const struct of_device_id *match;
 
 #ifdef CONFIG_ACPI
 	if (np == NULL) {
 		/* Match platform for ACPI boot */
 		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
-			return qcom_smmu_create(smmu, &qcom_smmu_impl);
+			return qcom_smmu_create(smmu, &qcom_smmu_data);
 	}
 #endif
 
@@ -471,10 +488,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	 * features if the order is changed.
 	 */
 	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
-		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
+		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
 
-	if (of_match_node(qcom_smmu_impl_of_match, np))
-		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+	match = of_match_node(qcom_smmu_impl_of_match, np);
+	if (match)
+		return qcom_smmu_create(smmu, match->data);
 
 	return smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 99ec8f8629a0..2424f10b7110 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -14,6 +14,10 @@ struct qcom_smmu {
 	u32 stall_enabled;
 };
 
+struct qcom_smmu_match_data {
+	const struct arm_smmu_impl *impl;
+};
+
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
 void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
 const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);
-- 
2.35.1

