Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAF547006
	for <lists+freedreno@lfdr.de>; Sat, 11 Jun 2022 01:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFCA11AC22;
	Fri, 10 Jun 2022 23:34:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7A811AC20
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 23:34:23 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d19so645178lji.10
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 16:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:dkim-signature:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding
 :precedence:list-id;
 bh=g1Ej6y7L50WC3StUsgb3mizk2vkH0x2OGyJaXI8sZ5o=;
 b=THCwkAu0d0kyy9kok+L9tWc7l9/gxtPZ0wxZlQ3INjPD/6AHF0oxNbeXErSMybTV7W
 4MvY+wQD17BU/KJZs7LT9wY3WTYqUGc3WILq5G0/chAzVVc4F7vg0WccT46UCNGoKYif
 TLUNM/mor/iRKV3jNDcZn3hrQ28Xvia2yBfQLqY+XK1ZhzaqAt1LtzFaOT1HnHUJ7IGT
 BDYbzRKlxI7Sg3/gu00blstqeXlUNjHKp7utlUGyDWSbD5KZj5Ptcxceae6NNt1XUaw2
 mH8ZvlCOAVt1Afi6CJo8yEP4LgOl89A2qbuaQQn5zyaHyvsTEu5mAdci5MDakm2VQ+eT
 7knQ==
X-Gm-Message-State: AOAM531oHYqY6t+JfX/vkgohu7hr+KqZzttxDiJjQhFleGaRulkmCpCk
 f0ZnjcdR4OGXlR0GGmOWfh0jr9eNBhOkQkEX
X-Google-Smtp-Source: ABdhPJyXoqzY18fpgXEYPD51trvV29fMpdLHWFZzmhopV8BA/Lp4IuXXt0a/BqhrkAxaLvfrGJxn8w==
X-Received: by 2002:a2e:a238:0:b0:255:ad6f:24d7 with SMTP id
 i24-20020a2ea238000000b00255ad6f24d7mr10879568ljm.481.1654904061023; 
 Fri, 10 Jun 2022 16:34:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a056512200f00b0047255d210f4sm39269lfb.35.2022.06.10.16.34.20
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 16:34:20 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Sat, 11 Jun 2022 02:34:18 +0300
Resent-Message-ID: <YqPU+tSA42VeqSXo@eriador.lumag.spb.ru>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a0c:e047:0:0:0:0:0 with SMTP id y7csp553197qvk;
 Fri, 10 Jun 2022 15:53:21 -0700 (PDT)
