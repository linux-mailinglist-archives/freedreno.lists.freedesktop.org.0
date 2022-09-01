Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB05A9471
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 12:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780F10E6B1;
	Thu,  1 Sep 2022 10:23:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AAA10E6A8
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:27 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id b26so10469126ljk.12
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
 b=kXkcAHCKeVbArfeueplPddDNJ6GGQ33c16EWLmeN+VykMBSabEJuCPbPFTczn1hMtQ
 kKnA29lmLHn/fxL2z9cQPVPM2PjyUzaLNOHEOLR7bF6/26mDgi7OOyFlNs763rSGbXLP
 L5J5ACqVcoITHp9lapY8B6yVjzCkTjaAQ+aEF/lzXpGCtx+ElOefZVCruXe3yZ1p9qBL
 AXYKb7W3cQM1KjwBd0z1ydtA1Rlao07eSvGRwJjp8DS7FXbgpHCGq0jby3a8yUKTNK0M
 UJIpwozUSNqnCq9K+Wb6pl3D4Ejk1KRT88xvtXjcSFej3ZREhHuHtqvkhoaPTAEvKY5w
 TSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=h3TGV/hZLKOeRKAV7vSOc7hHbC695F1vdnC1adEGcHg=;
 b=Qnq4MGECVw1Ogdya4ZDWNq4w2skfoc0jHQVoejqLDHwsU7X2R8+oIzMGQAVx4DTymy
 0n3oqhm0No16bbEYoc7E60gDO1qdWS/Wf2sRdJJd7JR8tQcsFmr8w4DTQMdNYkPNit7P
 2QJs+36XTZq/ESmBDN7rYrfT+8SK36aGIRezGS6bQnMCa9Amjp4nR5bnnnUsDVQe6Qs8
 UaEP/zlgV6WdsXI1QeKOEMh/EyzCls9+vp+xq8NvdheVtKUyFg6eu1a76besb1o053dT
 f4L7wCAWgRdvTTuLDBcaleMctmAa3EzDQIAsFTcEH6UoR2Jiwe+gKzgTi3iJDy29uxKR
 tCug==
X-Gm-Message-State: ACgBeo1s54gQldblHz+WJ4AQ8DR6Js+j9C3ZtsFcAQn0VvxlNwwLWVS0
 wCX1qliJI1zKCmQgIRWFn3EvMA==
X-Google-Smtp-Source: AA6agR648tmCUlzFuOWdj2ovCrgM3LOaJhn94D1LipEaS+mOZAZyZddv9ZH7JgjawGcjowk4eZiGTA==
X-Received: by 2002:a2e:140d:0:b0:268:cb78:40de with SMTP id
 u13-20020a2e140d000000b00268cb7840demr302489ljd.232.1662027805313; 
 Thu, 01 Sep 2022 03:23:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  1 Sep 2022 13:23:11 +0300
Message-Id: <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 11/12] dt-bindings: display/msm: add missing
 device nodes to mdss-* schemas
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/mdss-msm8998.yaml    | 12 +++++++++
 .../bindings/display/msm/mdss-qcm2290.yaml    |  6 +++++
 .../bindings/display/msm/mdss-sc7180.yaml     | 18 +++++++++++++
 .../bindings/display/msm/mdss-sc7280.yaml     | 26 +++++++++++++++++++
 .../bindings/display/msm/mdss-sdm845.yaml     | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
index 3482468fb2d4..f00a48a24521 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-msm8998.yaml
@@ -44,6 +44,18 @@ patternProperties:
       compatible:
         const: qcom,msm8998-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm-8998
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
index 7a6c3178f02c..1160c5435236 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-qcm2290.yaml
@@ -50,6 +50,12 @@ patternProperties:
       compatible:
         const: qcom,qcm2290-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-ctrl-6g-qcm2290
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
index 27d944f0e471..38e474ae90a3 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
@@ -50,6 +50,24 @@ patternProperties:
       compatible:
         const: qcom,sc7180-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7180-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
index db843412abf9..fcacbc5c5e2c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7280.yaml
@@ -49,6 +49,32 @@ patternProperties:
       compatible:
         const: qcom,sc7280-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^edp@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-edp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dsi-phy-7nm
+          - qcom,sc7280-edp-phy
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
index 0bc148f7fbd9..09a8aa9837ea 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sdm845.yaml
@@ -48,6 +48,18 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

