Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92599619744
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003710E758;
	Fri,  4 Nov 2022 13:14:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BDA10E756
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u2so6302684ljl.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
 b=cexTu/LwfVUpWlSdlSLDgE4GFfg/djgwgRyKeGrqIN8mtolRgv3UF4yX7RfKlRb3rR
 DTLbwGvOtm8A4obZzAxRJGHoYhKU0EYUnW9RSi6FTXr5VS+0VK1KdkRBw4nf1a1DB29j
 kGsrI0cqmImzNzLmVEaLQl+LIWGeKFpWuLj0/6m6XJg2B8BSyKH02gImud3SequMf9QO
 ///lHGUvjAcCNZLj8zbuJ5ht1QyJgXU/vwrWymLnFq2CWvPyr0DoI+80LdgtRzBFylAP
 MW+XdTjterdFG6R1tOcXeKUTh7s1lEo8Nh6xQimaJrvP8R4WrgQDW5E/KqJrqBO7WyEo
 PB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
 b=5lW/Hvspuy0eSyjv+AiOt7q3v48Jq9lI3zHwpyTt5rXmkAUy9BO70C8vRKSSr14Ni6
 fjNfbIkV0NNsWBYbMJBSseWDSbAn02Q68NMgqVTn3ZTt+MmnJaP0VvYZMBotSh6vtS4T
 uQp/F2kEh4EGRjy9jAQkd8DdKA3Ed+hcMM0MkHnFpIFUSt1mFSbsWMt+3zpe/DDsbWO5
 Hky/HaiZHyeskP2A9BH7M8arYuHtoX3vwKu8/NMzuQEfcqjM4bAdVRoQfw2oK72OiBph
 eRIEfBbnSEonRW/TYx12zFC+wKDoWDaQikDx0SbDq0Lw+DWruU6aqrJoLF/n+lnwY4Rw
 dx2A==
X-Gm-Message-State: ACrzQf0Jii8lQE1k8PgttvxgNWyQhtzf6bG0Bp3VinUSa+kpk1S2EkNl
 aAoykx5b49o7DPByUr2evVi49w==
X-Google-Smtp-Source: AMsMyM5VwoYUrsY1mgVbYrFymCEiknDJJHc0p6AbopTAAL3arUhx0ALhD5G5mbHBL0p2Ccfrpq6ehQ==
X-Received: by 2002:a05:651c:2104:b0:277:4656:2c95 with SMTP id
 a4-20020a05651c210400b0027746562c95mr2036784ljq.440.1667567645337; 
 Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:13:58 +0300
Message-Id: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9522dd29a38a..f37f226e9b11 100644
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
@@ -389,6 +400,26 @@ lt9611_codec: hdmi-bridge@2b {
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
+		};
 	};
 };
 
@@ -512,9 +543,23 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&dispcc {
+	status = "okay";
+};
+
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
+
 };
 
 &dsi0_phy {
-- 
2.35.1

