Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524156450FE
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589B910E164;
	Wed,  7 Dec 2022 01:22:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B625210E160
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:34 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c1so26398822lfi.7
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCL3T9bEBAWFKFNPkwgPngR7HtM0awS/KY1SN8cp/IM=;
 b=kLNApF10W4T1ZkkfMKkV3H9ll1opOSR8vclgred6Qvbx2Mzq34Fqn7PdH7XEPHKfte
 TUYzjVGeNaEPhAgDeU/e95AYvvYiCgDPauQqHiWMAuiaAVlKON7wj1fmmuSzy7UqAzO5
 9JOnVY2p3a9WLqZLcIsGUnioonmPC6xUzsgxZXsCELKlqnLV7VWd+Qj58eeWjkORxfgr
 dZbb4t3sFT9KqSeQdFszCviLoKPijIjF3SyrBUzdjJTgB9Q+q0lKJkvE8uf1M7iJKPoG
 CRR9MX6C68Q1QQZ1c3T+W2beKBO7nxg+GiLKtDmTe+4u1/n4rXhU1i/1GeOLwRWw2lEo
 mlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCL3T9bEBAWFKFNPkwgPngR7HtM0awS/KY1SN8cp/IM=;
 b=jM8WrRcC/CUGRBTNNex9W/7sT/Q0zw+pU4UoM6m/BsfzLzbuYNHZIlISlo1a4q7B45
 GfeTjl9i622UXacInoEL6hwt6b9HBu5nY5qFnDQZxZdJRd0Cf4xbchUOfpPfjunkYGgq
 eMHIFF8yavDEHGO7c7q3GIuNVti0pXajTSIb1927JTilD3jUxDpjM85ci7ykquOKwFSH
 BJXVo51BdwE5YRWHBLwuq+yFftKw2hlbMGKQiKQREQ482dkIsv8uhqjbM6zWn9cB6SBU
 ncnR1HJR+nJi52K5h0JMw4rA6to7JEBhFV8bCwMo4m4S2u4rSvMYf3+7NQpoJqsp1Emv
 xpgA==
X-Gm-Message-State: ANoB5plmQLnLkAPDlxRxZkj364j19/qVmzeujvDGlbVbpdnfe9Q9ebCE
 DPiq8cOVIH6yGTQnOFBHyb2xsw==
X-Google-Smtp-Source: AA0mqf7Nv6TBP7cqiq1SVk8fBI/MF5e5ko2zUI3pT0C9q59uDDilYIjLhrU6B6zpXHWPaowfoP6bJw==
X-Received: by 2002:a05:6512:b24:b0:4b5:5402:a300 with SMTP id
 w36-20020a0565120b2400b004b55402a300mr7520342lfu.167.1670376153074; 
 Tue, 06 Dec 2022 17:22:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:22:21 +0200
Message-Id: <20221207012231.112059-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 01/11] dt-bindings: display/msm: *dpu.yaml:
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Require only properties declared in given schema, which makes the code a
bit more readable and easy to follow.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

