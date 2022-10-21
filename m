Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1275607CF7
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 18:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757810E57B;
	Fri, 21 Oct 2022 16:56:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC58410E554
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 16:55:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r22so4492029ljn.10
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT9p+O8jS1617W9ayV/G2VKwq2HucMY9DBAQPNerHK4=;
 b=rJ0DwSGCkEIE25pd95phrfcMNfbybXvcvh4bDPLhBClsVFB1kJpdbY9ZXdeqI79FaF
 Mji8bX6GF893adMySxKCv20TEpdIH+G1UbtWU48em/BNNZ/GZAZoT5QG72X6+zIDo8lY
 sdc4jWx06elCJfG/o6UMB4Dyk+1+5i2QTvWx4L4j58QEDHZU3ExKddPnXhoJigwHkSpK
 wPSVgBpj8Dp2pZutXokdwh7d5VCOoiSWCOjIZmUR4pnfKTkI0JOACnpeuF/frwI1vveG
 Po6ZGlFKoSKU7CMLJgqZTMjUawtVPzcgMD4lBOr5G9gWBpZUjrVZqNQWwlRaxlWyVssW
 PRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZT9p+O8jS1617W9ayV/G2VKwq2HucMY9DBAQPNerHK4=;
 b=P/NAT8zNx0prtY1vK0vyEMmrid1upm2kjnBx+2S6mdVIGIQNijlY6VbF/2ZQUNPjFH
 caYrz3OXOfZyrRkdaPhzlxRduBIaKmy/OW9NmuqQcLLfbX+Vs2tv/ljXAR3CSK/Td7Xh
 u4toaKuEk2sdARsEohygxpd9bnpOaiqooRSQLOpJQ5B8aGPUPe16igIOMPmPVvtqTgAo
 uTC2wCRRgbXMZIvYePqOfkzIyyP8TWXbcS9mf/t6T4ge3yVs+vq23aI73+ethjICP6oh
 4agylFcnADrQbUDhgjE/iKmpkQWu8AtCMckxXX5Xuu+YolQOuu1f9zMpvEAaYpt4DwJa
 +bHA==
X-Gm-Message-State: ACrzQf2BUwxKzedpqO0SmJykPq8w9PGNUlEvVbCCdFEOedbnO5GtKYoG
 0YLWT9Px0f4KZby9VJWHhpyWdw==
X-Google-Smtp-Source: AMsMyM5DmLJ5rXTRgNdC7K58SnCb2aZlbYqY0kpaUJgU2Dzp2Oflwl8kkPrI4UQ6QWTOn0THOh0ktg==
X-Received: by 2002:a2e:549:0:b0:26d:ff5f:53c1 with SMTP id
 70-20020a2e0549000000b0026dff5f53c1mr7415424ljf.450.1666371349092; 
 Fri, 21 Oct 2022 09:55:49 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Oct 2022 19:55:34 +0300
Message-Id: <20221021165534.2334329-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 9/9] iommu/arm-smmu-qcom: Add generic qcom,
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 9abc40c00f3e..3be81338a25b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -493,6 +493,10 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
+/*
+ * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
+ * special handling and can not be covered by the qcom,smmu-500 entry.
+ */
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
@@ -511,6 +515,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
-- 
2.35.1

