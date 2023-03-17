Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB16BEC51
	for <lists+freedreno@lfdr.de>; Fri, 17 Mar 2023 16:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489D110E275;
	Fri, 17 Mar 2023 15:06:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE2210E264
 for <freedreno@lists.freedesktop.org>; Fri, 17 Mar 2023 15:06:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p4so4725591wre.11
 for <freedreno@lists.freedesktop.org>; Fri, 17 Mar 2023 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679065595;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=b+PT4rbtQaTLoitwvMzSctyfB/PTX2FRLt6w5MfEfjyUObdoeiMt0IvwQn4sXfB4PP
 QaaHwO87rM3LcVGXqMsqAKAPu2biM/oSj1F9FkgEZzK2CJKnuymYOqivN7CmoVMdCwA6
 r0pcek6V8uA2inoYnhCvLu9xU50PgNWuy9xlpmUKlrcJ80BT7m1g/bq9/0YNoxFUy3lY
 YhR8gWbPsx7Ntv2Rv6LefrhNlXuU3t2LtnfME7En4Shl9Ra/O+iXgMl0dsdHURJL5s4E
 ZNHjNnc2VsxQcXLyUqZagM13LQKAH1WxPTUUCtaKdRv0pA8yNWEHIpO3Euz20QqqNmDa
 P0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065595;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=ywrWNZqiFsMbloRVHnXsqb9wlP0cK+AoBpJvEzk920l79GQ1E3OZGeia7GRLnu79K+
 1XpOAtXVwbNeUQEaW52sKHPlIl9bcr7VXixx75VKjDPJ6r5IAGSzyt2+bWGmEAU4MrbQ
 XwJV9g6UMkGHaQ+tEV+1NmVG18EzSdyDFCSxd1Qh7OPP542Kg25EjucsF7ATVi+XWUIJ
 Izs7vCBy6dCDikc//FCXk4NhFzxqO9GzfsVyZC+qlg6xaLMR1mEjB61sJ+sRxkSV5ayn
 tky6MH+J6bDO3X53c6YnEAxd+3gYbZwaNlavM9K0+rjIbLdHfYs+IpBdKSTMAV5XEP2Z
 SBaw==
X-Gm-Message-State: AO0yUKUz9tNzMyKVUAw11rON/IlqdnMB8zJtHRodAVUWAwGbiylPXTAI
 X9Tg9bP2Z489yNHqWUfqtxTfaw==
X-Google-Smtp-Source: AK7set9Mf1yAu2eJOHf8lqanYjVkR/0dk89uLJzzPMVSb0YblJ5QbKXVabOolSXl4Fh0ldJMKeS/MQ==
X-Received: by 2002:adf:f0d0:0:b0:2cf:ea5d:f60a with SMTP id
 x16-20020adff0d0000000b002cfea5df60amr8317040wro.3.1679065595310; 
 Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d58ed000000b002c5493a17efsm2187902wrd.25.2023.03.17.08.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Mar 2023 16:06:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v6-1-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH v6 1/5] dt-bindings: display: msm:
 dp-controller: document SM8450 compatible
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..f0c2237d5f82 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -15,16 +15,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-dp
-      - qcom,sc7280-dp
-      - qcom,sc7280-edp
-      - qcom,sc8180x-dp
-      - qcom,sc8180x-edp
-      - qcom,sc8280xp-dp
-      - qcom,sc8280xp-edp
-      - qcom,sdm845-dp
-      - qcom,sm8350-dp
+    oneOf:
+      - enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc7280-edp
+          - qcom,sc8180x-dp
+          - qcom,sc8180x-edp
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+          - qcom,sdm845-dp
+          - qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

