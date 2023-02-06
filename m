Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39068B365
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239CD10E30E;
	Mon,  6 Feb 2023 00:27:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B758D10E306
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hx15so29772172ejc.11
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzeGxqTBPrxIjG9qLHd24E7JXaEtDXkcFzdjyXT/GCk=;
 b=eE9SLWV2ykCJ8v5iDYB1hYfJWQCbMBoDwIeOpgmYvCMtNFzBt8i205Z+y2MYOgf444
 +dqQmfycMVaEdWOwdejbI+KfTU/8pw0sv5yVVtwLRX145Fi2yJPQpzKi4JYwy6rSF3dQ
 TPczFm0XuCcCUvp9GGELUS8+x0kcSiWvkZP0FiJlIMhRsztVIMboQI8/NKnIy/HDlo1T
 HIrHw5gkktqUa2fA3xtAhGIKadUnn4xDOFcrg9m2DbwVPL7p66boF3/XZ4IZDEp3DxXP
 1x49AfLBR0earQw9JYYumcdw5sAeHERtls3zGvgNtfgwDEUgx0TStSAcBwZi9x95bLyn
 Qk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzeGxqTBPrxIjG9qLHd24E7JXaEtDXkcFzdjyXT/GCk=;
 b=3V3A0+dhdsEjRWQG7cLVWwDK1rFzvJVrmPT7CV53eYA8S5d5/BNyaWALu+IgzCiZ1X
 G0Fzp39takBxuDQM5aOUKI8gcjYm5KM1cVj5Wov+79JIFlUOerHMj+ejDlnovlo0obCb
 WjPwaJoI+imulae6QBmmDD6j6+R6r9vWtFqe5lzuy/mh8z360fG9sjdWFCnlaRWfDMue
 5FPVPFvt/8+G6kda8EATkKDaMaDF265Y8Gd4BIpJ267V7YneiZDZQhWA00iE3Gc4gije
 DQ8El4A76mx3TAwxJiyE4VyQRIb6L+98aLWHHn45SyLUFct0x1j+mvPG/SWv5LJAqWqy
 1gdA==
X-Gm-Message-State: AO0yUKVO804JL0THKs91r0mVrAdtYa5C2kbCg22u8+P/E/Va51VN1NVJ
 vCbHKEQLAsOu5luezktucCyOsA==
X-Google-Smtp-Source: AK7set8WlWMJw+yd+Unjs+G1EZDnFySmQ3golVXex5VTLnEsm6Z1RQmBE8wOgQIWTD5n789DSdfeTg==
X-Received: by 2002:a17:906:a893:b0:884:c45f:1c04 with SMTP id
 ha19-20020a170906a89300b00884c45f1c04mr18247069ejb.2.1675643265252; 
 Sun, 05 Feb 2023 16:27:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:32 +0200
Message-Id: <20230206002735.2736935-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/8] arm64: dts: qcom: sm8350: move more nodes
 to correct place
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Continue ordering DT nodes. Move RNG, UFS, system NoC and SLPI nodes
to the proper position.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 314 +++++++++++++--------------
 1 file changed, 157 insertions(+), 157 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 061aa3fec1c4..c327dc925793 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1423,6 +1423,13 @@ spi13: spi@a94000 {
 			};
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
@@ -1643,18 +1650,76 @@ pcie1_phy: phy@1c0f000 {
 			status = "disabled";
 		};
 
-		lpass_ag_noc: interconnect@3c40000 {
-			compatible = "qcom,sm8350-lpass-ag-noc";
-			reg = <0 0x03c40000 0 0xf080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+			status = "disabled";
 		};
 
-		compute_noc: interconnect@a0c0000 {
-			compatible = "qcom,sm8350-compute-noc";
-			reg = <0 0x0a0c0000 0 0xa180>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1c4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x188>,
+				      <0 0x01d87600 0 0x200>,
+				      <0 0x01d87c00 0 0x200>,
+				      <0 0x01d87800 0 0x188>,
+				      <0 0x01d87a00 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		ipa: ipa@1e40000 {
@@ -1702,6 +1767,13 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		lpass_ag_noc: interconnect@3c40000 {
+			compatible = "qcom,sm8350-lpass-ag-noc";
+			reg = <0 0x03c40000 0 0xf080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8350-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x4040>;
@@ -1744,6 +1816,74 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		slpi: remoteproc@5c00000 {
+			compatible = "qcom,sm8350-slpi-pas";
+			reg = <0 0x05c00000 0 0x4000>;
+
+			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_slpi_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_slpi_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0541 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0542 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0543 0x0>;
+						/* note: shared-cb = <4> in downstream */
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -2014,153 +2154,6 @@ qup_i2c19_default: qup-i2c19-default-state {
 			};
 		};
 
-		rng: rng@10d3000 {
-			compatible = "qcom,prng-ee";
-			reg = <0 0x010d3000 0 0x1000>;
-			clocks = <&rpmhcc RPMH_HWKM_CLK>;
-			clock-names = "core";
-		};
-
-		ufs_mem_hc: ufshc@1d84000 {
-			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
-				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-
-			power-domains = <&gcc UFS_PHY_GDSC>;
-
-			iommus = <&apps_smmu 0xe0 0x0>;
-
-			clock-names =
-				"core_clk",
-				"bus_aggr_clk",
-				"iface_clk",
-				"core_clk_unipro",
-				"ref_clk",
-				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
-			clocks =
-				<&gcc GCC_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_UFS_PHY_AHB_CLK>,
-				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
-			status = "disabled";
-		};
-
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			status = "disabled";
-
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
-		};
-
-		slpi: remoteproc@5c00000 {
-			compatible = "qcom,sm8350-slpi-pas";
-			reg = <0 0x05c00000 0 0x4000>;
-
-			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SM8350_LCX>,
-					<&rpmhpd SM8350_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			memory-region = <&pil_slpi_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_slpi_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_SLPI
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "slpi";
-				qcom,remote-pid = <3>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "sdsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x0541 0x0>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x0542 0x0>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x0543 0x0>;
-						/* note: shared-cb = <4> in downstream */
-					};
-				};
-			};
-		};
-
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2309,6 +2302,13 @@ system-cache-controller@9200000 {
 			reg-names = "llcc_base", "llcc_broadcast_base";
 		};
 
+		compute_noc: interconnect@a0c0000 {
+			compatible = "qcom,sm8350-compute-noc";
+			reg = <0 0x0a0c0000 0 0xa180>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-- 
2.39.1

