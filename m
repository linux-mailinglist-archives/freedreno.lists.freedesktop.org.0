Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F309C636F20
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096210E66E;
	Thu, 24 Nov 2022 00:48:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5B910E66D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x5so235779wrt.7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YqFsCNd8V96p96cud6oZMWsfVuJcreEZFfPj0HqVbw=;
 b=xMBXYU38t32UYo4DEytJ7SDlr9isxVTNC/StEbrUqUds8m4VtfdTF7NWRnksseznw3
 2XfA62w25Fmvfx+AjnhVb/cP3U+lJT/eMgsPf3bnBex5luUWI3oHA0v57W0YetlaVpSf
 r/6yM/JtIYKwzfflrIHST96qs24ZehT0IYXHRLdpOLe7g0QyEiZvtJIwjWJwP4K76vsR
 tzaAFvCPSdrPvjuCnBC0FuGxR9P23zNEjYS8GEdZrXOWecJVMpTL9KzDli5PyYn9c8TX
 Ew/ncvR0GognsFXz+sBd/kopQC03CM6u34wQ+o/JhWvuTnhHl0sKs5SUgt5VvrIh+bwa
 5wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YqFsCNd8V96p96cud6oZMWsfVuJcreEZFfPj0HqVbw=;
 b=aeJ3lu8GRsz6l1OySm4AL59pO5DmRsQv65fwepsnli0ocePF4DcVl+OdKrm7A09DqC
 OcAMj/YUg0pLToh58lSYE/iwzZMec+ePaxRmuy+cSi3ncbT3RWCvwWP46CrWf2lDiC1y
 h/Jrt+ulmHgL/or9IL/16cs+uLDuquak6PfWF7rBvliJ47xlRF4jbidmntFPpGftXBGw
 Je8g7Gk070vKzlZC59RQiw5F7PnXlTVwxt2ApKiOdr2U9DPbOXlzxtazlCTcdi6RLBtQ
 +CylbZ5EHcen8ndWro3ukn0VaKbx6LnROP4LjS7yaKsBIlvVC0sSX2LgBX1TuUrU8MGn
 fU1Q==
X-Gm-Message-State: ANoB5pk1D8TFSpPJepobVNrZiFUTA4VjMfK1ij5gbn5AFMtAF8w5RUQb
 TleNjyCIgCzI0txHMbKNGADSLQ==
X-Google-Smtp-Source: AA0mqf6WWL2LYDxTty4vRg5odd8bZG3WAEtfDj96WGeH3PlNMMqZCZn8rlo8v6fysiVONNqC5+LqGA==
X-Received: by 2002:adf:f408:0:b0:236:62c9:afa3 with SMTP id
 g8-20020adff408000000b0023662c9afa3mr18219077wro.467.1669250889721; 
 Wed, 23 Nov 2022 16:48:09 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:47 +0000
Message-Id: <20221124004801.361232-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 04/18] dt-bindings: msm: dsi-controller-main:
 Add compatible strings for every current SoC
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

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,apq8064-dsi-ctrl
- qcom,msm8916-dsi-ctrl
- qcom,msm8974-dsi-ctrl
- qcom,msm8996-dsi-ctrl
- qcom,sc7180-dsi-ctrl
- qcom,sc7280-dsi-ctrl
- qcom,sdm630-dsi-ctrl
- qcom,sdm660-dsi-ctrl
- qcom,sdm845-dsi-ctrl
- qcom,sm8250-dsi-ctrl

Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml        | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 67d08dc338925..c4da7179999d2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,20 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,qcm2290-dsi-ctrl
+    items:
+      - enum:
+          - qcom,apq8064-dsi-ctrl
+          - qcom,msm8916-dsi-ctrl
+          - qcom,msm8974-dsi-ctrl
+          - qcom,msm8996-dsi-ctrl
+          - qcom,qcm2290-dsi-ctrl
+          - qcom,sc7180-dsi-ctrl
+          - qcom,sc7280-dsi-ctrl
+          - qcom,sdm630-dsi-ctrl
+          - qcom,sdm660-dsi-ctrl
+          - qcom,sdm845-dsi-ctrl
+          - qcom,sm8250-dsi-ctrl
+      - const: qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

