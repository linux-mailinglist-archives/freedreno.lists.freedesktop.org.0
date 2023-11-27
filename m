Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639177FA4A5
	for <lists+freedreno@lfdr.de>; Mon, 27 Nov 2023 16:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E33D10E38C;
	Mon, 27 Nov 2023 15:29:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BE110E37F
 for <freedreno@lists.freedesktop.org>; Mon, 27 Nov 2023 15:29:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54af1daf6a9so5861784a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Nov 2023 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098964; x=1701703764; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c6/lhVmHX/sXs0e46ClnnLz5Erfr7PRCNkXawgtymt8=;
 b=YxZZuR7TMK0Rd2wcPT/ZCa3Q201JdpaYftVbUaEqFIuYUXPMEKUKbkLy+KrSfr61yX
 W+DrArlxTjFItHoS/eZSNVneOdV5h1MWNvjGyH59Icm/0Nl/vT5CI/H5wDRwe5DaKWoi
 kP8UGZqCbJlKLX7dxMHLYN+zgjhGQ/tjUKMBMfnyDqfSdNaB6miumcp/je95BLEKl1p7
 nyLqXTQC1MXGqcPQll/PZvXmYN+7tar7HNtO0YVX2WSvh0XYdUXJZW/TZwnOdm6QpX9B
 It65PQ3XLFD8qD5bEv9cNVEuWRsHyMETRATdOrZtavkO926jwhg3xswpbvHmq282fJSL
 1NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098964; x=1701703764;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6/lhVmHX/sXs0e46ClnnLz5Erfr7PRCNkXawgtymt8=;
 b=NCh+Xmy7/A59J8hWsj+6jXp9YlSuPrgtk+D3wEGyfI2m7UAnc/bK+1056zXZ0TSeSb
 BFjDGVJAg19Z2hdfgUngcEa8IiIm0Xzmnc76hMDhW16O9X9m36fsa6L6invgLhAcEKKW
 hdDebsmYZjTUjUNBihIAI03KYVw65QEq+sY1+7pYiEtRRAg+rAMnpS+KOBFF4PMV77P5
 GG5o7ydsU8G5pkt+wlSqCtue3fCiLIlvSYTMe8DbAT4z9o1N43gsa+r4/FdpTQlAmVgU
 SA16lbNAzLJ8K5aLRNZ7FYoiQZ18TRiDo76tgu/Jg84F+M1AEHQP/3/KV7V2jduNn46l
 1Gxw==
X-Gm-Message-State: AOJu0Yw+w/SbdnW+nq6umDA1/j4EItTaNbg+iS7iFVPGNwFSGykyht2z
 q7AmgPDNxCSwpJul9ikOVQjiIQ==
X-Google-Smtp-Source: AGHT+IE12MRZ+K4+7Ya9XYiXHy8f8LRtqIz85wDPP5rtzWUU+R4ruteNN5riVPicBCMiZlt8klaJfQ==
X-Received: by 2002:aa7:c401:0:b0:54b:3bba:8372 with SMTP id
 j1-20020aa7c401000000b0054b3bba8372mr5621717edq.5.1701098964534; 
 Mon, 27 Nov 2023 07:29:24 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:29:24 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-10-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=2344;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HG+qKKvGUGteXhS1Efd/CaFsVpJbWzVwdo27Zc2OxfM=;
 b=bScEiiVF7H6OgG93/bEfiiBpKcPZrN5AKqa/34nrmj67oU8vvcbgzuavBX+sO/7vUBhqlFj4Q
 H4dnTJ831zLC3QqIiTvg8eNp9DXstc5E1AfZnn/Y3db9beLHUlgcQ+X
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 10/12] arm64: dts: qcom: qrb2210-rb1: Set up
 HDMI
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the required nodes to support display output via the HDMI port.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 86 ++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 94885b9c21c8..ac6584164058 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -40,6 +40,17 @@ key-volume-up {
 		};
 	};
 
+	hdmi-connector {
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
 	leds {
 		compatible = "gpio-leds";
 
@@ -158,6 +169,68 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+		interrupts-extended = <&tlmm 46 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_hdmi_out_1p2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-names = "default";
+		#sound-dai-cells = <1>;
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
+	vdda-supply = <&pm2250_l5>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm2250_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -377,6 +450,19 @@ &sdhc_2 {
 };
 
 &tlmm {
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio41";
+		function = "gpio";
+		input-disable;
+		output-high;
+	};
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio46";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sd_det_in_on: sd-det-in-on-state {
 		pins = "gpio88";
 		function = "gpio";

-- 
2.43.0

