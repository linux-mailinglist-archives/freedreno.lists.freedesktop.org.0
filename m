Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62133616CDB
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2552A10E563;
	Wed,  2 Nov 2022 18:44:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6510E562
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t10so2552524ljj.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yehdn7gwZYYtQmdw5gvSKZrzS358tipn1+pOWTvWz3g=;
 b=eo2JUGq/uE90Rl3eR+ppoQE1tYMLFhWmT7FezYI2xZxsvK9YV5L8KsNZ+OcdAb9uqb
 dhOdxa4Uwh2/uHNzv/3h5jaP11y6Vlr/IYJp2eneceuPf1j5QvsXs9ieHGbxCYex+10j
 Nv60FWrCjAlHANqhtP8iufqAF8/syzAvv1nsipbh+V4BLZXqQvVHcPXHof2u8GISnnq8
 vYjAZkHsdXkJFMdV+3qkrCBgT5MmSFktXfz0okp7bcQuypavNgz3sRQN/DDT+2tHDmYJ
 NpsbYYqjdpZBFdrac5efF2DNkuEXpcss/YIde/jgl+JviWn6vZ/YUSLTPPs1B4G+bq8m
 0YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yehdn7gwZYYtQmdw5gvSKZrzS358tipn1+pOWTvWz3g=;
 b=tLpet2Jin57MVU+ekyEh/5z6vcDTqFGCuGy8ykjDaxH7eIMuEdJMLq6NIOexGHpLTb
 a+fpUWsNt3zIH0IZqre9yO6yk0lqo7lZkYx/O+xOa78NZr0MWUsZlkeucbnwN5pcgOEM
 cni4Sf319147wpA+Pv+iJUlMo8AutBpcpR4Q9AHT9x2925vlA/ZXPjFhOiahUOw03YdY
 42ZpxzdAAv28kwjRXSurXvfFaLLK3769VCdxIQMaCFKtq7Ty739vEi/ZH9KT71imb/0R
 aD9qpAozDVLLgaqoga0F1QIdJfzdJuBAN/MCDD9JcWx/N+lkcM7dZfroNyZbSaBaPa6O
 ynzQ==
X-Gm-Message-State: ACrzQf1zSY7QBLnBQ9Z8djRkYM8NiEYpRrwFARHFMsAdE1rArG6Nhts/
 mq6KsDeO3lnRmgOehd42rXVSkA==
X-Google-Smtp-Source: AMsMyM7mizVF0KTOys/pbmBZMouRiYVx/gmHUF6UI8HRmU7ngsANk4dEuPMrUp5gdpO6trffqfQdmg==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id
 m7-20020a2ea887000000b0026a871ba16dmr10577873ljq.482.1667414670299; 
 Wed, 02 Nov 2022 11:44:30 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:20 +0300
Message-Id: <20221102184420.534094-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 11/11] iommu/arm-smmu-qcom: Add generic
 qcom, smmu-500 match entry
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

