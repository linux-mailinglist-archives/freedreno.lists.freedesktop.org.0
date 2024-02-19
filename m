Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A385A4BE
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 14:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7D810E364;
	Mon, 19 Feb 2024 13:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J/r9hzB7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E210E313
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 13:36:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so5938492a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708349764; x=1708954564; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vm4+HsWSLi5Bqiq8guveLonPTq6IX1sdSS8MIp6iya8=;
 b=J/r9hzB7MxMI+Am8GdZ85xwn5PoN7AyUQ8SN63tftVaOa0MYKwp63BF4KlITKszABs
 pZHvfh12vEkk/CjM0rvPT9RoGmIk5thzlfC+dKIJHvA4pcAnxs6U4UxDuXI0V7I/dM6l
 w1LpbVj7Fj6qeT8OCTQKWEegzGdUqHA2Dc8+3zy7XeQ0ZnZi1ikJXMlmPOsWaG+spiBG
 0snCTyLGRTVx4wgehYPK8VFPxOlXFuCTcS0UHgwz0+PFhLwbnwPNvnqG3AjJUHOTsdqh
 9vICSLejyWGxgJ/bZovr2zJ8dAgcneJ8YBCKtDe2P/ynhsMuf/GbSDZYIIr0tq9A6zJA
 jq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349764; x=1708954564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vm4+HsWSLi5Bqiq8guveLonPTq6IX1sdSS8MIp6iya8=;
 b=RXZWwGBl4ns8TF3WVRv5U8BBC+2LN7Z3UnT31p11HLppqSYtSNutS9XiJ38LveeEl9
 XCFte/c4BpvvM/fenC9S5xgbr9kzNCgc9lC6w+QDbHu2YQD9r4XFtLf9eNHm2kbdUT5M
 aKc8qcVAKP0fpE0i9/n5U4Em5T5hjBFc1ab3iABROtUgi8kdDZ3IS6JeBVicqlKP7ndn
 AEIhWnc8XvpHumnxGA6g8GynO1Pa9GKxh0x8C7uKjHE7aX8ftqr6bUKYoPiLwbYZPqLT
 hUZ1OkJ0aano5Gk2ZZcpLTKJQIffrQQ9nUsbLp+pBW3ewJCL1hwsiWX3SPh7RHQWBhdX
 vnoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQmhKJajaMFg+baQNfFo+OOUlhxgiSv4SRd/1UX/jNe1pBTd/YjcF48nCgPbQF74MubOZj8zot14K5k6ll2GCuMzLoIebE2z6s96hbiCw
X-Gm-Message-State: AOJu0YzzJAycgMnSRM2tvX0ehSSIoWn3fs/w/3OBW33laF74R0FSzY7t
 yOp6I2jJUY8DheEP1l8GaPPFOYBmPd7HIb7te6xsJNykUlNpxKtdpdw01DgyE13sP2Nax11/GyU
 2
X-Google-Smtp-Source: AGHT+IHV7bK4ehHh9S5n4E8JdbICBeyKCog4TBxeQJc7jVSQ6sgYL2AGYMpXguUVOZv4iBTFSYicGw==
X-Received: by 2002:aa7:d959:0:b0:564:3191:f407 with SMTP id
 l25-20020aa7d959000000b005643191f407mr4013903eds.12.1708349764412; 
 Mon, 19 Feb 2024 05:36:04 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:36:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:46 +0100
Subject: [PATCH 1/8] dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-1-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=1444;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iLSWFU0PEB/wfyF1Nv5EVeYr19/e5DAihIhWgNDJAow=;
 b=71RQnNARetoCSKqpzfQqO6Lapq/qBgUH5HXLBQdA6ZcDXcoSaL+2ynFTnCmi9jFSY8Q7b8KzZ
 O5iL+UfQEyvAPDXeCzVYV8yaVrWJofN/Mv+M8WmxZgIBOjFSCjpHxRD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The GPU SMMU on QCM2290 nicely fits into the description we already have
for SM61[12]5. Add it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a4042ae24770..4a8d4022aebc 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -83,6 +83,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,qcm2290-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -462,6 +463,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,qcm2290-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
             - const: qcom,adreno-smmu
@@ -534,7 +536,6 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
-              - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc8180x-smmu-500

-- 
2.43.2

