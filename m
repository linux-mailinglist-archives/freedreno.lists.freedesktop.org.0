Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2468B9AF
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 11:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E2E10E362;
	Mon,  6 Feb 2023 10:17:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A73010E358
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 10:17:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso8332978wms.3
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=juT1ANtFRKnjz1qxgg5mjyQWnKuwI08rPtM+jF3OUfc=;
 b=hcxFwOf5s3B6uQ+TEDvLWWHa6v/pRaAt0pZWJfSz6KR8G9cKL2s9MQEPh3I8JujA2x
 i1HZyq/CoPY+6O9Q6HJ2X33Zu7KzgrAFqNMfUez+qAf82Ee7WuiQ1Bh+qlouUHvAMUdi
 4cDUMM4O54LRhEir1VY65DffLDAhlGKbg9ntI2V46kPa7KuTX4nyP3h7p6quQf44NFXn
 kQz5fNeVTeCzBOHluNHqhZNwYw/dPYCm6yeEzw6fzkL8bhVUzVGstvr+Tqpqnt5nRJOi
 PMU5zVVtcEGA++YzApp1CSULUdocIquCCSzIVcGLxXxMouLlSnOi8fjkzgex0r1YN39x
 tI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juT1ANtFRKnjz1qxgg5mjyQWnKuwI08rPtM+jF3OUfc=;
 b=YmIJsWdw0g3T8HvSWW0wFHAi4BWHg0ji1Ks5B/KX8v/NtX9uRIk6EjIxQxCR6lqecX
 Oqw4vRtDSX40WnEhbez2hsKnJGh3yFNHhMStOMRNOgSOcSWWuPKNa/AaqLW9NdGnTloR
 MmDf7SSZywyzlODVg2tT1IqJeTYXlnl2Y3TTk/iL0aPD2833fQ1jc0+1ylOkXftV9ggH
 hsC8AbKp2XTLkKlOYK62OBrL/6Wq2Vu+MpZyysGMey3L6VLbxGmllvKOjvw+NeK8e1U1
 Hs7rQZGFz01CWWNLdxmppWTksVApAWe4mF/FugYYczlwLyZ2SnxpDNANbRO4w20gZGqM
 Sasw==
X-Gm-Message-State: AO0yUKUaGB+0B9p+jHRNMJttPI2n8RW5tpDodmi0RnIXO2TvaKV6709H
 tsAE+PVvqANtZhX4oz8f+Looyg==
X-Google-Smtp-Source: AK7set+nTV2McC/t0ZmuxXwp/9Qiusp8BNjBheoHhkQQldgSqYkmsMsm5Ygo1A4/QyjK3+lSIH8SeA==
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr13663417wmb.24.1675678627739; 
 Mon, 06 Feb 2023 02:17:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003db0bb81b6asm11314201wmo.1.2023.02.06.02.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:17:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Feb 2023 11:17:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
Subject: [Freedreno] [PATCH 1/5] dt-bindings: display: msm: dp-controller:
 document SM8450 compatible
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

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..98bae326e655 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -25,6 +25,10 @@ properties:
       - qcom,sc8280xp-edp
       - qcom,sdm845-dp
       - qcom,sm8350-dp
+      - items:
+          - enum:
+            - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

