Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AA56AD86
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7D211AFC1;
	Thu,  7 Jul 2022 21:32:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73B11B12D
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:11 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bx13so23827906ljb.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qmHqomtPIyCyTmU9c0GuY++F1fuqEtzhO4HzH/F14o=;
 b=JqL35clNBQYGPpaEjGmP1beT+IT1EyV8unkvRsu5HYH9lBGYNo8xV8yONYTT2/4waM
 IL+rG1NWqVUWLiB+qBszuthBY4ieC94jIpRIfmk/47TSLj5BnjI2Ccy64RKUULYP4DrQ
 0YXS3RxG7Dw5reRbvYjC2YN3uhuQilzvFhiTCDRB052/MbM1RINhz3eEIYv0Xvu9/ZIG
 thmEVSfE6eP6P/+9pErPme9PIGxByD4IxyC2nPV27Yr5TijqJkipUQfG1XmuMZ6KgZHv
 tbZmH7a9yV/I7dd3Y1DeyQR5OklzSRZjn23nsxSsRpBCIzwoXhfGNL0YvNOy+BDljE3l
 Ku9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qmHqomtPIyCyTmU9c0GuY++F1fuqEtzhO4HzH/F14o=;
 b=OxXLtGaBdKjqAWjvCMHPuljnFtUBuJu9Md65cQxBYxJSsGIlAtUJxiZbYnznZA6rnS
 ndbt4AeLkeo8Upiu3ttC9wmv/K7aGIoyc/UNHEdHYQmG253vJIwjrlnCMv1BhRlKjQz1
 wkGeddR63K/t/ysQk2dyDamm9WZF4R8K5YHaqASr4Um8W1h6cd5D3zMvP9PZg/PkkhhX
 Ag77cZ1vW7Cq01C+OLyzgUxCs0zwQn3Cx7O0ytK1oAkK0hGujT/fhk1cDzLCpSqSuubd
 Xz5470QOw6foP50WH2LIFIYgw6llsfa86/OarMt1DyaBAfmTRSB+GPY+FHlQLSigi7eE
 HlxA==
X-Gm-Message-State: AJIora8zNPzkLaaOWpMeRBJYouyDVWtzGR4bbJ44VKuu6hz/cuqSsRaM
 iTfLSd77i2sT+mO6qKfN4yfH0A==
X-Google-Smtp-Source: AGRyM1u/zrZV5WDyRRmrgrTfbAEEMXa9NwgyyQheuXKk49R9ljtdKrfrkROt+ndm+hSOiQv8gSUPfQ==
X-Received: by 2002:a2e:2284:0:b0:25d:490f:60d3 with SMTP id
 i126-20020a2e2284000000b0025d490f60d3mr20372lji.486.1657229531507; 
 Thu, 07 Jul 2022 14:32:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:32:01 +0300
Message-Id: <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/9] dt-bindings: msm/dp: handle DP vs eDP
 difference
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The #sound-dai-cells property should be used only for DP controllers. It
doesn't make sense for eDP, there is no support for audio output. Also
aux-bus should not be used for DP controllers. Take care of these
differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 1ef845005b14..491f4aefe0db 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -107,7 +107,6 @@ required:
   - clock-names
   - phys
   - phy-names
-  - "#sound-dai-cells"
   - power-domains
   - ports
 
@@ -155,6 +154,24 @@ allOf:
             - const: ctrl_link_iface
             - const: stream_pixel
 
+  # AUX BUS does not exist on DP controllers
+  # Audio output also is present only on DP output
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+    then:
+      properties:
+        "#sound-dai-cells": false
+    else:
+      properties:
+        aux-bus: false
+      required:
+        - "#sound-dai-cells"
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

