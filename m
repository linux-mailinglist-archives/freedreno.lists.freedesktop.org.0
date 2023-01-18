Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57306711C0
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B432E10E653;
	Wed, 18 Jan 2023 03:20:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A5D10E653
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:20:27 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mg12so7755702ejc.5
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
 b=Vrxm+BaKUW7drwnQMkZl0L5zgktqfdhc5QBgrqW4OhcWixP8Oa34SJU3K7L/ob7SGX
 ivySSdkdp6unYI9GRyCLh/AMyR57Aw1Nkr7eDZMSHB6yje+uGyz3A7DYbsCNmoiUT24z
 BaPaP3sb3tBI2VEyrehlMaGvlBd9/7cQzKfTK7NG/oH7sxk1tzWN7/uT4xKoAG2dk05u
 YdN0v3nNRXYLv+5rMQLCL+f7DaeU3NOLUCyt0uhXBoGPCiUE1wW43M3E/Z7KcAFXO+Om
 whnT0nXMUFIqY8aCBvCgZbqKUeEB2Xy0bZLwtVgqNGt4HiIHnN0gYn+JP2FP2iEvexLS
 ts+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
 b=GRCuf43dC9Q8iJmfU7MfYoTOhwwzrqg1sglwcbh29RvwKlzNxhUcnCj+CaDsseVdMY
 tKCIyIDCyYWU7YRmc4dOo1XKoBzNmxZK0lciN2/9v+e1FHTtexLehh8tcEV+mT1oWYHO
 pkULjWBVXEbjKHxwYiYFld3A5ufHlo3RI4YO/MzkZ+5q3BWc+YNFrXqBLRVOmwVsoIMa
 QYL0kZWqeC2q1dXAWOQ0xhA/r31ukaO5+zJ2JID4Kfm1w5JfHlG7dgdGF0+sDiJQErUa
 cZtz0f+Q+q0ZsQyB/BPCSKNsLkWjqJr/16y9d5jeQIkooFjNiF9ejOo3+sIdIoutE4oZ
 bkEg==
X-Gm-Message-State: AFqh2krXf9OHZqIKfo8NPlo2ABuw6qpFjKwIrZtTQnySqa0slACKrWXd
 V3kc4/Xlm6tP6T8RY7K2E2HQeg==
X-Google-Smtp-Source: AMrXdXsPlqnmJSh/9i3ssUfdZIrIq/56AHP8tZA7qU5AK5epPxuuKnYq5TUQHuvBHjMl8efcGuCF1Q==
X-Received: by 2002:a17:906:6a27:b0:872:8c97:db27 with SMTP id
 qw39-20020a1709066a2700b008728c97db27mr5499157ejc.69.1674012026448; 
 Tue, 17 Jan 2023 19:20:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hu16-20020a170907a09000b0086ffe8a00fdsm3766670ejc.84.2023.01.17.19.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:20:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:20:24 +0200
Message-Id: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] arm64: dts: qcom: sm8350: use qcom,
 sm8350-dsi-ctrl compatibles
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

Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
to follow the pending DSI bindings changes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 703ba3d81e82..a066566b6ea9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2883,7 +2883,7 @@ dpu_intf1_out: endpoint {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -2978,7 +2978,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

