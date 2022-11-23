Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB833636C0A
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 22:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CAA10E63A;
	Wed, 23 Nov 2022 21:07:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E3A10E630
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c1so29945405lfi.7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUjry175/VXbDzEgIWugKXjr4zqZnAeXXZOGs2AXa0I=;
 b=T4BAKSuEyY5uCf5CZ0zBMvhnHSy05rhs6sScc2Ivx9W585akn3FcyfwSWWPIDSggdX
 X/qjRxYQRa8bLbFrSDeQYBQ36YOIysexCtAJKkdXcY2V3jdiGT9924oV7HUN4fSpN9s7
 xAvYim7YmGb/hBaDOLXSYgGj+bdNaStkFj88M3oMYGeozjFOhMGrztAYmtEsuxq+wcbt
 jyMPq9Ox4yTSH8TepXsXXlRXwDMOW4cIpKboxBo7/KS95bmwAH48d6ZhMleyPECWBL0L
 LlIzJFMunAgaqSpholvi9DNf+QuKEV7PHfgAwiplNS89bR3RBRwuxn8hQoTQuKJuMCAW
 Raig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUjry175/VXbDzEgIWugKXjr4zqZnAeXXZOGs2AXa0I=;
 b=A1k98g7JKJ2TE8wfK7alVrpPr/miK+CEh4/KaRg21Q9Oa96fN+El9PYBw7YbWVyefc
 FIjzwLAYvX/nHAIHG0hvp5zqk+rLGIGzpgdCL1OIkIv2wZ1bHsC62RM6zDaj+BtWSQnN
 rAyH4Ipw1/ZK1tos3jcm7G8OY0ECh4Ld/zT6l1tpZcztk6uMAVyno3mAkgIHZv0u+5/v
 r9h12K1IRHImX/3T8Zn4ZmHdikNw0WrCa+wCWehzcP8EiXpWJq34jzXI7L3mIaPNrlR/
 h4QdKKm6hy2wKK/Gkoj1aLibmnq/Cmdq2T3L10AdqWy5UyknydN97iOkRS/M5nMFyKyW
 EevA==
X-Gm-Message-State: ANoB5pk67ck04lzUcNWWjPjHiN+h4hoeFykZL7TUqAH10tqcq9vRmzAv
 eUbC+/GOBzsYDlfB2MRXLkY0Lg==
X-Google-Smtp-Source: AA0mqf4j3RwA3yK169nrzO6jRDebpX6fs/sqaTF3eghnIIcerKsaShaIzlXOcMBjEpMqGJxWdQGZWg==
X-Received: by 2002:a19:435c:0:b0:4b0:38f1:1784 with SMTP id
 m28-20020a19435c000000b004b038f11784mr3321716lfj.335.1669237644530; 
 Wed, 23 Nov 2022 13:07:24 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 23:07:19 +0200
Message-Id: <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 4/5] arm64: dts: qcom: sm8450-hdk: Add
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the LT9611uxc DSI-HDMI bridge and supplies

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 75b7aecb7d8e..d1635c9de6f3 100644
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
@@ -353,6 +375,27 @@ &dispcc {
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
+
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -416,6 +459,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
@@ -431,6 +478,18 @@ &sdhc_2 {
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

