Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C3616CD5
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD9410E568;
	Wed,  2 Nov 2022 18:44:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021A110E561
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be13so29695820lfb.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIotqkGNrlm6BB439NI+TopuA4OgMDspXMtZ7vfZlt0=;
 b=Wr8lAKJzRdGCyEiZLDpwpe9Xr+Q4v/mPvxKBJrYDpq3GE2zWVrRydL38FrkL2JQxRY
 gi4THW7Tx+nivFxczIb/9wR2BXk55y/v/rR+NU5z9G8E2QNm5AN7sZeCoJfwisQOl8Ls
 RA9N/uhApYgIKKvkrXqY388UIlurixn4ceCG5e8GO8ar3TLmePgV418c74o7CLo9FMg+
 BvIJua9jxNBYf0kyO+Yo6Yxg8WtR1Ka3+iDPHnXBYgpARBl8sHIETk/nhyU0/16u21na
 R0ufyRQB+/YRdLzm6gfu8TkImjuPxnkw/9V9pRf8kkiKvUhV3gI12hALeN1VafbSLkc9
 KoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIotqkGNrlm6BB439NI+TopuA4OgMDspXMtZ7vfZlt0=;
 b=SLKFfmjJQntC8uK06rFfy5Wz5kVrJ2ye4H60wLn7LSt8UGY1P9qogoxmhsrLxcB97+
 ZQOZHFpUHLn6akSEpE0Xeb0W1sQgUHdWCQzZYyBshT+45bZYG78Xu/yDvBcstCz4g9gJ
 UD/M4/7IG8iuN720ZD5JlAek8Nc7QSKpMlmbmmcevt98JSmdRJSLpeJ12HUv2BaNPjDE
 PhuQR63AjhRsexDBex5c1uubL9htBa8d0RS1bLSyOXFqCJS3HWxa0VpQqZv0X2oo43Ym
 HpnL6q0O4EPLFSh6RtYCXN+8G9T+Qza2v6M5/ihvmKlVyVplUpZyLDUkMiPtHZBEldib
 JEpw==
X-Gm-Message-State: ACrzQf1yK/oXZ2EFkPjx1fMz5pOGxpMF99RLIGfvqWegKvVrzn/pDwYi
 sczZZyQO2Gg4rLYbqnuLFbstmA==
X-Google-Smtp-Source: AMsMyM6K1J9+epLh5PQfayFvLbEHOs3ojtIt9m7hHopCSc9CdH6kkKxWFyriu27rZzKnsgL4I/WaEA==
X-Received: by 2002:ac2:59dc:0:b0:4b1:7729:3919 with SMTP id
 x28-20020ac259dc000000b004b177293919mr683218lfn.121.1667414666453; 
 Wed, 02 Nov 2022 11:44:26 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:15 +0300
Message-Id: <20221102184420.534094-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 06/11] iommu/arm-smmu-qcom: Move
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
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 ++++++++++++++--------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 ++
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b2708de25ea3..bd228b7d6817 100644
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
@@ -423,22 +431,30 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
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
-	{ .compatible = "qcom,sc7180-smmu-500" },
-	{ .compatible = "qcom,sc7280-smmu-500" },
-	{ .compatible = "qcom,sc8180x-smmu-500" },
-	{ .compatible = "qcom,sc8280xp-smmu-500" },
-	{ .compatible = "qcom,sdm630-smmu-v2" },
-	{ .compatible = "qcom,sdm845-smmu-500" },
-	{ .compatible = "qcom,sm6125-smmu-500" },
-	{ .compatible = "qcom,sm6350-smmu-500" },
-	{ .compatible = "qcom,sm6375-smmu-500" },
-	{ .compatible = "qcom,sm8150-smmu-500" },
-	{ .compatible = "qcom,sm8250-smmu-500" },
-	{ .compatible = "qcom,sm8350-smmu-500" },
-	{ .compatible = "qcom,sm8450-smmu-500" },
+	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
 	{ }
 };
 
@@ -453,12 +469,13 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
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
 
@@ -469,10 +486,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
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

