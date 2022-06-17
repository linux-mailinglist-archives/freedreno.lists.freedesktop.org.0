Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A854F58A
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 12:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C211A9F8;
	Fri, 17 Jun 2022 10:36:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276211A9F9
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:55 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id l20so4329548lji.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K4qaTb66gTbZJWmfOsRm5JPLXRPUuGXdUkz0yonXfvM=;
 b=mI/dafrtFJcpC4E7BEP+LSW7tz+zSKId9sS9JikzpRHZanwP5fhlgJxaOvwLMfvhV2
 phBUA9FCh6rW0xyd1mboHWPW9NB6usE6rOyYJHs+luEpeNDC9C9JVaRZ08VJiOdRycxy
 qhzxpVRRg4bbnc5T+gte2TjZKbvC8fBe8WXzPwL8BvJAiVsTf223S1aDDSNDfvwxqMaz
 crl9A5OcuwH6n9e2vZa08aSkGd7Q4ZTahURZPssTnfRcdsEL8UAGo9+LrXY/Zhb5kVBq
 RBOSJZ89nfh20DL9g/7feQ86YGGtwl7swzZhbzQYr8UI1dOhACxa2Lp7vQ25jFvBErLH
 5SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K4qaTb66gTbZJWmfOsRm5JPLXRPUuGXdUkz0yonXfvM=;
 b=wCKEjImgxg028XfMaY+ircWYyQ9aHsyks33bFlE9HTH2Tll5OoPw73UinlvDj8z5xv
 O8DQd2q0VANtdys17BsoljtyBlR/vMUnDZLQIUdHlQcnjiztMgJlM3xPIvagrT7v0Hi/
 bCADLbul4kgwaezBlCdetZ+oueHa5Prtpo/Y9w3DmyJVz/0id8mMEomzR7YXzJ3vvVYA
 jocXY4RzymWZuYkEFP1AA/fBJIIr4PdMK6ILRcKVdSCxCwxRDRtQ0wbCZq7/Bu1Z/09z
 gyJWyTejPjOhVqu1FcwJ1UdvMYthMwbLNqsigAUmz6hDpW/+inzzsp094mYvSUnI+XqA
 R7qA==
X-Gm-Message-State: AJIora/W6kFaUBDSkn2fjPXnOqfhUSpse1sNIFofagRA/m6Nemwp1uFK
 HvIt35fGGTaJBHsAOwQTfBV6dT/gG8FhomzK
X-Google-Smtp-Source: AGRyM1uojpulIKQGH2iKjaTXZyyy4FI9fy9dyVoCR0/RMEN7Qc4N1lzJE41+w2pEQ2tzs8kXfnle/Q==
X-Received: by 2002:a05:651c:204c:b0:259:9146:e839 with SMTP id
 t12-20020a05651c204c00b002599146e839mr4704555ljo.138.1655462214103; 
 Fri, 17 Jun 2022 03:36:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 7-20020ac25f47000000b00477b624c0a8sm590011lfz.180.2022.06.17.03.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 17 Jun 2022 13:36:52 +0300
Message-Id: <20220617103652.606250-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] arm64: dts: qcom: msm8996: add second DSI
 interface
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add device nodes for the DSI1, second DSI interface found on
MSM8996/APQ8096 platforms. For example on db820c it is routed to the
secondary HS expansion connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 73 +++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f94f10947f26..dffb87a5ee74 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -831,6 +831,13 @@ mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -900,6 +907,72 @@ dsi0_phy: dsi-phy@994400 {
 				status = "disabled";
 			};
 
+			dsi1: dsi@996000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x00996000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_BYTE1_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>,
+					 <&mmcc MDSS_PCLK1_CLK>,
+					 <&mmcc MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "byte",
+					      "iface",
+					      "bus",
+					      "core_mmss",
+					      "pixel",
+					      "core";
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi";
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1_phy: dsi-phy@996400 {
+				compatible = "qcom,dsi-phy-14nm";
+				reg = <0x00996400 0x100>,
+				      <0x00996500 0x300>,
+				      <0x00996800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clock-names = "iface", "ref";
+				status = "disabled";
+			};
+
 			hdmi: hdmi-tx@9a0000 {
 				compatible = "qcom,hdmi-tx-8996";
 				reg =	<0x009a0000 0x50c>,
-- 
2.35.1

