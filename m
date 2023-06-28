Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85A741665
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 18:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D422B10E377;
	Wed, 28 Jun 2023 16:29:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610D10E371
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so6464145e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969789; x=1690561789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k9KnMtZLR40pDXGElESmmZUvDm4CZ/ghYZ4Hvek4pbQ=;
 b=m1/0vpJU7e/vmira8hvb7shwcPdAr25+sj5szdqtuv4qnL85+sOOo/xfk7nVR4wSbF
 8cK9NOV8cxuLtUEDAnyiO+S4B0oPjEvOBGvy6r7HmD40YUyFOvf57zr/6ZZr5vKBFWo7
 SdTrH7sqljfa9vtyGc9Oa+zOD9UPUKOAhP4xIBk+e4GxAzZCPw3XRDsPt8JufSTJ8N+2
 ibbABJN6DcwG3X1McvSxXbbJknNaMyAuM4W+XL8TL2bP78Fe9B25xRScrpWCvGqr96V9
 zjpxFkw4nFFWuvUlf/p2tZkmFFApu2xqbsyQeLJZcrVoMs3ejMNDWRv9cO4BjxgNCm68
 LQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969789; x=1690561789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9KnMtZLR40pDXGElESmmZUvDm4CZ/ghYZ4Hvek4pbQ=;
 b=M8RZD1hp9BHNJY3LUV1TD9VccvSj9Lv5EOxRMrcZAeOKKBgxdTMFqE4omrqwroU3uE
 N+9xWWunHhOq5Wo7jDsiW5KUBzXISVgqZT0OMb1SEvdaNd4Nq9Vk3Ta+FhHT8KIGAxdF
 fVT9Wlzz9SE9iIGMKtk6sB6Qr+G2CDpNqYqdFA0j8wEAZ/uedccUZL8hte9QaUtxLqp6
 wD1L5cw373AksLGYjkrvdY0Q8yV4qOoXsVKW38jzBm+B7rs0wM3lf8rdgxSPBEkZ98Ax
 PT+tDrN97jRxME7pCeLZL/9bOZB0j8Kdv9fBNfqSDjGJnyu4G7qNbxnVfBGEgnOVTPws
 aQdQ==
X-Gm-Message-State: AC+VfDxSZqVnQW2j5guLNpe3VLnn6Ieda2GJCmKYfy/Aw/OF1yEP6bTV
 iCV4LSSYhqC5EGMSZr0+/oasPg==
X-Google-Smtp-Source: ACHHUZ5DA8AehWO58Dkwqvm39GPuJsu46ahFH3l4cIqAJIyjqBRvcGw8M9F4RnDDYxcvk8eLPANVTg==
X-Received: by 2002:ac2:4f07:0:b0:4f9:6528:fb15 with SMTP id
 k7-20020ac24f07000000b004f96528fb15mr14393398lfr.12.1687969788869; 
 Wed, 28 Jun 2023 09:29:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-1-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=2253;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=E6OpwKaLxLMqeufp2J5Sb8wXLqiG8TBOqY/1j2yTMwM=;
 b=Fl3PQ2gQQ2JC6dxfvdudrWKD2Y7+XzJSj9IfqR6O8URn9dgYJuKM7wqNx30GKtD2rIIg/tfEy
 qr+tcyV4xcrAYut9JAKjPW+iBve7g+7t66P2/sjfsFVzrZkhOqZAd+H
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 1/4] dt-bindings: regulator: Describe Qualcomm
 REFGEN regulator
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Modern Qualcomm SoCs have a REFGEN (reference voltage generator)
regulator, providing reference voltage to on-chip IP, like PHYs.
It's controlled through MMIO and we can toggle it or read its state back.

Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
new file mode 100644
index 000000000000..19d3eb9db98f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,sdm845-refgen-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. REFGEN Regulator
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+    The REFGEN (reference voltage renegator) regulator provides reference
+    voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sc7180-refgen-regulator
+              - qcom,sc8180x-refgen-regulator
+              - qcom,sm8150-refgen-regulator
+          - const: qcom,sdm845-refgen-regulator
+
+      - items:
+          - enum:
+              - qcom,sc7280-refgen-regulator
+              - qcom,sc8280xp-refgen-regulator
+              - qcom,sm6350-refgen-regulator
+              - qcom,sm6375-refgen-regulator
+              - qcom,sm8350-refgen-regulator
+          - const: qcom,sm8250-refgen-regulator
+
+      - enum:
+          - qcom,sdm845-refgen-regulator
+          - qcom,sm8250-refgen-regulator
+
+  reg: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    regulator@162f000 {
+      compatible = "qcom,sm8250-refgen-regulator";
+      reg = <0 0x0162f000 0 0x84>;
+    };
+...

-- 
2.41.0

