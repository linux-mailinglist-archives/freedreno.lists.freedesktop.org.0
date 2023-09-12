Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F379CCF3
	for <lists+freedreno@lfdr.de>; Tue, 12 Sep 2023 12:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263E10E3DC;
	Tue, 12 Sep 2023 10:04:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C7110E3DA
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 10:04:53 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so1281312166b.0
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513091; x=1695117891; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=76F0+BldbGsR8SBANuEdRlfBFJURUSsOZA3YGl1lILM=;
 b=IJ41SxMIIfvajuAek9a4eLoAupYpHrdXxCfEE0HKC6S8/QS+KxiahrAN003/cxQyUE
 rnPA+fqdpV01vmojb0rdWL6uLkAjTsThdDH99b8hnuU0NTLUSrJL9Q0Bw9uiYoTD83qI
 Zpo6hyd8F+UVaJb6uP9/zaNagHQBIH9Fz/Bo0aeP+HdbE2JNajDCG1yj9iJ4ptN/zUfu
 QicK7gNbjZS2HAVYVUxkkugcEiY9qyA2dxgRW4+HuBnL3EwVOY5lYyHqGm3r4UDbMbkw
 C5ANj38PaLoBQFxSy5pdxb8UODx6a/6/sMs3TFgIEML/eGVgF/uMAuwAK+z0qMOzinqn
 K7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513091; x=1695117891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76F0+BldbGsR8SBANuEdRlfBFJURUSsOZA3YGl1lILM=;
 b=LgZkKAF2jyvhtreylziqAeQtsrT7sknNuKcIbKHdLUp/HgtkYxtLnoLNL9aAigdmK8
 7l1Z6ts5Y2TTGFG82mmDUvK5H2FoZ2UCrgR4FGo/fmmKgOcvCBLQK3XBzlO8R/h9bNjP
 jo3TgQlo1cccaj1Rj9L1Ef9uZWAnlnWMvLztB9hUYyknej3rf1TDGzcj8s5JWBWFpF2h
 WvRQ2iNlEy4zSJCXKvsCb4oaVnKvw1YfnqHG2QQUM1UPZMQ718UlE5EFELRgVY4lQOML
 kPGrrho9Zi47hpBvpknJ+YkPH+lLMPboXMo5voZkySZsikWJF/gM3EwOTyrAx9mjnRzb
 k5qw==
X-Gm-Message-State: AOJu0Yy1Oq21PijkCKcIolKvQia6FmjH0fUJMXH4s6SMCCIz9qkCSipS
 PeguJJdEW2ehcTBzp4OIix6urg==
X-Google-Smtp-Source: AGHT+IFFTR7Me9GkF8TwPhcPBB1Y5s/bvb5Njy18q0t6j3M2sBcRZTcWLShIUmaBK5Yj95BzYsqQxA==
X-Received: by 2002:a17:906:5a54:b0:9a2:26e4:a5e2 with SMTP id
 my20-20020a1709065a5400b009a226e4a5e2mr2847448ejc.25.1694513091507; 
 Tue, 12 Sep 2023 03:04:51 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:04:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-2-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=f8Ks5qBU/xHwVpGLbBaIcN6/JSh0hSEZ3lbJ3m6GXGI=;
 b=9i+f9omsQyT4L6anbqN+1N8xukVQtyzR1G/5cFpfCRAcXhunuhaQaBlVP9C3SF6hKNycjZwNi
 tSIY9XL7KOcASIQvJHIYdBcJDX5frjvV03WkZdMxQnt8Xz6ujKo2wvN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 02/10] dt-bindings: display/msm/gmu: Allow
 passing QMP handle
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 20ddb89a4500..e132dbff3c4a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.42.0

