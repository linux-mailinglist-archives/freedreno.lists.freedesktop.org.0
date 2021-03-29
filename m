Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B834CF8E
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 14:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCFD6E400;
	Mon, 29 Mar 2021 12:01:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF036E400
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m12so17989986lfq.10
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Za3WAfwBQn5CB64f8uczux74fVXb0Y3lBUEXrhz1In0=;
 b=gOVs1Qg5jxqVjvbB1dL4XeliN7Umgx2BmvIcGEGk+aqxaWQ8IYeIONbfcCVXvGyw0G
 Mql/vEuEq+/BAVOeKt+ftMMUlLAk1T8moHbn473oIu/n+AK5MykF7pwHPGwK+RMZxsAB
 G5SyU/EFuOscIDC6zt5WceesYqfsrjpwzfiTRxFtQojIb0DBtvW/dVdpEP4gDrugschL
 oUfI695c0jAb25MvhuK9Uy0F/3MN6XDDxSV0BBkHXSqioeRpckf8bHVkD3exDgFYMenL
 lkNj6/LTmavc01xLvkbHXRRjXtEPSNjiI+XMhg7OjzZsZebu9YdwKQ9uoSLUyjmtfAA0
 uqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Za3WAfwBQn5CB64f8uczux74fVXb0Y3lBUEXrhz1In0=;
 b=cc5T3bsWdCfLG4QnDD7K74GIBIiga3iVK+y1xbW+0Yrac/BcO98ZeWK256DqCGUG3t
 selti3dUsFMGSmaHPpGW7/DUMTGEINYF0ReXpJvSs3/Ek9yFjM5OZvpKmTPNShBq6SoN
 yp1ehPKn2ThtOXfxfUu5hK01gFEy3NCzRI0UqlP7uQacIUOFWPmMr+YuK0e9Fb/OuVyT
 IZzRKnSACA6wM5fTVR4N8T117q2osJcxhR9MMxsvHoxaPO7GNzxfLOsqNHQ6YsE1hok4
 JRknDdGwh7fWZQnV6dsh36mOcsO84UOpf9XG5jtIdRdyvS6zpfZoNWyEl03wtbOJpnLJ
 Wohw==
X-Gm-Message-State: AOAM531+P3AuIgCGcPWYg8HKjBkcWxN7KBb1z5gl2k4LiYOVkUdAE556
 6MQ9TmOPgCAF6XXAu1f8zTVTCQ==
X-Google-Smtp-Source: ABdhPJy0iFeUUIiWAXivUm9466cQaaBmV/h5zJ2kWH4R1YJ2r/1HiavyeTSWFvYvloEFlPgvxHM16w==
X-Received: by 2002:a19:224d:: with SMTP id i74mr16390665lfi.224.1617019259451; 
 Mon, 29 Mar 2021 05:00:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:00:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Mar 2021 15:00:48 +0300
Message-Id: <20210329120051.3401567-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 1/4] arm64: dts: qcom: sm8250: fix display
 nodes
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Jonathan Marek <jonathan@marek.ca>

Apply these fixes to the newly added sm8250 display ndoes
 - Remove "notused" interconnect (which apparently was blindly copied from
   my old patches)
 - Use dispcc node example from dt-bindings, removing clocks which aren't
   documented or used by the driver and fixing the region size.

Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[DB: compatibility changes split into separate patch]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..32f0d6a82457 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2327,10 +2327,9 @@ mdss: mdss@ae00000 {
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>,
-					<&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+			interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
 					<&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
-			interconnect-names = "notused", "mdp0-mem", "mdp1-mem";
+			interconnect-names = "mdp0-mem", "mdp1-mem";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
@@ -2580,7 +2579,7 @@ opp-358000000 {
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
-			reg = <0 0x0af00000 0 0x20000>;
+			reg = <0 0x0af00000 0 0x10000>;
 			mmcx-supply = <&mmcx_reg>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
@@ -2588,28 +2587,14 @@ dispcc: clock-controller@af00000 {
 				 <&dsi1_phy 0>,
 				 <&dsi1_phy 1>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <&sleep_clk>;
+				 <0>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux",
-				      "dptx1_phy_pll_link_clk",
-				      "dptx1_phy_pll_vco_div_clk",
-				      "dptx2_phy_pll_link_clk",
-				      "dptx2_phy_pll_vco_div_clk",
-				      "edp_phy_pll_link_clk",
-				      "edp_phy_pll_vco_div_clk",
-				      "sleep_clk";
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
