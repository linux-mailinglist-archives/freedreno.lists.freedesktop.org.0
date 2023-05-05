Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577496F8B37
	for <lists+freedreno@lfdr.de>; Fri,  5 May 2023 23:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B4410E0B1;
	Fri,  5 May 2023 21:40:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0862B10E67E
 for <freedreno@lists.freedesktop.org>; Fri,  5 May 2023 21:40:45 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso23680021fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 05 May 2023 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322843; x=1685914843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
 b=mGExL8SrQ5XCe3yqvDTrnGVkTIhBUhG8YPsyQ1/e/44Q3cEhZJ1/08XjzeuiRUyQD6
 M7LB6Ez57o3AzvLFjeyAWMJALzYXdNP5M+2jminPeixrUPikkepbM+Bm56WqlLmrBYfw
 xKPWLHO6S0mh/OQ30sBadObt6s1ZrWJldEJ5AiUbHKsECbbpI1IdFDU+3k8vdctN9mBE
 SG9OPTHzZjUZY+VcadBG3WVZvfW0b26y9XZhml/nM1KrjY7pd5EcHbn90zlgmvZQEHKY
 QnGsUU3nMC72ua2pgZZ2l2gEKdrQfbjYoR+3X7r9uojNgEerTz0gxTkVc2hX0l8wKsfl
 Sd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322843; x=1685914843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
 b=dTApGNjz0L2ydNO1/EGP7rW0Gsnr3z4CNJKL3Tllv5uo7+nTb6SbXX6NmWnMOiSPXI
 wQYT+fcRXFf6CWebXy1T4wJvc88VIjaZH97Gcxj5wgyuuFW71tO/Tlmpvhy8VbDb81LP
 xLpV5TruTNLoD88J6sAf9pNwaPsf9vMpUWlCKLAyK3hvUc3dN3Eb0gZQpK1/nVDc+oPI
 bsawUPd7CuQuR4STF6eR1Jc+rWh+WTHR+prJG5ZnvEqnY3x6pm6iaJ9vD6rMbmMMaqxe
 gPh95kp4ptymT1M+ukIBSlvABQocu7ZsPLSDACzp1WcP0EAhzEt6VzY40KYzg8VfmlHR
 zLFQ==
X-Gm-Message-State: AC+VfDyCVrj7UPN0HdqnfmMhER4wndGGCsHBWiGu1826CN2gKqdM76TZ
 nv4HKOZFScHmnIGwPn12WjVmPg==
X-Google-Smtp-Source: ACHHUZ7dbutd62hVffBmQka6SJs8tp9PNCSqis8xhLAT3IIrAmJco8X7JFwSYcMQzrd1Segejocbug==
X-Received: by 2002:a2e:9202:0:b0:2ac:7a77:1d4e with SMTP id
 k2-20020a2e9202000000b002ac7a771d4emr790219ljg.24.1683322843242; 
 Fri, 05 May 2023 14:40:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:40:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-1-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+O75/n498bCPQBt/QSpDKi1r6jFyvKeD8W9H7IyUIm4=;
 b=H5Kkgj24gPlGZUMzlH7o48hrPaPJDKbNQlfIh6lS7Er20KgpF2LUCpCvwkInzjXJDZ0bDJ9aS
 6QteD0gUYBmCf9xOsDUgvrXBc64n/3AF6qfnUgjhKnmSXHBb+EfyOrm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 01/12] dt-bindings: display/msm:
 dsi-controller-main: Add SM6350
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the DSI host found on SM6350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e6c1ebfe8a32..6f367a1fabf8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -285,6 +286,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

