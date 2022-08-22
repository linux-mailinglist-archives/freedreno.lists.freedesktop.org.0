Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF759C71A
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 20:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8CB18ADC7;
	Mon, 22 Aug 2022 18:49:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675F38FD82
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 18:49:06 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s6so5300877lfo.11
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yW/zgiGRRkDA/MVfrxBInFrDTIC51LYTWBpp0NQEfD8=;
 b=IUnejPUHT5pQ9Q9W6PN2D8zRlcRNalnLnHpLk7EYa3s9uyLKfkYvgLOZHNeSath3UM
 HX3pqVzzrlE8CGFIZ9OnddBYRflwJqJa6txIC9HB8nzSenXY3CTj3cxZvR0HDcymGa+M
 DrSObuNl44pUMzg/NOla/4NKIuoD+5uOz6gNumiy1yZKWfm3UN2/RcuKELvDD7f/0cns
 OqJdto02v6mXreeV+mOC122jL8U2Q+RnJw2IBeYACWm9DLg5wNZiB/yGTex0Q70J1MdL
 b43ryCnHpncWUO3K2SiAVdtGEercz+LgjyD0bJnSsygLu/MSHmJ+xVdsZKPyinZDahFK
 caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yW/zgiGRRkDA/MVfrxBInFrDTIC51LYTWBpp0NQEfD8=;
 b=2xTbZxYT1xUVBDuWKtuA2CfK5BEXjPJQ5VVUdZzU+TgBYMWrFRVYShu+th8TSAgj1k
 B3l99bxjMR3w8ZRfT/xmDZ8DKvG2c2xflp8PUzntrQoiC1HWjGB/tB0HmF/LkvCzhNFm
 DydvW61XZM3IoK3VWXMKrS97aC4uMl9RrG/neNLtuoV94k7gx1HLT0PfvEMhbECk4uRE
 /so3mdG+3AirJRXaJ3UzpkaGPmTpls0fVbO7dbzA9oj3FXe55vjB/Z26fYfWeKtl2mkz
 SXcPc0pkdtE3MgQ0LnrxPe//Licgf2KoNtGxlIraYCiVy0zTc4bs5l7bSorUdNSDXJGC
 SOsA==
X-Gm-Message-State: ACgBeo16x8Y+MqpizAoJxjFUy4K5JV66jI3/znGOa3RrHIqtK2YZxwsa
 zD2np93r2R7+Hb3nU7+PZqo9Mg==
X-Google-Smtp-Source: AA6agR4H9k+jzeo4Ilk656p8IX03a6Pbvbfm7v6M3aPwbIQTa0dLaOINaxVU527PebB6Fc6qPsxflw==
X-Received: by 2002:a05:6512:3086:b0:492:c1e7:f5be with SMTP id
 z6-20020a056512308600b00492c1e7f5bemr7024827lfd.454.1661194144173; 
 Mon, 22 Aug 2022 11:49:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 22 Aug 2022 21:49:00 +0300
Message-Id: <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/3] dt-bindings: msm/dp: handle DP vs eDP
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The #sound-dai-cells property should be used only for DP controllers. It
doesn't make sense for eDP, there is no support for audio output. The
aux-bus should not be used for DP controllers. Also p1 MMIO region
should be used only for DP controllers.

Take care of these differences.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 52cbf00df0ba..f2515af8256f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,sm8350-dp
 
   reg:
+    minItems: 4
     items:
       - description: ahb register block
       - description: aux register block
@@ -112,10 +113,33 @@ required:
   - clock-names
   - phys
   - phy-names
-  - "#sound-dai-cells"
   - power-domains
   - ports
 
+allOf:
+  # AUX BUS does not exist on DP controllers
+  # Audio output also is present only on DP output
+  # p1 regions is present on DP, but not on eDP
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
+        reg:
+          maxItems: 4
+    else:
+      properties:
+        aux-bus: false
+        reg:
+          minItems: 5
+      required:
+        - "#sound-dai-cells"
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

