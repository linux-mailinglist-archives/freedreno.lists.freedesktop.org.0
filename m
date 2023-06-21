Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD814737EEA
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 11:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B6010E41D;
	Wed, 21 Jun 2023 09:26:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9DE10E41C
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 09:26:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f640e48bc3so7557503e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687339589; x=1689931589;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1u6dMLu+XDdmR+MTtlZcfDBb+RPJh7fhgvB/xrSsCvE=;
 b=TZv4N3WDU0oSVlaU5wJ1bBAeYj0fYKd130cieir2cTkNG0Kh+MSCdmP3N4I/Cd2nFL
 vBAGdqW9CZzONVyf2G/VUtXNllSeQQ+tnm1FdRpHbi+odT+hhdq/Pf69ICrj+3IkLdYr
 AXl5vz6pZC1H5FELXpBVzuS/u92AcEyuELpUgcH/95QvkNU/zg8AsYdWifvYpVmlm2AC
 YkMbJi54nLxlVBWaeokXVLtFBPbkg15fnbr0jytWqwqqcCpNO87qT8DxBZJsQFUP5L0v
 h4CFTr8b9PfvoCZo72xONQynYD/TIMKOj9BHxe+JVLUgJq8CMPwhv1bTY2/uvFn4Ogmf
 6h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687339589; x=1689931589;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1u6dMLu+XDdmR+MTtlZcfDBb+RPJh7fhgvB/xrSsCvE=;
 b=SllEBbJmis125EQGZHiTWAgMXJBcBUdf0rHuOlCQ2Qi6Sh/wKzdSK5tj+UNTSIOq+F
 rZdCu1YUAggdx1b8OkYDb6CIstJoeiPDizSo84fWpPogAc2f/0i4Zk+0VmfHXX3VVwKl
 L/TO2la1YtTEwxZaheEDEfe8aDSxIBCViUx8FohAQl9Uviw+03Cjgt+P9iQ+88cE2VLi
 JrAyJQE1fHeC50zWrGtO6MdXaUQi4M0dvcfu4qrZFw9Z+UALzVWMc1iVeTZwmGrkj0tU
 paDszQioDHMm/5CUTicH+TDnoLKuS0ck2HAFYPSoaly+chCFaFOu+4pZDwrz3TdSJRWI
 5lPQ==
X-Gm-Message-State: AC+VfDyQmu5JpmI19p8ZAcOYuP4VA1Ul4BXkfnRQ3UaEYkfYeGzECSan
 NlXXWIxT2jHIazbredyskSY11g==
X-Google-Smtp-Source: ACHHUZ7pZ+KItBxGa7DSPdaGeby4ce78m1+Ky+cxafr4DrJXRYhrD0n1gmC31QJQce6zA0HLfjSq9A==
X-Received: by 2002:a19:6544:0:b0:4f6:d7b:2f19 with SMTP id
 c4-20020a196544000000b004f60d7b2f19mr8147122lfj.24.1687339588863; 
 Wed, 21 Jun 2023 02:26:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 02:26:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jun 2023 11:26:24 +0200
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDCkmQC/x2OywqDMBAAf0Vy7kLUakt/pfSQx0YXzCZkTRHEf
 2/oceYwzKkEC6GoV3eqgl8SStygv3XKrYYXBPKN1aCHUc9DD3vK5EDi85g01Cx7QRMhehGwxJ5
 4EfAZpFpOHuEecJwfNkzOompRawTBFsNubVmu29ZkLhjo+F+8P9f1A6VCtGaVAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=n/PdcZDVLKRhIvYbN1bx5TS9tULGuMBKEC8xgdESvuE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJClUTpI5t3FkZIWzg2XBdjd4nX6NjdUW8Mf2nC
 uYlOHdeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQgAKCRB33NvayMhJ0cqcD/
 0VdK6Yroz7ljtVZiQJAUiLw/B6ezdYudvpzUuCZu9KSxdBrrJ7NhRxLcFJ2mhdowyOXVuwMOORHHje
 WuxjbN8F5a9eAirf2Tx14BDxjvrvUzg42BBcElD2nCxwHoyuf26pQwHGJn416wyxbKREIDcnEY6L7Z
 MYp8TsEaCUeN1HGYtBVdZqu5aNiE1qkzaACRudyZOgho9yvyp0pM3oejJTxjeB11DZKdQhCO460TIa
 vcfCiP0JJns2FgfTKYv4PEBKf93f/7REZUxnMfO4N/ZKpAcsY4SnGmYvE1a9KCp9aXjp8Qr1L35XW2
 U0nAR/VAaAiE0ZcezhwR8ZP7J2OHPG1n/SB3dhR6aLk+FWo9OTIxLiAZLmthe6GTeaI94HZuvwI7+r
 O17Yyl+0T1at/mzRGPYuLg4yklF4yeaVrofVwn1PRQWQSiu2pYxSEU1UbcazixB738P4wbfLVqZLzD
 lN4umOpoeZi70UOFuwuQ0LEtIxivXv5Q9r7DzKqu05VIK4d7NzJtilJoMt99dNNAZ3Kbooq5DHvR6f
 K+qyfcVJ/1beRmRsu2OoIUeOdf5q43E2UJXVDJUhcIop022cjl5XDALT0kiO4xRUDaT9BRNPK6cyFK
 R9bqwS3Am5SkQUwrS3ogM5HHdAFQFy9lhVhz08jLkHmTovdYPSIxFfZf5H3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH 0/3] dt-bindings: display: msm: document the
 SM8[345]50 displayport MDSS subnode
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the displayport subnode to fix the bindings check error:

arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)   
        From schema: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml                                                                 

And same for SM8350 and SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: display: msm: sm8350-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8450-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8550-mdss: document displayport controller subnode

 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
 3 files changed, 22 insertions(+)
---
base-commit: 15e71592dbae49a674429c618a10401d7f992ac3
change-id: 20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-4fe367bf5cbe

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