X-Received: by 2002:a17:906:d9d9:b0:710:f2ae:b455 with SMTP id
 qk25-20020a170906d9d900b00710f2aeb455mr31265635ejb.77.1654901600993; 
 Fri, 10 Jun 2022 15:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654901600; cv=none;
 d=google.com; s=arc-20160816;
 b=nYPSTuMq0jfWfTd6H1UQAW8+ZxST8+1ftPtuwAkidqv4BRCYH7s6KgomdRh10soBGr
 ALTOfGRHrPQ5HtUyb9V+AQPVPBJ5A4RkgQvcLrz0czzJzYeKE7vSt6155z+s5mrh03/n
 EOZ6aKnsD8GcSXKJMw+010GtWTYvHhUBhF3Y3FqhWkDJLYqC2sSHgunMXXYvt31fGurT
 Uskxi8caOA22NHdNrYwJ8D1zHKnL4tPJpAVGQ+UCK8nsr1vuXrxNCOFaNZjvqcuB6zp+
 8YIZqxn3/TdaSu3qJH/355pFQzQXrSa5MbqaVd9w9tek+VE3YG/++2NO06NMhPepb+OH
 kuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature;
 bh=g1Ej6y7L50WC3StUsgb3mizk2vkH0x2OGyJaXI8sZ5o=;
 b=uo4nRwJnpNdBfJ36jY8ba9DuVx1QvtUeicuEFGf373UUuRcH9SVQOHvLyQNw9BLhRF
 C5envJsBDcSloD0dV+xPrgRdnu0PRwVCVUw9hN0jAvCxf1Knl0gPOH76V905e0Il8opY
 HBKENiaD61PO//3UdPcf1x3DU+hLIdl+WGCIAPQl9SmPP8QUwBnrQHLKjTOoZoLZfMU0
 SDAnnVdSAmdqKwCQK8/Ei2zW7XrFFY+/FG170xPphC+qjlyfqKxB/6E3inUo0OC/zUPF
 jjOlTt50LB5Forses5gHa3lJsQ35fq7Xq9MqUKAAGuZadgrWBihSlKTs+hho6G4Bhlsn
 RKKg==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=fail header.i=@z3ntu.xyz header.s=z3ntu header.b=Bju+T6rI;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=z3ntu.xyz
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 g20-20020a056402425400b0042ad03b5aacsi589036edb.5.2022.06.10.15.53.20; 
 Fri, 10 Jun 2022 15:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S243284AbiFJWxT (ORCPT <rfc822;abel.vesa@linaro.org> + 14 others);
 Fri, 10 Jun 2022 18:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S232323AbiFJWxS (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Fri, 10 Jun 2022 18:53:18 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EA013D6E;
 Fri, 10 Jun 2022 15:53:16 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4346ECD3E6;
 Fri, 10 Jun 2022 22:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1654901594; bh=juMgCw/nmNxQ3b7/bs0cS2U1BmqwcY93GEJ6mlprFdw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Bju+T6rInwzSBW3ypILRrq1fy+s/+nHgTYsNA4rnuiEvWnUihurQbkJT/V8ofaNwn
 83De5atAk0X3IYG2NdtfhsG5j3fpIBtzvvEC+j/Ze/qY0HZRkwjmJjUZgKU5doM1oD
 LiBoCO1wwEodN25ig/mIGiUlXlQkznQIt+ulMh3M=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Date: Sat, 11 Jun 2022 00:53:03 +0200
Message-Id: <20220610225304.267508-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610225304.267508-1-luca@z3ntu.xyz>
References: <20220610225304.267508-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH 2/2] arm64: dts: qcom: msm8953: add MDSS
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 Andy Gross <agross@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add the MDSS, MDP and DSI nodes that are found on msm8953 SoC.

IOMMU is not added because support for it isn't yet upstream and MDSS
works fine without IOMMU on 8953.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 202 ++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index ffc3ec2cd3bc..a2aca3d05899 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -726,6 +726,208 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
 			reg = <0x193f044 0x4>;
 		};
 
+		mdss: mdss@1a00000 {
+			compatible = "qcom,mdss";
+
+			reg = <0x1a00000 0x1000>,
+			      <0x1ab0000 0x1040>;
+			reg-names = "mdss_phys",
+				    "vbif_phys";
+
+			power-domains = <&gcc MDSS_GDSC>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@1a01000 {
+				compatible = "qcom,mdp5";
+				reg = <0x1a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				power-domains = <&gcc MDSS_GDSC>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				// iommus = <&apps_iommu 0xc00 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@1a94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x1a94000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
+						  <&gcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>,
+							 <&dsi0_phy 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				phys = <&dsi0_phy>;
+				phy-names = "dsi";
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
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi0_phy: dsi-phy@1a94400 {
+				compatible = "qcom,dsi-phy-14nm-8953";
+				reg = <0x1a94400 0x100>,
+				      <0x1a94500 0x300>,
+				      <0x1a94800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
+			};
+
+			dsi1: dsi@1a96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x1a96000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
+						  <&gcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>,
+							 <&dsi1_phy 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi";
+
+				status = "disabled";
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
+			dsi1_phy: dsi-phy@1a96400 {
+				compatible = "qcom,dsi-phy-14nm-8953";
+				reg = <0x1a96400 0x100>,
+				      <0x1a96500 0x300>,
+				      <0x1a96800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x200f000 0x1000>,
-- 
2.36.1

