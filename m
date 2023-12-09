Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C033180B775
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87210E312;
	Sat,  9 Dec 2023 23:21:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE7C10E301
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso39877031fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164097; x=1702768897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=iog8TygZMw0xth45OUVRd0peMRD6KxLFYwuwUTE80WK93UAEMjNjDP8AvJQ4ilR1gF
 Xx3WfBQ952lTllTSTQ4D4ANdF0DCTn8KFGEx8Ft3PuRMWuZmk1N4pFuyCYYoy8NwNp4p
 XAS0lJFH8c/qbfzjs2qcsq15+Br/PISBsu2VKcjK0oed36RO36S2HQgQR+TupY7Erxob
 9EP11SXx23OUk2wqN/JdHGa9bAlwos2/56YoZXWS5fIsRksuQoPt0J/VmBgEVD9uGtvp
 6Y1ghFjdC0nFmc0hex1rU32Cyolf9p9j3ogqOJms1pTtOI4kvaFeMVrFPRXh9geDRo8L
 qVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164097; x=1702768897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=gFDKZHjaHlS1E1VPsbeftqC8f5mUQIsezYTUQpZU8EcF5iEelq0SYVxTHs59DkztHr
 GMLff2GnCzGkHWJN82n0sB2zOkl2E2Fdi56IW0+PxgBD1McbncPS3BnE/Dvu6N15gbu/
 G8VpoHnTij5nBePax7sw0uusTict1nhjU0QwMEomEdA+fsmTbPDN+Lz/U1YKyXMQFSIN
 GWhw2iLRYLzgMbuGVDwG5yJBKC2s7wC/aZBi9uopUXKnfaQ8/EmDiv7m7MW2moX2es+6
 f/va76xsYS/SqqHswYyoX5CXDqc259IZAfwngKzxhfgryoW/n709XWTf6kv9FSjypx60
 nchA==
X-Gm-Message-State: AOJu0YxeIEPWm/EmJtSism7x/TqO99APcZ8Ow/SNCrfjgFRU2Hpklgd5
 VGH1aLVmOh5375Iiiv1Pgd/JLA==
X-Google-Smtp-Source: AGHT+IEsH7bZJ6NHHzSz3PIsREQmGftXVyk/tvGr+e/b2ZwOpkBLf5rJNw7/z2UcN923vKRyJVZd+g==
X-Received: by 2002:a05:651c:9:b0:2c9:ec10:2e24 with SMTP id
 n9-20020a05651c000900b002c9ec102e24mr372894lja.214.1702164097093; 
 Sat, 09 Dec 2023 15:21:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/9] arm64: dts: qcom: sm8150-hdk: enable HDMI output
Date: Sun, 10 Dec 2023 02:21:27 +0300
Message-Id: <20231209232132.3580045-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
bridge, enabling HDMI output on this board. While adding the display
resources, also drop the headless ("amd,imageon") compat string from the
GPU node, since the board now has output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 128 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bb161b536da4..6a036f9ba1c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -54,6 +54,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
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
 };
 
 &apps_rsc {
@@ -359,12 +370,112 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>;
+
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
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
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
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p875>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p875>;
 	status = "okay";
 };
 
@@ -402,6 +513,13 @@ &remoteproc_slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <126 4>;
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio9";
+		function = "gpio";
+		bias-disable;
+	};
+
 };
 
 &uart2 {
-- 
2.39.2

