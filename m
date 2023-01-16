Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472966C383
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 16:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF7910E084;
	Mon, 16 Jan 2023 15:21:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592B10E03A
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 15:21:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r2so27802139wrv.7
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqKbnZ47SiC5UJD4UI1hpgRIV8/hQzL8IaTq+l5A3l8=;
 b=ZpHvKwuRhOAzmH79SmS5fPSo3tJkIDhQiHN6pDBQ2fGY1S3UFKyjld4P3TQ96AlCQD
 8kwY6ys/6ZTVyf0gKhB1vqRy10EqGX9jsoS1t1yqNyLg90L/uep1C/n3WnYMUshcf6Hx
 cykq1xO+8jstJoXcSA7swi/QOSgzvrzJbtlSjfW2uWvWqZZnlITkkp6B1E1987uAZDOM
 CsMrKXb9v7lQJT4WfygzhdLbVWz+89Rzr/CWIHxFh7OjLKrk+xqeC8AJSkOcxI5S0zsg
 t18DxTlXbcGLxrwpXoSl7ymaOTypQ2SJC6ZGv+2Ks9MjFScbzciONT0ntkzfSNQovihG
 Ci8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqKbnZ47SiC5UJD4UI1hpgRIV8/hQzL8IaTq+l5A3l8=;
 b=afXVIUEZ17rJ5dNcCHs00silNzSuRwwAXmz4nSQCu84SvHB9wBki+RahnryQZJ/Fcn
 VptzmnhEFh4HzFkZwQ7hCxfCyAhFQx1iC2x0pEqt0uSn/70EVoF9Pdt7tiOfBjvyLsKS
 deASWSrzvb4YHziV0K1yR/BXRpbudBngF8Xi2b3lUlpzwBp79qgGt553rNG8OGycixH8
 C9DWN796y3SY6C84axPgovPhPepDxXOqPWjChX5IBuzpGhnblJEqX4sMeWSsF7VS575P
 MatBLD127vnQt1fAmkQZVfsUls4F9N4zyR8ZRftYC966OFo9TWcjL/dLNrc+0GhY0L4O
 9QfA==
X-Gm-Message-State: AFqh2krqNTZhEwNVFcoVWo8gUSKzmXc+sgwo7g2A4yYltkv7PRh+Hcs+
 k/uXPbhyeVqADbwT9hnCgZA5Kw==
X-Google-Smtp-Source: AMrXdXtRCkiY47M4P26u77M+hM6bQtDtpVdGrrJ1gNbcwBNqT+C5KcOdSmtOC0GVzW+APJvkWbwwvg==
X-Received: by 2002:adf:dd87:0:b0:2bd:e395:584a with SMTP id
 x7-20020adfdd87000000b002bde395584amr9823686wrl.52.1673882496057; 
 Mon, 16 Jan 2023 07:21:36 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:21:35 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Mon, 16 Jan 2023 15:21:28 +0000
Message-Id: <20230116152128.909646-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
References: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 4/4] dt-bindings: display/msm: Add list of
 mdss-dsi-ctrl compats
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the list of current compats absent the deprecated qcm2290 to the list
of dsi compats listed here.

Several MDSS yaml files exist which document the dsi sub-node.
For each existing SoC MDSS yaml, provide the right dsi compat string.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 3 ++-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml           | 8 +++++---
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml | 6 ++++--
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml | 6 ++++--
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml | 8 +++++---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml | 8 +++++---
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml | 8 +++++---
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++--
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 4 +++-
 9 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731b..c194bea46c72f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -94,7 +94,8 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,mdss-dsi-ctrl
 
   "^phy@[1-9a-f][0-9a-f]*$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 8b82eef28162c..3c2b6ed98a568 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -46,7 +46,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,msm8998-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -128,7 +130,7 @@ examples:
         };
 
         dsi@c994000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0c994000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -198,7 +200,7 @@ examples:
         };
 
         dsi@c996000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0c996000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 5db9b3ab03c98..42ef06edddc42 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -58,7 +58,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sc7180-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -144,7 +146,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index a4e3ada2affcf..078e1d1a7d2fc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -58,7 +58,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sc7280-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^edp@[0-9a-f]+$":
     type: object
@@ -165,7 +167,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sc7280-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 8f60be6147d88..6ecb00920d7f6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sdm845-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -136,7 +138,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sdm845-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -206,7 +208,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sdm845-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index 55b41e4573dc8..5182e958e0691 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -55,7 +55,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8150-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -167,7 +169,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -257,7 +259,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 571dc6560266c..368d3db0ce967 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -54,7 +54,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8250-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -169,7 +171,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8250-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -259,7 +261,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8250-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 0d452f22f5569..4d94dbff30541 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8350-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -169,7 +171,7 @@ examples:
         };
 
         dsi0: dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index c268e0b662cf9..599a6bad80f43 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -46,7 +46,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8450-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
-- 
2.38.1

