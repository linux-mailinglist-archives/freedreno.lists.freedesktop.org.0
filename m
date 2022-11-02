Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B7616CD2
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA15A10E564;
	Wed,  2 Nov 2022 18:44:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ECC10E560
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h12so19467105ljg.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNK2wPK1fBXzQbq904VPM/ONG2+wLYMEqkAMyzLrb8A=;
 b=KE32gHX+t1m490OwcBj+IkhZR8UOU08WEyAZi+sKyor5it0XstYkmXHnVDrhAoT5Uy
 TkvdwmH4D+up3wFvlx5XjEqdg7lGPpKiIendw0DP5CESgouWvczajXJYDbbqVBEhzY4K
 Qv9e3bwD03OY7ICzdnIzaEF8MKPXMWkYdnVA5prwA2v78Yz2Kwl2jO28JYDk9EAQtyA0
 rSf2CcTyxnhtpfuGuVudDASovJbqojnscV4p08OdZZelTbpYFLCZzThr/vdwsZBDtdGR
 NpXwGc0QDLD/4PpVPfLuwCZJPHfYAIQSTWgp9nR5mTZoeRTe+p0xPMHP+rlDDkyvMjC8
 spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNK2wPK1fBXzQbq904VPM/ONG2+wLYMEqkAMyzLrb8A=;
 b=1hbZVEn5EVJhqGbK6gYH5Sg9rcV/AAVp8DtxpRmDNO5TRwina1yD8KsLPPW3bqRTjK
 OcTPPf9uxa0PgRgzNEswa8S7eIabZbOFnAFlCP8GQn5P4fGQ0lRergBfYBrS9P0v57pp
 gEL8JLTw6rloCTNquVvqpsMN6pQkQb1pPtImV0zuRiey7AHNhRvBZ4BzBK4hxjrHKOvg
 x4u/qn3xZ6NgeX+e7QjqhR8QibB7AnfAb3ijv7I6MsNdrPaZhv+i4X2eDDJiI1Pi+2dR
 FawzGtJ8XxTfx4sJFXPxzkxcqX/UkrTrpZHavcv2ni9WCP27pdGY/hrXO4uiKS+geRoY
 V8hA==
X-Gm-Message-State: ACrzQf1Jfv1xZbfyf6Hb2v/hzZE7/nkiuYM0KRnX2I/xnehlzZlBbsrJ
 vbfpHTefDi1V9tBY45lbBGRb+Q==
X-Google-Smtp-Source: AMsMyM7KfCrG5aH4B0J1QoogQr2JYMpYNPRytIihbQ+rgBpmAm8Qs6bm6jnsdHrAN3rJpYFmyKYhQg==
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id
 m7-20020a2ea887000000b0025e3174fb67mr9624008ljq.337.1667414663267; 
 Wed, 02 Nov 2022 11:44:23 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:11 +0300
Message-Id: <20221102184420.534094-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 02/11] dt-bindings: arm-smmu: Add missing
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
platforms and for the Qualcomm v2 SMMU used on SDM630 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

