Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37874737EED
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 11:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411D110E425;
	Wed, 21 Jun 2023 09:26:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2757E10E41E
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 09:26:33 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f849a0e371so7557675e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687339591; x=1689931591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=642ISV1RQy/4IBT8/0RpTRDp8l7iezX4cLvPXZIq6U4=;
 b=E7tvsPdFsOoE6UyrPeJBhP23t0NKFMbURh4PWkEEPcZo7kUUD6aYD5hs4ZzN+hVSi5
 wQ9NBCXrfgtynVg1CxEBf1VNraUXW6MuA58OaIxOJzC1nkpym7gYYzMlctR23S24dnoR
 4TbdlbA1fhgys4XLTaCmrs8lsTew6+UGq2vOxZ31nyL+ElkaMJkhumcC1ACb8VEX86EG
 3cIjNaedAnDY58NRRNUb8f+1pTN01XD2mf9SDXZUe9+GU9ijwArviKW6grLatJTV2oyS
 tq0dM9TveIoGqf7IAdyxPX5s7GBNIIyaftMAjT0jtyGLaiGIooUmYWR0aDv5S6gqkB4i
 DiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687339591; x=1689931591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=642ISV1RQy/4IBT8/0RpTRDp8l7iezX4cLvPXZIq6U4=;
 b=DDUOwZWX6hgg4HpVPkAi8CAcgy3tQCBQv8jtrlouH4pxi9EVHfR5sz88Yj5OnsFCTG
 OlCnMin58TiVLLixQJaYZChZpRkdqTAImPYHTPP6od1jlz8ftweRiRJpBNakQwzO9gvg
 YzGKLegkEZ2Qq5ViMbhI4gWXpTpebfnGWY77v+VoF3EuEyoLoP0S5BMc4vjHBuuVDhU0
 TbOiJEMmVXsEJ7ZJVSAlrOsx6rYTFiJJMWvJYmzU/h2fSekk6MCL4JMGzErjueZEJn3v
 /70pAG0069abcKe/RfeBiC6z7PVw4QvcHdkV+nOGkmmTzqUKOAQz9Dbw8mHPJm8sR9N4
 wdyQ==
X-Gm-Message-State: AC+VfDyKMLUj+fJt7ktwfuMqTmy2fa5+1RFnCu59qDJAZHJCBMOc9u1O
 064aDMpew3w9g+OdMjrF9ToHsw==
X-Google-Smtp-Source: ACHHUZ43PNwh9qBHoy2NPqJ2yxuPsyJNn7hgHjdashlCxbxzPvkgt4I1jXnsO93ioq7CzqaOVKtT8w==
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id
 f30-20020ac2499e000000b004f86f404776mr5395944lfl.46.1687339591023; 
 Wed, 21 Jun 2023 02:26:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 02:26:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jun 2023 11:26:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-2-8bf386b373eb@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wPfgKQUhZZtw05L3W0c8I0GpGZe+nDRcUCZuCoZr/P8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJCp+RZNgRoPbvq04JWliglIwxR8rwxQMWq0M9X
 yigbExWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQgAKCRB33NvayMhJ0cteEA
 DIFxnsOMAmYlnwSoF1sW3z9JpJk+/OmdLaHBvCZtjfSbdIbqIhN7fQR433hoBCI4YoBxY9CvyoL+AW
 gxTQ2mVkRkVSmwNejx7BCOoxxHZxGpsk+u5tSQpsq5of8cu87vAAwFtkmdB1ZzYmG3DnrvIgNK+gmu
 GpHjhyhmzfEZzCW0CRmjJQL5PxpEdGw5BITf0sq6zz/c00wwwL77UfYKzJtqwOotZW1AqRsaR06UXV
 tcQyY0Tu69cokKDrWBXbA6tVQbAcdg6XTyQuuDQxYH/raKodfTCN0sNuANHPB6v6JRiCCswJbIUwnd
 tnP8On+7YSrqnpxAdCJYxrJk2OBBEN59ilWqf+DsSj/X/8s0NPOBaZ7l1M2rug6+k7/AbxZ1jRDOtf
 USq7aTyCCA0tp22kTl7IY+b3x6SteVuKFvfMMeRsbRTAVroxADAiMW1tx7xAotTLSjNtYbba7qx8BN
 7XSQUng3asbn14nnR3QaPIHj1XjQfXWGDFk2NY6Er/GjoExFngZMBYTwNTF1KGTc41RSLX3UADe2wW
 zhYQ3J5CqcljrPqPU6Id1sCboMls18wCnxuwwUDgRKezXLVmqrXry5zaOfK3M99RkuKa0DXV+c1rTH
 ThfCnsyxU3wsXlPIdxktf9HHl+oV5gY5LjctbSVBCnL6VsR6pTDLhJk3JF3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH 2/3] dt-bindings: display: msm: sm8450-mdss:
 document displayport controller subnode
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

Document the optional document displayport controller subnode
of the SM8450 MDSS.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index f26eb5643aed..494e2a080e99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -42,6 +42,14 @@ patternProperties:
       compatible:
         const: qcom,sm8450-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8450-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

