Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B2A661B94
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 01:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CDC10E235;
	Mon,  9 Jan 2023 00:38:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3B610E22C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 00:38:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j17so10652738lfr.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 16:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7tzbbXtIcdAwZoC6yIOfhpW+r6dBpbZgfIckXUFSvw=;
 b=D4WGmG+HaScJg1C0el9OtztTyWDt5JuNx8u5i5obN51oiXeoIbw1hgf216nB5OlPQj
 jTG+Bdc8n7dKeQcOimJME2R6VPYRV07sS42gwuponbLAeV6cPrJb8Hriy4PlvOD0oA3/
 CkcboR5MG7FzBnwQh0l0Mq5QrdNEysfdttyE40tqsr4+5plLNL1kVCtpsOx4+J/NWs7R
 e4rK9WulDqvXXF1iSGeeXHv/oOLwcEML+8aKKjkIrH4iC7xgR1SrpOK2aL8oBKWuIxYt
 K/sK2y0djGAdvSjAub2Jh/u7Zo9ayeKyTX9FDoW6EQo0n5YtSXUAt56KGpmK7Xv1cpFv
 7L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7tzbbXtIcdAwZoC6yIOfhpW+r6dBpbZgfIckXUFSvw=;
 b=1r4B1jdF/ZTYk55SLRVydGVxprQNAm2auQMccMfslpjfQIFKCvv7sA8drA9i+AT2Na
 pPFuiv3GCfs1n/YqJjz9eGxy5tRtY3X0n+bfTp94ae8z6v5pRLd+OenOIPjtysqlj9ok
 o7NYLRYF52mT8kOZNslPGfKGwwLyzgVC1xcxuDjc2nLBYqThy3JjTkHO2RpuV/8bz7Ke
 nOrvWtYhNYtnXw7y0lrx8GPEHbeH6NsTtVjyj868QbljV7a1h7S4w0gHminOUcYor4ce
 UV2j9z96azZGID4CcV6BqLwhJrZqNU5iM+GujuC6dzMuvlj3FBgvwyFKRj9ANA0lhT2c
 YZmg==
X-Gm-Message-State: AFqh2kpCeueR29dTvKJdXO7DrantsmMx++5DXEJ+gn+UotwNATqw+85Y
 ayFNyElPbNnGFFT/rKmsxYGTCQ==
X-Google-Smtp-Source: AMrXdXt/9PmqRWev0nH5pp5ZiXqEVizMIvfXyeTLsR6rdshy74ZK24gyoTxXZwFOEqgySlPHqoOodA==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id
 u22-20020a05651206d600b004a468b9609bmr20697985lff.38.1673224702666; 
 Sun, 08 Jan 2023 16:38:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:38:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  9 Jan 2023 02:38:17 +0200
Message-Id: <20230109003819.245803-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/4] dt-bindings: display/msm: add
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms. For msm8998 list
qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
by either of the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml        | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..9d9da987572f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,23 @@ maintainers:
 
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
+              - qcom,msm8998-dpu
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
-- 
2.39.0

