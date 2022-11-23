Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A748636C07
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 22:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC43910E638;
	Wed, 23 Nov 2022 21:07:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9DB89798
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g7so29983059lfv.5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPFkruvlU7zrVvNuMEiG7x7XIlavtbJemFv/UB71t34=;
 b=F6ODKLmGxaxZW6vrrJASjd7RYxvVoh0jxNIA8rLALctVGGE73TsNfN4AZPPnDev61q
 IjX72koFK2Ry33aDAItXV3x9eShK9V4E8P9ybkrW6C1Dg59p35V1Tw8sbbx4jzwvOyt4
 uZZS3KghlICehz6d7tEriFcQ6ifr/QS4sJo9ezP9JBdjRrrA8x2DVso/EhxgKObN8Bcp
 TuyYpLB0aUZAuKbLDtaplF0+CAct+HE7Xdbms3h3crc+jFe9z5Wbu6dTbmJwlqpotdO2
 C/beoA+C3ZLea5xXQWXum9nLcT2oJpxdmJCYCGQAtq2c/QDmr2zTeejGEMgRPRBXUp+g
 J6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPFkruvlU7zrVvNuMEiG7x7XIlavtbJemFv/UB71t34=;
 b=KZLw9154KTCkp7C0ZiAd6AKhIKxbpcPR0HQucEheAEHFin108FhG+fYBQAKxBRDa7L
 nsKmGiJ0sTJsRRJpMy0W2tV2IDboOYVCTBls5o2fNNbYxUQOb6AdNVDyBfWgVKwYvq1a
 p6TnXVoY+WMrBMOsz22Kt5JLm4QiixULsSrSpNstbP23dTd79DRaFjcnrBjWpDQFHGGl
 iGTYNHOjIgPHAkuGlCUsD88cRf6vUEqD46jQpf89tOEheTEJEHeoGE5TsURTsoZ3ZKNL
 Vvtsl+bB2K/fvTyY8+ywU4YlCqTWdgSIbEPyRwaRLzosI8ZdTkyzkg2f4lHfJJ614APr
 Z3ZA==
X-Gm-Message-State: ANoB5pk9IJBvPoaKol3sJXiwnNqW3EgCaPAjzXh+PKMeTMjO7GphNkS9
 /MPLM8aHPV1jggujNhWeK029+Q==
X-Google-Smtp-Source: AA0mqf5SBnxq9+i0brSVlopHzdm/rGVGjlMXO2yXI5bC57Mcjvqs5hb/nqZ4lNLNJSReLXCETX2SZQ==
X-Received: by 2002:a05:6512:1184:b0:4af:a588:e8bd with SMTP id
 g4-20020a056512118400b004afa588e8bdmr9672840lfr.173.1669237645436; 
 Wed, 23 Nov 2022 13:07:25 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 23:07:20 +0200
Message-Id: <20221123210720.3593671-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/5] arm64: dts: qcom: sm8450-hdk: Enable
 HDMI Display
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index d1635c9de6f3..01f65a0e3ca1 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -393,6 +404,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -405,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

