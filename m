Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913D72429F
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 14:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50A10E349;
	Tue,  6 Jun 2023 12:44:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCC110E340
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 12:44:11 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b1a6a8e851so67906771fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055450; x=1688647450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VBUZ1meZbbD/0QuuPzRJYb6UmJbfmwDGrvNyug3ZzLk=;
 b=jnSK7+1zpmu991qwBvJ3ZIlu+slBKXGIaE6jPEh+vp4xRg4XK5Eg0Ulf+Dh4cvUger
 aVCFNYbhes3vqHGdfRUemxoEAFAVH1StyXTGhuaXHeT4EXnWTmtZ0iiPqlevEP+9BiJm
 OkmZt5nXShGf4ChSji90Kq7vSYB31u/f25sEM4OV5WecEdtV2clD0ym4yolryzqCc50z
 YEfsjEbEWYfJNZdquwFH4BYpge9qzfZS9QtRYWfgedfVXf25wrtVGFi65aMMoWJzfZs6
 uljNOg5AvakquOdwTs4PE++mwRYu3IUBCezN1fPaksOQoDCd7raQ3/blX4U1gVp0j1HF
 qiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055450; x=1688647450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBUZ1meZbbD/0QuuPzRJYb6UmJbfmwDGrvNyug3ZzLk=;
 b=LEZEOdFa8ZB240qbJXqnAvT2tr3sUBaN/c+kCOXooZOHllOmO4PAQ9eFZ4XXNWRwVa
 X6cclIAifZg35t12zM7I2SSf9+d5/D2BnpprV4ugSoQbcMKNRQetpGw0uTmkJqvKBYxw
 hjmeAk5326RiCx3zQpdfF+7rVXBhDrAYyo2kQwTfvRtY4clwnjLQa3VVyCG086qCBRAN
 R8JSyCZ8zJ4yhzuVaxlm2MGY2vxFcEZPFG3C3ZRTmEyiFwGIjUsfONuuy8dNqHBWUtCi
 dsF6i+tWwKTygdXCbIS+HUXuwct0CcBofNYS7eKkf2zbdwYcPPgdXhPT3RlU0MFVefbz
 WKQQ==
X-Gm-Message-State: AC+VfDw1Ah42YUxyO0X8O6hAJOT6ugf6qB4zvrpiX883bR+akAIUgqTd
 S09NETQFbAPdLk9WtqQw0arFnJqeSc3SEvgpIrI=
X-Google-Smtp-Source: ACHHUZ5cXQn+wOXfu/FSV6zagKC6P/GKQV30mrRDGFF+nDCp51PKEcK6E+D5czHT1DI6IDbNtQ2YxA==
X-Received: by 2002:a2e:8195:0:b0:2b0:5a04:a5bd with SMTP id
 e21-20020a2e8195000000b002b05a04a5bdmr1206729ljg.42.1686055449867; 
 Tue, 06 Jun 2023 05:44:09 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 05:44:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Jun 2023 14:43:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-2-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JGKnL4ZgwMWnoMOWE82d7ZP3M4qFGKoVV5n7o2Z/y7Q=;
 b=lM/5jSBScLTQJPlH/4rHxJICwUc4pVMdaa7jz7nt1RK8NQYVckLGy55vAm97QbYEzpbzfXiDU
 CRpyempUinMAK9WwmDGdJUFc3uocptnLkZc6eiZUH1jAdgg5le/FicX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 02/12] dt-bindings: display/msm:
 dsi-controller-main: Add SM6375
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

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 8081ced7b297..01848bdd5873 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -368,6 +369,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

