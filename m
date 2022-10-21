Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBF607CEE
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 18:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E98410E411;
	Fri, 21 Oct 2022 16:55:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9110E4EB
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 16:55:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id by36so4546799ljb.4
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1V79C6sUOMuHke6im7U/KGPAAIEinbvZsKwAJ+skWg=;
 b=SXHRzkKXofttZe/G3LEBQU+cp7BGyaEorRJK3v0SfgIv+2LYZSaavBcnVMmShBLCT+
 mR+qCsr6fAL24q4iwbXkRFBF/O09JVEBGe+ZOSk4Z6DURjJT5NKcBElAADFn7C6iLIxp
 yWtJjh4oEKGBor8y1iRp6v8x9LyKkqcJQ/lX8AclvpnYrmIojbVrcwV7+Itk/6fumpD3
 /p86ms1t81bFbpsWkuyiUiviQuqb6EXNzlabSYJ+u8z6tj+0WUd+4pBCB+iz5uv0r2l/
 RsG9adQ8vkmm8G9truhcbgCtwcsGWr0CUOZ/Nv4oxKncwKTyDLZX0mj6hxJi1+MlscpZ
 tR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1V79C6sUOMuHke6im7U/KGPAAIEinbvZsKwAJ+skWg=;
 b=MUafqtoZl2N0Ayl7obseP4NTuaFkwayQd0ZQr24wgzohX62IsVSxuVNcXOMFjMUdvZ
 GaGQui86P0LOfZzDT77h3bb0Gc7RVO8Ziw3cC7cFvAY+s0KW3ez48OXJ6sJvYuDOfm5+
 BFt03B8C/1T7E1V9fC8Q61dqm20scLendAy7v+c7cdh17+ro7hQkz0EORk4SH30HH1Yk
 WpA6EFdS/pm/doKBXD3jDv1Ay35ohYIAjHdk5uiNN8VVQgMq2zusfXgVkhz1dPj2ampQ
 2cplvQbHt2YOYyLBFCP0JIKyJfvO3a/YHm0bNmZfLwXuKqzOJksjbD8q+mYK6Ymhq1O4
 eeKQ==
X-Gm-Message-State: ACrzQf3FwD7LUHgkUoBVL9l0aPkHfyjqiY+Px/9YfQAA75zuXv2zHrpO
 CBs/y2Q1nCq1yMhso2CQBHXLAQ==
X-Google-Smtp-Source: AMsMyM4ZwzA/9qYXr0Ylgwy+8+4oJWjtym9xDnym9eNdTzpXpeSZrCYheWZaDSw2pFE6iCh7YY7u+Q==
X-Received: by 2002:a2e:a789:0:b0:26f:c3e0:4e4d with SMTP id
 c9-20020a2ea789000000b0026fc3e04e4dmr7085266ljf.499.1666371336036; 
 Fri, 21 Oct 2022 09:55:36 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Oct 2022 19:55:26 +0300
Message-Id: <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing
 Qualcomm SMMU compatibles
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

Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
platforms and for the Qualcomm v2 SMMU used on SDM630 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 9066e6df1ba1..34ee33a62ba5 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sdm630-smmu-v2
           - const: qcom,smmu-v2
 
       - description: Qcom SoCs implementing "arm,mmu-500"
@@ -48,10 +49,20 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
           - const: arm,mmu-500
+
+      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
+        items:
+          - enum:
+              - qcom,sc7280-smmu-500
+              - qcom,sm8250-smmu-500
+          - const: qcom,adreno-smmu
+          - const: arm,mmu-500
       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
         items:
           - enum:
+              - qcom,msm8996-smmu-v2
               - qcom,sc7180-smmu-v2
+              - qcom,sdm630-smmu-v2
               - qcom,sdm845-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
-- 
2.35.1

