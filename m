Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87279CD07
	for <lists+freedreno@lfdr.de>; Tue, 12 Sep 2023 12:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BC810E3ED;
	Tue, 12 Sep 2023 10:05:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905EC10E3DE
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 10:04:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-502b0d23f28so4225120e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513094; x=1695117894; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ir9r9aQtaSZLleag9LnQwnbzzTQdAeEYrkqtlWNxaqg=;
 b=xt3hF0qIu128SJK880GnEUH1K+irXQTG3jZEKK3463TlTTYceX5jFD9XrxmzMEGSwH
 5TkKfm8TlhQFw3i++3okxs6Mc0ztRpQxQLTAs//J2o+n9jzdb6f6BCDzXmjxEwLpBIVL
 t38WMWYDOCP9MjxBT4ctL7QZHOFOf0qN3dDg7md/3bicSJTvRFGPTdOPqubFhrWMwLsL
 BV/bR6rjKNGYraX251MavKjRJskdBCj7FohrXhXYhkcFqq2JvyRVQv3ZY5SlwSTq+LkL
 xoE49ZXdJ/PrWaCL1kTPYxwEidxJUt9QH6zLFSw7gZmEobV9/EvpqtwOzgKmDSPPrGqw
 lObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513094; x=1695117894;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ir9r9aQtaSZLleag9LnQwnbzzTQdAeEYrkqtlWNxaqg=;
 b=HQM8hXhu5aMr1AtO5mwq7m9gcNjKMqT4oXNWIy7vVL9gOaEWGFq3rrMbsG5eUVRwr9
 EWi35Qy2scmiL45TfrkWFffPS/HnqtREeR/hBDAHxhtgvPiFK6y4eNpeQkpQFm2LXVwe
 gur7fc3r+xtVVsF/RE+XtZc1rLk/b2gTF+OHu/zwnIaQ2ZQ0XXJcCcigd/UUKkblVudd
 HuU1ykYZHfxwMSqf6HedcvAYBtxZz1e+iBHN/gQ0mKFaGbucApz3Env3oVcc2SfiuEXd
 mRHMbXwOiob1RAfMyCuuUHY5NTFpK4DoJQNrsItMNj5X2HPS8aYKcTiyXig02pNbuBRb
 e9gg==
X-Gm-Message-State: AOJu0Yx/s7HtFej6a/wcd8IMx7H2fPAlPe1aAr4iUPmxfB342A9bZjqJ
 JWLZkf65KBUu/U57uwv1Owc49Q==
X-Google-Smtp-Source: AGHT+IHyp6bxGr08MxrJXgU77ALZhRoZWA9rEEteS0kLQHTL/Fi8nw8lQ98cVxST83ghnfxL5Qje9w==
X-Received: by 2002:ac2:58cc:0:b0:4fb:c657:3376 with SMTP id
 u12-20020ac258cc000000b004fbc6573376mr8841228lfo.29.1694513093643; 
 Tue, 12 Sep 2023 03:04:53 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:04:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-3-8b3e402795c1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=1566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VV4z2afr+St9/dA+OjbMmt+l3E+tCjarurRFVAL3RG8=;
 b=RliuCnOaiDRBp0EAJeURYXdZIfXDaE/0Hi/yLzX875X7bJqTyIF8cUX7zT13ntDismvMkq/5O
 ZcwAX8tFscDD90Z+QqcOFVeoXJG4vjP25RgJa/AF/5uGNgL+FYrxftf
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 03/10] dt-bindings: display/msm/gpu: Allow
 A7xx SKUs
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

Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
They use GMU for all things DVFS, just like most A6xx GPUs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 56b9b247e8c2..b019db954793 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -23,7 +23,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -203,7 +203,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.42.0

