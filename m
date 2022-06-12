Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89154BBED
	for <lists+freedreno@lfdr.de>; Tue, 14 Jun 2022 22:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF82112CDB;
	Tue, 14 Jun 2022 20:39:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52078112048
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 20:39:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b7so11044118ljr.6
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 13:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:dkim-signature:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding
 :precedence:list-id;
 bh=l6+9ZTA4NfiekIYNRKfiluGK4YOH8TKijejH4GAAsfI=;
 b=l9BtQAH6i+Sw9iEsXCPLUdRTR6+ei7kUaTtilwQJ9Pqt4JqtrE+ojDrrSaEsfd/1mQ
 K3GLKprmI/8515YwfltLuwwWJU+rsGxdwvnla3H0X3O3XgkLmm2Oy6CWdoakTWTihqC3
 6Trj8ikHZ52rRcFtWzEJoLRRc1KcQjusY+mpv+hAUfOspFi+O7udONnipnwUkmZxZVv4
 9KT9xuWcrPVklx2yvUbeDCzhHLQLkZpjgP0mkldg8i7caZ3fGOCeFEuh/jrpTezUsRHF
 vIW9HEMepKt2ePGol5lUctlQ2R3o7ZdwzczbHaP8ns+YMc/QOl7+7WnbWB0+CHXoX/w/
 QQpg==
X-Gm-Message-State: AJIora+5Ig0EZ+pqziXY8bKJ79+9LiS0zCyVvSu1dW8KX/baAiqKC//W
 5qRsiZK15Za1eajUwrxGadY/gXrTCU4T6PMd
X-Google-Smtp-Source: AGRyM1s4aEy4Uih89bqqO/IOgwP3krYFBxrUbk9PMDIy3WKnDBEq7nJaCn/AWNHLDyRVqtDIz/fS8g==
X-Received: by 2002:a2e:94cc:0:b0:24f:81d:15f3 with SMTP id
 r12-20020a2e94cc000000b0024f081d15f3mr3482448ljh.407.1655239159326; 
 Tue, 14 Jun 2022 13:39:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ac25311000000b00479395286ffsm1518209lfh.107.2022.06.14.13.39.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:39:18 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Tue, 14 Jun 2022 23:39:12 +0300
Resent-Message-ID: <Yqjx8OGduONbNKQD@eriador.lumag.spb.ru>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a0c:e047:0:0:0:0:0 with SMTP id y7csp635128qvk;
 Sun, 12 Jun 2022 02:22:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1811:b0:51b:fec8:be7b with SMTP id
 y17-20020a056a00181100b0051bfec8be7bmr40508827pfa.22.1655025765620; 
 Sun, 12 Jun 2022 02:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655025765; cv=none;
 d=google.com; s=arc-20160816;
 b=UxKyaGpf9VKsF1kXZudnk3xwhA4dRPslES37fV3KEQ5S5FkD162zRrXC6U9ysPaBeF
 ljgIkbvl3zn0rsX9dVIlGJvRjM689vh77F2lQFPZ2YbBO7tr8zUtZMYoKW72Pq8dHnvy
 qgwwSYEzl4IsmaxCa/z6eA6noDdDu//DGiKFpbd8YLo+4kUWfaccYS74TZWDSMKQbAmm
 9f9vuBrMpV1ZJB/xDLLFgQBtLdpNhj2dsyrw278ghA/LVkIUPje8scZwVXOgVz9bN3Xt
 44PhyIZaibHiO4SkpMVzRywsiBh22rxYccrWYiWEkfWtLE8fKmldfCKXcSgInJulwkUE
 NxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature;
 bh=l6+9ZTA4NfiekIYNRKfiluGK4YOH8TKijejH4GAAsfI=;
 b=UF0PO2JvfhuQFXomnlNYqME92QUCEtyInJxLx6ecrzeoW8w5AwxwpRSq+uLZuxM1Fs
 W6/hG+2TAQLf1gJFLI5hPDHwTiAgLb6a7t+soe9DFThEFlhzkC5txujYF33fiOz/pXrl
 DvaSDq50aJF/kM9Epd8adXlQZyHHL+vI1/wfm/KIWFwTT+nrtimOxJkdHeU/xeuGEz6Y
 M7lSv4w6ZQlEMdCOIyHpZGdd1V527BaLEJP2Ctb9PGPMNDuY/tlURAbrr9l3b9re4BSE
 OcBZGajPICA/BS8NfUDNNfN8KCBhyd8EFyOlP35PJoLnaDYThPbDpcP6/7+vIAtof+JG
 Md7Q==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=fail header.i=@z3ntu.xyz header.s=z3ntu header.b=u7aChQ+d;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=z3ntu.xyz
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 d6-20020a170902aa8600b00167895fb8f1si5335387plr.137.2022.06.12.02.22.45; 
 Sun, 12 Jun 2022 02:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S235713AbiFLJWl (ORCPT <rfc822;abel.vesa@linaro.org> + 14 others);
 Sun, 12 Jun 2022 05:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S235656AbiFLJWh (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Sun, 12 Jun 2022 05:22:37 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9749764BC3;
 Sun, 12 Jun 2022 02:22:36 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0A71DCD397;
 Sun, 12 Jun 2022 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1655025755; bh=DueHZ3+zM2/Qwe9kIKCDxZ1igDp5Qcx1FY11oo7Whr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=u7aChQ+dnHhcfwfQzPX5GVU1tYrEINnm356zguq+OtJ746BF0imJ4+QVu95ObLpIs
 tSLVnmoO9puOi35TX934KmInj83JmTuV5iMaBzRdzAL1MjdTNbYhKjtBEgfBPza0zu
 BkfrPpHg5MB2jvx4MG1pwCotzimWrTgiRS1f7Ehs=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Date: Sun, 12 Jun 2022 11:22:16 +0200
Message-Id: <20220612092218.424809-5-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612092218.424809-1-luca@z3ntu.xyz>
References: <20220612092218.424809-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH v2 4/4] arm64: dts: qcom: msm8953: add MDSS
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

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes from v1:
- disable nodes by default, thanks Dmitry!
- enable iommu for mdp

 arch/arm64/boot/dts/qcom/msm8953.dtsi | 208 ++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 961db3e23ee4..c7373c845f41 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -726,6 +726,214 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
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
+			status = "disabled";
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
+				iommus = <&apps_iommu 0x15>;
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
+				status = "disabled";
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
+
+				status = "disabled";
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
 		apps_iommu: iommu@1e00000 {
 			compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v1";
 			ranges  = <0 0x1e20000 0x20000>;
-- 
2.36.1

