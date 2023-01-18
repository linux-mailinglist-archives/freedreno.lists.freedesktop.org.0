Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D0671259
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6317810E669;
	Wed, 18 Jan 2023 04:12:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09310E669
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mg12so7933043ejc.5
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GIyuJnQD498muXVqSb8DedJYfl5A4JrvBcZkaYGB5JM=;
 b=YFkqeAcAiFVwaUiZH+QhFxq6iOrOnKPJoAaer4DjvNMBst6aMt3dhhhHxsq7wQlv67
 1c7z1wk+/VNMj2rIzHihNz0AYVleQbn3+l6UR7t+YhFe3uO/Qq/FCTRXmAeFIp2tRIeJ
 /J/Y7vYjdi6dHlzFd8/Vd1FWPSkVBYeq8/RoNj1BVYBiC8JCfO1y5eI87VDfe4va4xcT
 1n/O3e4SIvJY65eHCJDJ+RXIfYP71DsQ+R1QA2l9obBXJEyqGfCRxncP6m4hlRU4Fe9L
 sqhDEN4+EGfaR6Q/e+gOpiez8CfZHkirFglp2e0/tnpcUDcANEIQgaVhQaaj9tCKig+m
 2+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GIyuJnQD498muXVqSb8DedJYfl5A4JrvBcZkaYGB5JM=;
 b=0dOOBisnIPlMCo0JthCXH7gY68l0vFjf2p1xhhrf12MXFIYLvktbUV5HNlZT90iQ+Y
 hYYtHuvcnNQd7HNgxWtw9ePAFfnf0LRUkC47JIBPcRtsPyM5wzTHbK8U4CuECVwAiE3D
 SSClbzg8/bGNE/C3+Pohxreyj3srZqcIwKL0Jhk/c8GsHltzeJy1mKZaujAISWYfeB2z
 W/Tbyg1Wy3NUrpV8Jt3sZFJBK0W5dLdDd7y+G7bOiXf+oHGSksL2Lna7hl5dfglyPC3o
 mGnbVK0P3DFNuQ8e7ykc/X/gsW2fTcbV/6GxvHNZon3dxCdfltL6MzhpuGwrLChYLG3l
 Drew==
X-Gm-Message-State: AFqh2kqz6JNrbjuheldq5LqUblYb8riDRZevEdiSigp4zflv0Uc9Pq0r
 U39aLJrKSZUD0Y3ibq50iN+cgg==
X-Google-Smtp-Source: AMrXdXvOt533A3OI/xj5g7SBPehNuG3/BkHWvbsgSYiSiB203N2XrDqddr3Bqy8RqxrML0sx94UNaw==
X-Received: by 2002:a17:906:3e0f:b0:7c0:dac7:36ea with SMTP id
 k15-20020a1709063e0f00b007c0dac736eamr1335969eji.66.1674015168098; 
 Tue, 17 Jan 2023 20:12:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:34 +0200
Message-Id: <20230118041243.1720520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 02/11] dt-bindings: display/msm: add
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
 .../bindings/display/msm/qcom,mdss.yaml         |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 5e3cd7abf046..cb7bf48c3a58 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,22 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7479cd96fdec..d09842db3825 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -88,7 +88,8 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdp5
+        contains:
+          const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.39.0

