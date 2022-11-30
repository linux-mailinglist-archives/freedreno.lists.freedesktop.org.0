Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2C63D43B
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 12:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D7D10E449;
	Wed, 30 Nov 2022 11:18:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08110E447
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 11:18:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p8so26410032lfu.11
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N2Jz1uYU49xsD7ETI7QCbsq6QCp/tcyJvoLJYQB9dOM=;
 b=WNFOgZEowTMj5fbeGGSlTv0ak1sq9OGXG3PbYPobaGMpeCM3oBhnrC+iIqmIkhPL+w
 SS5jZ0CkT/E8vDekh5klrK6ZzEKZHb4qTq2EGmad4btXXfTRTEO3tLJ1AstwxUwrtrjd
 OHAallRKOxUcXbBPcpRJDmXvJY6GOBeESzeSiQnJA6hdFfR+q1hnoY/rbs3QShNKC6o5
 L0C8f+kVV0uSvekzNO3mbMJTQZfDzlV2YKmlLQj11a5b9/uHYGbtDQXbwL8uiFLt89BM
 cL2jy54iLO/v93eD/mvqOZiuvLGELKS5K0HBIdDC46RpRyhfg0Uh60l+jZhvWqkcNm6X
 PzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2Jz1uYU49xsD7ETI7QCbsq6QCp/tcyJvoLJYQB9dOM=;
 b=mECXMKw5DXIU4YPRcrQ8Y673INQ0tWepMf/Y+UvP7zfjy2/28Vc3JPgeOx+Y854BC0
 CzT7WMxFK7bBBWphvDvzwQ2q5ZgLQ2993NOr6Jn24BbXS2kKxQt9XIfmHwRoYf6CvOQt
 amGj/5yv5tmX0tlh9dCItVphLtRlhgFJHboXUBadw2VGOAC9DT4sIcYPOvwpuz1S6JtP
 Ag+WBUeJA8g59EVsq28tv+7JXgFSLsgRAql9gWFV/fm9+snQ/U5b0JdafmraMahrXIci
 H8Nx7iuKn2VJ1FzzbQMktiHT74xIMR9k2j5w9sqNEu0ncY1jYIxnXI6DhZwk0HB5CsZB
 UgCA==
X-Gm-Message-State: ANoB5plhOIPVgBxzDBkckGNdM992Jbq/vt7IzGgoEy7Hbjmu+NI/vP7J
 Hj4UMNI9kK1ndZNv5Ivcv9xtqQ==
X-Google-Smtp-Source: AA0mqf7R6L+tYVj9FHOCNENRkeWyo2jfBtNx/XeOBFOWKooTkr3e0x2pdrqTUlPSh8DabRh1a1Z+TA==
X-Received: by 2002:ac2:4909:0:b0:4a4:29df:55c with SMTP id
 n9-20020ac24909000000b004a429df055cmr19515214lfi.667.1669807117095; 
 Wed, 30 Nov 2022 03:18:37 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b0049a4862966fsm217923lfk.146.2022.11.30.03.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:18:36 -0800 (PST)
Message-ID: <a0d7f484-947f-40b9-12d8-29851a96bdbc@linaro.org>
Date: Wed, 30 Nov 2022 12:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-9-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-9-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 08/12] arm64: dts: qcom: sm6115: Add
 mdss/dpu node
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add mdss and dpu node to enable display support on SM6115.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 183 +++++++++++++++++++++++++++
>  1 file changed, 183 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index ea0e0b3c5d84..b459f1746a7f 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -718,6 +718,189 @@ usb_1_dwc3: usb@4e00000 {
>  			};
>  		};
>  
> +		mdss: display-subsystem@5e00000 {
> +			compatible = "qcom,sm6115-mdss";
> +			reg = <0x05e00000 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x420 0x2>,
> +				 <&apps_smmu 0x421 0x0>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdp: display-controller@5e01000 {
> +				compatible = "qcom,sm6115-dpu";
> +				reg = <0x05e01000 0x8f000>,
> +				      <0x05eb0000 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "iface",
> +					      "core",
> +					      "lut",
> +					      "rot",
> +					      "vsync";
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmpd SM6115_VDDCX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmpd_opp_min_svs>;
> +					};
> +
> +					opp-192000000 {
> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmpd_opp_low_svs>;
> +					};
> +
> +					opp-256000000 {
> +						opp-hz = /bits/ 64 <256000000>;
> +						required-opps = <&rpmpd_opp_svs>;
> +					};
> +
> +					opp-307200000 {
> +						opp-hz = /bits/ 64 <307200000>;
> +						required-opps = <&rpmpd_opp_svs_plus>;
> +					};
> +
> +					opp-384000000 {
> +						opp-hz = /bits/ 64 <384000000>;
> +						required-opps = <&rpmpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@5e94000 {
> +				compatible = "qcom,dsi-ctrl-6g-qcm2290";
> +				reg = <0x05e94000 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmpd SM6115_VDDCX>;
> +				phys = <&dsi0_phy>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmpd_opp_min_svs>;
> +					};
> +
> +					opp-164000000 {
> +						opp-hz = /bits/ 64 <164000000>;
> +						required-opps = <&rpmpd_opp_low_svs>;
> +					};
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmpd_opp_svs>;
> +					};
> +				};
> +			};
> +
> +			dsi0_phy: phy@5e94400 {
> +				compatible = "qcom,dsi-phy-14nm-2290";
> +				reg = <0x05e94400 0x100>,
> +				      <0x05e94500 0x300>,
> +				      <0x05e94800 0x188>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +		};
> +
>  		dispcc: clock-controller@5f00000 {
>  			compatible = "qcom,sm6115-dispcc";
>  			reg = <0x05f00000 0x20000>;
