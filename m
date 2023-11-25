Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F527F8B78
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9751010E381;
	Sat, 25 Nov 2023 14:18:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20E10E381
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:18:15 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a011e9bf336so390905366b.3
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921893; x=1701526693; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YptWvF1sLLHvvXfICRwlDYacILHWf1Qs1ovKRND9MmY=;
 b=Q632C8mvqE4q/sh/GhKQYPc4J9rJqym+rh8ei2PlQLkWRgypb/hxnQtpEQ0sw0AO2R
 ccj+987JPh+6H9SwdkS642ef0I3Ig7Tal1GpCeGI50NcP4Sqr9I5uYSXz/rLLYcJe3Ev
 Ca1xLFG46XkkWWVo2pm4yqFSwDVjRDRLyzB23ApQ0/5YGPe/UVhizvCrxcwxC+d9JgIp
 0cvcheyBvyV6S9tyZzRCOmckA6a7cJfTRU9l8z+QoqRKJp0nHGWSkrK8SadLnVPNmHmK
 FMSprQJiXejujwVrBI+vzEtIB2FSfAwU9Pw/K/iKdu0eCPQJaI9EI4E6bXkoaqcBIce4
 IcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921893; x=1701526693;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YptWvF1sLLHvvXfICRwlDYacILHWf1Qs1ovKRND9MmY=;
 b=nn/PQll21bIYY1ddF3YizrPi/XpYvCndWF1IumykHdeMEc7vznsGtKrC+s1r1gdUuV
 Uik7/jZRqgtTwzrHtpJlvhDirlu/WMmDuMWhHcIV/b6wAiwqoWK4zXvZCvr477PARa/D
 Y5rphQuW8Ruaam/jfzCGCICknPFyEM84g2Mvysfu7G5hlq+XqVHqByQzYnDQgoEGmeiN
 kwmhYi/XfFJJ5Kj74eBR3oWr5cxO0S49xUOxzq701Jz2XSFbA4xBN8968xhAWzgBQGL1
 fXXd6deIwhFVX0qlZyUvbbAbK2tex88EptAyfCHp4hNdAncPQeQILSx8iBzrd2VxIEal
 WwxQ==
X-Gm-Message-State: AOJu0Ywh8r0q0mzhHZGtgJUGGc1w7v2x84dVHUzboYYAP2JXWqle3Yms
 vvlwgfkagu56ieN3CsVJRLyD0A==
X-Google-Smtp-Source: AGHT+IEveIKy8lS1XIRID2ri9B1I/5i3oOMUuCvPc3WfqFNEUFa6T6wVRX6iLxNL8g8XxcnkIOK5Vw==
X-Received: by 2002:a17:906:5195:b0:a03:9a89:5aaf with SMTP id
 y21-20020a170906519500b00a039a895aafmr4262215ejk.6.1700921893233; 
 Sat, 25 Nov 2023 06:18:13 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:18:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-11-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1186;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JMbrDi2bxn7DXN0vpomcpuwaGp6goPBlt7d60Jxny0w=;
 b=Ow4Ll9242Yv5Y/KsoduODHlhgumTpa99uBnKCbAyWQYNOkJS+/6FFM3xsPWfMjhds1Cgj/BkR
 MwrWiH7RB7lDoCaSaSob+BAKLUxzTFGSFHjKebDh3bFYbzY/x1JMPJx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 11/12] arm64: dts: qcom: qrb2210-rb1: Enable CAN
 bus controller
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

Enable the Microchip mcp2518fd hosted on the SPI5 bus.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index ac6584164058..ac597eb3fe9d 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -23,6 +23,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk40M: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -449,6 +457,20 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&clk40M>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vdc_5v>;
+		xceiver-supply = <&vdc_5v>;
+	};
+};
+
 &tlmm {
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio41";

-- 
2.43.0

