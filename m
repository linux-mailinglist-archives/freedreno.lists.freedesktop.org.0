Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0A7461E8
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 20:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E2B10E12E;
	Mon,  3 Jul 2023 18:16:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62710E12E
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 18:16:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso7453231e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688408161; x=1691000161;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PXHn6Y9ohB66Fq7/rdy4/Qmz5PjvLS1WDR/plz/VYq8=;
 b=d/qqapgcXdEiKfkb4swP1JWdo2/TxD6rqTvyzR5ljPkPl4nN0/wAYUdtmPa983+GRa
 J8jPnnVSij6wHzaxugl2bmiaIefpqJoTNtDHPux1FlmaFO72wpGbRk8oDTusgtqhwdG6
 zJ19u2o6rMowAgQt6A8KTYB46HaHBrkqK7ibmSiF2MD3dkOT4jgkKlcAfdfR1Y5cvDWo
 isIaiantfFEDK8ibuzPzJ1N+6zPEdfthUolbPvjiVF3JBWYNphk8ATU7dYNSSLsPp6pZ
 yMXVpJiCEsnSGP0njkrKvDAVI8FB4waM1lG5zP5ZDPuSDs+l+x7+0TnMO2ENKA5MoaWi
 GKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408161; x=1691000161;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXHn6Y9ohB66Fq7/rdy4/Qmz5PjvLS1WDR/plz/VYq8=;
 b=TBWwC8CIKm2fsArZs4liXHuLJNBiq+6uVWlebIj63CYTpFmYMcGMKvJ3VK8WJtdJ8E
 rMYRGwWAXpkzoZzV3ncFdfhtXWHKBTJxKstCawwlWumaJqWFTBZE4Q17VZtOXTlhhEFg
 2k6VDxASQpm6uAL1O+y0iI+oTC2JrrJyqO4A97NaOpZsGWV31NKPwK+4HHdlk77/Rirj
 CJ6cHxebK57ThCQ8+qoe3WShiH1gWmTGLzfJ3MATTsAfSbKzD3nKav6PdQwOm5NdMSnA
 UdmnX+tbU/zjpw9quvFIJuL96NqOnI5O7QS2ST7WbjvT6QUB9Bxak9x+ZYlyabBlQbvM
 uUxg==
X-Gm-Message-State: ABy/qLau6qp3avMLVK8cu+afULUbr/VL+EhMpWCqJoZxGG4typ9k63zR
 x6Qw1SYbGTyDvqBa+Wqc2qxBQw==
X-Google-Smtp-Source: APBJJlGRZgPFbzMJAuoctz2DN10n3xkec3jfPHQ7vZZg6q8rPgnEKQoHwr6CfM33Y9/USAVcerQxDA==
X-Received: by 2002:a19:2d45:0:b0:4fb:b11:c99d with SMTP id
 t5-20020a192d45000000b004fb0b11c99dmr6933824lft.57.1688408161007; 
 Mon, 03 Jul 2023 11:16:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 11:16:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 03 Jul 2023 20:15:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v3-1-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=2256;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Dw17w0X3yguWSuWVzgIdOAGrOkzUUOLcbRD0QrQwKtw=;
 b=IrxxxLa3w8rmQOS7sMn5V5HbFSk5R9ykL6JtPxJ819bCV6NnhQmyAH3pqbHYHtDjq1f2N+JDO
 C5CF8L8DzhUAIQoKCAdT9zJTQOevM+mIRm2Jch7pEq4yNq2V2nyoMMR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 1/4] dt-bindings: regulator: Describe
 Qualcomm REFGEN regulator
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
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
new file mode 100644
index 000000000000..f02f97d4fdd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -0,0 +1,57 @@
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
+description:
+  The REFGEN (reference voltage generator) regulator provides reference
+  voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
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
+  reg:
+    maxItems: 1
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
+      reg = <0x0162f000 0x84>;
+    };
+...

-- 
2.41.0

