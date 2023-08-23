Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D77785831
	for <lists+freedreno@lfdr.de>; Wed, 23 Aug 2023 14:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C110E422;
	Wed, 23 Aug 2023 12:56:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE7B10E422
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:03 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso86820961fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795362; x=1693400162;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
 b=nFwEETn78mwFOweFwubXHwB/C+P7qrmJHrgLWAdf4o+b0utAvC65FBdmYaPMg+97JC
 Sj0soxpIMmmMNDaQpyIH2m3mDRjghpxeG6mChYdZX4C2ymOqCbGomsSFYSRPOgEXFxcK
 VC3+ScZpKy0/bft4yKV/j4TDzfMb9KeyzAWejjGQfRJ+pWOpALssQ6ghZix7HZ09wtab
 lHpNTHiuw2ONDZUVu7ECh34B57z9zLmCcLeS+EVejaMSynErA9YmavniFyVooH6NdXbu
 vrA+8lZw/pMaxsi7BzySyj0Fqu8Rh41zvCdP67nVBdCVKwO2elUBNnYu6Bfut1Xmpd8Q
 1DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795362; x=1693400162;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
 b=TAxoJ2VjFf5VDY9og/BhlNM0GN7ivWP4bk5i7Joh9EhroaQuoLPTCKMW5ZpONwmibA
 JwFk+v/PwcbZA+fWKVCIEKE5fLNxOa838dKWYZM+ZnZWpzBRCEEhIOWTA8DfjTv2miRu
 fFk7yP0XaAJ+S1YgKcFkxUuqximIhyHXo/qztk6LzLYJBNLfiOwK3YqBX9RnqbdUyyv3
 96NQNt14vc4vyYF1gPJ92RD63w1j/eOkp5NBW1yQ2+pu36d88GJ7t8MBa3XKkAY0kDIv
 rW41PmCQyycbO894khMfWhhPvr9ICE2AhxeLecig0HNbjcL6PnYeVaBJv9wwz4Jwo/Dr
 B1+w==
X-Gm-Message-State: AOJu0YyCeGKOi1MHTiYKEi0/xyiqy3Xg7+9eu1ZcZ2v63hY6BGSMTdLE
 7lmG+fpYhz+3Na2wvK6Qk4rFsQ==
X-Google-Smtp-Source: AGHT+IFQSUpVtDlkA3Qtiu0IIzwzYYR6P8TkdBvNyd1xjlg7sp7x2+BrOapUKG0oxhkxYmgoBboi6Q==
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id
 15-20020a05651c00cf00b002bcbdbd1542mr6804744ljr.11.1692795361697; 
 Wed, 23 Aug 2023 05:56:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:56:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 23 Aug 2023 14:55:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v3-1-4ee67ccbaf9d@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=2826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HNK2SS799OXNh7iy5vESf+h2uwh6BGHa1r43G7UvIKE=;
 b=/DAwVATtw+vn+n8shtTbBONnwNRjmULTiU2IxtoBwvSmEXIwhcDqCUfaleCW2fgNtM8NHwn6q
 ikU/lRY9xDHAgUmZU2+KFF9YXbJEByM+k+FDbj5jyrlIkvSttpKAAI8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 01/10] dt-bindings: display/msm/gmu: Add
 Adreno 7[34]0 GMU
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

The GMU on the A7xx series is pretty much the same as on the A6xx parts.
It's now "smarter", needs a bit less register writes and controls more
things (like inter-frame power collapse) mostly internally (instead of
us having to write to G[PM]U_[CG]X registers from APPS)

The only difference worth mentioning is the now-required DEMET clock,
which is strictly required for things like asserting reset lines, not
turning it on results in GMU not being fully functional (all OOB requests
would fail and HFI would hang after the first submitted OOB).

Describe the A730 and A740 GMU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 5fc4106110ad..20ddb89a4500 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
@@ -213,6 +213,44 @@ allOf:
             - const: axi
             - const: memnoc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-730.1
+              - qcom,adreno-gmu-740.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GPUSS DEMET clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+            - const: demet
+
   - if:
       properties:
         compatible:

-- 
2.42.0

