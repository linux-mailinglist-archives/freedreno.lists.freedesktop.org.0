Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A703649B37
	for <lists+freedreno@lfdr.de>; Mon, 12 Dec 2022 10:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0A10E187;
	Mon, 12 Dec 2022 09:33:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E482C10E182
 for <freedreno@lists.freedesktop.org>; Mon, 12 Dec 2022 09:33:23 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h10so11858510ljk.11
 for <freedreno@lists.freedesktop.org>; Mon, 12 Dec 2022 01:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xN1LN8Q13bIGioRmVa1bu9PkrPkTjKd3uyYwlIhvFvM=;
 b=sqRK+DUkBbboDM1xjUfhDcSMwMKw02FtrsEce4gvw5gmTle3/0c9mxjQHV7PqlKoLl
 0v+vN217H4gyG8YsjgJ2cKFTqhAEfm3VWyT8+PfMioubEPTLg5sMT/AwwGLWKhwfshaW
 MCupofIq/FZlQy71E5aiWAYHNH2MEQomPzYAy2ej+Yh2yIp8yKxhYP+g2xuYGoTom0jn
 qgD7KNRquiT9Kepl6r/zsZTLSaMdU6E2orkB1fBOqhwL301cUQAcFUv/Q2KhWQd7tgCi
 DWBdnuCZAtekT30+1fbqKD4UtQs932L6pCcKWYjruqVryy/+M/TjEPTYJ9RfhnytCOmc
 rZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xN1LN8Q13bIGioRmVa1bu9PkrPkTjKd3uyYwlIhvFvM=;
 b=r3fJbTf0WL3oxRVzM7ph/20fIa5Z63io3JYBGngF/T1NZsJ5JisRXCzzezTGTsR7/+
 mjNxeyu+n9oQD/1+nq6yzZCEuibiV4PG8lOgDW3yOSKqg0StUBbTkqjnxlf8FG522Ke0
 hAbn/YBADRexlvjoxJhw78QW4tRGKV/aMwFqp7tveWtnKIN3EeMFDyjuxQiwNq9B0I8/
 x6uSI+IPOcqvs1gA1DZgSmckqwyeVvlNQYETudVvJYHSDOd/X3pm7vmCmakyefDvxZWZ
 cXCSTpXJO4LLFPmyXLxVaiMIguFL65Flt0iVevYeJkdZfPZCMLBbUjb6RNCCJrGWiO1x
 41eg==
X-Gm-Message-State: ANoB5pmyHWKhO5ZPNAMnhvM78je4nzVICjAb3w7Lb0IUP2XfGqdHPzAn
 p+ZT6VSiNW9xrlNFkewTwIhYug==
X-Google-Smtp-Source: AA0mqf49ZV1sY4WXZX15jqMsuI6ytLu7nqTx7I4CfWaxDkFNza9Q3mIexZm4mXJmXQyUbItioe+ZbQ==
X-Received: by 2002:a2e:be28:0:b0:26f:db35:2e96 with SMTP id
 z40-20020a2ebe28000000b0026fdb352e96mr7090008ljq.8.1670837601793; 
 Mon, 12 Dec 2022 01:33:21 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl.
 [83.9.1.44]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05651c106200b002770fb5722fsm1155081ljm.123.2022.12.12.01.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 01:33:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Mon, 12 Dec 2022 10:33:13 +0100
Message-Id: <20221212093315.11390-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093315.11390-1-konrad.dybcio@linaro.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Years after the SoC support has been added, it's high time for it to
get dispcc going. Add the node to ensure that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..ff04397777f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8150-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8150_MMCX>;
+			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x400>;
-- 
2.38.1

