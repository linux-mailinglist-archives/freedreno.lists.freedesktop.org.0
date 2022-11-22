Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18136634AC6
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D4510E495;
	Tue, 22 Nov 2022 23:12:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B310E494
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:40 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id s8so25735682lfc.8
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqPS17XYoak6QxziVSZ62TRbM8OKU3jq05RDYgh93/0=;
 b=jAeayRsoXGP/fzlpVGUoEEqjpvUzwd92QPYdW078Rcf1bXg9FDtNmEfW+rRfqthmrk
 H4GecBXSMhn2yia4UYNwb8XRQFkgKLGEi2/YnTWgOiBV5bMHCWQUTM0/VWF69+ytgksw
 Av6bPg9tqfg7du2oF87GY0+U7bC4/nTj923G8e667IMftyH9fkyu9gkvsUMN2fASDmXp
 v26kDKpVUj3GyAOLI+v7Vcj+6X5gH90H1g1t/9Y9GYbV+O2TZqScP4FUOv/nkJjY1Bhy
 HhfscbKJg4WW56KCxRseuebXDKCoc3VLxAo9zXVvPlKTXVUrTQ1VWUKkm3ygvBU1lfXz
 KpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MqPS17XYoak6QxziVSZ62TRbM8OKU3jq05RDYgh93/0=;
 b=oHaUsXN7q7NkEm+2kXMv6HlbDazPTQ42TALIcvwE4TgIXuCzyOoUyCYq89oRc99h4b
 bBrn4GO+TqELfUvx8TRytln+oEyDlvyKY5l7z/qyq4ZW61wwECXaGffNSBiHXSgarLAh
 b4FVfnWNqY5JepF/tkgxD6/aEMvmLisBGg5Tzjis37U4cF9cL3FYjVO+qcbOPL1HuuI3
 5E8LQxutTkRi3D7FMFx76vbrSMAh4rkfPzvCciLxJ9QnMqXgeXFtebdLYOhqRFrVVDcJ
 xbU7TD84L7yULdfdWrshOZh9Mig0SIgKgEdUukFObgg+NV+AF72utZ3ZSFx/IB1GWwCl
 53ag==
X-Gm-Message-State: ANoB5pnkbDVlCq8z1QZa5/AhpyddXIZUOCodMjNCYkqC/eoTy1Iq8WM1
 2334GFVJJRtHIDe7cbwbPGAXhg==
X-Google-Smtp-Source: AA0mqf7UGVX9qjxbcVs/Qk4UzLdScTlacWSOT6/VxAo4FHCe2216XL34sRyQSzu3lh58l5j/LoTq3g==
X-Received: by 2002:a05:6512:1285:b0:4a2:26ed:a129 with SMTP id
 u5-20020a056512128500b004a226eda129mr4295682lfs.616.1669158757938; 
 Tue, 22 Nov 2022 15:12:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:12:25 +0200
Message-Id: <20221122231235.3299737-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 02/11] dt-bindings: display/msm: *mdss.yaml:
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

Per Krzysztof's request, move a clause requiring 'compatible' property to
the file where it is formally defined.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 -
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml     | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml      | 3 +++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml      | 3 +++
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 27d7242657b2..59f17ac898aa 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -70,7 +70,6 @@ properties:
       - description: MDSS_CORE reset
 
 required:
-  - compatible
   - reg
   - reg-names
   - power-domains
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index cf52ff77a41a..fc6969c9c52e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -55,6 +55,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm-8998
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d6f043a4b08d..0c2f9755125e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -61,6 +61,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-14nm-2290
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 13e396d61a51..fb835a4d9114 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -67,6 +67,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index a3de1744ba11..a4e3ada2affc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -74,6 +74,9 @@ patternProperties:
           - qcom,sc7280-dsi-phy-7nm
           - qcom,sc7280-edp-phy
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 31ca6f99fc22..2a0960bf3052 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -59,6 +59,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-10nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 0d3be5386b3f..d752fd022ac5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -63,6 +63,9 @@ patternProperties:
       compatible:
         const: qcom,dsi-phy-7nm
 
+required:
+  - compatible
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

