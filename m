Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D153616CDA
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3210E56E;
	Wed,  2 Nov 2022 18:44:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB07D10E560
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b3so4536701lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9IFAoIiE6zk/68PG4L50nqjshUlH8V6wR65bpY1Vak=;
 b=yn/vfHE6LozuJmD95+HrWoH82ZlB0zLDoaY4bc4O2qtmL9V2/xY8NRF3Jeb9iDtN0v
 bVVa7tfENlg6q3FEb49B86k9ykRduXKY+gtj9DbpoHY8SzqUTxFfAom5RqUMSQqNxMFx
 mxd6dfEwVYEYq4yYNh61eFuHvx8zUEpV+OlWp/9zoWYwe/ONtca9c0vwGT+H+SzJs5ak
 yR4BekvoCsZNPeszYxengsxi3k0sZyExV+gL0NiMo/u1FisyfAceJa3CYObOX03KsC8f
 Q6xl7sOdMLWj8I5+qs+q14IQP8kFJWI5YniMTrT9OkAlzEBsYUE5xdX45UmFVXrzofEu
 tGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9IFAoIiE6zk/68PG4L50nqjshUlH8V6wR65bpY1Vak=;
 b=lK5U7ElBIJpgwnpmZdVP64rFmLQZt9eYpLOTz45Oi4DEfFB10CpxV6P+NZM3bd1LT6
 GqHUO+FxLO4XuWnY7z7fmAAGWbVhPthHFu8stmeCxBudZ1TZP9ZgMOvyF47bg37iZrRQ
 WDyS/f/l57oa6Yb0wbcdtOExFVffn1EV4rJWMo+xSYrydyXrmLkx28xm+e+xYojufGto
 Jn1wnLV36qsZ03BibCy2mm9lvUjg6bxMWcSqV1rf8YmzpUurlYB7M3JYwwPji/J8ROZx
 h4oH2Z/4evZiy7GKjx+iYwbaejhtIpKhOlDAeOWC5rgKV4r+cEdrSEN0kmDOyNurnLHs
 Xk+Q==
X-Gm-Message-State: ACrzQf2/yhIjnG0DWm3XrO+PnWFr/Q4JExargRvMHLQDncEpD9Wheviu
 jLKMbK9+46w0hoFC2YFVXqXXxRTAuImdJ28ANvA=
X-Google-Smtp-Source: AMsMyM4yJnkpdkDouKkNsFT3wdHhrbQSpdR2Dk71mqLLaRPuqYXDy19etdJWvMoHbhsWFCKlUNnNaA==
X-Received: by 2002:a05:6512:ac8:b0:4a2:61e7:7963 with SMTP id
 n8-20020a0565120ac800b004a261e77963mr9685893lfu.363.1667414664824; 
 Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:13 +0300
Message-Id: <20221102184420.534094-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 04/11] dt-bindings: arm-smmu: add special
 case for Google Cheza platform
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

Cheza fw does not properly program the GPU aperture to allow the
GPU to update the SMMU pagetables for context switches. The board file
works around this by dropping the "qcom,adreno-smmu" compat string.
Add this usecase to arm,smmu.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index abcb1ee4b58f..f44572cbb071 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -66,6 +66,10 @@ properties:
               - qcom,sdm845-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
+      - description: Qcom Adreno GPUs on Google Cheza platform
+        items:
+          - const: qcom,sdm845-smmu-v2
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.35.1

