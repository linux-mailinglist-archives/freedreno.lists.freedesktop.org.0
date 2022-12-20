Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8B65209C
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26010E3C9;
	Tue, 20 Dec 2022 12:36:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11610E3A6
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h11so11549454wrw.13
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7U4CGtf/Ju09Jbzb4QB+ZvkuzO+a1Kfzp82haXBgZc=;
 b=hlBWHxGW3kYwrRrztRl9g25tkWVLHBYLmcG87nCSCI1spGlnexbL7jyKA+6WFeclMZ
 YQZ+lXHITTUBgVALtCHEtkcjOYPZWa2OLvHUWAfrJjM4wmEl8rjrSIrZSbHOddKnXyEk
 PMfifyPmtrSS28zFX8b5wdVw2H/DOUs6aZ8T2ADqf9WmzmFuBKc/9qe7eq1dKRu/ncVR
 S9F+oEY2wUFiEgeH89t3zY8CGn4KZEAcB/L2xs/2XLWHIoVaBVYJPygH5eo3Ilwhze/H
 bBr9b7uHYR93Vhh9K9wrF2zJlncawicAKCkvYMHBUtljR1t36PSAjwHu1Czblk9C6lnu
 0Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7U4CGtf/Ju09Jbzb4QB+ZvkuzO+a1Kfzp82haXBgZc=;
 b=RBiDBwyT6chTx9Ch7X13Y4zAsTQm4y0vIfGhrdCxIW7QE4+qwsEfVTDEnuJK2FY82N
 uPQZmjDThbEuYGWJNpBOR84T2syCapkp4u3WJecWddbXk21xmshUW4SCNfi13rzzXbdC
 pwGFWsab2lpOBXAkQDm3MhtvUx3C8nzjUEIc1C0sdijo0wTMwMjWihB9/XRKt33Dyhg4
 8ADflb0UNfnISPjffiI5R4mGPW0di9ZCfdIop7yHyB+gysM/fCDbl4pKmyOsnTpk3TEU
 ZFuJwOI6DWeBgrc9+sPSwP/MDihkEEZ8sP4PhJ/7JCvycsO76yG8EmeiQlKhgmcGeUa5
 CGrg==
X-Gm-Message-State: ANoB5pkl97OHy8TW4BcdMVS7vqQAAVL0OxVOuy/ESNKlwS4zrmkbzpA2
 qqTw7D1Vu2uGCis/Won4adCN3A==
X-Google-Smtp-Source: AA0mqf4/rduBkEMjCAmyHkOs90ejtZKYKZt/P61s/Qfs66FMjyrUGzd93dJ0vFMqGca2ksOiSp/xzw==
X-Received: by 2002:adf:fb48:0:b0:236:57de:1462 with SMTP id
 c8-20020adffb48000000b0023657de1462mr27175174wrs.29.1671539807669; 
 Tue, 20 Dec 2022 04:36:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:22 +0000
Message-Id: <20221220123634.382970-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 09/21] dt-bindings: display/msm: Add list of
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731b..86bb43489bf4a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -94,7 +94,21 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - enum:
+              - qcom,apq8064-dsi-ctrl
+              - qcom,msm8916-dsi-ctrl
+              - qcom,msm8953-dsi-ctrl
+              - qcom,msm8974-dsi-ctrl
+              - qcom,msm8996-dsi-ctrl
+              - qcom,msm8998-dsi-ctrl
+              - qcom,qcm2290-dsi-ctrl
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sdm660-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.38.1

