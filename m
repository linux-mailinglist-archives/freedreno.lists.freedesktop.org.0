Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B096520C0
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8E710E3E3;
	Tue, 20 Dec 2022 12:37:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95C110E3C3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so8656619wms.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=b1dMW0eG8mZGJmDlBetQlxHLiE0Qn+BOZ4Yiqj2P2HY+eeZyTVUkuaE9LI8wTW0/R7
 d11X33T1puXL3C3ciUi56+uJqJbDYt2Lp63iU/wK7LnZkO4s8oUNzjkwTVKXgZb7S+lh
 1NRzK2rR78GrDsXIc24rLm0nmOFQbJ3UNzO0znW+RcUv+exmqAieDdV1DbWDKu++mqp/
 /yntMXb1LdvBWeS9i1UBamyFe7bWXrf6BW2/UrzrfknK8XRc2leCR4hIWMnM7Jx+Ka6B
 R91j/xBLSl70E9b1RZ10Hd6kwYsFTDbK8MMyKReEbBRE8U/ByM1cTESbDKYNbOVWxgTl
 BzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=YVav5uvzAAXEZnBJ4YFnpxt4k1GJqNd8DABmF+Oe14jTunOUEo6mawAgeCwJtxTIDt
 JigdvpL80FlCU/pVx+rCHfBAG5l2wHiN8FHtJn5J58FQN04i2IFwZTZK7iYcyO8ulWVb
 E1HU4yzf64Znpz2s9oovdVRW2wT5UaShOSfyrAKiafCflhSGwKnerIIiBtVUSFnLBydB
 PFLIwu5AkimA9SNDQ2pGACvJtA2SJtDFRDAt6Y2566EqF/ze4O5Kw0qn82oXUPiUQi+J
 ZiIjnq0ehqur3M0t97GKM8I6e7y9ZrjmGIxJysyaAWInBjoHyyNe1MA9lKIzbj+551Z9
 5jzQ==
X-Gm-Message-State: ANoB5pnuz0MAVxe3+PelZkbmebtQgaCNZ/zY1edawVpW0gvbnNpVwixm
 dDVRT51PExn3OgSINrEfyDGUsg==
X-Google-Smtp-Source: AA0mqf6iHwbVHyEvGsTvVxs6wi0sc9SsG8Enzu0jPcef+MYUCXf6kyphBF1kj3CaYio4HGgb2Wwkgg==
X-Received: by 2002:a7b:c005:0:b0:3c6:e63d:fcfc with SMTP id
 c5-20020a7bc005000000b003c6e63dfcfcmr37476117wmb.35.1671539818399; 
 Tue, 20 Dec 2022 04:36:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:58 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:31 +0000
Message-Id: <20221220123634.382970-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 18/21] arm64: dts: qcom: sdm630: Add compat
 qcom, sdm660-dsi-ctrl
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

The sdm630 can use the sdm660 mdss-dsi-ctrl compat. Currently it has the
same set of binding dependencies as sdm660.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27c..8b9c7421bc0c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1572,7 +1572,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm660-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

