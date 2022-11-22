Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE333634ABC
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706010E498;
	Tue, 22 Nov 2022 23:12:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BE910E48D
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p8so25715132lfu.11
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFu2tmy75XTB8WKFWQKeHfVOl1fJlblgj9tmlZq5sH0=;
 b=roLeHcCXPau4e8XUPmOaokUoTVO9VYolkHrzkUdkGVKT1wDozdEBj7hKyWpyBHorV5
 cZaMoy97qMiiEOq14XQmO6vH7nLHSU8Asq7KTosXFmWB2DWlbwzPyJLahn12lgEAulcp
 v9XdDqYL7KvS+f6SiqgHMPrQG3x5IvaewOvzarr1Einj1dLCURcApvCJPa8fTggkxAhP
 pOOksK7lCDzUkOKqaFEJJE26qjB+6o8BZan9fCHE8J8IVyOAPNsGSZH2q4ko7QwSz8wq
 kDqtCLmgyZNVVrH9uStQmHJRUKc03yyn0UEaE8R64FialPfiZWCZRRz3qA64n93h0hKO
 dDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFu2tmy75XTB8WKFWQKeHfVOl1fJlblgj9tmlZq5sH0=;
 b=SXDdhEeM82dnXz9t7In5Aez37JOA3zzhVagjmgskzI++rnS1eRBk8C9zoVsgxDdxwu
 cLDoKDARcC/zq+5hAW4Ng1qNVFSv8ygbvCNj4ckbu/tA3cGpn5ewX7K2THRsv2xWRXT9
 +NtUUoyY/mNnb8uM3bsgIqdrGIHmNTNLPAB7vdcQF4zj6sQDwePLZxiwsd7XE5mkmmNA
 ZG5sbeNaO3+S/OjyKiUt6PEYa19HGX8QvDqEkf4C3ALWEbD9KadDwlfP3PtywxsX4Uvx
 /UI1x5kzhA9+t+WVLyIys6bykeOibhWLY+M87XmarpH8JvmHrz1s4nV4uKL8yvU5MEoO
 nzgw==
X-Gm-Message-State: ANoB5pkZuZi6nhVPOjdQWpV9zEEhqtb4BkPUXwAErnGOG+WfO7KJqMD7
 zvBzQiffNPnj5Kxeh3BZWG5jqA==
X-Google-Smtp-Source: AA0mqf5UzNEEFCVpjd9K21BvS2MlKjn/Y24gZ5wJTjHp7FknnGwdYhpGnROPJtzfUeI+ASCpfcgC5g==
X-Received: by 2002:a19:690e:0:b0:4b4:6c29:9580 with SMTP id
 e14-20020a19690e000000b004b46c299580mr9481492lfc.299.1669158757087; 
 Tue, 22 Nov 2022 15:12:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:12:24 +0200
Message-Id: <20221122231235.3299737-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/11] dt-bindings: display/msm: *dpu.yaml:
 split required properties clauses
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Per Krzysztof's request, move a clause requiring certain properties to
the file where they are declared.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml        | 4 ----
 .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml  | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml  | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml   | 7 +++++++
 7 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 8ffbc30c6b7f..870158bb2aa0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -40,10 +40,6 @@ properties:
       - port@0
 
 required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
   - interrupts
   - power-domains
   - operating-points-v2
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index b02adba36e9e..479ce75bd451 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -46,6 +46,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index a7b382f01b56..e794f0dd8ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -42,6 +42,13 @@ properties:
       - const: lut
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index bd590a6b5b96..0dfdf8f3c5b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -44,6 +44,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 924059b387b6..512d23f8d629 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -43,6 +43,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index 5719b45f2860..d5a55e898b11 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -42,6 +42,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
index 9ff8a265c85f..687c8c170cd4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
@@ -39,6 +39,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

