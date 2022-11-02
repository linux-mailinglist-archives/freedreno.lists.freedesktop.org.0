Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A2616CD7
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9120D10E569;
	Wed,  2 Nov 2022 18:44:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2810E560
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b2so29674993lfp.6
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9r2jAN2ifM7pblPIEyP95isDltMBDbHzODH4f5j+ec=;
 b=GkLtVQFrTmCoWJAdWKLUzRF0bkN0rJSMIkzNY/RbLd3/jsknE1BT12p03gt5WipbTl
 P7pXWDwyiNYT9sb9mm5k430Z0UrLLTASEhhOfUmwr5c+CPB+wYCgBd1z/icDwKN386yK
 reLfjyCBHptPoAP7vSkvAPlp9qE2Ngqzma1KeEHxRuwmL/zX6yfcU8q9GbEI/AqUfyug
 1SCfY+ykv999+29pA64kLXlAVLGjMCqEitnJ75oppXpOhmV61r+c8eEb5A5DJPd4Bkyj
 RYmMOmIf5Ssqto3A4akbaYyLmLjv8ATJJpjmUEAPBafJO55IB1PEIaqUIDOewTqNSvJx
 hWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9r2jAN2ifM7pblPIEyP95isDltMBDbHzODH4f5j+ec=;
 b=dgg8jRthwzhOCyEOD9/FenrT58giOHYPHJx9ewc5CfeTGEQ05PBN2vmZi7QxnTerRH
 zBlpGaTFxyVf62MZch4ByTrfYggIjY1P4sBUPsu8cc1T5EvOBuumS5KNkDP6OUf2ulrL
 AAyDq6rOLFUe4TOli4rrXz+b4JH25NxTomdIIF/xxpcmpYZPlamO6jZ94vozmrt6BKVf
 S4GTdjFGGZiXIJGkk30XG2KknifEgABDcwjeVwSvITJpllntlbPp1EUflHNL4u1DRiPH
 aPFt63Dq23lu2/W0cFHB9Lt0L2L2c0E4k9Gt9+i2UV9GaUI6NddlQ7fbZ+A5PyOK5lUg
 b5HA==
X-Gm-Message-State: ACrzQf0MdDQ0HbZgAnY6cff5kIZyfrj8BVUvTL/ei5Vnmby++jtgmLpm
 r+yRQV8iT6UtphveXwmcfEn0qQ==
X-Google-Smtp-Source: AMsMyM7cRAF+kWHvjLNKh5hA16h9oGLKiTSz4U9zXLRvrHTsSM081VyNEeJEIBJv5/JjmxmjG7nT3g==
X-Received: by 2002:a05:6512:308d:b0:4a2:5958:3443 with SMTP id
 z13-20020a056512308d00b004a259583443mr9865150lfd.208.1667414665475; 
 Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:14 +0300
Message-Id: <20221102184420.534094-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 05/11] dt-bindings: arm-smmu: Add generic
 qcom, smmu-500 bindings
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add generic bindings for the Qualcomm variant of the ARM MMU-500. It is
expected that all future platforms will use the generic qcom,smmu-500
compat string in addition to SoC-specific and the generic arm,mmu-500
ones. Older bindings are now described as deprecated.

Note: I have split the sdx55 and sdx65 from the legacy bindings. They
are not supported by the qcom SMMU implementation. I can suppose that
they are using the generic implementation rather than the
Qualcomm-speicific one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f44572cbb071..3d4cc8996195 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -31,7 +31,7 @@ properties:
               - qcom,sdm630-smmu-v2
           - const: qcom,smmu-v2
 
-      - description: Qcom SoCs implementing "arm,mmu-500"
+      - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
               - qcom,qcm2290-smmu-500
@@ -40,8 +40,34 @@ properties:
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sm6350-smmu-500
+              - qcom,sm6375-smmu-500
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
+              - qcom,sm8450-smmu-500
+          - const: qcom,smmu-500
+          - const: arm,mmu-500
+
+      - description: Qcom SoCs implementing "arm,mmu-500" (non-qcom implementation)
+        deprecated: true
+        items:
+          - enum:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
+          - const: arm,mmu-500
+
+      - description: Qcom SoCs implementing "arm,mmu-500" (legacy binding)
+        deprecated: true
+        items:
+          # Do not add additional SoC to this list. Instead use two previous lists.
+          - enum:
+              - qcom,qcm2290-smmu-500
+              - qcom,sc7180-smmu-500
+              - qcom,sc7280-smmu-500
+              - qcom,sc8180x-smmu-500
+              - qcom,sc8280xp-smmu-500
+              - qcom,sdm845-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
               - qcom,sm8150-smmu-500
-- 
2.35.1

