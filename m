Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFCB645123
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DEF10E167;
	Wed,  7 Dec 2022 01:28:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF1B10E167
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:08 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q7so19220653ljp.9
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9Bijc6xAvrurI7rmLzETeV+DVE/8v/b0T5kGTcy6SY=;
 b=K/t7Nful85ubYgrqzW2KWc0N3JPTcAhTIK8qpf7Ow4FABvU1hKsbiZ3WjSpimn8STp
 y46wTJ9Ud48OFa6JrD3HFKe68RkFxZL0u2wVvHx+sqVU4aKqtHh5tuHXnPJcg1unztpv
 waHJmV8P/YrcDNM2rOO/VGf5HyATK6KvtZj0fYIoRzRlW3fYUl0ReTBN9bGm3GNevFxT
 KX7lAvxr8TApC08ri/KW/X7OhZrgP9x1mwqHh3dwv4x15x2Dg4lfxOm5rRc3PyvQiL0O
 DWft+nr1tmewnRt266w491UqlrFA6gn6KTR3eDVqXzRqzmTyovwBT3PuNbvrnkI+UA1K
 1JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9Bijc6xAvrurI7rmLzETeV+DVE/8v/b0T5kGTcy6SY=;
 b=IRbuUNIAkXCzJhd0DX+6FGqJXtj9fpdg31/9PeCBs5fGxR5X1ODHzUBwGAgHGTpq5Z
 msUPxORgUqzSS5D42pJQGDfQCWRJ3jKXPsAIJ79FeCvN+h/+diCHFENoKqwUmNy0aDPB
 2NTIjUnx1hXBTyZxT39peLlr5LTC5gbcujT5bhFQQp47chDdF4C2d7U6Tm7WvfRfF1UX
 aoQFtNC5sE1Pjrwnkc/Q+naYamfK1xe4cyD0Ht3ci/yO4otF68EfLagSiRM9RfSuzcex
 lksly9Bz02+V/Ba6qwHurKxtEg79jrJ9ZpCK+i8rQYDltVKU9HGQwuuJQjgQRBkRwSLq
 b3TQ==
X-Gm-Message-State: ANoB5pk4/xtGqHihQIR9/pkbxZNcogAH46+IcFCqlE/MRFtq8riaItfH
 LUixuNnXNV0RjPHELKoOgRF8mA==
X-Google-Smtp-Source: AA0mqf7YNIryjZBfn8G3maAvd9s9XFKUXB75CCdK6j4CEaekf5vXUMrCPeVENaQ8fZOeCvDVzsla6g==
X-Received: by 2002:a2e:a810:0:b0:277:9e5:6cc8 with SMTP id
 l16-20020a2ea810000000b0027709e56cc8mr26130001ljq.105.1670376487850; 
 Tue, 06 Dec 2022 17:28:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:28:02 +0200
Message-Id: <20221207012803.114959-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 4/5] arm64: dts: qcom: sm8450-hdk: Add
 LT9611uxc HDMI bridge
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the LT9611uxc DSI-HDMI bridge and supplies

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 75b7aecb7d8e..4f345786352a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,28 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	lt9611_3v3: lt9611-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_3V3";
+
+		vin-supply = <&vreg_bob>;
+		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -353,6 +375,26 @@ &dispcc {
 	status = "okay";
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		interrupts-extended = <&tlmm 44 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -416,6 +458,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
@@ -431,6 +477,18 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio44";
+		function = "gpio";
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio107";
+		function = "gpio";
+		output-high;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio92";
 		function = "gpio";
-- 
2.35.1

