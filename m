Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B75D6E9ED5
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C3810ED08;
	Thu, 20 Apr 2023 22:31:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866FB10ED08
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so9306021fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029883; x=1684621883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KWT/B+r7q/RKUVkiuFZ1DbVX2TD5Cvvln3noQ7CU1Y8=;
 b=j9ovLmib1wBjfXLyvuYVA9fKZyjdkuM60bwdom/p0l6d+g2HsTUgByXIxDq9KFypFu
 jgMhPVeraebxHUjWSU4KaJF8Xi7nBbEJaeuDLq/rSmcPRsCf0ASlwS5Z+lFEJjSeMpz+
 G1Yt7few+Y8hg1VsUCOMe/El/+bubLML0kMxy+IHcgJDKr7/rH2ou6w2f3I/Usi8aUQg
 /Fvoh6ko1EjKmjL/6hgmIJo0XgJHYg1ElgnjgSTqffBGoIgN2QMlVcn833UfxYJpoxnk
 AMSxyjfPeLL8WKDLsdAAco5psbKaG2UgDmUKmOBjH8g03MF2PLeZGgB54O/n7Y8x0LQe
 unTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029883; x=1684621883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWT/B+r7q/RKUVkiuFZ1DbVX2TD5Cvvln3noQ7CU1Y8=;
 b=NnkAcMrd1EhHSC7o+wpZb/bMBsom46EcS9NYJzRxAPOWixCoMA0aVe+lAIqg7ir+cg
 5OjFmFM25qQmGsYsbdXqw/hEAZkKMPeUrXtfngeh3kmey7GtIo54CixKA63p4YihOjEd
 iz8iQNN/UjIJgfu3lnz0xbukF/LBgELV1w128+eq6nB3V9kYdllYWKCWfhNwAo7LfoFp
 APLJfarB2Oq4zKGH4VmUS+hzHKUFB0NKWxR/pYNEMs8K3bUrxAJuGCL3Ohkrm6T9ghc9
 8uGxqBpOucsXxjQE3rL4uFY7Q7pEU5sdEe/h1F9/EoqRnn7ylahv9gjdAlvivAtIMWpO
 j60Q==
X-Gm-Message-State: AAQBX9dTf74sav6hYqfuYIcPad1qxnkwW8V7biHvZxwbP8d2iaBviztR
 SERxpijzUxD1vuYIBJMKvbJw4w==
X-Google-Smtp-Source: AKy350YuA9AUlqOuw49Ln1YZYTP8MQma23on/4STSQR6nyDGIJDgDbGw/Gs5GKRb/mcbRPEuFqhiIg==
X-Received: by 2002:a2e:8784:0:b0:2a6:15c7:1926 with SMTP id
 n4-20020a2e8784000000b002a615c71926mr129250lji.3.1682029883233; 
 Thu, 20 Apr 2023 15:31:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-1-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1EZeD/7Id9o6cBL4ylQ4GNUTK1f0wLzgpRCWpr/xxlY=;
 b=wcPs44uEQqo7xru1sJ+NnetyZuOSV0ot3K+yGfD6q7BPkHkYw3QFtH5LXw7Tm1g/nLRcx7x2ZTpV
 PmFalNyZAsKNw3ajQaTN5bG899GZ4jB9ffY6uOvQVN4xLUyZfp7t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 01/13] dt-bindings: display/msm:
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
2.40.0

