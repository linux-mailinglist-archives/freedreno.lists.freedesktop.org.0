Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F65669129
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3AE10E9B4;
	Fri, 13 Jan 2023 08:37:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465010E9B3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m6so32084804lfj.11
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBWElJ3IO67Fk9CmbUWfHwt0KiBiWiS5gZEar60mfps=;
 b=g/+yuEL6fT4FmzQHSpsjF7hhcrvpH76maUTxBOx85ZRxdMFI+OoBFWsWvvXvmk+2+q
 axfl5cWEgQ8i5nzIaAZum4hgGIN2FOzdtTZpETk7ZQnM3LYcVcy6TfUj+oV0QfpA2057
 ZNFGgeR2pb+qxuLqUbry3ggfcOizkomPTx5J8R7EqE1Rq5dUGhT91mX7cbnArnau4vBg
 3RyLsOqGq/Eof9HonFjOxJpXYGK5U0QTRNtQzjA9YTdxjO3CS8czWlSbbkByGnmkVMtb
 VQbyHU5nqGlPW8a5eDbQfKmt/iACi8huK8+fjLASgJeAVER/iFc4yTL0yuh66vTRRL9w
 3//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBWElJ3IO67Fk9CmbUWfHwt0KiBiWiS5gZEar60mfps=;
 b=TxXxwuSYZB9zcGcoOWsgZPYAEEgfWZ0ZmIczEUn2IATqav9yalf0wbhq48DnXevrI4
 up8PeEmYSPD7cEKOAB581JHVodEVLfee4t344syMo8eiDXgTQhV5y+ifQ8fOvG6b8+Sb
 lz+JIPFBPQBjnqce6eHDExtRjhbFqqO+5nSCtaspBTvr3q0wN3CRhAehws1xNzcbGzHZ
 QElHPk4fW5s2fnxoOZhbp6hSuhQN0myiVTI5MnQJlwwkyo//NVrgU1yipOShXoKDH+Rc
 4+nXGjeMVTVYNf1gCZ9WeKaVw/IkIlySBPEDy/QZJsAq2GELfnkE1ticGhP6yH98tjti
 bwag==
X-Gm-Message-State: AFqh2kobA+j33k+eI5ASY4ec6jS5tZF0ezV0pzfqD80sLiMkpFU8hdGW
 I9PfkjUQzLEOOMrKYrClFFRYYg==
X-Google-Smtp-Source: AMrXdXvhqdjho1hb0ITp61WnfeZYyLq21vI1S0xY0BraWfvdnKrO+ElBFknIu3FOaap+8aeu0jMcZA==
X-Received: by 2002:a05:6512:400d:b0:4cc:79ed:782b with SMTP id
 br13-20020a056512400d00b004cc79ed782bmr7668534lfb.19.1673599045576; 
 Fri, 13 Jan 2023 00:37:25 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:11 +0200
Message-Id: <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 02/11] dt-bindings: display/msm: add
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
 .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
 .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index ba0460268731..dcde34ffc8d0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -88,7 +88,11 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdp5
+        oneOf:
+          - const: qcom,mdp5
+          - items:
+              - {}
+              - const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.39.0

