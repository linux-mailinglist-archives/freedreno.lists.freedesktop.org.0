Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C3691CE1
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 11:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EED10ECCC;
	Fri, 10 Feb 2023 10:35:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5670310ECD2
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 10:35:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r2so4597544wrv.7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 02:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QKMQ6JZNfoQFQu0rb2MpaNHYonP3HvUmrwgg0187xgo=;
 b=PUf1ELYMWH9j2YA4oD7zplIxIiorjyI0GCxQE8nhPPaAr1GBRZlDjZv8otDRpvjW4l
 088ZBNHiot8lGTj4LwTkT4Vy34K3UWGBhxiL3fhfDRt/QZDJfzDregesdTb2XTr439lp
 9SIuDao65AdO8fdsm05NZaD0GNukztnTkDlCigvr+vJPYOkq+4KOz7VyX9S+wZ70H44w
 lz8cl/Vcb7FVTjr4wM/YmtOytSbhKKw+CEKovV7TOFJ3j3y/gwGQZ9utoR1t5A//EveU
 TJRaZyS9EAmD6spu3tslnQkokPPNzTBa3W16RH7mFCOM6c/iFzevAK3D/N3V+y5o2+yn
 /T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKMQ6JZNfoQFQu0rb2MpaNHYonP3HvUmrwgg0187xgo=;
 b=yJKaqj0qMHmsIVVtc5zI86HX6IWT8WtFWL8ad3tPM08+Vwxn/zTBle+J/ArN+qAvb8
 zF5yR/Vz6X1a4N2ixyqlhcO0YRF5iK6F4JFMYEGmgfBazR83ezSfLS1yQrfNZ8/ypnZD
 D/Sw8xLgm4oY9db9Dzx8YsdoJiI7UwAZJkFbXx8xt/cbiTykWQkYb2VdC2AwKBQ7Jo8E
 7to0EosmDM5OfBNcsdpbO9jXGBmRO7e6H1sMZNSue9Fta5DbhoRUJuHLpb2hjmZQ87Mq
 ubF2BaIVYsrqd8nD7y97/PffSMHAR+iooU4Iks6TvrlmDG4kiPOOQ1brfIyyedhguBz5
 GriA==
X-Gm-Message-State: AO0yUKXmmYGfYG6Qpvb6saGumbM4QcCsXIXvoyrZK21MSQp2G19OPR6F
 ebfTMgVyi8Tx+key2sF5cTucmg==
X-Google-Smtp-Source: AK7set+6VAKuP8er9C6Q36j6QEsZTcCARRc9HxsCCZ5YLC3es2mxTXg8qKmtfvbB12yMGRh0IH6TQQ==
X-Received: by 2002:adf:e708:0:b0:2be:3ccd:7f37 with SMTP id
 c8-20020adfe708000000b002be3ccd7f37mr14399928wrm.52.1676025300869; 
 Fri, 10 Feb 2023 02:35:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:35:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 11:34:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-5-529da2203659@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
Subject: [Freedreno] [PATCH v2 5/5] arm64: dts: qcom: sm8450: add dp
 controller
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the Display Port controller subnode to the MDSS node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 84 ++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 6248adc546f2..5e47cac6c582 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2742,13 +2742,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dpu_intf1_out: endpoint {
-							remote-endpoint = <&mdss_dsi0_in>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
 						dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
@@ -2786,6 +2793,77 @@ opp-500000000 {
 				};
 			};
 
+			mdss_dp0: displayport-controller@ae90000 {
+				compatible = "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0xfc>,
+				      <0 0xae90200 0 0xc0>,
+				      <0 0xae90400 0 0x770>,
+				      <0 0xae91000 0 0x98>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+			                      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy 1>,
+							 <&usb_1_qmpphy 2>;
+
+				phys = <&usb_1_qmpphy 1>;
+			        phy-names = "dp";
+
+			        #sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8450_MMCX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
@@ -2963,8 +3041,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <&usb_1_qmpphy 0>,
 				 <&usb_1_qmpphy 1>,
+				 <&usb_1_qmpphy 2>,
 				 <0>, /* dp1 */
 				 <0>,
 				 <0>, /* dp2 */

-- 
2.34.1

