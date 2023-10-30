Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE607DB836
	for <lists+freedreno@lfdr.de>; Mon, 30 Oct 2023 11:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F72D10E292;
	Mon, 30 Oct 2023 10:36:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103DD10E290
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507cee17b00so6157713e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662204; x=1699267004; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/4+eh4kuDYlM+0XoOFl1j21GXPiGzFQcZ1jyrcn8Ob0=;
 b=fQxlUIc+z2DC2h3uNx+0HoOA+PIa2HRj/ZuvKEuBAwoKvio7JJbXI0/TKnvu161f+f
 vNRkih/JpRBi2X36Yb/3DR23erkfxmK8A7YM/nBH3oG/0XWy9Bdh2ChqF8rl7tWZGTPS
 yEmGQKYBtUt9WjJDj+DIRBCM4fSVyWc0EVx9wX6O9fo+nx3EMktGFJhL5bNaCT1L9QlB
 CygwVsOWXK0X1Av3yY2iICbqx7tZKhF3AfbWDVPj3gbnbe49O3zP5Fe2On66JoiO328V
 yGE1mtn8xuGMkJeoYYl/9FJtZBGANJ9WJ60WZNYxkZbHzbZKoPn1GEYWLlUTAu3y2Gle
 w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662204; x=1699267004;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4+eh4kuDYlM+0XoOFl1j21GXPiGzFQcZ1jyrcn8Ob0=;
 b=VkjMnuyAwGsLP22mYhe606YngNNfNa9fFq88xTUj9hTJH8oYg1Pw5QiTNEiKFCn6rX
 8/kfGWn85XHfj8dDyGWvYSPLDoAOS9MfmIATSKrJ2uG07Immg2CzHh1nfHGROTswdqDe
 INud1WuzMZvULjK8kJPJMKh/HotcEPNAfXMS7Vtrsxj4p3K4pYrCBzQxYmBHmlO5GSPy
 N69aRoWfD6fDp9HEFbbHQlYZCycjByQ7/XogL70JntpGw9gr4/aha0H8rYKTxULMgkue
 mw1DhqCWR+vj8PgTZkZtRwZU6jmRZr7anT/j/K0/c5djHoDwynOXwfvJyAka89CG4Ol+
 8OJQ==
X-Gm-Message-State: AOJu0YwhjVqXeXQ+oZxLg9Ufepw3j9X0YyJJWO+YX9dDK1YjAmmVOlCd
 4L/DNIDKiVRu0vrXkIst/FWkgA==
X-Google-Smtp-Source: AGHT+IEGVqS4uBQs7Hw9muJEQ3nUCcWEPHRVACdpa5VFhl/0qtWKcas+HfqqFi17wdBt63lJA02IpQ==
X-Received: by 2002:a05:6512:1323:b0:500:c292:e44e with SMTP id
 x35-20020a056512132300b00500c292e44emr1937739lfu.54.1698662204156; 
 Mon, 30 Oct 2023 03:36:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-1-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=815;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OnxXDntwlDGC0O778vMV/1raM0wE4XEonnITvW0QgTg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c2aGxS0U5Ah+TIDzr6R44jBG5iqvXQWoDEG8RF
 ie8kz06JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNgAKCRB33NvayMhJ0Y84D/
 wOLJD1bdmKRgnGkL1btpWYk2/qN2eino/ju7Djdxyil88vqlZ/C/EVo6DzR+Zofdbrdge2PJN0J8I+
 STBVVgTJjC6CSTb3Br2t67OdW0OOkzV4uFusPMtvFR09u4Ra6C2S5F6qNBk9TOpR2Z7o6fTu3wuflp
 Vb9+MC9fPJCn6fjDtXCq6A702uGswZZMhYHatu7Wwz3TjS3MkcllTBs6SUL+Nzv6kjQX6N2bhReQ1h
 JT3yyLDi/jugzzTUQDsilTS1UXusAw1NbHhM+C66e9BwqezEbwTpqhjtOfMIGlJEt4mvHIdrcFi7Em
 DUPUGXvf+Y1+BsgJh7q9Lk9BOJ19wKA5+PrW85Ep9SZWAOWQgIrtjHEvneKVa1w6TUsa5x1tVuKNZO
 h2VWFvKWnUdJjInhMkBrGmTNIs06s2u0NhtYRZYDz3Tgl62qws/nLq8kf3VX/AdfPhZKaaRxE0j75O
 hECfLfa3ByxasP4Bl1oAp+PSFW65XjwAa0oOfGHko1vDCZNL/C0nxEhqa1SZGYySiiQuhoWG/Dia7R
 k/cwahyL5audoDI8msJ+PDytTFa78lo+KNs2rBLtZRBZcwlAqn00gvei/KMY5Jw0ghHTwTgi528jVZ
 GgxbrH8q0fJF5yBypUQoyHIdBre/pqv958DDwfbT2xdkJ70HwFHiIkn9RXwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 1/8] dt-bindings: display: msm-dsi-phy-7nm:
 document the SM8650 DSI PHY
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the DSI PHY on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index dd6619555a12..7e764eac3ef3 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
+      - qcom,sm8650-dsi-phy-4nm
 
   reg:
     items:

-- 
2.34.1

