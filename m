Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58D628698
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823210E2FF;
	Mon, 14 Nov 2022 17:06:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1210E2F6
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id be13so20341169lfb.4
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8u8ckjitOk87OPv1Jwz8aOeKIkjevPLVEgZLx8LVKu0=;
 b=RKwF7+xKIOGSnKveI2PAInWKUnqEGSjLhQQFfCvQVMPJtbi24+cGu0b3OcSyBWppll
 azC4x8354D0ekmcZLlbmkrrPTGLZ6URFJGHgfgj6MZRRWKbm57ekKj/VRsrX+dLG6mtT
 5PdEX7ghguLGv4P9P6nctM16YxC1j3bEkYx6zSCnVoY1MApK84obwxNNeWUKGAkktnf/
 9EKacFihcXAH7XE6hu1+s5RMFbm4zIF5/lyodKZHmITBZ+RWQmbFTpfQxDiC8rXNq5pE
 aqiHMTlwOuWc4bWrCVEZB8e+kQGeIMo/dbg3fznpg/d2JzLVAhAytnSORJJP/Qa74Z8x
 NXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8u8ckjitOk87OPv1Jwz8aOeKIkjevPLVEgZLx8LVKu0=;
 b=KHKNeXF2+UMGrCl1/XkJYjjg1KCaGTSNOy8FwD2yZg6Z4u+FyAT4CbpKb4mNMhQ77U
 BHLV9UK4A7Ii4yjtfC8wNX64iAguzRelQ2JsASSS1yp49bTL05AfZcjtPmY4G8nF7ORy
 K7rwLrufT7KdpVDYsribJx7mFGTVsUGtitLIVa6aSaj/BnF2EVXhlPI3UMX/+PfdtdFx
 Pr3OHIWhawufGxwsNYSn7UbTDPqsVOUA3rP8lYTKF5RfCBwjabeOUouflWGR8VQL2CtO
 8mQEnEy+3eczRjLhAkwTfO/r7KWQ04QNzW9ExwZWSYxOJtaq7BJfYMQKP3cR+35V+3Np
 rT6A==
X-Gm-Message-State: ANoB5pnCNBhfLRHvCH05Tf0fwrk0fvvh+1VOrHLZjSbzX5LR4DLP4gPh
 u6aBgeMq5eS6VWChWKqFI2OXqQ==
X-Google-Smtp-Source: AA0mqf6iE8d2S2e+OPdybOymDTWtPOKfA6NgyrVu0mdAo+HMp22j6G/cBaBrN6dsAlqFPBVieiGcXQ==
X-Received: by 2002:a05:6512:79a:b0:4b0:efed:e3a7 with SMTP id
 x26-20020a056512079a00b004b0efede3a7mr4543580lfr.323.1668445604416; 
 Mon, 14 Nov 2022 09:06:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:35 +0300
Message-Id: <20221114170635.1406534-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 10/10] iommu/arm-smmu-qcom: Add generic qcom,
 smmu-500 match entry
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

Add generic qcom,smmu-500 compatibility string. Newer platforms should
use this generic entry rather than declaring per-SoC entries.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b93aaa0594d3..0830e614f3be 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -496,6 +496,10 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
+/*
+ * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
+ * special handling and can not be covered by the qcom,smmu-500 entry.
+ */
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
@@ -516,6 +520,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
-- 
2.35.1

