Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729FF6110CD
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5FA10E81C;
	Fri, 28 Oct 2022 12:08:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1B810E803
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y69so7568914ede.5
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nro0nHTMpy1mUmByNujQ3HWqymE/gqfVxOpFm6MkAlg=;
 b=HW5d2CcAgnJGaGDLx5MVUC++wgNlk+4j6ys+wvUFMQJQR3IFmRLdxoKNwrDlJjH3Vb
 wtBGekZ1y3x8cPg4GkAKKma5q6sNA+6yrP7UizBRsDVCxIuRDhGo3CAiyzupPHrcmTqu
 to+TtfdLCDKapZKzhsz4Lo85x5zOd4rg3oc1ZQvJN6Ne4Z/UksJdkrNFt7p2PAnTSw1g
 RRlULIfUadS2qDL5SbuF6knVNs9tEAMHPsOexfEOIVv0DyWfJ69QUac/aBDfj83wLUxi
 yZO8vpyAShCtAEokoPjo/YcqUuNqZxOzvOpK05ohvEEDzdOAKaqEr4vzH93droLLx2q8
 q7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nro0nHTMpy1mUmByNujQ3HWqymE/gqfVxOpFm6MkAlg=;
 b=Q0Vr68M3JYTp3Bizlh0RmxnTwh5SphBiD2l/l/4cSJN3nXx9MUNQ6nVbe0H0bCnszP
 MvHKFySk8qX1FQAFsZa38r0RP0ZTfk1zTemnzsHxoFnB3kHJPFdzMGfYIiPhrLtxIBPp
 cS/RgCVg2On8fZC+7MdmFuPINJb1dKyxnWiMaFUBrlveTwv6YUwRpmmOW83uij1L763L
 76JwAF+X2QIFJmnFU/Z0pOXu9YogvnLzXIgxaM7/WT36oT5y2dGXRDoxsnu2pK2BcRSP
 rosKwrG7wcayyV8C+2it80q0qWex5D8JRNbDgwgbMif6YnV8vkjd4GFHgTx3tLo3GWW4
 tmOQ==
X-Gm-Message-State: ACrzQf1YvL6mQsW0Wh45oJ3ke22kJDAoabTLV022gp1cLNugo3k/kjB3
 wQkGUDSzTNzzzMqHO8UzdsRfjQ==
X-Google-Smtp-Source: AMsMyM70uaL8wAMtl6+wtBpEnZXEqG6mBPqazj98CibBhVmcXVtzbqoSq0xADjpvZliUap6B25Mjrw==
X-Received: by 2002:a05:6402:5159:b0:462:3e9f:a0a4 with SMTP id
 n25-20020a056402515900b004623e9fa0a4mr14081184edd.313.1666958921698; 
 Fri, 28 Oct 2022 05:08:41 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:40 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Date: Fri, 28 Oct 2022 14:08:12 +0200
Message-Id: <20221028120812.339100-10-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable
 lt9611uxc dsi-hdmi bridge
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.

In order to toggle the board to enable the HDMI output,
switch #7 & #8 on the rightmost multi-switch package have
to be toggled to On.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 6e07feb4b3b2..6666b38b58f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	lt9611_1v2: lt9611-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	lt9611_3v3: lt9611-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_3V3";
+
+		vin-supply = <&vreg_bob>;
+		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &adsp {
@@ -220,6 +257,15 @@ &dispcc {
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l6b_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
 };
 
 &dsi0_phy  {
@@ -231,6 +277,48 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&i2c15 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+		status = "okay";
+
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
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
+
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -248,6 +336,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &slpi {
 	status = "okay";
 	firmware-name = "qcom/sm8350/slpi.mbn";
@@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
 		drive-strength = <2>;
 		output-low;
 	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio48";
+		function = "normal";
+
+		output-high;
+		input-disable;
+	};
+
+	lt9611_irq_pin: lt9611-irq {
+		pins = "gpio50";
+		function = "gpio";
+		bias-disable;
+	};
 };
-- 
2.34.1

