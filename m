Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C822569A9FE
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 12:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567B210EF6B;
	Fri, 17 Feb 2023 11:13:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43D10E03A
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 11:13:23 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y29so956144lfj.12
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 03:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hs8Yxp1MVlT0I86oaYY4unW9sTOxwBrv4kqwbTUdvms=;
 b=CGC563MdG5ZK3KHRue7aFJyu4Qnz5uziqhEbG4CsGGHsvLQEojFDL7WA+mLIDUIYhi
 /bFndr3aVqCYYfFvbp+nWjTxYHkp7/r35T07SX4F/p4FWasT9dOMUFDg4Xda1dglXy9F
 PGC48gU7jQdiXLtBlm/U1tejAbRSQIc1GcusXhTSmWJKO8lKbCu7lygQFsA8EkqWasQi
 kmjY8YfAwEoSxdNE0+et+Pr2zriuPlpXO5w5ps4Kd7jerOZ53+45+96+CffC/ZoAyniQ
 GupQVFTR6ctOzUXuh0LryBWoof8+SpejsVhrH8XshLe3J5gkEaNape3WO0jJwMLagK/q
 fxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hs8Yxp1MVlT0I86oaYY4unW9sTOxwBrv4kqwbTUdvms=;
 b=tNOCb3an9Pw9J5NlweNCcSB3BcZVB69lUt4XH1mN/3hCnfaE3WRGlw2/vmA5VjpOO9
 aTOyn7BtP7pi09CGZjss/8PJ5vyLhpX2JOB6gDI37w6YYsNUpwQdGKHfkILS56LWLU1t
 oUPQsJCaQbFh57bV4gfD//P9OkMoMW0dxEXCmxqxSXY3VA6xHYqU9mGV2ikpqVSBBB9e
 FX8szfKWjjWjaC20ex3JQ00G/z/f552R++iAVnWGg5vZJBmtrtxn03ECBNcAnneHg7s2
 xwu2NaXcvMf0Cf674pm1U1cPsrVX89HtAeK8ndRhNjtFCGWry0jWo/QxL7AD9ZGDi82z
 4cFA==
X-Gm-Message-State: AO0yUKVtfZrJzO+Wlq73QoCaBa5u3eDgpL965pKZXWZLmZw9oSgZCxnw
 50J4DfLv0spDlXcgRWsWnjSpbw==
X-Google-Smtp-Source: AK7set8ZhdFUqbXhgL08rWxQqCGaftiy0CrErLGx8HogZOY2K9jf5KtkaFsV9HvhIdLZFYbGXK9viA==
X-Received: by 2002:a19:5202:0:b0:4cb:430b:c6b with SMTP id
 m2-20020a195202000000b004cb430b0c6bmr172623lfb.29.1676632401630; 
 Fri, 17 Feb 2023 03:13:21 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac250cb000000b004b564e1a4e0sm642683lfm.76.2023.02.17.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:13:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Fri, 17 Feb 2023 12:13:16 +0100
Message-Id: <20230217111316.306241-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217111316.306241-1-konrad.dybcio@linaro.org>
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm: sm6115-mdss:
 Fix DSI compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the DSI autodetection is bound to work correctly on 6115 now,
switch to using the correct per-SoC + generic fallback compatible
combo.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on (and should have been a part of):

https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

v1 -> v2:
- Deprecate the old compatible instead of removing it (Krzysztof)

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..6fd1703e415f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding with separate driver logic, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
-- 
2.39.1

