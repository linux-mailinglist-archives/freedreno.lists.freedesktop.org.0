Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37B638A3B
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EE10E76A;
	Fri, 25 Nov 2022 12:37:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D5710E756
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso6277536wmb.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=fJJR4QeEbYbrdwi9ZTqdfFKUfYSWnqAF9EsGpW+uixxx2zbe9q7zL6OjmJDVxo0hMd
 myn/rr/7wFhiBZK6cB5qCvfGKPEZtb+sRmw126yZDnQwCxANmo0Oh+U4EFrSdp2x1iJl
 7UiEwCOzYCrdFXVbEvP3xmPo1LlYddEPa5BeLWNC9uN/Y07gDn6T4APWzdU6VnfYkl/f
 YgnnPFhlo1K9NH8gc2xdQABhjJNkSIaSJfI/SIzJ2kJp9bvf6WpqooO4PqFuUwijSl9Q
 Q0SX1O6YKPIDBWjYNc1F6gMZPbKITblTsOBUf+xzeu3d7iIVmmGvDKCQTPUOmu5Py1nl
 rrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=MaAQrbfMi4+jsZQpI4Z6rCLjalcpDZOCVXEBiWNCgLBdSO241JGxNE8Spq9Oti3Klh
 OjD1SEepwt7QZECrL+BdGTbzpZyJSF1DEt10r/ZEKqAfVY8vxchkWjCRGXw/uy4rHGiB
 NRnIIGTA1cg+BcMBPxXIbKzU8tG6a74ltvjAsTP1J4ZboUDq5lVtF3bH0rfTt9BDjhHc
 h9bloTsALQ28UTzmZcHBBgl1/uAtOwyzigSRh4cQvFPwFoHMJ0mFc+WbZlPGwHpYQDit
 pLoS0VGF1pTih/RIUAocrfihgXdbiYHccABKKtkXvspLEQZluzNGBAI5qG4fLy6pwntX
 hbWQ==
X-Gm-Message-State: ANoB5ple8LXosIHklcgzcI8e0n4fZbS5kiWeqgWtoTkuunc/jFzuVXnk
 wuwagsqfB2ojv10jBnEP6XcHJw==
X-Google-Smtp-Source: AA0mqf4C+BIzB93Y+GyJoAW9Q84AZU7HlHwF5CeORzNqfFwZ5t3SbSpe4RxDy89uLI7h+t3HQNpsJw==
X-Received: by 2002:a1c:f216:0:b0:3c6:c2ae:278b with SMTP id
 s22-20020a1cf216000000b003c6c2ae278bmr27105879wmc.127.1669379817884; 
 Fri, 25 Nov 2022 04:36:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:33 +0000
Message-Id: <20221125123638.823261-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 13/18] arm64: dts: qcom: sc7180: Add compat
 qcom, sc7180-dsi-ctrl
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d2c374e9d8c03..cfe44afc52b4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2985,7 +2985,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

