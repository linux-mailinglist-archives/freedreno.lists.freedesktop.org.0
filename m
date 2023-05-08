Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F536FA2FC
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 11:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4440410E19D;
	Mon,  8 May 2023 09:09:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBB510E19D
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 09:09:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f14f266b72so2508602e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683536982; x=1686128982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XLm7AdpaWx+8rYMuzi3BjIbkTFvyrXGpj/w3QLDCRhk=;
 b=pC/3lGt1s7oCKAexq4WkMenYzNMw5XLlO2tcOQUyZjv25pJk77d3HATPSdu2dSiwVa
 IUTI9th28NtvaMndosS1O1ODOXokuaaxjnJvnwCRP3oyFSq0+aBJVOvhexLBi/BIwWdc
 GizzdSIZBOG/ni6Kk8x62cuXNB9xvdfXzWk4eSgFweoOZQDhMLuAPIeUGnUeB6JkIov/
 wautuuyiWOtr3KF6kgS9mblyUZHap25+1pr3J3Aqa7haTDS1qgOx+fJZSM4myXQfcX7O
 3d2P0SfE+O42J6iRIylsVX8jmONavAoFh1g+qS9edW6LbuBa83n208cToM+xSrPuTgGg
 u4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683536982; x=1686128982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLm7AdpaWx+8rYMuzi3BjIbkTFvyrXGpj/w3QLDCRhk=;
 b=K6hd1d2GDFh3VsVIIzISrnkbbh1yEhCnBEx+LS8fHyzuEYgaEK1VLgtQSROJG05PS8
 ktilh/O1EABxGfOYCaq7ZCY07BxxMEsX9yazOaaVtoyibiqOOuPcKWuuahOL4MNP6oMM
 ZyjTL0U9io7xGwB5OVuqqdJoVwKBaeOS4O6jaUngsPs7hMBU7y0yee8MMOvcUvNoMHog
 2tKMGwZELznsgzboqueab4JIa6e2x40ZN3NfNRHBBO+htR3bcWclHy2tMAqUkIYGRfmf
 b652lwHMfOn8T9pUW+IQEYTdNKObf8w/LjQRzGVHm6x3cr3dSv4aYxWed+WaEbu5wxFg
 2UzA==
X-Gm-Message-State: AC+VfDycxIYnYt+4e7e48bmUiNkNASpOpJefz17NYz0WgRTFwC69/K9K
 PfDbRAyD8kl3c4hvMrk23obXrQ==
X-Google-Smtp-Source: ACHHUZ5F6obglJyHPsXi4ZWFMKfGnDZYUJDB9yjOwr+BXdmUc+8ECiwRSxaiQ5exXwTTcbZmVFmLzg==
X-Received: by 2002:ac2:5d69:0:b0:4ea:f632:4738 with SMTP id
 h9-20020ac25d69000000b004eaf6324738mr2181920lft.6.1683536982113; 
 Mon, 08 May 2023 02:09:42 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 f6-20020ac24e46000000b004f00279c307sm1226461lfr.245.2023.05.08.02.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:09:41 -0700 (PDT)
Message-ID: <29d30e11-54f1-5398-9e3d-5e390b6b0ee3@linaro.org>
Date: Mon, 8 May 2023 11:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
 <20230507202841.2339127-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507202841.2339127-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v1 2/3] ARM: dts: qcom: msm8974: add
 support for the HDMI output
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 7.05.2023 22:28, Dmitry Baryshkov wrote:
> Add HDMI and HDMI PHY device nodes for the Qualcomm MSM8974 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 90 ++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index fb661c1bd3d5..fbe74eeef863 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1805,6 +1805,21 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
>  				};
>  			};
>  
> +			hdmi_default: hdmi-default-state {
> +				cec-pins {
> +					pins = "gpio31";
> +					function = "hdmi_cec";
> +				};
add a newline before each consecutive subnode, please

> +				ddc-pins {
> +					pins = "gpio32", "gpio33";
> +					function = "hdmi_ddc";
> +				};
> +				hpd-pins {
> +					pins = "gpio34";
> +					function = "hdmi_hpd";
> +				};
> +			};
> +
>  			spi8_default: spi8_default-state {
>  				mosi-pins {
>  					pins = "gpio45";
> @@ -1840,7 +1855,7 @@ mmcc: clock-controller@fd8c0000 {
>  				 <&dsi0_phy 0>,
>  				 <&dsi1_phy 1>,
>  				 <&dsi1_phy 0>,
> -				 <0>,
> +				 <&mdss_hdmi_phy>,
>  				 <0>,
>  				 <0>;
>  			clock-names = "xo",
> @@ -1914,6 +1929,13 @@ mdp5_intf2_out: endpoint {
>  							remote-endpoint = <&dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mdp5_intf3_out: endpoint {
> +							remote-endpoint = <&mdss_hdmi_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -1970,6 +1992,72 @@ dsi0_out: endpoint {
>  				};
>  			};
>  
> +			mdss_hdmi: hdmi-tx@fd922100 {
> +				compatible = "qcom,hdmi-tx-8974";
> +				reg = <0xfd922100 0x35c>,
> +				      <0xfc4b8000 0x60f0>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical";
> +
> +				pinctrl-0 = <&hdmi_default>;
> +				pinctrl-names = "default";
property-n
property-names

since the pinctrl driver only allows these functions on these pins,
it's okay for it to stay in the SoC dtsi

> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>;
> +				clock-names =
> +					"mdp_core",
> +					"iface",
> +					"core",
> +					"alt_iface",
> +					"extp";
broken indentation

> +
> +				phys = <&mdss_hdmi_phy>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
add a newline before properties and subnodes, please

Konrad
> +						mdss_hdmi_in: endpoint {
> +							remote-endpoint = <&mdp5_intf3_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_hdmi_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_hdmi_phy: hdmi-phy@fd922500 {
> +				compatible = "qcom,hdmi-phy-8974";
> +				reg = <0xfd922500 0x7c>,
> +				      <0xfd922700 0xd4>;
> +				reg-names = "hdmi_phy",
> +					    "hdmi_pll";
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_AHB_CLK>;
> +				clock-names = "iface",
> +					      "alt_iface";
> +
> +				#phy-cells = <0>;
> +				#clock-cells = <0>;
> +
> +				status = "disabled";
> +			};
> +
>  			dsi0_phy: phy@fd922a00 {
>  				compatible = "qcom,dsi-phy-28nm-hpm";
>  				reg = <0xfd922a00 0xd4>,
