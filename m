Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2A671257
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E2F10E668;
	Wed, 18 Jan 2023 04:12:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34CC10E668
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id v6so37255691ejg.6
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
 b=HnMtNU4Y8dkcp72PJN26efwS6aMQk0M30koPe6RBIgDg9Q+6WF+95IATz1M8FvE03K
 HaEslUbJIvBfgSy+xl4dMJ9N+Zus439odBrmdXF73gfx+PfdXohykJahlEfg20Tv/uxo
 8qHH+bk0t1S9phZFhC2R1TitG2M0g8YFLOTgWGuSuUpd73UYxVDp5xA1eAZc2MvxeihJ
 aWfAXqg+MOF00/7bBjDxWmmcRMnH+97ADBKZaCCEHRCpp0w5AzBk6zaiOAmNHXuxK2ns
 WQTtdKgEUlwy5ALxpn0zsLI9zKZFPh0vhRufSo9BzdhQhhABlb/U71EUIj1vgLWH3GQT
 LM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
 b=peUPYwrpUTo2HNG/YrP05ef5OpjMgxmjgasItA0t3/A/N74XVNkGqdhCqXUVqqhv/V
 bUoZjc5ohxjmXpYU5MmQC979fyH1l/Dg6J2sKBRp1FHcWMbuV7/eW5Gh95VH07yVT8Fe
 PoI2bV7RKkMUc1VzXXNInnLrvjXiXnaRvfzOLeQc4ScdYjITpu/OMrOfcWjmEo3QZpMC
 F32UT8WrLEmNDHqpO+tS8o3npSx6ZHZrmVEYKagEcKRgE0ENWF2u4GAORengp9VYmQDi
 aIhV8C8M3RHKkxZ2gLSqUCAZuBO81uZOTzuxpLvF6c1yjqRM9VDqvN0k6v04IxCh62EG
 a+tA==
X-Gm-Message-State: AFqh2krl3ML2UEYrvWJ1kAArt0umwIxyv1P2JxvDxPjTq/ppF73qCDxz
 JzkO/wc66JrKYGoKkYJprT3ZZg==
X-Google-Smtp-Source: AMrXdXsS5MGtLfe/3lDjhg6BD1CRnNYyo8jZwtVgfKoSIPFG+TmSJn/SOyLf1YcMgbL3Ax8ssAnIPQ==
X-Received: by 2002:a17:907:2096:b0:7c1:2075:199a with SMTP id
 pv22-20020a170907209600b007c12075199amr5586276ejb.76.1674015169276; 
 Tue, 17 Jan 2023 20:12:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:35 +0200
Message-Id: <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 03/11] dt-bindings: display/msm: add core
 clock to the mdss bindings
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

Add (optional) core clock to the mdss bindings to let the MDSS driver
access hardware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 32 +++++++++++++------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index d09842db3825..461cb13c7092 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -44,18 +44,30 @@ properties:
       The MDSS power domain provided by GCC
 
   clocks:
-    minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    oneOf:
+      - minItems: 3
+        items:
+          - description: Display abh clock
+          - description: Display axi clock
+          - description: Display vsync clock
+          - description: Display core clock
+      - minItems: 1
+        items:
+          - description: Display abh clock
+          - description: Display core clock
 
   clock-names:
-    minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    oneOf:
+      - minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+      - minItems: 1
+        items:
+          - const: iface
+          - const: core
 
   "#address-cells":
     const: 1
-- 
2.39.0

