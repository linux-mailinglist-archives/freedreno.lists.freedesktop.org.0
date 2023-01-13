Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24581669125
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BCE10E9B3;
	Fri, 13 Jan 2023 08:37:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D3D10E9B4
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bf43so32116082lfb.6
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8TVxtJdg2h5XhTVxxFJGPtkt+HMuIyEWNXdD88o9m4=;
 b=WfLmaKYQeSGM9P6tgCLJkezq5ShsNyq9wnzM+A2likM44ed+GQUTQYYEBBoIu0t5P6
 uY8ochmFRZy29qcuZsochkJkS9vHL+BnKXA6FO35ossjWLEDrM7/dtVmIf94epwLlu0W
 X52Fj2LdxeMD00uBC+c0TxFMdA/i+eGac9D8GQKLaGWILayk9VzMclTF3Sn7yHeW04F1
 NafYhdiwGHm76sW2tdMk+77uDhjwCnIHgu4TcD3gnsJv9Dg0//+VfHpjEZB/c/NbT0QU
 ZT88012E52zl3ZQ7n/1wfuuwcekcFmeCtXwoNdP62AU/1tmcfOaPY0wxUTtU2DkMWzIV
 A1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8TVxtJdg2h5XhTVxxFJGPtkt+HMuIyEWNXdD88o9m4=;
 b=APnT7rzAoVNPIXPiv1YQI0BMsAvV60pIQsCOEXwir8kR4UdXkp4N4anAVxMMgBg8tg
 N3/Rck16nBrygRzDy0WAYn0cnm9qnZIbFXTk4798+QfF28A1X+2qgZPVhzqE9/VKG6T+
 D/t9XOkBgGXcZVT1VNTREdCOJhdf2QQDk6cDSJHOYx7/rUa17QZCb/UIpJ5cNR9MOo22
 UTpgz5hEUnQwgGJk06B1oukCYP3bJGIVnBq+HoctSG/M8BaEjkPqQVTpx7gl1ny7SzFU
 j/7omMoKTf1G8EP43zWEWE7B0V06yvGAZ6gAbS84+vXQ83NgHvSShhS0Ue/5SOurNjTc
 HQQQ==
X-Gm-Message-State: AFqh2ko/mP4Uoo+8cbb55+FwsbV278MUVO65WeWUXW8MLD5lruZtUK/q
 JzOlfUX2IOWi/9LL1GXWOrxpZG2mYhK6YGznWc4=
X-Google-Smtp-Source: AMrXdXtB2YEHCAdS50P4fV1zUDlLyBdhXucLwdD3JaKYcIdl+ECMK511wK8DblpGZs+KW/iRZpeBJg==
X-Received: by 2002:a19:f514:0:b0:4b5:61e8:8934 with SMTP id
 j20-20020a19f514000000b004b561e88934mr20438626lfb.64.1673599047061; 
 Fri, 13 Jan 2023 00:37:27 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:12 +0200
Message-Id: <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 03/11] dt-bindings: display/msm: add core
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
access harware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index dcde34ffc8d0..6948ae3ac7bc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -45,17 +45,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    maxItems: 4
 
   clock-names:
     minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    maxItems: 4
 
   "#address-cells":
     const: 1
@@ -69,6 +63,30 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
+
 required:
   - compatible
   - reg
-- 
2.39.0

