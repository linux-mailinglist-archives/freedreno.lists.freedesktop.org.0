Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610564662A
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 01:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1539810E44D;
	Thu,  8 Dec 2022 00:55:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599D10E448
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 00:55:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so31352487lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
 b=dcXN8CrIwWj+WhiIr+k4CEInsAx52ZiTtEKU5oKIVxc2m0Oy6WhpOehgibHctHVcPe
 DYzdhAhDj5JG6Qg3RYEy8W6T06IQC3MOwAirjDcicnZMSdlZojzybp1sFvBvsX/RdT9a
 A7uxfuWg3nPriYSn+ZPCOxX+caIWkvto4J4zkM2EKiyVOs7yB1lYRHCtzlVGJvjSboWb
 ezWCnD1Ndo/Y17pW/Nc7PwMx8DEpxFXCwxQTtzg6eAZduWU789oiH6wsD7uHVwy6ClJz
 TViLnME8x6O6dkVyqGMETlcrK6fTc/vM/sObQ7hK9iB0nI90etAaLOTMGThqmYiTqZj4
 9QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
 b=tCI1GMQjhKQIoTQgNqk9WdQciPVnQ9QjXmcjC+ZOsGhBZcCr9NeVJVjxEc+6srFKR/
 37XeegFmvw0aO2h8qnw8LtB7tio/Jsgf+hrUJmOLsRiaking6zFURl7Wm1scIwwkTr6z
 tHfDLyKjwDbJObCKlNtX2cx2Vw0elVuKg5wgXzlQBI6q8oIvw5h5lAIqdcKzYJ+BSmQf
 nRXGw1zgrpPrK7iPw+bbWP1DVP/zAuZAd3uULBFUmd36GbUyFL+pMBjtePpCjV9TJrZ6
 2xSSoD5DWpefRMC5dr05RHndZZEcnHTotMmaNjlpY1K0Czg+/09LEoht54V5WKdN3TUk
 UIXw==
X-Gm-Message-State: ANoB5pl+hRtEFYkRo+pCvOxMTTerfs2eQ5+PJhBamBiYMrKxn1VZUiN/
 KmQtyLc72DYjQkDzDm+y6QxFng==
X-Google-Smtp-Source: AA0mqf69gi2tQR9aBLCUz9azAEFIH0hbuGn9WAjHGko/R2B+a4Gqgt2JoRfRWtg7+JlcT2aKX43k2w==
X-Received: by 2002:a05:6512:12d1:b0:4b5:869f:420a with SMTP id
 p17-20020a05651212d100b004b5869f420amr3049175lfg.353.1670460901051; 
 Wed, 07 Dec 2022 16:55:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:55:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  8 Dec 2022 02:54:56 +0200
Message-Id: <20221208005458.328196-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/4] dt-bindings: display/msm: add
 SoC-specific compats to qcom, mdp5.yaml
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

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml       | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..a7a97a4c46b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,24 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+            # msm8998 should either use old single-string compat or new
+            # qcom,msm8998-dpu
+              - qcom,apq8084-mdp5
+              - qcom,msm8916-mdp5
+              - qcom,msm8917-mdp5
+              - qcom,msm8953-mdp5
+              - qcom,msm8974-mdp5
+              - qcom,msm8976-mdp5
+              - qcom,msm8994-mdp5
+              - qcom,msm8996-mdp5
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
-- 
2.35.1

